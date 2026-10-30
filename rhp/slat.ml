type 'row t = 'row Row.t -> Solidtype.Jsx.element
type both
type each
type 'kind length
type edge
type 'kind room

(* A length is a number or a string, an edge a number or "auto", and either
   per orientation an object of both: the kinds keep a per-orientation one
   from being given per orientation again, which rhp does not read. *)
external number : float -> both length = "%identity"
external css : string -> both length = "%identity"

external lengths :
  ?horizontal:both length -> ?vertical:both length -> unit -> each length = ""
[@@mel.obj]

external px : float -> edge = "%identity"
external edge_of_string : string -> edge = "%identity"

let auto = edge_of_string "auto"

external room :
  ?start:edge ->
  ?end_:(edge[@mel.as "end"]) ->
  ?before:float ->
  ?after:float ->
  unit ->
  both room = ""
[@@mel.obj]

external room_of_string : string -> both room = "%identity"

let auto_room = room_of_string "auto"

external rooms :
  ?horizontal:both room -> ?vertical:both room -> unit -> each room = ""
[@@mel.obj]

type layout

external layout :
  ?css:string ->
  ?thickness:'a length ->
  ?inset:'b length ->
  ?room:'c room ->
  unit ->
  layout = ""
[@@mel.obj]

external slat : layout -> ('row Row.t -> Solidtype.Jsx.element) -> 'row t
  = "slat"
[@@mel.module "@bezda/rhp"]

let make ?css ?thickness ?inset ?room f =
  slat (layout ?css ?thickness ?inset ?room ()) f

external restyle_js : 'row t -> string -> unit = "restyle"
[@@mel.module "@bezda/rhp"]

let restyle slat css =
  match restyle_js slat css with
  | () -> ()
  | exception Js.Exn.Error e ->
      invalid_arg ("restyle: " ^ Option.value (Js.Exn.message e) ~default:"")
