(** Many dots at once: a plain HTML point for each row, placed by the chart's
    two scales, with no slat and no Solid computation per point, for a large
    scatter plot inside a [Chart] with a [cross] scale. Experimental in rhp.

    Ported by hand: each of its props is a value for every point or a function
    of the row, generic over its rows, a pair no rule maps. *)

type ('row, 'v) value
(** What a point is given: one value for every point, or one per point. *)

external same : 'v -> ('row, 'v) value = "%identity"
(** The same value for every point. *)

val each : ('row -> int -> 'v) -> ('row, 'v) value
(** A value for each point, from its row and its number; worked out once for
    each update of the rows. *)

type size
(** A point's diameter. *)

external px : float -> size = "%identity"
external css : string -> size = "%identity"

module Props : sig
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
  (** [at], a point's value on the value axis, and [cross], on the chart's cross
      scale, a point whose either is not finite left out; [key], what identifies
      a point, its row's number by default; [color], [size], 4px by default, and
      [shape]; [point_class] and [point_style], a point's own classes and
      declarations, the collection keeping its place; then a [<div>]'s
      attributes and handlers, which it passes on. *)
end

external component : unit Solidtype.Jsx.component = "ManyDots"
[@@mel.module "@bezda/rhp"]
