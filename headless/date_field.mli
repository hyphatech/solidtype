(** A date field, as Kobalte would make one: a [<div>] around a group of
    segments, each part of the date -- its year, month and day, and on a field
    with a time its hour, minute, second and AM or PM -- a {!Segment}, Kobalte's
    spin button, typed into or stepped by the arrow keys. Its value is
    \@internationalized/date's: a
    {!Solidtype_internationalized_date.Types.CalendarDate} for {!Root}, a
    {!Solidtype_internationalized_date.Types.CalendarDateTime} for
    {!Root_date_time} and a
    {!Solidtype_internationalized_date.Types.ZonedDateTime} for {!Root_zoned},
    each given back as the kind it was given. It draws no style: each part is
    the element it names, its roles and state as attributes, and takes every
    attribute its element does, which it passes on.

    {[
      <Date_field.Root name="start">
        <Date_field.Label>"Date"</Date_field.Label>
        <Date_field.Input>
          (fun segment -> <Date_field.Segment segment=(S.get segment) />)
        </Date_field.Input>
      </Date_field.Root>
    ]}

    Its segments are its locale's, in its order and its calendar -- [dd/mm/yyyy]
    in [en-GB], [mm/dd/yyyy] in [en-US], [dd.mm.yyyy] in [de-DE], a Buddhist
    year in [th-TH] -- and the literals between them. Its locale is the one an
    [I18nProvider] names, else [en-GB], whatever the browser reads. Tab reaches
    each segment, the arrows Left and Right move between them as the page's
    direction reads them, and a segment typed into whole moves on to the next.
    Up and Down step a segment, wrapping at its ends, Page Up and Page Down by a
    page -- five years, two months, a week, two hours, a quarter of an hour --
    and Home and End reach its least and greatest; Backspace erases a digit, and
    an empty segment's Backspace moves to the one before. A segment typed before
    it has a value starts from [placeholder_value], else today. Typing a letter
    chooses AM or PM, or an era. A date partly typed, or not yet a date --
    February 30 -- is the field's own: the value changes, and [on_change] is
    told, once every segment has its part and makes a date; as focus leaves the
    field, a whole date that is not one is made one, February 30 the last day of
    February.

    The field is invalid while [is_invalid], and while its value is before
    [min_value], after [max_value] or a day [is_date_unavailable] refuses, as
    Kobalte's time field is. A form is sent its value as
    \@internationalized/date writes it, [2026-11-21]. A part is used inside a
    root: elsewhere it raises [Invalid_argument] as it is made. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx
module D := Solidtype_internationalized_date

type segment_type =
  [ `era
  | `year
  | `month
  | `day
  | `hour
  | `minute
  | `second
  | `dayPeriod
  | `timeZoneName
  | `literal ]
(** What part of the date a segment is; a literal is the text between two. *)

type segment = {
  type_ : segment_type;
  text : string;  (** What it shows: its part, or its placeholder. *)
  value : int option;
      (** Its part, an era by its place among the calendar's, AM 0 and PM 1. *)
  min_value : int option;
  max_value : int option;  (** Its least and greatest, where it is edited. *)
  is_placeholder : bool;  (** Whether it has no part yet. *)
  placeholder : string;  (** What it shows while it has none: [mm], [––]. *)
  is_editable : bool;
}
(** A segment of the field, as {!Input} gives each to its children. *)

type translations = {
  selected_date_description : string -> string;
  start_date : string;
  end_date : string;
  selected_range_description : string -> string -> string;
}
(** What the field tells a reader, of its value as its locale writes it, in its
    locale's words where none are given, React Aria's, else English. *)

val english : translations
(** [Selected Date: November 21, 2026], React Aria's English. *)

type 'v range = { start : 'v; end_ : 'v }
(** A range of values, its ends included, as a range's root gives it. *)

type field = {
  segments : segment array S.accessor;
  is_disabled : bool S.accessor;
  is_read_only : bool S.accessor;
  is_required : bool S.accessor;
  is_invalid : bool S.accessor;
      (** Given, or its value out of its range or unavailable. *)
  labelled_by : string option S.accessor;
      (** The ids that name it: its {!Label}'s and [aria_labelledby]. *)
  described_by : string option S.accessor;
      (** The ids that describe it: its value as its locale tells it, its
          {!Description} and {!Error_message}, and [aria_describedby]. *)
}
(** What a part inside a root reads of it, and a style's attribute on it. *)

module Context : sig
  val use : unit -> field
  (** The field above; outside a root it raises [Invalid_argument]. *)
end

(** A field of a date, a [<div>]. Its value is [value] while it is given one --
    [Js.Nullable.null] keeps it empty -- else the one it keeps, [default_value]
    at first, and each change calls [on_change], [None] once every segment is
    erased. A segment typed while it has none starts from [placeholder_value],
    else today. It is named by [aria_label] or [aria_labelledby], else by its
    {!Label}, and described by its {!Description} and {!Error_message};
    [auto_focus] focuses its first segment as it is drawn. Its leading zeros are
    its locale's, or always there with [should_force_leading_zeros]. While
    [is_disabled] its segments cannot be focused, and while [is_read_only] they
    are focused but not changed. Its {!Input} is the group of its segments,
    else, with [`presentation] for [input_role], only their container, where a
    group around it -- a date picker's -- names the field. *)
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
      ?translations:translations Solidtype.Check.value ->
      ?input_role:[ `group | `presentation ] Solidtype.Check.value ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `elements ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** A field of a date and a time, as {!Root} is: its segments run to
    [granularity], [`minute] by default, its hour on the clock of [hour_cycle],
    else the locale's. A time typed while it has none is put on
    [placeholder_value], else today at midnight. It is sent
    [2026-11-21T09:30:00]. *)
module Root_date_time : sig
  module Props : sig
    type t

    val check :
      ?value:D.Types.CalendarDateTime.t Js.Nullable.t Solidtype.Check.value ->
      ?default_value:D.Types.CalendarDateTime.t Solidtype.Check.value ->
      ?on_change:(D.Types.CalendarDateTime.t option -> unit) ->
      ?placeholder_value:D.Types.CalendarDateTime.t Solidtype.Check.value ->
      ?min_value:D.Types.CalendarDateTime.t Solidtype.Check.value ->
      ?max_value:D.Types.CalendarDateTime.t Solidtype.Check.value ->
      ?is_date_unavailable:(D.Types.CalendarDateTime.t -> bool) ->
      ?granularity:[ `day | `hour | `minute | `second ] Solidtype.Check.value ->
      ?hour_cycle:[ `h12 | `h24 ] Solidtype.Check.value ->
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
      ?translations:translations Solidtype.Check.value ->
      ?input_role:[ `group | `presentation ] Solidtype.Check.value ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `elements ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** A field of a date and a time in a zone, as {!Root_date_time} is: its zone's
    name, as the locale writes it at the time shown, follows its segments, a
    segment a reader reaches and nothing edits, unless [hide_time_zone]. Its
    hour steps by the zone's rules, so an hour its clocks repeat is stepped
    through twice. A time typed while it has none is put on
    [placeholder_value]'s date and zone. It is sent
    [2026-11-21T09:30:00+02:00[Europe/Kyiv]]. *)
module Root_zoned : sig
  module Props : sig
    type t

    val check :
      ?value:D.Types.ZonedDateTime.t Js.Nullable.t Solidtype.Check.value ->
      ?default_value:D.Types.ZonedDateTime.t Solidtype.Check.value ->
      ?on_change:(D.Types.ZonedDateTime.t option -> unit) ->
      placeholder_value:D.Types.ZonedDateTime.t Solidtype.Check.value ->
      ?min_value:D.Types.ZonedDateTime.t Solidtype.Check.value ->
      ?max_value:D.Types.ZonedDateTime.t Solidtype.Check.value ->
      ?is_date_unavailable:(D.Types.ZonedDateTime.t -> bool) ->
      ?granularity:[ `day | `hour | `minute | `second ] Solidtype.Check.value ->
      ?hour_cycle:[ `h12 | `h24 ] Solidtype.Check.value ->
      ?hide_time_zone:bool Solidtype.Check.value ->
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
      ?translations:translations Solidtype.Check.value ->
      ?input_role:[ `group | `presentation ] Solidtype.Check.value ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `elements ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** A field of a range of dates: two fields under one [<div>], its start and its
    end, each an {!Input} given its [slot], ["start"] or ["end"], as React
    Aria's range picker composes them. Each is named [Start Date] or [End Date]
    in its locale and by the root's {!Label}, and sent with a form as
    [start_name] and [end_name]. Its value is the range once both ends are
    there, kept or given as a field's is; [on_change] is told it, and [None] as
    an end is erased. It is invalid while [is_invalid], while its end is before
    its start, and while either end is out of its range or unavailable; it is
    described by the range as its locale tells it. *)
module Root_range : sig
  module Props : sig
    type t

    val check :
      ?value:D.Types.CalendarDate.t range Js.Nullable.t Solidtype.Check.value ->
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
      ?aria_labelledby:string Solidtype.Check.value ->
      ?aria_describedby:string Solidtype.Check.value ->
      ?translations:translations Solidtype.Check.value ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `elements ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** A field of a range of dates with a time, as {!Root_range} is, each end as
    {!Root_date_time}'s value is. *)
module Root_range_date_time : sig
  module Props : sig
    type t

    val check :
      ?value:
        D.Types.CalendarDateTime.t range Js.Nullable.t Solidtype.Check.value ->
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
      ?aria_labelledby:string Solidtype.Check.value ->
      ?aria_describedby:string Solidtype.Check.value ->
      ?translations:translations Solidtype.Check.value ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `elements ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** A field of a range of dates with a time in a zone, as {!Root_range} is, each
    end as {!Root_zoned}'s value is. *)
module Root_range_zoned : sig
  module Props : sig
    type t

    val check :
      ?value:D.Types.ZonedDateTime.t range Js.Nullable.t Solidtype.Check.value ->
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
      ?aria_labelledby:string Solidtype.Check.value ->
      ?aria_describedby:string Solidtype.Check.value ->
      ?translations:translations Solidtype.Check.value ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `elements ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The field's name, a [<span>] its {!Input} is labelled by; a press on it
    focuses the first segment. *)
module Label : sig
  module Props : sig
    type t

    val check :
      ?as_:(Solidtype.Html.Span.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `elements ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Span.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The segments: a [<div role="group">] labelled and described as the field is,
    which draws [children] for each segment, in order, the literals among them,
    each given its segment as it changes. A press on it outside a segment
    focuses the first segment with no part, or the last. It tells a reader the
    field's value, [Selected Date: November 21, 2026]. In a range's root, its
    [slot], ["start"] or ["end"], says which of the range's fields it is. *)
module Input : sig
  module Props : sig
    type t

    val check :
      children:
        ( segment S.accessor -> Jsx.element,
          [ `render ] )
        Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** A segment, the [segment] {!Input} gave, a [<div>] of its text, [data-type]
    its part: a literal is [aria-hidden]; any other is Kobalte's spin button,
    named by its part and by the field, [data-placeholder] while it has no part,
    focusable unless the field is disabled and typed into unless it is
    read-only; a zone's name is a read-only [role="textbox"]. *)
module Segment : sig
  module Props : sig
    type t

    val check :
      segment:segment Solidtype.Check.value ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `elements ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The field's description, a [<span>] its {!Input} is described by. *)
module Description : sig
  module Props : sig
    type t

    val check :
      ?as_:(Solidtype.Html.Span.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `elements ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Span.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The field's error, a [<span>] its {!Input} is described by after its
    {!Description}. *)
module Error_message : sig
  module Props : sig
    type t

    val check :
      ?as_:(Solidtype.Html.Span.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `elements ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Span.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end
