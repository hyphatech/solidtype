(** A calendar, as Kobalte would make one: a month's grid of days to choose a
    date from, its locale's in its order, its first day of the week and its
    calendar, moved through by the keys and paged by its {!Previous} and {!Next}
    buttons. Its value is \@internationalized/date's
    {!Solidtype_internationalized_date.Types.CalendarDate}: one with {!Root},
    several with {!Root_multiple}. It draws no style: each part is the element
    it names, its roles and state as attributes, and takes every attribute its
    element does, which it passes on.

    {[
      <Calendar.Root aria_label="Event date">
        <Calendar.Heading />
        <Calendar.Previous>"<"</Calendar.Previous>
        <Calendar.Next>">"</Calendar.Next>
        <Calendar.Grid>
          <Calendar.Grid_header>
            (fun day -> <Calendar.Header_cell>(Jsx.string (S.get day))</Calendar.Header_cell>)
          </Calendar.Grid_header>
          <Calendar.Grid_body>
            (fun date -> <Calendar.Cell date=(S.get date) />)
          </Calendar.Grid_body>
        </Calendar.Grid>
      </Calendar.Root>
    ]}

    Its locale is the one an [I18nProvider] names, else [en-GB], whatever the
    browser reads. It shows [visible_duration], a month by default, around the
    focused date, which is [focused_value] while it is given one, else the one
    it keeps: [default_focused_value] at first, else its value, else today,
    within [min_value] and [max_value]. The arrows move the focus a day, or a
    week up and down; Page Up and Page Down a month, or a year with Shift; Home
    and End to the start and end of the week, or of the month in a month's view;
    Enter and Space choose the focused day, as a press does. A day before
    [min_value] or after [max_value] is disabled; one [is_date_unavailable]
    refuses is focused but never chosen. A chosen date is told in the calendar
    of the value given, else the Gregorian. A reader is told each day's name,
    whether it is today and whether it is chosen, and the month shown as it
    changes. A part is used inside a root: elsewhere it raises
    [Invalid_argument] as it is made. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx
module D := Solidtype_internationalized_date

type duration =
  | Months of int
  | Weeks of int
  | Days of int  (** How much a calendar shows, and pages by. *)

type day_of_week = [ `sun | `mon | `tue | `wed | `thu | `fri | `sat ]

type range = { start : D.Types.CalendarDate.t; end_ : D.Types.CalendarDate.t }
(** A range of dates, its ends included, [start] never after [end_]. *)

type translations = {
  previous : string;
  next : string;
  selected_date_description : string -> string;
  today_date : string -> string;
  today_date_selected : string -> string;
  date_selected : string -> string;
  minimum_date : string;
  maximum_date : string;
  date_range : string -> string -> string;
  selected_range_description : string -> string;
  start_range_selection_prompt : string;
  finish_range_selection_prompt : string;
}
(** What the calendar tells a reader, in its locale's words where none are
    given, React Aria's, else English. *)

val english : translations
(** React Aria's English: [Previous],
    [Today, Saturday, November 21, 2026 selected], [First available date]. *)

type calendar = {
  focused_date : D.Types.CalendarDate.t S.accessor;
  set_focused_date : D.Types.CalendarDate.t -> unit;
      (** Focuses a date, within the calendar's range, and shows it. *)
  visible_start : D.Types.CalendarDate.t S.accessor;
  visible_end : D.Types.CalendarDate.t S.accessor;
  visible_duration : duration S.accessor;
  min_value : D.Types.CalendarDate.t option S.accessor;
  max_value : D.Types.CalendarDate.t option S.accessor;
  locale : string S.accessor;
  time_zone : string S.accessor;
  is_disabled : bool S.accessor;
  is_read_only : bool S.accessor;
  is_invalid : bool S.accessor;
  is_focused : bool S.accessor;  (** Whether focus is in its grid. *)
  is_previous_disabled : bool S.accessor;
  is_next_disabled : bool S.accessor;
      (** Whether its {!Previous} and {!Next} buttons are disabled. *)
  focus : unit -> unit;  (** Focuses its focused date's cell. *)
}
(** What a part inside a root reads of it, and a style's attribute on it. *)

module Context : sig
  val use : unit -> calendar
  (** The calendar above; outside a root it raises [Invalid_argument]. *)
end

type cell = {
  date : D.Types.CalendarDate.t S.accessor;
  formatted_date : string S.accessor;  (** Its day of the month, [21]. *)
  is_selected : bool S.accessor;
  is_focused : bool S.accessor;
  is_disabled : bool S.accessor;
  is_unavailable : bool S.accessor;
  is_outside_month : bool S.accessor;
  is_outside_visible_range : bool S.accessor;
  is_today : bool S.accessor;
  is_invalid : bool S.accessor;
  is_selection_start : bool S.accessor;
  is_selection_end : bool S.accessor;
}
(** What a {!Cell}'s children are drawn of, given as a function. *)

(** What a picker around a calendar gives it: its date, or its range, and the
    dates it may choose. A root inside a {!Given.Provider} takes each where it
    is given none of its own, and the focus as it is drawn, as React Aria's
    calendar takes its date picker's; a date chosen is told to both. *)
module Given : sig
  type value =
    | Single of
        D.Types.CalendarDate.t option S.accessor
        * (D.Types.CalendarDate.t -> unit)
    | Range of range option S.accessor * (range -> unit)

  type t = {
    value : value;
    min_value : D.Types.CalendarDate.t option S.accessor;
    max_value : D.Types.CalendarDate.t option S.accessor;
    is_date_unavailable : (D.Types.CalendarDate.t -> bool) option S.accessor;
    is_disabled : bool S.accessor;
    is_read_only : bool S.accessor;
    is_invalid : bool S.accessor;
    default_focused_value : D.Types.CalendarDate.t option S.accessor;
    first_day_of_week : day_of_week option S.accessor;
    page_behavior : [ `visible | `single ] option S.accessor;
  }

  module Provider : sig
    module Props : sig
      val check :
        value:t Solidtype.Check.value ->
        ?children:('f, [ `elements ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Jsx.component
  end

  val use : unit -> t option
end

(** A calendar of one date, a [<div role="application">] named by [aria_label],
    else [aria_labelledby], and the dates it shows. Its value is [value] while
    it is given one -- [Js.Nullable.null] keeps it empty -- else the one it
    keeps, [default_value] at first; each date chosen calls [on_change]. Paging
    moves by [visible_duration], or a single month, week or day with
    [page_behavior] [`single]; [selection_alignment] places the focused date at
    the start, the centre or the end of what is shown. Its weeks start on
    [first_day_of_week], else the locale's, and a month's grid has
    [weeks_in_month] rows, else as many as the month needs. While [is_disabled]
    nothing is focused or chosen, and while [is_read_only] days are focused but
    not chosen; it is invalid while [is_invalid] or while its value is out of
    its range or unavailable. *)
module Root : sig
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

(** A calendar of several dates, as {!Root} is: a date chosen joins its value,
    and one chosen again leaves it, each change telling [on_change] the dates in
    the order they were chosen. Its grid is [aria-multiselectable]. *)
module Root_multiple : sig
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

(** A calendar of a range of dates: a press, or Enter, on a day begins it, and
    the range shown runs from that day to the one hovered or focused, until a
    second press ends it; a drag from a day chooses the days it crosses, and one
    from an end of the range chosen moves that end. While a range is begun it
    reaches no further than the nearest unavailable day, unless
    [allows_non_contiguous_ranges]; Escape lets it go, and a pointer let go of
    outside the days, or the focus leaving, ends it as [commit_behavior] says:
    [`select] the focused day, [`reset] the range begun let go, [`clear] the
    value too, [on_change] told [None]. Its cells are [data-selection-start] and
    [data-selection-end] at the range's ends. [is_date_unavailable] is given the
    range's first date beside each, while one is begun, so the days a range may
    end on can turn on where it starts. *)
module Root_range : sig
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

(** What the calendar shows, an [<h2>] a reader skips, since the calendar is
    named by it: the month and year, [November 2026], or the days of a week's or
    a day's view, [November 16 – 22, 2026]. Given [offset], the month that far
    from the first shown, for a calendar of several months; given [format], the
    parts of the date it writes. *)
module Heading : sig
  module Props : sig
    type t

    val check :
      ?offset:duration Solidtype.Check.value ->
      ?format:D.Types.DateTimeFormatOptions.t Solidtype.Check.value ->
      ?as_:(Solidtype.Html.H2.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `elements ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.H2.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** What shows the page before, a [<button>] named [Previous], disabled where it
    would show only dates before [min_value]. While it is disabled with the
    focus in it, the focus moves to the grid. *)
module Previous : sig
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

(** What shows the page after, a [<button>] named [Next], as {!Previous}. *)
module Next : sig
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

(** A month's days, a [<table role="grid">] named as the calendar is and by the
    dates it holds: the first month shown, or given [offset], the one that far
    from it. Its {!Grid_header} names the days of the week as [weekday_style]
    writes them, [`narrow] by default. *)
module Grid : sig
  module Props : sig
    type t

    val check :
      ?offset:duration Solidtype.Check.value ->
      ?weekday_style:[ `narrow | `short | `long ] Solidtype.Check.value ->
      ?as_:(Solidtype.Html.Table.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `elements ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Table.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The days of the week, a [<thead aria-hidden="true">] of one row: it draws
    [children] for each day's name, in the locale's order. *)
module Grid_header : sig
  module Props : sig
    type t

    val check :
      children:
        (string S.accessor -> Jsx.element, [ `render ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Thead.props -> Jsx.element) ->
      ?props:'spread S.rest ->
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
      ?as_:(Solidtype.Html.Th.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `elements ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Th.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The weeks, a [<tbody>] of a [<tr>] each: it draws [children] for each day of
    the grid's month and the days around it that complete its weeks, each given
    its date as it changes, and an empty [<td>] where a calendar has no date. *)
module Grid_body : sig
  module Props : sig
    type t

    val check :
      children:
        ( D.Types.CalendarDate.t S.accessor -> Jsx.element,
          [ `render ] )
        Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Tbody.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (unit -> unit) Solidtype.Html.Tbody.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** A day, the [date] {!Grid_body} gave: a [<td role="gridcell">],
    [aria-selected] while it is chosen, around a [<div role="button">] named by
    the day in full, focusable while it is the focused date, which takes every
    attribute given. Its children are drawn of its {!cell}, else its day of the
    month. The button is [data-selected], [data-today], [data-unavailable],
    [data-disabled], [data-outside-month], [data-outside-visible-range],
    [data-focused] and [data-invalid], present and empty as Kobalte's state is.
*)
module Cell : sig
  module Context : sig
    val use : unit -> cell
    (** The cell above, read by a part inside it, or by a style's attribute on
        it, which Solid reads inside the cell; outside a {!Cell} it raises
        [Invalid_argument]. *)
  end

  module Props : sig
    type t

    val check :
      date:D.Types.CalendarDate.t Solidtype.Check.value ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:
         (cell -> Jsx.element, [ `elements | `render ]) Solidtype.Check.children ->
      unit ->
      unit)
      Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end
