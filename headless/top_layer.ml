type style

(* Any element is one, by its kind; the elements kept are held as one. *)
external as_element : _ Dom.element_like -> Dom.element = "%identity"

external set_attribute : Dom.element -> string -> string -> unit
  = "setAttribute"
[@@mel.send]

external style : Dom.element -> style = "style" [@@mel.get]
external set_css_text : style -> string -> unit = "cssText" [@@mel.set]
external is_connected : Dom.element -> bool = "isConnected" [@@mel.get]
external show_popover : Dom.element -> unit = "showPopover" [@@mel.send]
external hide_popover : Dom.element -> unit = "hidePopover" [@@mel.send]

(* The Popover API throws where the browser has none, a TypeError, and where
   the element is already shown or hidden, or not in the document. *)
let show e = match show_popover e with () -> Ok () | exception x -> Error x
let hide e = match hide_popover e with () -> Ok () | exception x -> Error x

(* The user agent's style of a popover centres it as a box with a border and
   a background; a placed element is a box of no size at the corner, so
   what it holds is laid out against the viewport as it was. *)
let corner =
  "position: fixed; inset: 0 auto auto 0; width: 0; height: 0; margin: 0; \
   padding: 0; border: 0; background: transparent; overflow: visible;"

(* The elements kept on top, in the order they were kept. *)
let kept : Dom.element list ref = ref []

let lift e =
  set_attribute e "popover" "manual";
  set_css_text (style e) corner;
  (* A browser with no top layer leaves [e] where the page stacks it. *)
  match show e with
  | Ok () | Error _ -> ()

let place e =
  let e = as_element e in
  lift e;
  kept := List.filter is_connected !kept;
  List.iter
    (fun k ->
      if not (k == e) then (
        (* Shown again, [k] is the last in the top layer. *)
        (match hide k with
        | Ok () | Error _ -> ());
        match show k with Ok () | Error _ -> ()))
    !kept

let keep_on_top e =
  let e = as_element e in
  kept := List.filter (fun k -> not (k == e)) !kept @ [ e ];
  lift e
