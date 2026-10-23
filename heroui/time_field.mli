(** HeroUI's TimeField: Kobalte's [TimeField.Root], a field's [<div>], with
    HeroUI's classes from {!Styles.TimeField}, whose value is a time of day,
    each of its parts -- hour, minute, second and AM or PM -- a segment typed
    into or stepped by the arrow keys, within its [min_value] and [max_value].
    Its {!Label} names it, its {!Description} describes it, its {!Field_error}
    shows while it is invalid, and it submits its value with a form, by
    Kobalte's hidden input.

    {[
      <Time_field name="start">
        <Label>"Time"</Label>
        <Time_field.Group>
          <Time_field.Input>
            (fun segment ->
              <Time_field.Segment segment=(fun () -> S.get segment) />)
          </Time_field.Input>
        </Time_field.Group>
      </Time_field>
    ]}

    Its value is Kobalte's {!Solidtype_kobalte.Types.Time}, an hour, a minute
    and a second. A part is used inside a [Time_field]: elsewhere it raises
    [Invalid_argument] as it is made. *)

type segment = [ `hour | `minute | `second | `dayPeriod ]
(** A segment's part of the time, AM or PM its [`dayPeriod]. *)

(** The box the input sits in, React Aria's group, with HeroUI's
    {!Styles.DateInputGroup}: a [<div role="group">]. *)
module Group : sig
  module Props : sig
    type t

    val check :
      ?variant:[ `primary | `secondary ] Solidtype.Check.value ->
      ?full_width:bool Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** What sits before the input in its group, an icon: a [<div>]. *)
module Prefix : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** What sits after the input in its group: a [<div>]. *)
module Suffix : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The time's segments, Kobalte's input: it renders [children] for each
    segment, in order, and the literals between them, as React Aria's does --
    [":"] between the hour, the minute and the second, and a space before AM or
    PM, each a [<span data-type="literal">] a reader skips. *)
module Input : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:
        ( segment Solidtype.Solid.accessor -> Solidtype.Jsx.element,
          [ `render ] )
        Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** One segment, Kobalte's spin button: its text the part's value, or dashes
    while it has none, which it declares as [data-placeholder]. *)
module Segment : sig
  module Props : sig
    type t

    val check :
      segment:segment Solidtype.Check.value ->
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
    ?value:Solidtype_kobalte.Types.Time.t Solidtype.Check.value ->
    ?default_value:Solidtype_kobalte.Types.Time.t Solidtype.Check.value ->
    ?on_change:(Solidtype_kobalte.Types.Time.t -> unit) ->
    ?placeholder_value:Solidtype_kobalte.Types.Time.t Solidtype.Check.value ->
    ?min_value:Solidtype_kobalte.Types.Time.t Solidtype.Check.value ->
    ?max_value:Solidtype_kobalte.Types.Time.t Solidtype.Check.value ->
    ?granularity:[ `hour | `minute | `second ] Solidtype.Check.value ->
    ?hour_cycle:[ `h12 | `h24 ] Solidtype.Check.value ->
    ?should_force_leading_zeros:bool Solidtype.Check.value ->
    ?is_required:bool Solidtype.Check.value ->
    ?is_invalid:bool Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?is_read_only:bool Solidtype.Check.value ->
    ?name:string Solidtype.Check.value ->
    ?aria_label:string Solidtype.Check.value ->
    ?full_width:bool Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?on_blur:(Dom.focusEvent -> unit) ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
