(** HeroUI's DatePicker: a {!Date_field}'s group whose {!Trigger} opens a
    {!Popover} of a {!Calendar}, with HeroUI's classes from
    {!Styles.DatePicker}, on {!Solidtype_headless.Date_picker}, since Kobalte
    has no date picker. Its parts are composed as HeroUI's are: a
    {!Date_field.Group} of the field's input, the trigger in its
    {!Date_field.Suffix}, and the calendar in the popover.

    Its page, with its examples:
    [$(opam var solidtype:doc)/pages/heroui/date-picker.md].

    {[
      <Date_picker name="date">
        <Label>"Date"</Label>
        <Date_field.Group full_width=true>
          <Date_field.Input>
            (fun segment -> <Date_field.Segment segment=(S.get segment) />)
          </Date_field.Input>
          <Date_field.Suffix>
            <Date_picker.Trigger><Date_picker.Trigger_indicator /></Date_picker.Trigger>
          </Date_field.Suffix>
        </Date_field.Group>
        <Date_picker.Popover>
          <Calendar aria_label="Event date"> ... </Calendar>
        </Date_picker.Popover>
      </Date_picker>
    ]}

    Its value is a {!Solidtype_internationalized_date.Types.CalendarDate}, as a
    {!Date_field}'s is; a date with a time is {!Date_time}'s, and one in a zone
    {!Zoned}'s. The calendar in its popover takes its date, its range, and
    whether it is disabled, read-only or invalid, and the focus as it opens; a
    day chosen there is its value and closes the popover, unless
    [should_close_on_select] is [false]. A picker with a time keeps it as a day
    is chosen; its children may be a function of its {!type-state}, whose
    [state] gives the time chosen apart, to draw a {!Time_field} in the popover.
    Its locale is the one an [I18nProvider] names, else [en-GB]. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx
module D := Solidtype_internationalized_date

type 'v state = {
  state : 'v Solidtype_headless.Date_picker.state;
      (** React Stately's date picker state: its date and time apart, its
          popover open. *)
  is_disabled : bool S.accessor;
  is_invalid : bool S.accessor;
  is_read_only : bool S.accessor;
  is_required : bool S.accessor;
  is_open : bool S.accessor;
}
(** What a date picker's children are drawn of, given as a function, as HeroUI's
    render props are. *)

module Props : sig
  type t

  val check :
    ?value:D.Types.CalendarDate.t Js.Nullable.t Solidtype.Check.value ->
    ?default_value:D.Types.CalendarDate.t Solidtype.Check.value ->
    ?on_change:(D.Types.CalendarDate.t option -> unit) ->
    ?placeholder_value:D.Types.CalendarDate.t Solidtype.Check.value ->
    ?min_value:D.Types.CalendarDate.t Solidtype.Check.value ->
    ?max_value:D.Types.CalendarDate.t Solidtype.Check.value ->
    ?is_date_unavailable:(D.Types.CalendarDate.t -> bool) ->
    ?should_force_leading_zeros:bool Solidtype.Check.value ->
    ?is_required:bool Solidtype.Check.value ->
    ?is_invalid:bool Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?is_read_only:bool Solidtype.Check.value ->
    ?name:string Solidtype.Check.value ->
    ?auto_focus:bool Solidtype.Check.value ->
    ?aria_label:string Solidtype.Check.value ->
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

(** A date picker whose value is a date with a time, a
    {!Solidtype_internationalized_date.Types.CalendarDateTime}, as a
    {!Date_field.Date_time}'s is; a day chosen keeps its time, else is put at
    the placeholder's, else at the start of the day. *)
module Date_time : sig
  module Props : sig
    type t

    val check :
      ?value:D.Types.CalendarDateTime.t Js.Nullable.t Solidtype.Check.value ->
      ?default_value:D.Types.CalendarDateTime.t Solidtype.Check.value ->
      ?on_change:(D.Types.CalendarDateTime.t option -> unit) ->
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
      ?name:string Solidtype.Check.value ->
      ?auto_focus:bool Solidtype.Check.value ->
      ?aria_label:string Solidtype.Check.value ->
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

(** A date picker whose value is a date with a time in a zone, a
    {!Solidtype_internationalized_date.Types.ZonedDateTime}, as a
    {!Date_field.Zoned}'s is; a day chosen keeps its time and zone, else the
    placeholder's. *)
module Zoned : sig
  module Props : sig
    type t

    val check :
      ?value:D.Types.ZonedDateTime.t Js.Nullable.t Solidtype.Check.value ->
      ?default_value:D.Types.ZonedDateTime.t Solidtype.Check.value ->
      ?on_change:(D.Types.ZonedDateTime.t option -> unit) ->
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
      ?name:string Solidtype.Check.value ->
      ?auto_focus:bool Solidtype.Check.value ->
      ?aria_label:string Solidtype.Check.value ->
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

(** What opens the popover: a [<button>] named [Calendar] in its locale,
    [data-pressed] while the popover is open, disabled while the picker is
    disabled or read-only. *)
module Trigger : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `elements ]) Solidtype.Check.children ->
      ?ref:(Dom.htmlButtonElement -> unit) ->
      ?as_:(Solidtype.Html.Button.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Button.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The trigger's icon, HeroUI's calendar, or its children: a [<span>] a reader
    skips. *)
module Trigger_indicator : sig
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

(** The popover the calendar is drawn in, a dialog anchored to the field's
    group, on its [placement] side, [`bottom] by default, [offset] from it, [8.]
    by default; it animates in and out as HeroUI's does. *)
module Popover : sig
  module Props : sig
    type t

    val check :
      ?placement:[ `top | `bottom | `left | `right ] Solidtype.Check.value ->
      ?offset:float Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?style:string Solidtype.Check.value ->
      ?ref:(Dom.htmlDivElement -> unit) ->
      children:(_, [ `elements ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

val in_range_look : (unit -> Jsx.element) -> Jsx.element
(** What [draw] draws, the parts above in a range picker's look, with HeroUI's
    classes from {!Styles.DateRangePicker}: {!Date_range_picker}'s parts are
    these. *)
