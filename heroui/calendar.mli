(** HeroUI's Calendar: a month's grid of days to choose a date from, with
    HeroUI's classes from {!Styles.Calendar} and {!Styles.CalendarYearPicker},
    on {!Solidtype_headless.Calendar}, since Kobalte has no calendar. Its days
    are its locale's, in its order, its first day of the week and its calendar;
    a year picker over its grid chooses the year shown.

    Its page, with its examples:
    [$(opam var solidtype:doc)/pages/heroui/calendar.md].

    {[
      <Calendar aria_label="Event date">
        <Calendar.Header>
          <Calendar.Heading />
          <Calendar.Nav_button slot=`previous />
          <Calendar.Nav_button slot=`next />
        </Calendar.Header>
        <Calendar.Grid>
          <Calendar.Grid_header>
            (fun day -> <Calendar.Header_cell>(Jsx.string (S.get day))</Calendar.Header_cell>)
          </Calendar.Grid_header>
          <Calendar.Grid_body>
            (fun date -> <Calendar.Cell date=(S.get date) />)
          </Calendar.Grid_body>
        </Calendar.Grid>
      </Calendar>
    ]}

    Its value is a {!Solidtype_internationalized_date.Types.CalendarDate}, made
    by [CalendarDate.make 2026 11 21], [parse_date "2026-11-21"] or
    [today zone]; several are {!Multiple}'s. Its locale is the one an
    [I18nProvider] names, else [en-GB], whatever the browser reads. Where no
    [min_value] or [max_value] is given, it runs from 1900 to 2099 in its
    locale's calendar. A press on a day focuses it, an unavailable one or one of
    a read-only calendar too, and chooses it where it can be chosen. A part is
    used inside a calendar: elsewhere it raises [Invalid_argument] as it is
    made. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx
module D := Solidtype_internationalized_date

type duration = Solidtype_headless.Calendar.duration =
  | Months of int
  | Weeks of int
  | Days of int  (** How much a calendar shows, and pages by. *)

type day_of_week = Solidtype_headless.Calendar.day_of_week

type cell = Solidtype_headless.Calendar.cell
(** What a {!Cell}'s children are drawn of, given as a function. *)

type state = { is_disabled : bool S.accessor; is_invalid : bool S.accessor }
(** What a calendar's children are drawn of, given as a function, as HeroUI's
    render props are. *)

module Props : sig
  type t

  val check :
    ?value:D.Types.CalendarDate.t Js.Nullable.t Solidtype.Check.value ->
    ?default_value:D.Types.CalendarDate.t Solidtype.Check.value ->
    ?on_change:(D.Types.CalendarDate.t -> unit) ->
    ?focused_value:D.Types.CalendarDate.t Solidtype.Check.value ->
    ?default_focused_value:D.Types.CalendarDate.t Solidtype.Check.value ->
    ?on_focus_change:(D.Types.CalendarDate.t -> unit) ->
    ?min_value:D.Types.CalendarDate.t Solidtype.Check.value ->
    ?max_value:D.Types.CalendarDate.t Solidtype.Check.value ->
    ?is_date_unavailable:(D.Types.CalendarDate.t -> bool) ->
    ?visible_duration:duration Solidtype.Check.value ->
    ?page_behavior:[ `visible | `single ] Solidtype.Check.value ->
    ?selection_alignment:[ `start | `center | `end_ ] Solidtype.Check.value ->
    ?first_day_of_week:day_of_week Solidtype.Check.value ->
    ?weeks_in_month:int Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?is_read_only:bool Solidtype.Check.value ->
    ?is_invalid:bool Solidtype.Check.value ->
    ?auto_focus:bool Solidtype.Check.value ->
    ?aria_label:string Solidtype.Check.value ->
    ?aria_labelledby:string Solidtype.Check.value ->
    ?default_year_picker_open:bool Solidtype.Check.value ->
    ?is_year_picker_open:bool Solidtype.Check.value ->
    ?on_year_picker_open_change:(bool -> unit) ->
    ?class_:string Solidtype.Check.value ->
    ?ref:(Dom.htmlDivElement -> unit) ->
    children:
      (state -> Jsx.element, [ `elements | `render ]) Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Div.props -> state -> Jsx.element) ->
    ?props:t S.rest ->
    (unit -> unit) Solidtype.Html.Div.check
end

val make : Props.t -> Jsx.element
val component : Props.t Jsx.component

(** A calendar of several dates: a date chosen joins its value, and one chosen
    again leaves it, [on_change] told the dates in the order chosen. *)
module Multiple : sig
  module Props : sig
    type t

    val check :
      ?value:D.Types.CalendarDate.t array Solidtype.Check.value ->
      ?default_value:D.Types.CalendarDate.t array Solidtype.Check.value ->
      ?on_change:(D.Types.CalendarDate.t array -> unit) ->
      ?focused_value:D.Types.CalendarDate.t Solidtype.Check.value ->
      ?default_focused_value:D.Types.CalendarDate.t Solidtype.Check.value ->
      ?on_focus_change:(D.Types.CalendarDate.t -> unit) ->
      ?min_value:D.Types.CalendarDate.t Solidtype.Check.value ->
      ?max_value:D.Types.CalendarDate.t Solidtype.Check.value ->
      ?is_date_unavailable:(D.Types.CalendarDate.t -> bool) ->
      ?visible_duration:duration Solidtype.Check.value ->
      ?page_behavior:[ `visible | `single ] Solidtype.Check.value ->
      ?selection_alignment:[ `start | `center | `end_ ] Solidtype.Check.value ->
      ?first_day_of_week:day_of_week Solidtype.Check.value ->
      ?weeks_in_month:int Solidtype.Check.value ->
      ?is_disabled:bool Solidtype.Check.value ->
      ?is_read_only:bool Solidtype.Check.value ->
      ?is_invalid:bool Solidtype.Check.value ->
      ?auto_focus:bool Solidtype.Check.value ->
      ?aria_label:string Solidtype.Check.value ->
      ?aria_labelledby:string Solidtype.Check.value ->
      ?default_year_picker_open:bool Solidtype.Check.value ->
      ?is_year_picker_open:bool Solidtype.Check.value ->
      ?on_year_picker_open_change:(bool -> unit) ->
      ?class_:string Solidtype.Check.value ->
      ?ref:(Dom.htmlDivElement -> unit) ->
      children:
        (state -> Jsx.element, [ `elements | `render ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> state -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

type range = Solidtype_headless.Calendar.range = {
  start : D.Types.CalendarDate.t;
  end_ : D.Types.CalendarDate.t;
}
(** A range of dates, its ends included. *)

(** The root of {!Range_calendar}, a calendar of a range of dates, which its
    parts are this calendar's. *)
module Range : sig
  module Props : sig
    type t

    val check :
      ?value:range Js.Nullable.t Solidtype.Check.value ->
      ?default_value:range Solidtype.Check.value ->
      ?on_change:(range option -> unit) ->
      ?allows_non_contiguous_ranges:bool Solidtype.Check.value ->
      ?commit_behavior:[ `clear | `reset | `select ] Solidtype.Check.value ->
      ?focused_value:D.Types.CalendarDate.t Solidtype.Check.value ->
      ?default_focused_value:D.Types.CalendarDate.t Solidtype.Check.value ->
      ?on_focus_change:(D.Types.CalendarDate.t -> unit) ->
      ?min_value:D.Types.CalendarDate.t Solidtype.Check.value ->
      ?max_value:D.Types.CalendarDate.t Solidtype.Check.value ->
      ?is_date_unavailable:
        (D.Types.CalendarDate.t -> D.Types.CalendarDate.t option -> bool) ->
      ?visible_duration:duration Solidtype.Check.value ->
      ?page_behavior:[ `visible | `single ] Solidtype.Check.value ->
      ?selection_alignment:[ `start | `center | `end_ ] Solidtype.Check.value ->
      ?first_day_of_week:day_of_week Solidtype.Check.value ->
      ?weeks_in_month:int Solidtype.Check.value ->
      ?is_disabled:bool Solidtype.Check.value ->
      ?is_read_only:bool Solidtype.Check.value ->
      ?is_invalid:bool Solidtype.Check.value ->
      ?auto_focus:bool Solidtype.Check.value ->
      ?aria_label:string Solidtype.Check.value ->
      ?aria_labelledby:string Solidtype.Check.value ->
      ?default_year_picker_open:bool Solidtype.Check.value ->
      ?is_year_picker_open:bool Solidtype.Check.value ->
      ?on_year_picker_open_change:(bool -> unit) ->
      ?class_:string Solidtype.Check.value ->
      ?ref:(Dom.htmlDivElement -> unit) ->
      children:
        (state -> Jsx.element, [ `elements | `render ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> state -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The row above the grid: a [<header>] of its heading and buttons. *)
module Header : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `elements ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Header.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Header.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** What the calendar shows, [November 2026], an [<h2>]; given [offset], the
    month that far on, and [format], the parts it writes. *)
module Heading : sig
  module Props : sig
    type t

    val check :
      ?offset:duration Solidtype.Check.value ->
      ?format:D.Types.DateTimeFormatOptions.t Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?as_:(Solidtype.Html.H2.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.H2.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** What shows the page before, [`previous], or after, [`next]: a [<button>] of
    HeroUI's chevron, or its children. *)
module Nav_button : sig
  module Props : sig
    type t

    val check :
      slot:[ `previous | `next ] Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?children:(_, [ `elements ]) Solidtype.Check.children ->
      ?ref:(Dom.htmlButtonElement -> unit) ->
      ?as_:(Solidtype.Html.Button.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Button.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** A month's days, a [<table>]; given [offset], the month that far on, for a
    calendar of several months. Its days' names are [weekday_style], [`short] by
    default. *)
module Grid : sig
  module Props : sig
    type t

    val check :
      ?offset:duration Solidtype.Check.value ->
      ?weekday_style:[ `narrow | `short | `long ] Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `elements ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Table.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Table.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The days of the week, a [<thead>]: it draws [children] for each day's name.
*)
module Grid_header : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:
        (string S.accessor -> Jsx.element, [ `render ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Thead.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Thead.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** A day's name, a [<th>]. *)
module Header_cell : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `elements ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Th.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Th.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The weeks, a [<tbody>]: it draws [children] for each day, given its date as
    it changes. A view of a week or more of days is laid out in whole weeks, as
    HeroUI's is. *)
module Grid_body : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:
        ( D.Types.CalendarDate.t S.accessor -> Jsx.element,
          [ `render ] )
        Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Tbody.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Tbody.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** A day, the [date] {!Grid_body} gave: its children drawn of its {!cell}, else
    its day of the month, and its state as React Aria writes it,
    [data-selected], [data-today], [data-unavailable], [data-outside-month] and
    the others, ["true"]. *)
module Cell : sig
  module Props : sig
    type t

    val check :
      date:D.Types.CalendarDate.t Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?children:
        (cell -> Jsx.element, [ `elements | `render ]) Solidtype.Check.children ->
      ?ref:(Dom.htmlDivElement -> unit) ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** A dot in a day, of what the day holds: a [<span>] a reader skips. *)
module Cell_indicator : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?as_:(Solidtype.Html.Span.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Span.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

type trigger = {
  is_open : bool S.accessor;
  month_year : string S.accessor;
  toggle : unit -> unit;
}
(** What a year picker's trigger and its parts draw their children of. *)

(** What opens and closes the year picker, a [<button>] named by the month shown
    and [year selector], [data-open] while it is open; Escape closes it. *)
module Year_picker_trigger : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:
        ( trigger -> Jsx.element,
          [ `elements | `render ] )
        Solidtype.Check.children ->
      ?on_key_down:(Dom.keyboardEvent -> unit) ->
      ?on_click:(Dom.mouseEvent -> unit) ->
      ?as_:(Solidtype.Html.Button.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Button.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The month shown, in the trigger: a [<span>], its children or the heading,
    given [offset] and [format] as {!Heading} is. *)
module Year_picker_trigger_heading : sig
  module Props : sig
    type t

    val check :
      ?offset:duration Solidtype.Check.value ->
      ?format:D.Types.DateTimeFormatOptions.t Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?children:
        ( trigger -> Jsx.element,
          [ `elements | `render ] )
        Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Span.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Span.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The trigger's chevron, turned while the picker is open: a [<span>] a reader
    skips, its children or HeroUI's chevron. *)
module Year_picker_trigger_indicator : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?children:
        ( trigger -> Jsx.element,
          [ `elements | `render ] )
        Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Span.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Span.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

type year = {
  year : int;
  formatted_year : string;
  is_current_year : bool;
  is_open : bool;
  is_selected : bool;
  select_year : unit -> unit;
}
(** A year as {!Year_picker_grid_body} gives it to its children. *)

(** The years, a [<div role="listbox">] laid over the day grid, [data-open]
    while the picker is: [visible_years] of them around the focused date's, the
    whole range by default, written as [format] says. The arrows move between
    them, three to a row, Home and End to the first and last, and Escape closes
    it; as it opens, the focus goes to the focused date's year. *)
module Year_picker_grid : sig
  module Props : sig
    type t

    val check :
      ?format:D.Types.DateTimeFormatOptions.t Solidtype.Check.value ->
      ?visible_years:int Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?on_key_down:(Dom.keyboardEvent -> unit) ->
      children:(_, [ `elements ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The years' cells: its children drawn for each {!type-year}, else a
    {!Year_picker_cell} each. *)
module Year_picker_grid_body : sig
  module Props : sig
    type t

    val check :
      ?children:
        (year -> Jsx.element, [ `elements | `render ]) Solidtype.Check.children ->
      ?props:t S.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** A year, a [<button>] named by it, [data-selected] while it is the focused
    date's; a press shows it and closes the picker. *)
module Year_picker_cell : sig
  module Props : sig
    type t

    val check :
      year:int Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?children:
        (year -> Jsx.element, [ `elements | `render ]) Solidtype.Check.children ->
      ?on_focus:(Dom.focusEvent -> unit) ->
      ?on_click:(Dom.mouseEvent -> unit) ->
      ?as_:(Solidtype.Html.Button.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Button.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end
