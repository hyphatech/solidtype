(** A date picker, as Kobalte would make one: a {!Date_field} whose {!Group}
    holds a {!Trigger} that opens a popover, its {!Content}, of a {!Calendar}
    that chooses the field's date, as React Aria's date picker is. Its root is
    the field's root, and takes every prop the field's does; the field's parts,
    its label, input and segments, are used inside it as inside a field. It
    draws no style.

    {[
      <Date_picker.Root name="start">
        <Date_field.Label>"Date"</Date_field.Label>
        <Date_picker.Group>
          <Date_field.Input>
            (fun segment -> <Date_field.Segment segment=(S.get segment) />)
          </Date_field.Input>
          <Date_picker.Trigger>"Open"</Date_picker.Trigger>
        </Date_picker.Group>
        <Date_picker.Content>
          <Calendar.Root aria_label="Date"> ... </Calendar.Root>
        </Date_picker.Content>
      </Date_picker.Root>
    ]}

    A calendar inside its content takes the picker's date, its range and its
    state where it is given none of its own, and the focus as it opens, by
    {!Calendar.Given}. A day chosen there becomes the field's date and closes
    the popover, unless [should_close_on_select] is [false]. A picker with a
    time keeps it as a day is chosen, and puts a day chosen while it has no
    value at the time chosen apart, else its placeholder's, else the start of
    the day; its state, which its children may be a function of, gives the date
    and the time chosen apart, to draw a time field in the popover. The popover
    is anchored to the {!Group}, a dialog named by the trigger and the label;
    Escape or a press outside it closes it, and the focus goes back to the
    trigger. Its words, the trigger's name, are its locale's, React Aria's,
    unless [picker_translations] are given. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx
module D := Solidtype_internationalized_date

type translations = { calendar : string }
(** What a picker tells a reader, in its locale's words, React Aria's, else
    English: its trigger's name. *)

val english : translations
val translations_for : string -> translations

type 'v state = {
  value : 'v option S.accessor;
  date_value : D.Types.CalendarDate.t option S.accessor;
      (** The value's date, else the date chosen apart from a time. *)
  time_value : 'v option S.accessor;
      (** The value, where it has a time, else the time chosen apart. *)
  set_date_value : D.Types.CalendarDate.t -> unit;
  set_time_value : 'v -> unit;
  is_open : bool S.accessor;
  set_open : bool -> unit;
  has_time : bool S.accessor;
}
(** What a root's children may be drawn of, as React Stately's date picker state
    gives them. *)

type context = {
  is_open : bool S.accessor;
  set_open : bool -> unit;
  is_disabled : bool S.accessor;
  is_read_only : bool S.accessor;
}
(** What a part inside a root reads of it, and a style's attribute on it. *)

module Context : sig
  val use : unit -> context
  (** The picker above; outside a root it raises [Invalid_argument]. *)

  val find : unit -> context option
  (** The picker above, if there is one: a part a field and a picker share reads
      which it is in. *)
end

(** A picker of a date: {!Date_field.Root}, [data-open] while its popover is,
    its value kept or given as the field's is, its popover open while [is_open],
    else as it keeps it, [default_open] at first, and each change told
    [on_open_change]. *)
module Root : sig
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
      ?aria_labelledby:string Solidtype.Check.value ->
      ?aria_describedby:string Solidtype.Check.value ->
      ?translations:Date_field.translations Solidtype.Check.value ->
      ?is_open:bool Solidtype.Check.value ->
      ?default_open:bool Solidtype.Check.value ->
      ?on_open_change:(bool -> unit) ->
      ?should_close_on_select:bool Solidtype.Check.value ->
      ?first_day_of_week:Calendar.day_of_week Solidtype.Check.value ->
      ?page_behavior:[ `visible | `single ] Solidtype.Check.value ->
      ?picker_translations:translations Solidtype.Check.value ->
      children:
        ( D.Types.CalendarDate.t state -> Jsx.element,
          [ `elements | `render ] )
        Solidtype.Check.children ->
      ?as_:
        (Solidtype.Html.Div.props ->
        D.Types.CalendarDate.t state ->
        Jsx.element) ->
      ?props:'spread S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** A picker of a date and a time, on {!Date_field.Root_date_time}; with [`day]
    for [granularity] it has no time. *)
module Root_date_time : sig
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
      ?aria_labelledby:string Solidtype.Check.value ->
      ?aria_describedby:string Solidtype.Check.value ->
      ?translations:Date_field.translations Solidtype.Check.value ->
      ?is_open:bool Solidtype.Check.value ->
      ?default_open:bool Solidtype.Check.value ->
      ?on_open_change:(bool -> unit) ->
      ?should_close_on_select:bool Solidtype.Check.value ->
      ?first_day_of_week:Calendar.day_of_week Solidtype.Check.value ->
      ?page_behavior:[ `visible | `single ] Solidtype.Check.value ->
      ?picker_translations:translations Solidtype.Check.value ->
      children:
        ( D.Types.CalendarDateTime.t state -> Jsx.element,
          [ `elements | `render ] )
        Solidtype.Check.children ->
      ?as_:
        (Solidtype.Html.Div.props ->
        D.Types.CalendarDateTime.t state ->
        Jsx.element) ->
      ?props:'spread S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** A picker of a date and a time in a time zone, on {!Date_field.Root_zoned}; a
    day chosen keeps the value's time and zone, else the placeholder's. *)
module Root_zoned : sig
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
      ?aria_labelledby:string Solidtype.Check.value ->
      ?aria_describedby:string Solidtype.Check.value ->
      ?translations:Date_field.translations Solidtype.Check.value ->
      ?is_open:bool Solidtype.Check.value ->
      ?default_open:bool Solidtype.Check.value ->
      ?on_open_change:(bool -> unit) ->
      ?should_close_on_select:bool Solidtype.Check.value ->
      ?first_day_of_week:Calendar.day_of_week Solidtype.Check.value ->
      ?page_behavior:[ `visible | `single ] Solidtype.Check.value ->
      ?picker_translations:translations Solidtype.Check.value ->
      children:
        ( D.Types.ZonedDateTime.t state -> Jsx.element,
          [ `elements | `render ] )
        Solidtype.Check.children ->
      ?as_:
        (Solidtype.Html.Div.props ->
        D.Types.ZonedDateTime.t state ->
        Jsx.element) ->
      ?props:'spread S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

type 'v range_state = {
  range : 'v Date_field.range option S.accessor;
  date_range : Calendar.range option S.accessor;
      (** The range's dates, else the dates chosen apart from times. *)
  time_range : ('v option * 'v option) S.accessor;
      (** The range, where it has times, else the times chosen apart. *)
  set_date_range : Calendar.range -> unit;
  set_time : [ `start | `end_ ] -> 'v -> unit;
  range_open : bool S.accessor;
  set_range_open : bool -> unit;
  range_has_time : bool S.accessor;
}
(** What a range picker's children may be drawn of, as React Stately's range
    picker state gives them. *)

(** A picker of a range of dates: {!Date_field.Root_range}, its inputs given
    their [slot] inside the {!Group}, and a {!Calendar.Root_range} in its
    popover, which takes the range and chooses it, as React Aria's range picker
    composes them. Its popover opens and closes as {!Root}'s does. *)
module Root_range : sig
  module Props : sig
    type t

    val check :
      ?value:
        D.Types.CalendarDate.t Date_field.range Js.Nullable.t
        Solidtype.Check.value ->
      ?default_value:
        D.Types.CalendarDate.t Date_field.range Solidtype.Check.value ->
      ?on_change:(D.Types.CalendarDate.t Date_field.range option -> unit) ->
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
      ?aria_labelledby:string Solidtype.Check.value ->
      ?aria_describedby:string Solidtype.Check.value ->
      ?translations:Date_field.translations Solidtype.Check.value ->
      ?is_open:bool Solidtype.Check.value ->
      ?default_open:bool Solidtype.Check.value ->
      ?on_open_change:(bool -> unit) ->
      ?should_close_on_select:bool Solidtype.Check.value ->
      ?first_day_of_week:Calendar.day_of_week Solidtype.Check.value ->
      ?page_behavior:[ `visible | `single ] Solidtype.Check.value ->
      ?picker_translations:translations Solidtype.Check.value ->
      children:
        ( D.Types.CalendarDate.t range_state -> Jsx.element,
          [ `elements | `render ] )
        Solidtype.Check.children ->
      ?as_:
        (Solidtype.Html.Div.props ->
        D.Types.CalendarDate.t range_state ->
        Jsx.element) ->
      ?props:'spread S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** A picker of a range of dates with times, on
    {!Date_field.Root_range_date_time}: a range chosen keeps its ends' times,
    else is put at those chosen apart, else at the placeholder's, else at the
    start of the day. *)
module Root_range_date_time : sig
  module Props : sig
    type t

    val check :
      ?value:
        D.Types.CalendarDateTime.t Date_field.range Js.Nullable.t
        Solidtype.Check.value ->
      ?default_value:
        D.Types.CalendarDateTime.t Date_field.range Solidtype.Check.value ->
      ?on_change:(D.Types.CalendarDateTime.t Date_field.range option -> unit) ->
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
      ?aria_labelledby:string Solidtype.Check.value ->
      ?aria_describedby:string Solidtype.Check.value ->
      ?translations:Date_field.translations Solidtype.Check.value ->
      ?is_open:bool Solidtype.Check.value ->
      ?default_open:bool Solidtype.Check.value ->
      ?on_open_change:(bool -> unit) ->
      ?should_close_on_select:bool Solidtype.Check.value ->
      ?first_day_of_week:Calendar.day_of_week Solidtype.Check.value ->
      ?page_behavior:[ `visible | `single ] Solidtype.Check.value ->
      ?picker_translations:translations Solidtype.Check.value ->
      children:
        ( D.Types.CalendarDateTime.t range_state -> Jsx.element,
          [ `elements | `render ] )
        Solidtype.Check.children ->
      ?as_:
        (Solidtype.Html.Div.props ->
        D.Types.CalendarDateTime.t range_state ->
        Jsx.element) ->
      ?props:'spread S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** A picker of a range of dates with times in a zone, on
    {!Date_field.Root_range_zoned}. *)
