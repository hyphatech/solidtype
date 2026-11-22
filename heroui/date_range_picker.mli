(** HeroUI's DateRangePicker: a {!Date_field}'s group of two inputs, a start and
    an end, whose {!Trigger} opens a {!Popover} of a {!Range_calendar}, with
    HeroUI's classes from {!Styles.DateRangePicker}, on
    {!Solidtype_headless.Date_picker.Root_range}, since Kobalte has no range
    picker. Its parts are composed as HeroUI's are: a {!Date_field.Group} of two
    {!Date_field.Input}s given their [slot], ["start"] and ["end"], with a
    {!Range_separator} between them and the trigger in its {!Date_field.Suffix},
    and the range calendar in the popover. Its trigger, its indicator and its
    popover are {!Date_picker}'s, in the range's look.

    Its page, with its examples:
    [$(opam var solidtype:doc)/pages/heroui/date-range-picker.md].

    {[
      <Date_range_picker start_name="startDate" end_name="endDate">
        <Label>"Trip dates"</Label>
        <Date_field.Group full_width=true>
          <Date_field.Input slot="start">
            (fun segment -> <Date_field.Segment segment=(S.get segment) />)
          </Date_field.Input>
          <Date_range_picker.Range_separator />
          <Date_field.Input slot="end">
            (fun segment -> <Date_field.Segment segment=(S.get segment) />)
          </Date_field.Input>
          <Date_field.Suffix>
            <Date_range_picker.Trigger>
              <Date_range_picker.Trigger_indicator />
            </Date_range_picker.Trigger>
          </Date_field.Suffix>
        </Date_field.Group>
        <Date_range_picker.Popover>
          <Range_calendar aria_label="Trip dates"> ... </Range_calendar>
        </Date_range_picker.Popover>
      </Date_range_picker>
    ]}

    Its value is a {!range} of
    {!Solidtype_internationalized_date.Types.CalendarDate}s, told once both ends
    are there, and [None] as one is erased; a range of dates with times is
    {!Date_time}'s, and of ones in a zone {!Zoned}'s. Each end is sent with a
    form by its name, [start_name] and [end_name]. It is invalid while
    [is_invalid], while its end is before its start, and while an end is out of
    its range or unavailable. The arrows, Backspace and a segment typed whole
    move between its ends. The range calendar in its popover takes its range and
    chooses it, closing the popover unless [should_close_on_select] is [false];
    a range with times keeps them. Its locale is the one an [I18nProvider]
    names, else [en-GB]. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx
module D := Solidtype_internationalized_date

type 'v range = 'v Solidtype_headless.Date_field.range = {
  start : 'v;
  end_ : 'v;
}

type 'v state = {
  state : 'v Solidtype_headless.Date_picker.range_state;
      (** React Stately's range picker state: its dates and times apart, its
          popover open. *)
  is_disabled : bool S.accessor;
  is_invalid : bool S.accessor;
  is_read_only : bool S.accessor;
  is_required : bool S.accessor;
  is_open : bool S.accessor;
}
(** What a range picker's children are drawn of, given as a function, as
    HeroUI's render props are. *)

module Props : sig
  type t

  val check :
    ?value:D.Types.CalendarDate.t range Js.Null.t Solidtype.Check.value ->
    ?default_value:D.Types.CalendarDate.t range Solidtype.Check.value ->
    ?on_change:(D.Types.CalendarDate.t range option -> unit) ->
    ?start_name:string Solidtype.Check.value ->
    ?end_name:string Solidtype.Check.value ->
    ?placeholder_value:D.Types.CalendarDate.t Solidtype.Check.value ->
    ?min_value:D.Types.CalendarDate.t Solidtype.Check.value ->
    ?max_value:D.Types.CalendarDate.t Solidtype.Check.value ->
    ?is_date_unavailable:(D.Types.CalendarDate.t -> bool) ->
    ?should_force_leading_zeros:bool Solidtype.Check.value ->
    ?is_required:bool Solidtype.Check.value ->
    ?is_invalid:bool Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?is_read_only:bool Solidtype.Check.value ->
    ?auto_focus:bool Solidtype.Check.value ->
    ?is_open:bool Solidtype.Check.value ->
    ?default_open:bool Solidtype.Check.value ->
    ?on_open_change:(bool -> unit) ->
    ?should_close_on_select:bool Solidtype.Check.value ->
    ?first_day_of_week:
      Solidtype_headless.Calendar.day_of_week Solidtype.Check.value ->
    ?page_behavior:[ `visible | `single ] Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?on_blur:(Dom.focusEvent -> unit) ->
    ?ref:(Dom.htmlDivElement -> unit) ->
    children:
      ( D.Types.CalendarDate.t state -> Jsx.element,
        [ `elements | `render ] )
      Solidtype.Check.children ->
    ?as_:
      (Solidtype.Html.Div.props -> D.Types.CalendarDate.t state -> Jsx.element) ->
    ?props:t S.rest ->
    (unit -> unit) Solidtype.Html.Div.check
end

val make : Props.t -> Jsx.element
val component : Props.t Jsx.component

(** A range picker whose ends are dates with times, as
    {!Date_picker.Date_time}'s value is. *)
module Date_time : sig
  module Props : sig
    type t

    val check :
      ?value:D.Types.CalendarDateTime.t range Js.Null.t Solidtype.Check.value ->
      ?default_value:D.Types.CalendarDateTime.t range Solidtype.Check.value ->
      ?on_change:(D.Types.CalendarDateTime.t range option -> unit) ->
      ?start_name:string Solidtype.Check.value ->
      ?end_name:string Solidtype.Check.value ->
      ?placeholder_value:D.Types.CalendarDateTime.t Solidtype.Check.value ->
      ?granularity:[ `day | `hour | `minute | `second ] Solidtype.Check.value ->
      ?hour_cycle:[ `h12 | `h24 ] Solidtype.Check.value ->
      ?min_value:D.Types.CalendarDateTime.t Solidtype.Check.value ->
      ?max_value:D.Types.CalendarDateTime.t Solidtype.Check.value ->
      ?is_date_unavailable:(D.Types.CalendarDateTime.t -> bool) ->
      ?should_force_leading_zeros:bool Solidtype.Check.value ->
      ?is_required:bool Solidtype.Check.value ->
      ?is_invalid:bool Solidtype.Check.value ->
      ?is_disabled:bool Solidtype.Check.value ->
      ?is_read_only:bool Solidtype.Check.value ->
      ?auto_focus:bool Solidtype.Check.value ->
      ?is_open:bool Solidtype.Check.value ->
      ?default_open:bool Solidtype.Check.value ->
      ?on_open_change:(bool -> unit) ->
      ?should_close_on_select:bool Solidtype.Check.value ->
      ?first_day_of_week:
        Solidtype_headless.Calendar.day_of_week Solidtype.Check.value ->
      ?page_behavior:[ `visible | `single ] Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?on_blur:(Dom.focusEvent -> unit) ->
      ?ref:(Dom.htmlDivElement -> unit) ->
      children:
        ( D.Types.CalendarDateTime.t state -> Jsx.element,
          [ `elements | `render ] )
        Solidtype.Check.children ->
      ?as_:
        (Solidtype.Html.Div.props ->
        D.Types.CalendarDateTime.t state ->
        Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** A range picker whose ends are dates with times in a zone, as
    {!Date_picker.Zoned}'s value is. *)
module Zoned : sig
  module Props : sig
    type t

    val check :
      ?value:D.Types.ZonedDateTime.t range Js.Null.t Solidtype.Check.value ->
      ?default_value:D.Types.ZonedDateTime.t range Solidtype.Check.value ->
      ?on_change:(D.Types.ZonedDateTime.t range option -> unit) ->
      ?start_name:string Solidtype.Check.value ->
      ?end_name:string Solidtype.Check.value ->
      placeholder_value:D.Types.ZonedDateTime.t Solidtype.Check.value ->
      ?granularity:[ `day | `hour | `minute | `second ] Solidtype.Check.value ->
      ?hour_cycle:[ `h12 | `h24 ] Solidtype.Check.value ->
      ?hide_time_zone:bool Solidtype.Check.value ->
      ?min_value:D.Types.ZonedDateTime.t Solidtype.Check.value ->
      ?max_value:D.Types.ZonedDateTime.t Solidtype.Check.value ->
      ?is_date_unavailable:(D.Types.ZonedDateTime.t -> bool) ->
      ?should_force_leading_zeros:bool Solidtype.Check.value ->
      ?is_required:bool Solidtype.Check.value ->
      ?is_invalid:bool Solidtype.Check.value ->
      ?is_disabled:bool Solidtype.Check.value ->
      ?is_read_only:bool Solidtype.Check.value ->
      ?auto_focus:bool Solidtype.Check.value ->
      ?is_open:bool Solidtype.Check.value ->
      ?default_open:bool Solidtype.Check.value ->
      ?on_open_change:(bool -> unit) ->
      ?should_close_on_select:bool Solidtype.Check.value ->
      ?first_day_of_week:
        Solidtype_headless.Calendar.day_of_week Solidtype.Check.value ->
      ?page_behavior:[ `visible | `single ] Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?on_blur:(Dom.focusEvent -> unit) ->
      ?ref:(Dom.htmlDivElement -> unit) ->
      children:
        ( D.Types.ZonedDateTime.t state -> Jsx.element,
          [ `elements | `render ] )
        Solidtype.Check.children ->
      ?as_:
        (Solidtype.Html.Div.props ->
        D.Types.ZonedDateTime.t state ->
        Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

module Trigger = Date_picker.Trigger
module Trigger_indicator = Date_picker.Trigger_indicator
module Popover = Date_picker.Popover

(** What stands between the start's input and the end's, [" - "], or its
    children: a [<span>] a reader skips. *)
module Range_separator : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?children:(_, [ `elements ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Span.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Span.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end
