external on_pointer :
  _ Dom.eventTarget_like ->
  string ->
  ((Dom.pointerEvent -> unit)[@mel.uncurry]) ->
  unit = "addEventListener"
[@@mel.send]

external on_key :
  _ Dom.eventTarget_like ->
  string ->
  ((Dom.keyboardEvent -> unit)[@mel.uncurry]) ->
  unit = "addEventListener"
[@@mel.send]

external on_focus :
  _ Dom.eventTarget_like ->
  string ->
  ((Dom.focusEvent -> unit)[@mel.uncurry]) ->
  unit = "addEventListener"
[@@mel.send]

external document : Dom.document = "document"
external pointer_type : Dom.pointerEvent -> string = "pointerType" [@@mel.get]
external button : Dom.pointerEvent -> int = "button" [@@mel.get]
external key : Dom.keyboardEvent -> string = "key" [@@mel.get]
external repeat : Dom.keyboardEvent -> bool = "repeat" [@@mel.get]
external meta_key : Dom.keyboardEvent -> bool = "metaKey" [@@mel.get]
external ctrl_key : Dom.keyboardEvent -> bool = "ctrlKey" [@@mel.get]
external alt_key : Dom.keyboardEvent -> bool = "altKey" [@@mel.get]

external set_attribute : _ Dom.element_like -> string -> string -> unit
  = "setAttribute"
[@@mel.send]

external remove_attribute : _ Dom.element_like -> string -> unit
  = "removeAttribute"
[@@mel.send]

(* Whether the last input was a key, as React Aria decides focus-visible:
   one modality for the page, read by every element tracked, its listeners
   added by the first. A key held with Meta, Control or Alt is a shortcut,
   not a move of the focus. *)
let by_keyboard = ref false
let watching = ref false

let watch_modality () =
  if not !watching then begin
    watching := true;
    on_key document "keydown" (fun e ->
        if not (meta_key e || ctrl_key e || alt_key e) then by_keyboard := true);
    on_pointer document "pointerdown" (fun _ -> by_keyboard := false)
  end

let show element name on =
  if on then set_attribute element name "true"
  else remove_attribute element name

external tag_name : _ Dom.element_like -> string = "tagName" [@@mel.get]

external has_attribute : _ Dom.element_like -> string -> bool = "hasAttribute"
[@@mel.send]

external attribute : _ Dom.element_like -> string -> string Js.null
  = "getAttribute"
[@@mel.send]

(* A link, as React Aria tells one: an anchor with an href, or the link
   role. *)
let link element =
  (String.equal (tag_name element) "A" && has_attribute element "href")
  || Option.equal String.equal
       (Js.Null.toOption (attribute element "role"))
       (Some "link")

(* Enter presses, and Space too but on a link, as React Aria presses. *)
let pressing element k =
  String.equal k "Enter" || (String.equal k " " && not (link element))

let track ?disabled element =
  let disabled () =
    match disabled with Some d -> Solidtype.Solid.get d | None -> false
  in
  watch_modality ();
  let down = ref false in
  let focused = ref false in
  let hovered on = show element "data-hovered" (on && not (disabled ())) in
  let pressed on = show element "data-pressed" (on && not (disabled ())) in
  on_pointer element "pointerenter" (fun e ->
      if not (String.equal (pointer_type e) "touch") then hovered true;
      if !down then pressed true);
  on_pointer element "pointerleave" (fun _ ->
      hovered false;
      pressed false);
  on_pointer element "pointerdown" (fun e ->
      if button e = 0 && not (disabled ()) then begin
        down := true;
        pressed true
      end);
  (* A pointer is let go wherever it is, so the page hears it. *)
  on_pointer document "pointerup" (fun _ ->
      if !down then begin
        down := false;
        pressed false
      end);
  on_pointer document "pointercancel" (fun _ ->
      down := false;
      pressed false);
  on_key element "keydown" (fun e ->
      if !focused then show element "data-focus-visible" true;
      if pressing element (key e) && not (repeat e) then pressed true);
  on_key element "keyup" (fun e ->
      if pressing element (key e) then pressed false);
  on_focus element "focus" (fun _ ->
      focused := true;
      show element "data-focused" true;
      show element "data-focus-visible" !by_keyboard);
  on_focus element "blur" (fun _ ->
      focused := false;
      show element "data-focused" false;
      show element "data-focus-visible" false);
  (* After Kobalte's own render effects, which write data-disabled as "". *)
  Solidtype.Solid.create_effect (fun () ->
      let off = disabled () in
      show element "data-disabled" off;
      if off then begin
        hovered false;
        pressed false
      end)
