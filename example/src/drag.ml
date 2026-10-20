(* The one value a card's drag carries, the book's id, as text: the drop
   reads it back from the event the browser hands the column. *)

type transfer

external transfer : Dom.dragEvent -> transfer = "dataTransfer" [@@mel.get]

external set_data : transfer -> string -> string -> unit = "setData"
[@@mel.send]

external get_data : transfer -> string -> string = "getData" [@@mel.send]
external prevent_default : Dom.dragEvent -> unit = "preventDefault" [@@mel.send]

let start e id = set_data (transfer e) "text/plain" (Js.Float.toString id)
let dropped e = float_of_string_opt (get_data (transfer e) "text/plain")
