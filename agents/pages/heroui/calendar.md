# Calendar

Composable date picker with month grid, navigation, and year picker support.

Its value is a `CalendarDate` of `solidtype-internationalized-date`, made by
`CalendarDate.make 2026 11 21`, `parse_date "2026-11-21"` or `today zone`;
several dates are `Calendar.Multiple`'s.

Its weeks start on Monday and its days are written as `en-GB` writes them,
whatever the browser reads, unless an `I18n.I18nProvider` names another
locale. React's follows the browser.

Original HeroUI documentation: [Calendar](https://heroui.com/en/docs/react/components/calendar).

## Usage

```ocaml title="calendar_usage.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Calendar = Solidtype_heroui.Calendar

let make () =
  <Calendar aria_label="Event date">
    <Calendar.Header>
      <Calendar.Heading />
      <Calendar.Nav_button slot=`previous />
      <Calendar.Nav_button slot=`next />
    </Calendar.Header>
    <Calendar.Grid>
      <Calendar.Grid_header>
        (fun day ->
          <Calendar.Header_cell>(Jsx.string (S.get day))</Calendar.Header_cell>)
      </Calendar.Grid_header>
      <Calendar.Grid_body>
        (fun date -> <Calendar.Cell date=(S.get date) />)
      </Calendar.Grid_body>
    </Calendar.Grid>
  </Calendar>
```

## Parity

The same HeroUI Calendar twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of the two calendars:
a marked row is one they disagree on.

## Anatomy

```ocaml
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
```

## Examples

### Disabled

```ocaml title="calendar_disabled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Calendar = Solidtype_heroui.Calendar
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate
module Description = Solidtype_heroui.Description

let make () =
  <div class_="flex flex-col items-center gap-4">
    <Calendar
      is_disabled=true
      aria_label="Event date"
      default_value=(D.today (D.get_local_time_zone ()))>
      <Calendar.Header>
        <Calendar.Heading />
        <Calendar.Nav_button slot=`previous />
        <Calendar.Nav_button slot=`next />
      </Calendar.Header>
      <Calendar.Grid>
        <Calendar.Grid_header>
          (fun day ->
            <Calendar.Header_cell>
              (Jsx.string (S.get day))
            </Calendar.Header_cell>)
        </Calendar.Grid_header>
        <Calendar.Grid_body>
          (fun date -> <Calendar.Cell date=(S.get date) />)
        </Calendar.Grid_body>
      </Calendar.Grid>
    </Calendar>
    <Description class_="text-center">"Calendar is disabled"</Description>
  </div>
```

### Read Only

A press on a day of a read-only calendar focuses it, and the arrows move on
from it.

```ocaml title="calendar_read_only.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Calendar = Solidtype_heroui.Calendar
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate
module Description = Solidtype_heroui.Description

let make () =
  <div class_="flex flex-col items-center gap-4">
    <Calendar
      is_read_only=true
      aria_label="Event date"
      default_value=(D.today (D.get_local_time_zone ()))>
      <Calendar.Header>
        <Calendar.Heading />
        <Calendar.Nav_button slot=`previous />
        <Calendar.Nav_button slot=`next />
      </Calendar.Header>
      <Calendar.Grid>
        <Calendar.Grid_header>
          (fun day ->
            <Calendar.Header_cell>
              (Jsx.string (S.get day))
            </Calendar.Header_cell>)
        </Calendar.Grid_header>
        <Calendar.Grid_body>
          (fun date -> <Calendar.Cell date=(S.get date) />)
        </Calendar.Grid_body>
      </Calendar.Grid>
    </Calendar>
    <Description class_="text-center">"Calendar is read-only"</Description>
  </div>
```

### Default Value

```ocaml title="calendar_default_value.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Calendar = Solidtype_heroui.Calendar
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate

let make () =
  <Calendar aria_label="Event date" default_value=(D.parse_date "2025-02-14")>
    <Calendar.Header>
      <Calendar.Heading />
      <Calendar.Nav_button slot=`previous />
      <Calendar.Nav_button slot=`next />
    </Calendar.Header>
    <Calendar.Grid>
      <Calendar.Grid_header>
        (fun day ->
          <Calendar.Header_cell>(Jsx.string (S.get day))</Calendar.Header_cell>)
      </Calendar.Grid_header>
      <Calendar.Grid_body>
        (fun date -> <Calendar.Cell date=(S.get date) />)
      </Calendar.Grid_body>
    </Calendar.Grid>
  </Calendar>
```

### Year Picker

`Calendar.Year_picker_trigger`, `Calendar.Year_picker_grid`, and their body
and cell parts provide an integrated year navigation pattern.

```ocaml title="calendar_year_picker.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Calendar = Solidtype_heroui.Calendar

let make () =
  <Calendar aria_label="Event date">
    <Calendar.Header>
      <Calendar.Year_picker_trigger>
        <Calendar.Year_picker_trigger_heading />
        <Calendar.Year_picker_trigger_indicator />
      </Calendar.Year_picker_trigger>
      <Calendar.Nav_button slot=`previous />
      <Calendar.Nav_button slot=`next />
    </Calendar.Header>
    <Calendar.Grid>
      <Calendar.Grid_header>
        (fun day ->
          <Calendar.Header_cell>(Jsx.string (S.get day))</Calendar.Header_cell>)
      </Calendar.Grid_header>
      <Calendar.Grid_body>
        (fun date -> <Calendar.Cell date=(S.get date) />)
      </Calendar.Grid_body>
    </Calendar.Grid>
    <Calendar.Year_picker_grid>
      <Calendar.Year_picker_grid_body />
    </Calendar.Year_picker_grid>
  </Calendar>
```

### Controlled

Use controlled `value` and `focused_value` for external state coordination
and custom shortcuts.

```ocaml title="calendar_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Button = Solidtype_heroui.Button
module Button_group = Solidtype_heroui.Button_group
module Calendar = Solidtype_heroui.Calendar
module Description = Solidtype_heroui.Description
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate

let today () = D.today (D.get_local_time_zone ())

(* The start of the week holding [d], Monday first, as en-GB counts. *)
let start_of_week d =
  Date.subtract d
    (D.Types.DateDuration.make ~days:(D.get_day_of_week d "en-GB" ()) ())

let start_of_month d = Date.set d (D.Types.DateFields.make ~day:1 ())

let make () =
  let value, set_value = S.create_signal None in
  let focused, set_focused = S.create_signal (D.parse_date "2025-12-25") in
  let choose d =
    S.set set_value (Some d);
    S.set set_focused d
  in
  <div class_="flex flex-col items-center gap-4">
    <Button_group full_width=true size=`sm variant=`tertiary>
      <Button on_click=(fun _ -> choose (today ()))>"Today"</Button>
      <Button on_click=(fun _ -> choose (start_of_week (today ())))>
        "Week"
      </Button>
      <Button on_click=(fun _ -> choose (start_of_month (today ())))>
        "Month"
      </Button>
    </Button_group>
    <Calendar
      aria_label="Event date"
      focused_value=(S.get focused)
      value=(Js.Nullable.fromOption (S.get value))
      on_change=(fun d -> S.set set_value (Some d))
      on_focus_change=(S.set set_focused)>
      <Calendar.Header>
        <Calendar.Heading />
        <Calendar.Nav_button slot=`previous />
        <Calendar.Nav_button slot=`next />
      </Calendar.Header>
      <Calendar.Grid>
        <Calendar.Grid_header>
          (fun day ->
            <Calendar.Header_cell>
              (Jsx.string (S.get day))
            </Calendar.Header_cell>)
        </Calendar.Grid_header>
        <Calendar.Grid_body>
          (fun date -> <Calendar.Cell date=(S.get date) />)
        </Calendar.Grid_body>
      </Calendar.Grid>
    </Calendar>
    <Description class_="text-center">
      (Jsx.string
         ("Selected date: "
         ^
         match S.get value with
         | Some d -> Date.to_string d ()
         | None -> "(none)"))
    </Description>
    <div class_="flex gap-2">
      <Button size=`sm variant=`secondary on_click=(fun _ -> choose (today ()))>
        "Set Today"
      </Button>
      <Button
        size=`sm
        variant=`secondary
        on_click=(fun _ -> choose (D.parse_date "2025-12-25"))>
        "Set Christmas"
      </Button>
      <Button
        size=`sm variant=`tertiary on_click=(fun _ -> S.set set_value None)>
        "Clear"
      </Button>
    </div>
  </div>
```

### Min and Max Dates

```ocaml title="calendar_min_max.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Calendar = Solidtype_heroui.Calendar
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate
module Description = Solidtype_heroui.Description

let make () =
  let now = D.today (D.get_local_time_zone ()) in
  let max_date = Date.add now (D.Types.DateDuration.make ~months:3 ()) in
  <div class_="flex flex-col items-center gap-4">
    <Calendar aria_label="Appointment date" max_value=max_date min_value=now>
      <Calendar.Header>
        <Calendar.Heading />
        <Calendar.Nav_button slot=`previous />
        <Calendar.Nav_button slot=`next />
      </Calendar.Header>
      <Calendar.Grid>
        <Calendar.Grid_header>
          (fun day ->
            <Calendar.Header_cell>
              (Jsx.string (S.get day))
            </Calendar.Header_cell>)
        </Calendar.Grid_header>
        <Calendar.Grid_body>
          (fun date -> <Calendar.Cell date=(S.get date) />)
        </Calendar.Grid_body>
      </Calendar.Grid>
    </Calendar>
    <Description class_="text-center">
      (Jsx.string
         ("Select a date between today and " ^ Date.to_string max_date ()))
    </Description>
  </div>
```

### Unavailable Dates

Use `is_date_unavailable` to block dates such as weekends, holidays, or
booked slots. A press on an unavailable day focuses it without choosing it.

```ocaml title="calendar_unavailable.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Calendar = Solidtype_heroui.Calendar
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate
module Description = Solidtype_heroui.Description

(* Saturdays and Sundays, as most of the world's weekend falls. *)
let is_date_unavailable date = D.is_weekend date "en-GB"

let make () =
  <div class_="flex flex-col items-center gap-4">
    <Calendar aria_label="Appointment date" is_date_unavailable>
      <Calendar.Header>
        <Calendar.Heading />
        <Calendar.Nav_button slot=`previous />
        <Calendar.Nav_button slot=`next />
      </Calendar.Header>
      <Calendar.Grid>
        <Calendar.Grid_header>
          (fun day ->
            <Calendar.Header_cell>
              (Jsx.string (S.get day))
            </Calendar.Header_cell>)
        </Calendar.Grid_header>
        <Calendar.Grid_body>
          (fun date -> <Calendar.Cell date=(S.get date) />)
        </Calendar.Grid_body>
      </Calendar.Grid>
    </Calendar>
    <Description class_="text-center">"Weekends are unavailable"</Description>
  </div>
```

### Weeks in Month

Set `weeks_in_month` to a fixed value, for example `6`, to keep the grid's
height as months change.

```ocaml title="calendar_weeks_in_month.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Calendar = Solidtype_heroui.Calendar
module Description = Solidtype_heroui.Description

let make () =
  <div class_="flex flex-col items-center gap-4">
    <Calendar aria_label="Event date" weeks_in_month=6>
      <Calendar.Header>
        <Calendar.Heading />
        <Calendar.Nav_button slot=`previous />
        <Calendar.Nav_button slot=`next />
      </Calendar.Header>
      <Calendar.Grid>
        <Calendar.Grid_header>
          (fun day ->
            <Calendar.Header_cell>
              (Jsx.string (S.get day))
            </Calendar.Header_cell>)
        </Calendar.Grid_header>
        <Calendar.Grid_body>
          (fun date -> <Calendar.Cell date=(S.get date) />)
        </Calendar.Grid_body>
      </Calendar.Grid>
    </Calendar>
    <Description class_="text-center">
      "Always shows 6 weeks per month to avoid layout shift when navigating"
    </Description>
  </div>
```

### Week View

`` visible_duration=(Calendar.Weeks n) `` shows one or more weeks at a time,
and its buttons page by them; `` page_behavior=`single `` pages a week at a
time. Its grid is named by the days it shows.

```ocaml title="calendar_week_view.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Calendar = Solidtype_heroui.Calendar
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Select = Solidtype_heroui.Select

let options =
  [|
    ("1", "1 week");
    ("2", "2 weeks");
    ("3", "3 weeks");
    ("4", "4 weeks");
    ("5", "5 weeks");
    ("6", "6 weeks");
    ("8", "8 weeks");
  |]

let make () =
  let count, set_count = S.create_signal 1 in
  <div class_="flex flex-col items-center gap-6">
    <Select
      class_="w-40"
      value=[| string_of_int (S.get count) |]
      on_change=(fun ids ->
                  match ids with
                  | [| id |] ->
                      Option.iter (S.set set_count) (int_of_string_opt id)
                  | _ -> ())>
      <Label>"Visible weeks"</Label>
      <Select.Trigger><Select.Value /> <Select.Indicator /></Select.Trigger>
      <Select.Popover>
        <List_box>
          <Solidtype.For each=options>
            (fun (id, name) _ ->
              <List_box.Item id text_value=name>
                (Jsx.string name) <List_box.Item_indicator />
              </List_box.Item>)
          </Solidtype.For>
        </List_box>
      </Select.Popover>
    </Select>
    <Calendar
      aria_label="Week view" visible_duration=(Calendar.Weeks (S.get count))>
      <Calendar.Header>
        <Calendar.Heading />
        <Calendar.Nav_button slot=`previous />
        <Calendar.Nav_button slot=`next />
      </Calendar.Header>
      <Calendar.Grid>
        <Calendar.Grid_header>
          (fun day ->
            <Calendar.Header_cell>
              (Jsx.string (S.get day))
            </Calendar.Header_cell>)
        </Calendar.Grid_header>
        <Calendar.Grid_body>
          (fun date -> <Calendar.Cell date=(S.get date) />)
        </Calendar.Grid_body>
      </Calendar.Grid>
    </Calendar>
  </div>
```

### Day View

`` visible_duration=(Calendar.Days n) `` shows a run of days, and its buttons
page by them; `` page_behavior=`single `` pages a day at a time.

```ocaml title="calendar_day_view.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Calendar = Solidtype_heroui.Calendar
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Select = Solidtype_heroui.Select

let options =
  [|
    ("1", "1 day");
    ("5", "5 days");
    ("7", "7 days");
    ("8", "8 days");
    ("10", "10 days");
    ("14", "14 days");
    ("21", "21 days");
  |]

let make () =
  let count, set_count = S.create_signal 5 in
  <div class_="flex flex-col items-center gap-6">
    <Select
      class_="w-40"
      value=[| string_of_int (S.get count) |]
      on_change=(fun ids ->
                  match ids with
                  | [| id |] ->
                      Option.iter (S.set set_count) (int_of_string_opt id)
                  | _ -> ())>
      <Label>"Visible days"</Label>
      <Select.Trigger><Select.Value /> <Select.Indicator /></Select.Trigger>
      <Select.Popover>
        <List_box>
          <Solidtype.For each=options>
            (fun (id, name) _ ->
              <List_box.Item id text_value=name>
                (Jsx.string name) <List_box.Item_indicator />
              </List_box.Item>)
          </Solidtype.For>
        </List_box>
      </Select.Popover>
    </Select>
    <Calendar
      aria_label="Day view" visible_duration=(Calendar.Days (S.get count))>
      <Calendar.Header>
        <Calendar.Heading />
        <Calendar.Nav_button slot=`previous />
        <Calendar.Nav_button slot=`next />
      </Calendar.Header>
      <Calendar.Grid>
        <Calendar.Grid_header>
          (fun day ->
            <Calendar.Header_cell>
              (Jsx.string (S.get day))
            </Calendar.Header_cell>)
        </Calendar.Grid_header>
        <Calendar.Grid_body>
          (fun date -> <Calendar.Cell date=(S.get date) />)
        </Calendar.Grid_body>
      </Calendar.Grid>
    </Calendar>
  </div>
```

### Multiple Selection

`Calendar.Multiple` chooses several dates: its `value`, `default_value` and
`on_change` are arrays.

```ocaml title="calendar_multiple.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Calendar = Solidtype_heroui.Calendar
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate
module Description = Solidtype_heroui.Description

let make () =
  let value, set_value = S.create_signal [||] in
  <div class_="flex flex-col items-center gap-4">
    <Calendar.Multiple
      aria_label="Event dates" value=(S.get value) on_change=(S.set set_value)>
      <Calendar.Header>
        <Calendar.Heading />
        <Calendar.Nav_button slot=`previous />
        <Calendar.Nav_button slot=`next />
      </Calendar.Header>
      <Calendar.Grid>
        <Calendar.Grid_header>
          (fun day ->
            <Calendar.Header_cell>
              (Jsx.string (S.get day))
            </Calendar.Header_cell>)
        </Calendar.Grid_header>
        <Calendar.Grid_body>
          (fun date -> <Calendar.Cell date=(S.get date) />)
        </Calendar.Grid_body>
      </Calendar.Grid>
    </Calendar.Multiple>
    <Description class_="text-center">
      (Jsx.string
         (match Array.length (S.get value) with
         | 0 -> "Select multiple dates"
         | n -> string_of_int n ^ " date(s) selected"))
    </Description>
  </div>
```

### Focused Value

`focused_value` and `on_focus_change` control which date is focused.

```ocaml title="calendar_focused_value.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Calendar = Solidtype_heroui.Calendar
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate
module Description = Solidtype_heroui.Description
module Button = Solidtype_heroui.Button

let make () =
  let focused, set_focused = S.create_signal (D.parse_date "2025-06-15") in
  <div class_="flex flex-col items-center gap-4">
    <Calendar
      aria_label="Event date"
      focused_value=(S.get focused)
      on_focus_change=(S.set set_focused)>
      <Calendar.Header>
        <Calendar.Heading />
        <Calendar.Nav_button slot=`previous />
        <Calendar.Nav_button slot=`next />
      </Calendar.Header>
      <Calendar.Grid>
        <Calendar.Grid_header>
          (fun day ->
            <Calendar.Header_cell>
              (Jsx.string (S.get day))
            </Calendar.Header_cell>)
        </Calendar.Grid_header>
        <Calendar.Grid_body>
          (fun date -> <Calendar.Cell date=(S.get date) />)
        </Calendar.Grid_body>
      </Calendar.Grid>
    </Calendar>
    <Description class_="text-center">
      (Jsx.string ("Focused: " ^ Date.to_string (S.get focused) ()))
    </Description>
    <div class_="flex flex-wrap justify-center gap-2">
      <Button
        size=`sm
        variant=`secondary
        on_click=(fun _ -> S.set set_focused (D.parse_date "2025-01-01"))>
        "Go to Jan"
      </Button>
      <Button
        size=`sm
        variant=`secondary
        on_click=(fun _ -> S.set set_focused (D.parse_date "2025-06-15"))>
        "Go to Jun"
      </Button>
      <Button
        size=`sm
        variant=`secondary
        on_click=(fun _ -> S.set set_focused (D.parse_date "2025-12-25"))>
        "Go to Christmas"
      </Button>
    </div>
  </div>
```

### Cell Indicators

`Calendar.Cell`'s children are drawn of its state, and
`Calendar.Cell_indicator` marks a day.

```ocaml title="calendar_indicators.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Calendar = Solidtype_heroui.Calendar
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate

let dates_with_events = [ 3; 7; 12; 15; 21; 28 ]

let make () =
  <Calendar aria_label="Event date">
    <Calendar.Header>
      <Calendar.Heading />
      <Calendar.Nav_button slot=`previous />
      <Calendar.Nav_button slot=`next />
    </Calendar.Header>
    <Calendar.Grid>
      <Calendar.Grid_header>
        (fun day ->
          <Calendar.Header_cell>(Jsx.string (S.get day))</Calendar.Header_cell>)
      </Calendar.Grid_header>
      <Calendar.Grid_body>
        (fun date ->
          <Calendar.Cell date=(S.get date)>
            (fun (cell : Calendar.cell) ->
              let d = S.get date in
              Jsx.fragment
                [|
                  Jsx.string (S.get cell.formatted_date);
                  (if
                     D.is_today d (D.get_local_time_zone ())
                     || List.mem (Date.day d) dates_with_events
                   then <Calendar.Cell_indicator />
                   else Jsx.nothing);
                |])
          </Calendar.Cell>)
      </Calendar.Grid_body>
    </Calendar.Grid>
  </Calendar>
```

### Custom Navigation Icons

Children of `Calendar.Nav_button` replace the chevrons.

```ocaml title="calendar_custom_icons.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Calendar = Solidtype_heroui.Calendar

let make () =
  <Calendar aria_label="Event date">
    <Calendar.Header>
      <Calendar.Heading />
      <Calendar.Nav_button slot=`previous>
        <svg
          height="24"
          view_box="0 0 24 24"
          width="24"
          xmlns="http://www.w3.org/2000/svg">
          <path
            d="M15.41 16.59L10.83 12l4.58-4.59L14 6l-6 6l6 6z"
            fill="currentColor"
          />
        </svg>
      </Calendar.Nav_button>
      <Calendar.Nav_button slot=`next>
        <svg
          height="24"
          view_box="0 0 24 24"
          width="24"
          xmlns="http://www.w3.org/2000/svg">
          <path
            d="M8.59 16.59L13.17 12L8.59 7.41L10 6l6 6l-6 6z"
            fill="currentColor"
          />
        </svg>
      </Calendar.Nav_button>
    </Calendar.Header>
    <Calendar.Grid>
      <Calendar.Grid_header>
        (fun day ->
          <Calendar.Header_cell>(Jsx.string (S.get day))</Calendar.Header_cell>)
      </Calendar.Grid_header>
      <Calendar.Grid_body>
        (fun date -> <Calendar.Cell date=(S.get date) />)
      </Calendar.Grid_body>
    </Calendar.Grid>
  </Calendar>
```

### Multiple Months

`visible_duration` and `offset` show several months side by side.

```ocaml title="calendar_multiple_months.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Calendar = Solidtype_heroui.Calendar

let make () =
  <Calendar
    aria_label="Trip dates"
    class_="@container-normal w-full max-w-none overflow-x-auto"
    visible_duration=(Calendar.Months 2)>
    <div class_="mx-auto flex w-max gap-8">
      <div class_="w-64">
        <Calendar.Header>
          <Calendar.Nav_button slot=`previous />
          <Calendar.Heading class_="flex-none" />
          <div class_="size-6" />
        </Calendar.Header>
        <Calendar.Grid>
          <Calendar.Grid_header>
            (fun day ->
              <Calendar.Header_cell>
                (Jsx.string (S.get day))
              </Calendar.Header_cell>)
          </Calendar.Grid_header>
          <Calendar.Grid_body>
            (fun date -> <Calendar.Cell date=(S.get date) />)
          </Calendar.Grid_body>
        </Calendar.Grid>
      </div>
      <div class_="w-64">
        <Calendar.Header>
          <div class_="size-6" />
          <Calendar.Heading class_="flex-none" offset=(Calendar.Months 1) />
          <Calendar.Nav_button slot=`next />
        </Calendar.Header>
        <Calendar.Grid offset=(Calendar.Months 1)>
          <Calendar.Grid_header>
            (fun day ->
              <Calendar.Header_cell>
                (Jsx.string (S.get day))
              </Calendar.Header_cell>)
          </Calendar.Grid_header>
          <Calendar.Grid_body>
            (fun date -> <Calendar.Cell date=(S.get date) />)
          </Calendar.Grid_body>
        </Calendar.Grid>
      </div>
    </div>
  </Calendar>
```

### Real-World Example

```ocaml title="calendar_booking.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Calendar = Solidtype_heroui.Calendar
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate
module Button = Solidtype_heroui.Button

let booked_dates = [ 5; 6; 12; 13; 14; 20 ]
let weekend date = D.is_weekend date "en-GB"

let make () =
  let selected, set_selected = S.create_signal None in
  let is_date_unavailable date =
    weekend date || List.mem (Date.day date) booked_dates
  in
  <div class_="flex flex-col items-center gap-4">
    <Calendar
      aria_label="Booking date"
      is_date_unavailable
      min_value=(D.today (D.get_local_time_zone ()))
      value=(Js.Nullable.fromOption (S.get selected))
      on_change=(fun d -> S.set set_selected (Some d))>
      <Calendar.Header>
        <Calendar.Heading />
        <Calendar.Nav_button slot=`previous />
        <Calendar.Nav_button slot=`next />
      </Calendar.Header>
      <Calendar.Grid>
        <Calendar.Grid_header>
          (fun day ->
            <Calendar.Header_cell>
              (Jsx.string (S.get day))
            </Calendar.Header_cell>)
        </Calendar.Grid_header>
        <Calendar.Grid_body>
          (fun date ->
            <Calendar.Cell date=(S.get date)>
              (fun (cell : Calendar.cell) ->
                let d = S.get date in
                Jsx.fragment
                  [|
                    Jsx.string (S.get cell.formatted_date);
                    (if
                       (not (S.get cell.is_unavailable))
                       && (not (weekend d))
                       && List.mem (Date.day d) booked_dates
                     then <Calendar.Cell_indicator />
                     else Jsx.nothing);
                  |])
            </Calendar.Cell>)
        </Calendar.Grid_body>
      </Calendar.Grid>
    </Calendar>
    <div class_="flex flex-col gap-2 text-center">
      <div class_="flex items-center justify-center gap-4 text-xs text-muted">
        <span class_="flex items-center gap-1">
          <span class_="size-2 rounded-full bg-muted" /> "Has bookings"
        </span>
        <span class_="flex items-center gap-1">
          <span class_="size-2 rounded-full bg-default" /> "Weekend/Unavailable"
        </span>
      </div>
      <Solidtype.Show.Some some=(S.get selected)>
        (fun d ->
          <Button size=`sm variant=`primary>
            (Jsx.string ("Book " ^ Date.to_string (S.get d) ()))
          </Button>)
      </Solidtype.Show.Some>
    </div>
  </div>
```

### International Calendars

An `I18n.I18nProvider` locale with a calendar extension shows that calendar;
`on_change` gives a date in the calendar of the value given, else the
Gregorian.

```ocaml title="calendar_international.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Calendar = Solidtype_heroui.Calendar
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate
module I18n = Solidtype_kobalte.I18n

let make () =
  <I18n.I18nProvider locale="hi-IN-u-ca-indian">
    <Calendar
      aria_label="Event date" default_value=(D.today (D.get_local_time_zone ()))>
      <Calendar.Header>
        <Calendar.Year_picker_trigger>
          <Calendar.Year_picker_trigger_heading />
          <Calendar.Year_picker_trigger_indicator />
        </Calendar.Year_picker_trigger>
        <Calendar.Nav_button slot=`previous />
        <Calendar.Nav_button slot=`next />
      </Calendar.Header>
      <Calendar.Grid>
        <Calendar.Grid_header>
          (fun day ->
            <Calendar.Header_cell>
              (Jsx.string (S.get day))
            </Calendar.Header_cell>)
        </Calendar.Grid_header>
        <Calendar.Grid_body>
          (fun date -> <Calendar.Cell date=(S.get date) />)
        </Calendar.Grid_body>
      </Calendar.Grid>
      <Calendar.Year_picker_grid>
        <Calendar.Year_picker_grid_body />
      </Calendar.Year_picker_grid>
    </Calendar>
  </I18n.I18nProvider>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="calendar_tailwind.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Calendar = Solidtype_heroui.Calendar

let make () =
  <Calendar
    aria_label="Custom styled calendar"
    class_="w-63 rounded-2xl border border-border/80 bg-surface p-3 shadow-sm \
            ring-1 ring-accent/5 dark:border-border/90 dark:ring-accent/10">
    <Calendar.Header class_="px-0.5 pb-4">
      <Calendar.Heading class_="text-sm font-medium text-foreground" />
      <Calendar.Nav_button
        class_="text-accent-soft-foreground hover:bg-default \
                hover:text-accent-soft-foreground active:scale-95"
        slot=`previous
      />
      <Calendar.Nav_button
        class_="text-accent-soft-foreground hover:bg-default \
                hover:text-accent-soft-foreground active:scale-95"
        slot=`next
      />
    </Calendar.Header>
    <Calendar.Grid>
      <Calendar.Grid_header>
        (fun day ->
          <Calendar.Header_cell class_="pb-2 text-xs font-medium text-muted">
            (Jsx.string (S.get day))
          </Calendar.Header_cell>)
      </Calendar.Grid_header>
      <Calendar.Grid_body>
        (fun date ->
          <Calendar.Cell
            class_="rounded-3xl hover:bg-default \
                    data-[hovered=true]:bg-default \
                    data-[outside-month=true]:text-muted \
                    data-[outside-month=true]:opacity-50 \
                    data-[selected=true]:bg-accent \
                    data-[selected=true]:text-accent-foreground \
                    data-[selected=true]:hover:bg-accent-hover \
                    data-[selected=true]:data-[hovered=true]:bg-accent-hover \
                    data-[selected=true]:data-[outside-month=true]:bg-default \
                    data-[today=true]:bg-accent-soft \
                    data-[today=true]:text-accent-soft-foreground \
                    data-[today=true]:hover:bg-accent-soft-hover \
                    data-[today=true]:data-[hovered=true]:bg-accent-soft-hover \
                    data-[selected=true]:data-[today=true]:bg-accent \
                    data-[selected=true]:data-[today=true]:hover:bg-accent-hover"
            date=(S.get date)
          />)
      </Calendar.Grid_body>
    </Calendar.Grid>
  </Calendar>
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

- `.calendar` - Root container.
- `.calendar--week-view`, `.calendar--day-view` - A week's or a day's view.
- `.calendar__header` - Header row containing nav buttons and heading.
- `.calendar__heading` - Current month label.
- `.calendar__nav-button` - Previous/next navigation controls.
- `.calendar__grid` - Main day grid.
- `.calendar__grid-header` - Weekday header row wrapper.
- `.calendar__grid-body` - Date rows wrapper.
- `.calendar__header-cell` - Weekday header cell.
- `.calendar__cell` - Interactive day cell.
- `.calendar__cell-indicator` - Dot indicator inside a day cell.
- `.calendar-year-picker__trigger` - Year picker toggle button.
- `.calendar-year-picker__trigger-heading` - Heading text inside year picker trigger.
- `.calendar-year-picker__trigger-indicator` - Indicator icon inside year picker trigger.
- `.calendar-year-picker__year-grid` - Overlay grid of selectable years.
- `.calendar-year-picker__year-cell` - Individual year option.

### Interactive States

- **Selected**: `[data-selected="true"]`
- **Today**: `[data-today="true"]`
- **Unavailable**: `[data-unavailable="true"]`
- **Outside month**: `[data-outside-month="true"]`
- **Hovered**: `[data-hovered="true"]`
- **Pressed**: `[data-pressed="true"]`
- **Focus visible**: `[data-focus-visible="true"]`
- **Disabled**: `[data-disabled="true"]`

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Calendar

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `value` | `value` | `CalendarDate.t Js.Nullable.t` | | Controlled selected date; null controls it empty |
| `defaultValue` | `default_value` | `CalendarDate.t` | | Initial selected date (uncontrolled) |
| `onChange` | `on_change` | `CalendarDate.t -> unit` | | Called when a date is chosen |
| `selectionMode` | — | | | `Calendar.Multiple` chooses several dates |
| `focusedValue` | `focused_value` | `CalendarDate.t` | | Controlled focused date |
| `defaultFocusedValue` | `default_focused_value` | `CalendarDate.t` | its value, else today | Initial focused date |
| `onFocusChange` | `on_focus_change` | `CalendarDate.t -> unit` | | Called when focus moves to another date |
| `minValue` | `min_value` | `CalendarDate.t` | 1900-01-01 in its calendar | Earliest selectable date |
| `maxValue` | `max_value` | `CalendarDate.t` | 2099-12-31 in its calendar | Latest selectable date |
| `weeksInMonth` | `weeks_in_month` | `int` | the month's | The number of weeks in a month's grid |
| `isDateUnavailable` | `is_date_unavailable` | `CalendarDate.t -> bool` | | Marks dates as unavailable |
| `firstDayOfWeek` | `first_day_of_week` | `` [ `sun \| `mon \| `tue \| `wed \| `thu \| `fri \| `sat ] `` | the locale's | The first day of its weeks |
| `pageBehavior` | `page_behavior` | `` [ `visible \| `single ] `` | `` `visible `` | Whether paging moves by what is shown or by one unit |
| `selectionAlignment` | `selection_alignment` | `` [ `start \| `center \| `end_ ] `` | `` `center `` | Where the focused date stands in what is shown at first |
| `isDisabled` | `is_disabled` | `bool` | `false` | Disables interaction and selection |
| `isReadOnly` | `is_read_only` | `bool` | `false` | Days are focused but not chosen |
| `isInvalid` | `is_invalid` | `bool` | `false` | Marks the calendar as invalid |
| `visibleDuration` | `visible_duration` | `Calendar.duration` | `Months 1` | `Months n`, `Weeks n` or `Days n` |
| `defaultYearPickerOpen` | `default_year_picker_open` | `bool` | `false` | Initial open state of the year picker |
| `isYearPickerOpen` | `is_year_picker_open` | `bool` | | Controlled open state of the year picker |
| `onYearPickerOpenChange` | `on_year_picker_open_change` | `bool -> unit` | | Called when the year picker opens or closes |
| `aria-label` | `aria_label` | `string` | | Its name, beside the dates it shows |
| `className` | `class_` | `string` | | Added after HeroUI's classes |

### Composition Parts

| React | solidtype | Description |
|---|---|---|
| `Calendar.Header` | `Calendar.Header` | Header container for navigation and heading |
| `Calendar.Heading` | `Calendar.Heading` | The dates shown; `offset` and `format` |
| `Calendar.NavButton` | `Calendar.Nav_button` | `` slot=`previous `` or `` slot=`next `` |
| `Calendar.Grid` | `Calendar.Grid` | Day grid for one month; `offset` and `weekday_style` |
| `Calendar.GridHeader` | `Calendar.Grid_header` | Weekday header, a function of each day's name |
| `Calendar.GridBody` | `Calendar.Grid_body` | Date cells, a function of each date |
| `Calendar.HeaderCell` | `Calendar.Header_cell` | Weekday label cell |
| `Calendar.Cell` | `Calendar.Cell` | A day, its children drawn of its state |
| `Calendar.CellIndicator` | `Calendar.Cell_indicator` | A dot marking a day |
| `Calendar.YearPickerTrigger` | `Calendar.Year_picker_trigger` | Opens and closes the year picker |
| `Calendar.YearPickerTriggerHeading` | `Calendar.Year_picker_trigger_heading` | The month shown, in the trigger |
| `Calendar.YearPickerTriggerIndicator` | `Calendar.Year_picker_trigger_indicator` | The trigger's chevron |
| `Calendar.YearPickerGrid` | `Calendar.Year_picker_grid` | The years; `format` and `visible_years` |
| `Calendar.YearPickerGridBody` | `Calendar.Year_picker_grid_body` | The years' cells, or a function of each year |
| `Calendar.YearPickerCell` | `Calendar.Year_picker_cell` | A year |

### Calendar.Cell's state

| React | solidtype | Type | Description |
|---|---|---|---|
| `formattedDate` | `formatted_date` | `string S.accessor` | Its day of the month |
| `isSelected` | `is_selected` | `bool S.accessor` | Whether the date is chosen |
| `isUnavailable` | `is_unavailable` | `bool S.accessor` | Whether the date is unavailable |
| `isDisabled` | `is_disabled` | `bool S.accessor` | Whether the cell is disabled |
| `isOutsideMonth` | `is_outside_month` | `bool S.accessor` | Whether the date belongs to another month |
| `isToday` | `is_today` | `bool S.accessor` | Whether the date is today |