module Root_range_zoned : sig
  module Props : sig
    type t

    val check :
      ?value:
        D.Types.ZonedDateTime.t Date_field.range Js.Nullable.t
        Solidtype.Check.value ->
      ?default_value:
        D.Types.ZonedDateTime.t Date_field.range Solidtype.Check.value ->
      ?on_change:(D.Types.ZonedDateTime.t Date_field.range option -> unit) ->
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
      ?aria_labelledby:string Solidtype.Check.value ->
      ?aria_describedby:string Solidtype.Check.value ->
      ?translations:Date_field.translations Solidtype.Check.value ->
      ?is_open:bool Solidtype.Check.value ->
      ?default_open:bool Solidtype.Check.value ->
      ?on_open_change:(bool -> unit) ->
      ?should_close_on_select:bool Solidtype.Check.value ->
      ?first_day_of_week:Calendar.day_of_week Solidtype.Check.value ->
      ?page_behavior:[ `visible | `single ] Solidtype.Check.value ->
      ?picker_translations:translations Solidtype.Check.value ->
      children:
        ( D.Types.ZonedDateTime.t range_state -> Jsx.element,
          [ `elements | `render ] )
        Solidtype.Check.children ->
      ?as_:
        (Solidtype.Html.Div.props ->
        D.Types.ZonedDateTime.t range_state ->
        Jsx.element) ->
      ?props:'spread S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The field's segments and the trigger, a [<div role="group">] named and
    described as the field is, which the popover is anchored to; while the
    popover is open, it leaves its keys to it. *)
module Group : sig
  module Props : sig
    type t

    val check :
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `elements ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** What opens the popover, Kobalte's popover trigger: a [<button>] named
    [Calendar] in its locale and labelled by the field's label too, disabled
    while the picker is disabled or read-only. *)
module Trigger : sig
  module Props : sig
    type t

    val check :
      ?as_:(Solidtype.Html.Button.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `elements ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Button.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The popover, Kobalte's popover content, a dialog in the page's top layer,
    named by the trigger and the field's label, on the side [placement] says,
    Kobalte's, ["bottom"] by default, [offset] from the group, [8.] by default.
    It is drawn while the popover is open, and while [kept], for a style to
    animate it closing. *)
module Content : sig
  module Props : sig
    type t

    val check :
      ?placement:string Solidtype.Check.value ->
      ?offset:float Solidtype.Check.value ->
      ?kept:bool Solidtype.Check.value ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `elements ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end
