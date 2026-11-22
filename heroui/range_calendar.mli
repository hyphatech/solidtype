(** HeroUI's RangeCalendar: a month's grid of days to choose a range of dates
    from, with HeroUI's classes from {!Styles.RangeCalendar}, on
    {!Solidtype_headless.Calendar.Root_range}. Its parts are {!Calendar}'s,
    drawn in the range's look; a day is drawn in a [<span>] of its own,
    [range-calendar__cell-button], chosen at the range's ends.

    Its page, with its examples:
    [$(opam var solidtype:doc)/pages/heroui/range-calendar.md].

    {[
      <Range_calendar aria_label="Trip dates">
        <Range_calendar.Header>
          <Range_calendar.Heading />
          <Range_calendar.Nav_button slot=`previous />
          <Range_calendar.Nav_button slot=`next />
        </Range_calendar.Header>
        <Range_calendar.Grid>
          <Range_calendar.Grid_header>
            (fun day ->
              <Range_calendar.Header_cell>
                (Jsx.string (S.get day))
              </Range_calendar.Header_cell>)
          </Range_calendar.Grid_header>
          <Range_calendar.Grid_body>
            (fun date -> <Range_calendar.Cell date=(S.get date) />)
          </Range_calendar.Grid_body>
        </Range_calendar.Grid>
      </Range_calendar>
    ]}

    Its value is a {!range}, [{ start; end_ }]. A press on a day begins a range,
    and the days shown run to the one hovered or focused until a second press
    ends it; a drag chooses the days it crosses, and one from an end of the
    range chosen moves that end. A range begun reaches no further than the
    nearest unavailable day, unless [allows_non_contiguous_ranges]; Escape lets
    it go, and a pointer let go of outside the days ends it as [commit_behavior]
    says, [`select] by default: [`reset] lets it go, and [`clear] clears the
    value too, [on_change] told [None]. Its locale is the one an [I18nProvider]
    names, else [en-GB]. *)

include module type of Calendar.Range

type range = Calendar.range = {
  start : Solidtype_internationalized_date.Types.CalendarDate.t;
  end_ : Solidtype_internationalized_date.Types.CalendarDate.t;
}

type duration = Calendar.duration = Months of int | Weeks of int | Days of int
type day_of_week = Calendar.day_of_week
type cell = Calendar.cell
type state = Calendar.state

module Header = Calendar.Header
module Heading = Calendar.Heading
module Nav_button = Calendar.Nav_button
module Grid = Calendar.Grid
module Grid_header = Calendar.Grid_header
module Header_cell = Calendar.Header_cell
module Grid_body = Calendar.Grid_body
module Cell = Calendar.Cell
module Cell_indicator = Calendar.Cell_indicator

type trigger = Calendar.trigger

module Year_picker_trigger = Calendar.Year_picker_trigger
module Year_picker_trigger_heading = Calendar.Year_picker_trigger_heading
module Year_picker_trigger_indicator = Calendar.Year_picker_trigger_indicator

type year = Calendar.year

module Year_picker_grid = Calendar.Year_picker_grid
module Year_picker_grid_body = Calendar.Year_picker_grid_body
module Year_picker_cell = Calendar.Year_picker_cell
