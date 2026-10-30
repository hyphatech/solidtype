type ('row, 'v) value

(* A value for every point is the value itself, one per point a function rhp
   calls with the row and its number: t hides which. *)
external same : 'v -> ('row, 'v) value = "%identity"
external of_function : ('row -> int -> 'v) -> ('row, 'v) value = "%identity"

(* A function is wrapped by a call Melange keeps: inlined, its identity would
   let Melange merge the function into the thunk it is written in,
   (fun () -> each (fun ...)), into one JavaScript function of all their
   arguments, which rhp would call with its own. *)
let[@inline never] each f = of_function f

type size

external px : float -> size = "%identity"
external css : string -> size = "%identity"

module Props = struct
  external check :
    rows:'row array Solidtype.Check.value ->
    at:('row, float) value Solidtype.Check.value ->
    cross:('row, float) value Solidtype.Check.value ->
    ?key:('row -> int -> 'key) ->
    ?color:('row, Color.t) value Solidtype.Check.value ->
    ?size:('row, size) value Solidtype.Check.value ->
    ?shape:('row, Shape.t) value Solidtype.Check.value ->
    ?point_class:('row, string) value Solidtype.Check.value ->
    ?point_style:('row, string Js.Dict.t) value Solidtype.Check.value ->
    ?style:string Solidtype.Check.value ->
    ?props:'spread Solidtype.Solid.rest ->
    (unit -> unit) Solidtype.Html.Div.check = "check"
  [@@mel.module "vite-plugin-solidtype/markers"]
end

external component : unit Solidtype.Jsx.component = "ManyDots"
[@@mel.module "@bezda/rhp"]
