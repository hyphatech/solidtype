(** A chip that shows a change: HeroUI's {!Chip}, coloured by its [trend], with
    an arrow and its value in tabular figures, its look trend-chip.css's.

    {[
      <Trend_chip trend=`down>
        "-5.9%" <Trend_chip.Suffix>"vs last month"</Trend_chip.Suffix>
      </Trend_chip>
    ]}

    Its parts may come in any order among its children. *)

type trend = [ `up | `down | `neutral ]
type size = [ `sm | `md | `lg ]
type variant = [ `primary | `secondary | `soft | `tertiary ]

(** Text before the value: a [<span>]. *)
module Prefix : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Span.props -> Solidtype.Jsx.element) ->
      ?props:t Solidtype.Solid.rest ->
      (unit -> unit) Solidtype.Html.Span.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** Text after the value, in the muted colour: a [<span>]. *)
module Suffix : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Span.props -> Solidtype.Jsx.element) ->
      ?props:t Solidtype.Solid.rest ->
      (unit -> unit) Solidtype.Html.Span.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The arrow: an [<svg>] for the trend, hidden from a reader, or, given an
    icon, a [<span>] that sizes it. Given, it shows for a neutral trend too. *)
module Indicator : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Span.props -> Solidtype.Jsx.element) ->
      ?props:t Solidtype.Solid.rest ->
      (unit -> unit) Solidtype.Html.Span.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

module Props : sig
  type t

  val check :
    ?trend:trend Solidtype.Check.value ->
    ?size:size Solidtype.Check.value ->
    ?variant:variant Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Span.props -> Solidtype.Jsx.element) ->
    ?props:t Solidtype.Solid.rest ->
    (unit -> unit) Solidtype.Html.Span.check
end

val make : Props.t -> Solidtype.Jsx.element
(** The chip, [data-trend] its trend; [`up], [`sm] and [`soft] by default. *)

val component : Props.t Solidtype.Jsx.component
