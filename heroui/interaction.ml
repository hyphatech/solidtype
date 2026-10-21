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

module S = Solidtype.Solid

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

external key_target : Dom.keyboardEvent -> Dom.element = "target" [@@mel.get]
external input_type : Dom.element -> string Js.undefined = "type" [@@mel.get]

(* A checkbox or a radio, a switch's input among them, which a key toggles
   only by Space, as a browser does. *)
let check element =
  String.equal (tag_name element) "INPUT"
  && Option.fold ~none:false
       ~some:(fun t -> String.equal t "checkbox" || String.equal t "radio")
       (Js.Undefined.toOption (input_type element))

external as_element : _ Dom.element_like -> Dom.element = "%identity"

(* Whether a key presses [target], as React Aria decides: Enter and Space,
   but only Enter a link and only Space a checkbox or a radio. *)
let pressing target e =
  match key e with
  | "Enter" -> not (check target)
  | " " -> not (link target)
  | _ -> false

type t = {
  off : bool S.accessor option;
  keys : [ `target | `element ];
  hover : bool S.accessor;
  set_hover : bool S.setter;
  press : bool S.accessor;
  set_press : bool S.setter;
  focus : bool S.accessor;
  set_focus : bool S.setter;
  focus_ring : bool S.accessor;
  set_focus_ring : bool S.setter;
}

let create ?disabled ?(keys = `target) () =
  let hover, set_hover = S.create_signal false in
  let press, set_press = S.create_signal false in
  let focus, set_focus = S.create_signal false in
  let focus_ring, set_focus_ring = S.create_signal false in
  {
    off = disabled;
    keys;
    hover;
    set_hover;
    press;
    set_press;
    focus;
    set_focus;
    focus_ring;
    set_focus_ring;
  }

let disabled i = match i.off with Some d -> S.get d | None -> false

(* A disabled element is neither hovered nor pressed, whatever the pointer
   did while it was. *)
let hovered i = S.get i.hover && not (disabled i)
let pressed i = S.get i.press && not (disabled i)
let focused i = S.get i.focus
let focus_visible i = S.get i.focus_ring

let watch i element =
  watch_modality ();
  let down = ref false in
  let press on = S.set i.set_press on in
  let pressing e =
    pressing
      (match i.keys with
      | `target -> key_target e
      | `element -> as_element element)
      e
  in
  on_pointer element "pointerenter" (fun e ->
      if not (String.equal (pointer_type e) "touch") then S.set i.set_hover true;
      if !down then press true);
  on_pointer element "pointerleave" (fun _ ->
      S.set i.set_hover false;
      press false);
  on_pointer element "pointerdown" (fun e ->
      if button e = 0 && not (disabled i) then begin
        down := true;
        press true
      end);
  (* A pointer is let go wherever it is, so the page hears it. *)
  on_pointer document "pointerup" (fun _ ->
      if !down then begin
        down := false;
        press false
      end);
  on_pointer document "pointercancel" (fun _ ->
      down := false;
      press false);
  on_key element "keydown" (fun e ->
      if focused i then S.set i.set_focus_ring true;
      if pressing e && not (repeat e) then press true);
  on_key element "keyup" (fun e -> if pressing e then press false);
  (* Focus as it bubbles: a switch's content is a label whose input inside it
     takes the focus. *)
  on_focus element "focusin" (fun _ ->
      S.set i.set_focus true;
      S.set i.set_focus_ring !by_keyboard);
  on_focus element "focusout" (fun _ ->
      S.set i.set_focus false;
      S.set i.set_focus_ring false)
