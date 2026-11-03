(** HeroUI's TimeField: Kobalte's [TimeField.Root], a field's [<div>], with
    HeroUI's classes from {!Styles.TimeField}, whose value is a time of day,
    each of its parts -- hour, minute, second and AM or PM -- a segment typed
    into or stepped by the arrow keys, within its [min_value] and [max_value].
    Its {!Label} names it, its {!Description} describes it, its {!Field_error}
    shows while it is invalid, and it submits its value with a form, as
    \@internationalized/date writes it, [14:30:00].

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

    Its value is \@internationalized/date's
    {!Solidtype_internationalized_date.Types.Time}, made by
    [Time.make ~hour:14 ~minute:30 ()] or [parse_time "14:30"]. A time on a date
    is {!Date_time}'s, and a time in a zone {!Zoned}'s, each given back as the
    kind it was given: the three share the parts below. A [value] of
    [Js.Nullable.null] controls a field empty, as React's [null] does, and
    [on_change] is told [None] once every segment is erased. A part is used
    inside a field: elsewhere it raises [Invalid_argument] as it is made. *)

type segment = [ `hour | `minute | `second | `dayPeriod ]
(** A segment's part of the time, AM or PM its [`dayPeriod]. *)

(** The box the input sits in, React Aria's group, with HeroUI's
    {!Styles.DateInputGroup}: a [<div role="group">]. *)
module Group : sig
  type state = {
    is_hovered : bool Solidtype.Solid.accessor;
    is_focus_within : bool Solidtype.Solid.accessor;
    is_focus_visible : bool Solidtype.Solid.accessor;
    is_disabled : bool Solidtype.Solid.accessor;
    is_invalid : bool Solidtype.Solid.accessor;
  }
  (** What its children are drawn of, given as a function, as HeroUI's render
      props are, each read where Solid tracks it. *)

  module Props : sig
    type t

    val check :
      ?variant:[ `primary | `secondary ] Solidtype.Check.value ->
      ?full_width:bool Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:
        ( state -> Solidtype.Jsx.element,
          [ `nodes | `render ] )
        Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      (unit -> unit) Solidtype.Html.Div.check
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
      (unit -> unit) Solidtype.Html.Div.check
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
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The time's segments, Kobalte's input: it renders [children] for each
    segment, in order, and the literals between them, as React Aria's does --
    [":"] between the hour, the minute and the second, and a space before AM or
    PM, each a [<span data-type="literal">] a reader skips. A {!Zoned} field's
    zone follows them, as the reader's locale names it, [GMT+3]: a
    [<span data-type="timeZoneName">] a reader reaches and nothing edits, unless
    the field hides it. *)
module Input : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?ref:(Dom.htmlDivElement -> unit) ->
      children:
        ( segment Solidtype.Solid.accessor -> Solidtype.Jsx.element,
          [ `render ] )
        Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      (unit -> unit) Solidtype.Html.Div.check
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
      ?ref:(Dom.htmlDivElement -> unit) ->
      ?props:t Solidtype.Solid.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

type state = {
  is_disabled : bool Solidtype.Solid.accessor;
  is_invalid : bool Solidtype.Solid.accessor;
  is_read_only : bool Solidtype.Solid.accessor;
  is_required : bool Solidtype.Solid.accessor;
}
(** What a time field's children are drawn of, given as a function, as HeroUI's
    render props are, each read where Solid tracks it. *)

module Props : sig
  type t

  val check :
    ?value:
      Solidtype_internationalized_date.Types.Time.t Js.Nullable.t
      Solidtype.Check.value ->
    ?default_value:
      Solidtype_internationalized_date.Types.Time.t Solidtype.Check.value ->
    ?on_change:(Solidtype_internationalized_date.Types.Time.t option -> unit) ->
    ?placeholder_value:
      Solidtype_internationalized_date.Types.Time.t Solidtype.Check.value ->
    ?min_value:
      Solidtype_internationalized_date.Types.Time.t Solidtype.Check.value ->
    ?max_value:
      Solidtype_internationalized_date.Types.Time.t Solidtype.Check.value ->
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
    ?on_focus_out:(Dom.focusEvent -> unit) ->
    ?ref:(Dom.htmlDivElement -> unit) ->
    children:
      ( state -> Solidtype.Jsx.element,
        [ `nodes | `render ] )
      Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    (unit -> unit) Solidtype.Html.Div.check
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component

(** A time field whose value is a time on a date, a
    {!Solidtype_internationalized_date.Types.CalendarDateTime}: it shows and
    edits the time alone, and keeps the date. While it has no value, a time
    typed is put on [placeholder_value]'s date, which an arrow key also steps an
    empty segment from; [min_value] and [max_value] are times of day. It submits
    its value whole, [2026-10-30T14:30:00]. *)
module Date_time : sig
  module Props : sig
    type t

    val check :
      ?value:
        Solidtype_internationalized_date.Types.CalendarDateTime.t Js.Nullable.t
        Solidtype.Check.value ->
      ?default_value:
        Solidtype_internationalized_date.Types.CalendarDateTime.t
        Solidtype.Check.value ->
      ?on_change:
        (Solidtype_internationalized_date.Types.CalendarDateTime.t option ->
        unit) ->
      placeholder_value:
        Solidtype_internationalized_date.Types.CalendarDateTime.t
        Solidtype.Check.value ->
      ?min_value:
        Solidtype_internationalized_date.Types.Time.t Solidtype.Check.value ->
      ?max_value:
        Solidtype_internationalized_date.Types.Time.t Solidtype.Check.value ->
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
      ?on_focus_out:(Dom.focusEvent -> unit) ->
      ?ref:(Dom.htmlDivElement -> unit) ->
      children:
        ( state -> Solidtype.Jsx.element,
          [ `nodes | `render ] )
        Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** A time field whose value is a time in a zone, a
    {!Solidtype_internationalized_date.Types.ZonedDateTime}: it shows and edits
    the time alone, and keeps the date and the zone, whose name it shows after
    the time unless [hide_time_zone]. A time changes by the zone's rules: one
    its clocks skip, as they go forward, is the hour after it, as the zone's
    [compatible] reading has it. While it has no value, a time typed is put on
    [placeholder_value]'s date and zone, which an arrow key also steps an empty
    segment from; [min_value] and [max_value] are times of day. It submits its
    value whole, [2026-10-30T14:30:00+02:00[Europe/Kyiv]]. *)
module Zoned : sig
  module Props : sig
    type t

    val check :
      ?value:
        Solidtype_internationalized_date.Types.ZonedDateTime.t Js.Nullable.t
        Solidtype.Check.value ->
      ?default_value:
        Solidtype_internationalized_date.Types.ZonedDateTime.t
        Solidtype.Check.value ->
      ?on_change:
        (Solidtype_internationalized_date.Types.ZonedDateTime.t option -> unit) ->
      placeholder_value:
        Solidtype_internationalized_date.Types.ZonedDateTime.t
        Solidtype.Check.value ->
      ?min_value:
        Solidtype_internationalized_date.Types.Time.t Solidtype.Check.value ->
      ?max_value:
        Solidtype_internationalized_date.Types.Time.t Solidtype.Check.value ->
      ?hide_time_zone:bool Solidtype.Check.value ->
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
      ?on_focus_out:(Dom.focusEvent -> unit) ->
      ?ref:(Dom.htmlDivElement -> unit) ->
      children:
        ( state -> Solidtype.Jsx.element,
          [ `nodes | `render ] )
        Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end
