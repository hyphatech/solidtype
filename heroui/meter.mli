(** HeroUI's Meter: Kobalte's [Meter.Root], a [<div role="meter">], with
    HeroUI's classes from {!Styles.Meter}, that shows a quantity within a known
    range: its {!Label} names it, its {!Output} shows its value as Kobalte
    formats it for the reader's locale, and its {!Fill} is as wide in its
    {!Track} as the value is far along the range.

    {[
      <Meter value=60.>
        <Label>"Storage"</Label>
        <Meter.Output />
        <Meter.Track><Meter.Fill /></Meter.Track>
      </Meter>
    ]}

    [format_options], as HeroUI's [formatOptions], formats it by Kobalte's
    [I18n.create_number_formatter], in Kobalte's locale: a percent style, the
    default, shows the value's share of its range, and any other the value
    itself, as
    [Types.NumberFormatOptions.make ~style:`currency ~currency:"USD" ()] shows
    [$60.00].

    A part is used inside a [Meter]: elsewhere it raises [Invalid_argument] as
    it is made. *)

(** The value as text, Kobalte's, a percentage by default, or the children it is
    given: a [<span>]. *)
module Output : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The bar the fill is drawn in: a [<div>]. *)
module Track : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The part of the track up to the value: a [<div>] as wide as its share. *)
module Fill : sig
  module Props : sig
    type t

    val check : ?class_:string Solidtype.Check.value -> ?props:t -> unit -> unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

module Props : sig
  type t

  val check :
    value:float Solidtype.Check.value ->
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
    ?props:t ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
