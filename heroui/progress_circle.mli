(** HeroUI's ProgressCircle: Kobalte's [Progress.Root], a
    [<div role="progressbar">], with HeroUI's classes from
    {!Styles.ProgressCircle}, that shows a quantity within a known range as an
    arc: its {!Fill_circle} is drawn round its {!Track_circle} as far as the
    value is along the range, or, indeterminate, spins as HeroUI's styles
    animate it. No label names it, so it is named by its [aria_label].

    {[
      <Progress_circle value=60. aria_label="Loading">
        <Progress_circle.Track>
          <Progress_circle.Track_circle />
          <Progress_circle.Fill_circle />
        </Progress_circle.Track>
      </Progress_circle>
    ]}

    A circle's [r], [cx], [cy] and [stroke_width] change its size, and the
    track's [view_box] and [stroke_width] the drawing's; the fill's arc is
    measured on its own radius. A part is used inside a [Progress_circle]:
    elsewhere it raises [Invalid_argument] as it is made. *)

(** The drawing the circles are in: an [<svg>], 36 units square. *)
module Track : sig
  module Props : sig
    type t

    val check :
      ?view_box:string Solidtype.Check.value ->
      ?stroke_width:float Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The whole circle the arc is drawn on: a [<circle>]. *)
module Track_circle : sig
  module Props : sig
    type t

    val check :
      ?cx:float Solidtype.Check.value ->
      ?cy:float Solidtype.Check.value ->
      ?r:float Solidtype.Check.value ->
      ?stroke_width:float Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The arc as far as the value is along its range, from the top, clockwise: a
    [<circle>] whose dash is that share of its own length; a quarter of it, spun
    by HeroUI's styles, while the circle is indeterminate. *)
module Fill_circle : sig
  module Props : sig
    type t

    val check :
      ?cx:float Solidtype.Check.value ->
      ?cy:float Solidtype.Check.value ->
      ?r:float Solidtype.Check.value ->
      ?stroke_width:float Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

module Props : sig
  type t

  val check :
    ?value:float Solidtype.Check.value ->
    ?is_indeterminate:bool Solidtype.Check.value ->
    ?min_value:float Solidtype.Check.value ->
    ?max_value:float Solidtype.Check.value ->
    ?color:
      [ `default | `accent | `success | `warning | `danger ]
      Solidtype.Check.value ->
    ?size:[ `sm | `md | `lg ] Solidtype.Check.value ->
    ?aria_label:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?format_options:
      Solidtype_kobalte.Types.NumberFormatOptions.t Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
