(* The one value a card's drag carries, the task's id, as text: the drop
   reads it back from the event the browser hands the column. *)

type transfer

external transfer : Dom.dragEvent -> transfer = "dataTransfer" [@@mel.get]

external set_data : transfer -> string -> string -> unit = "setData"
[@@mel.send]

external get_data : transfer -> string -> string = "getData" [@@mel.send]
external prevent_default : Dom.dragEvent -> unit = "preventDefault" [@@mel.send]

let start e id = set_data (transfer e) "text/plain" (Js.Float.toString id)
let dropped e = float_of_string_opt (get_data (transfer e) "text/plain")

external related : Dom.dragEvent -> Dom.element Js.Nullable.t = "relatedTarget"
[@@mel.get]

external current : Dom.dragEvent -> Dom.element = "currentTarget" [@@mel.get]
external contains : Dom.element -> Dom.element -> bool = "contains" [@@mel.send]

(* The browser says a drag leaves an element as it enters one of the
   element's own children, which is no leaving. *)
let left e =
  match Js.Nullable.toOption (related e) with
  | Some entered -> not (contains (current e) entered)
  | None -> true
