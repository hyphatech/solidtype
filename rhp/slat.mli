(** A slat: the template for one row of a plot, a function of the row that
    returns one element, with the CSS and layout every slat of its type shares.

    Ported by hand: rhp's [slat] is two overloads, [slat(fn)] and
    [slat(layout, fn)], and its result a function with its layout attached; its
    layout's sizes are a number, a CSS length, or one of either per orientation.
*)

type 'row t = 'row Row.t -> Solidtype.Jsx.element
(** A slat is the function, so any function of a row is a slat with no layout of
    its own. *)

type both
(** A setting the same in both orientations. *)

type each
(** A setting given for each orientation. *)

type 'kind length
(** A size along the stack or across the band. *)

external number : float -> both length = "%identity"
(** A number: px for [thickness], a share of the band for [inset]. *)

external css : string -> both length = "%identity"
(** A CSS length, ["2rem"] or ["var(--row)"]. *)

val lengths :
  ?horizontal:both length -> ?vertical:both length -> unit -> each length
(** One length for a horizontal chart and one for a vertical. *)

type edge
(** Room on the start or end side of the plot. *)

external px : float -> edge = "%identity"

val auto : edge
(** As wide as the widest label at that edge. *)

type 'kind room
(** Room outside the plot for what a slat draws there. *)

val room :
  ?start:edge ->
  ?end_:edge ->
  ?before:float ->
  ?after:float ->
  unit ->
  both room
(** Room along the value axis, at its [start] and [end_], and along the stack,
    [before] and [after] it, in px. *)

val auto_room : both room
(** [start] and [end_] as wide as the widest label at each edge. *)

val rooms : ?horizontal:both room -> ?vertical:both room -> unit -> each room
(** One room for a horizontal chart and one for a vertical. *)

val make :
  ?css:string ->
  ?thickness:_ length ->
  ?inset:_ length ->
  ?room:_ room ->
  ('row Row.t -> Solidtype.Jsx.element) ->
  'row t
(** [make f] is a slat type of [f], [f] itself left as it was.

    - [css] is CSS scoped to this type's slats, the theme's colors as
      [var(--rhp-<key>)], and [:horizontal] and [:vertical] matching an
      orientation.
    - [thickness] is a row's height, or a column's width; without one, the slats
      share what the chart has.
    - [inset] is the empty share of the band on each side of a [Bar], a [Tick]
      or an [Area], 0.18 by default.
    - [room] is room outside the plot for what the slat draws there. *)
