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
   one modality for the page, a signal every element tracked reads, so a
   pointer pressed anywhere hides the focus ring of what has the focus, as
   React Aria's does. Made, and its listeners added, by the first element
   watched, in the browser. A key held with Meta, Control or Alt is a
   shortcut, not a move of the focus. *)
let modality = ref None

let by_keyboard () =
  match !modality with
  | Some (keyboard, _, _, _) -> S.get keyboard
  | None -> false

let keyed () =
  match !modality with Some (_, _, keyed, _) -> S.get keyed | None -> false

external key_on : Dom.keyboardEvent -> Dom.element = "target" [@@mel.get]
external input_type : Dom.element -> string = "type" [@@mel.get]
external editable : Dom.element -> bool = "isContentEditable" [@@mel.get]
external element_tag : Dom.element -> string = "tagName" [@@mel.get]

(* A key typed into a text, as React Aria tells one: into an input of a text
   type, a text area or editable content, but Tab and Escape, which move the
   focus or leave. Typing shows no focus ring. *)
let typing e =
  let target = key_on e in
  let text =
    match element_tag target with
    | "INPUT" -> (
        match input_type target with
        | "checkbox" | "radio" | "range" | "color" | "file" | "image" | "button"
        | "submit" | "reset" ->
            false
        | _ -> true)
    | "TEXTAREA" -> true
    | _ -> editable target
  in
  text && match key e with "Tab" | "Escape" -> false | _ -> true

let watch_modality () =
  if Option.is_none !modality then begin
    let keyboard, set_keyboard = S.create_signal false in
    let keyed, set_keyed = S.create_signal false in
    modality := Some (keyboard, set_keyboard, keyed, set_keyed);
    on_key document "keydown" (fun e ->
        if not (meta_key e || ctrl_key e || alt_key e) then begin
          S.set set_keyed true;
          if not (typing e) then S.set set_keyboard true
        end);
    on_pointer document "pointerdown" (fun _ ->
        S.set set_keyboard false;
        S.set set_keyed false)
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
  no_hover : bool S.accessor option;
  no_pointer_press : bool S.accessor option;
  keys : [ `target | `element ];
  hover : bool S.accessor;
  set_hover : bool S.setter;
  press : bool S.accessor;
  set_press : bool S.setter;
  focus : bool S.accessor;
  set_focus : bool S.setter;
}

let create ?disabled ?no_hover ?no_pointer_press ?(keys = `target) () =
  let hover, set_hover = S.create_signal false in
  let press, set_press = S.create_signal false in
  let focus, set_focus = S.create_signal false in
  (* A hover or a press ends as the element is disabled, as React Aria ends
     them, so one enabled again under a resting pointer shows neither until
     the pointer moves in again. *)
  Option.iter
    (fun off ->
      S.create_computed (fun () ->
          if S.get off then begin
            S.set set_hover false;
            S.set set_press false
          end))
    disabled;
  {
    off = disabled;
    no_hover;
    no_pointer_press;
    keys;
    hover;
    set_hover;
    press;
    set_press;
    focus;
    set_focus;
  }

let disabled i = match i.off with Some d -> S.get d | None -> false
let holds = function Some a -> S.get a | None -> false
let pointer_inert i = holds i.no_pointer_press

(* A disabled element is neither hovered, pressed nor focused, whatever was
   done to it before: a button disabled as it is pressed, the last page's
   Next, keeps the focus with no blur told. *)
let hovered i = S.get i.hover && not (disabled i || holds i.no_hover)
let pressed i = S.get i.press && not (disabled i)
let focused i = S.get i.focus && not (disabled i)
let focus_visible i = focused i && by_keyboard ()

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
      if button e = 0 && not (disabled i || pointer_inert i) then begin
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
      if pressing e && not (repeat e) then press true);
  on_key element "keyup" (fun e -> if pressing e then press false);
  (* Focus as it bubbles: a switch's content is a label whose input inside it
     takes the focus. *)
  on_focus element "focusin" (fun _ -> S.set i.set_focus true);
  on_focus element "focusout" (fun _ -> S.set i.set_focus false)
