include Calendar.Range

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
