# RangeCalendar

Composable date range picker with month grid, navigation, and year picker support.

Its value is a `Range_calendar.range`, `{ start; end_ }`, of
`CalendarDate`s of `solidtype-internationalized-date`. `on_change` is told
the range chosen, or `None` where `` commit_behavior=`clear `` clears it.

Its weeks start on Monday and its days are written as `en-GB` writes them,
whatever the browser reads, unless an `I18n.I18nProvider` names another
locale. React's follows the browser.

Original HeroUI documentation: [RangeCalendar](https://heroui.com/en/docs/react/components/range-calendar).

## Usage

```ocaml title="range_calendar_usage.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Range_calendar = Solidtype_heroui.Range_calendar

let make () =
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
```

## Parity

The same HeroUI RangeCalendar twice, under the same props: in solidtype on
the left, in React on the right. Below them, every attribute of the two
calendars: a marked row is one they disagree on.

## Anatomy

```ocaml
<Range_calendar aria_label="Trip dates">
  <Range_calendar.Header>
    <Range_calendar.Heading />
    <Range_calendar.Nav_button slot=`previous />
    <Range_calendar.Nav_button slot=`next />
  </Range_calendar.Header>
  <Range_calendar.Grid>
    <Range_calendar.Grid_header>
      (fun day ->
        <Range_calendar.Header_cell>(Jsx.string (S.get day))</Range_calendar.Header_cell>)
    </Range_calendar.Grid_header>
    <Range_calendar.Grid_body>
      (fun date -> <Range_calendar.Cell date=(S.get date) />)
    </Range_calendar.Grid_body>
  </Range_calendar.Grid>
</Range_calendar>
```

A press on a day begins a range, and the days shown run to the one hovered
or focused until a second press ends it. A drag chooses the days it crosses,
and a drag from an end of the range chosen moves that end. Enter begins and
ends a range by the keys, and Escape lets a range begun go.

## Examples

### Disabled

```ocaml title="range_calendar_disabled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Range_calendar = Solidtype_heroui.Range_calendar
module Description = Solidtype_heroui.Description

let make () =
  <div class_="flex flex-col items-center gap-4">
    <Range_calendar is_disabled=true aria_label="Trip dates">
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
    <Description class_="text-center">"Range calendar is disabled"</Description>
  </div>
```

### Year Picker

`Range_calendar.Year_picker_trigger`, `Range_calendar.Year_picker_grid`, and
their body and cell parts provide an integrated year navigation pattern.

```ocaml title="range_calendar_year_picker.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Range_calendar = Solidtype_heroui.Range_calendar

let make () =
  <Range_calendar aria_label="Trip dates">
    <Range_calendar.Header>
      <Range_calendar.Year_picker_trigger>
        <Range_calendar.Year_picker_trigger_heading />
        <Range_calendar.Year_picker_trigger_indicator />
      </Range_calendar.Year_picker_trigger>
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
    <Range_calendar.Year_picker_grid>
      <Range_calendar.Year_picker_grid_body />
    </Range_calendar.Year_picker_grid>
  </Range_calendar>
```

### Default Value

```ocaml title="range_calendar_default_value.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Range_calendar = Solidtype_heroui.Range_calendar
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate

let make () =
  <Range_calendar
    aria_label="Trip dates"
    default_value={
                    Range_calendar.start = D.parse_date "2025-02-03";
                    end_ = D.parse_date "2025-02-12";
                  }>
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
```

### Controlled

Use controlled `value` and `focused_value` for external state coordination
and custom shortcuts.

```ocaml title="range_calendar_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Range_calendar = Solidtype_heroui.Range_calendar
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate
module Description = Solidtype_heroui.Description
module Button = Solidtype_heroui.Button
module Button_group = Solidtype_heroui.Button_group

let today () = D.today (D.get_local_time_zone ())

(* The start of the week holding [d], Monday first, as en-GB counts. *)
let start_of_week d =
  Date.subtract d
    (D.Types.DateDuration.make ~days:(D.get_day_of_week d "en-GB" ()) ())

let start_of_month d = Date.set d (D.Types.DateFields.make ~day:1 ())

let make () =
  let value, set_value = S.create_signal None in
  let focused, set_focused = S.create_signal (D.parse_date "2025-12-25") in
  let set_range start end_ =
    S.set set_value (Some { Range_calendar.start; end_ });
    S.set set_focused start
  in
  <div class_="flex flex-col items-center gap-4">
    <Button_group variant=`tertiary>
      <Button on_click=(fun _ -> S.set set_focused (today ()))>
        "This week"
      </Button>
      <Button
        on_click=(fun _ ->
                     S.set set_focused
                       (start_of_week
                          (Date.add (today ())
                             (D.Types.DateDuration.make ~weeks:1 ()))))>
        "Next week"
      </Button>
      <Button
        on_click=(fun _ ->
                     S.set set_focused
                       (start_of_month
                          (Date.add (today ())
                             (D.Types.DateDuration.make ~months:1 ()))))>
        "Next month"
      </Button>
    </Button_group>
    <Range_calendar
      aria_label="Trip dates"
      first_day_of_week=`mon
      focused_value=(S.get focused)
      value=(Js.Null.fromOption (S.get value))
      on_change=(S.set set_value)
      on_focus_change=(S.set set_focused)>
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
    <Description class_="text-center">
      (Jsx.string
         ("Selected range: "
         ^
         match S.get value with
         | Some r ->
             Date.to_string r.start () ^ " -> " ^ Date.to_string r.end_ ()
         | None -> "(none)"))
    </Description>
    <div class_="flex gap-2">
      <Button
        size=`sm
        variant=`secondary
        on_click=(fun _ ->
                     let start = today () in
                     set_range start
                       (Date.add start (D.Types.DateDuration.make ~days:6 ())))>
        "Set 1 week"
      </Button>
      <Button
        size=`sm
        variant=`secondary
        on_click=(fun _ ->
                     set_range
                       (D.parse_date "2025-12-20")
                       (D.parse_date "2025-12-31"))>
        "Set Holidays"
      </Button>
      <Button
        size=`sm variant=`tertiary on_click=(fun _ -> S.set set_value None)>
        "Clear"
      </Button>
    </div>
  </div>
```

### Min and Max Dates

```ocaml title="range_calendar_min_max.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Range_calendar = Solidtype_heroui.Range_calendar
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate
module Description = Solidtype_heroui.Description

let make () =
  let now = D.today (D.get_local_time_zone ()) in
  let max_date = Date.add now (D.Types.DateDuration.make ~months:3 ()) in
  <div class_="flex flex-col items-center gap-4">
    <Range_calendar
      aria_label="Appointment date" max_value=max_date min_value=now>
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
    <Description class_="text-center">
      (Jsx.string
         ("Select a date between today and " ^ Date.to_string max_date ()))
    </Description>
  </div>
```

### Unavailable Dates

Use `is_date_unavailable` to block dates such as weekends, holidays, or
booked slots. A range begun reaches no further than the nearest unavailable
day.

```ocaml title="range_calendar_unavailable.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Range_calendar = Solidtype_heroui.Range_calendar
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate
module Description = Solidtype_heroui.Description

let now () = D.today (D.get_local_time_zone ())
let days n = D.Types.DateDuration.make ~days:n ()

(* Days two to five from today, and twelve and thirteen, are booked. *)
let is_date_unavailable d _ =
  let n = now () in
  List.exists
    (fun (a, b) ->
      Date.compare d (Date.add n (days a)) >= 0.
      && Date.compare d (Date.add n (days b)) <= 0.)
    [ (2, 5); (12, 13) ]

let make () =
  <div class_="flex flex-col items-center gap-4">
    <Range_calendar
      aria_label="Trip dates"
      default_value={
                      Range_calendar.start = Date.add (now ()) (days 6);
                      end_ = Date.add (now ()) (days 9);
                    }
      first_day_of_week=`mon
      is_date_unavailable>
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
    <Description class_="text-center">"Some days are unavailable"</Description>
  </div>
```

### Anchor-Based Unavailable Dates

While a range is begun, `is_date_unavailable` is given its first date beside
each date, `Some anchor`, else `None`. Use it to limit which end dates are
valid, for example within 7 days of the start.

```ocaml title="range_calendar_anchor_unavailable.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Range_calendar = Solidtype_heroui.Range_calendar
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate
module Description = Solidtype_heroui.Description

(* Once a start is chosen, only the days within a week of it may end the
   range. *)
let is_date_unavailable d anchor =
  match anchor with
  | Some a -> abs_float (Date.compare d a) > 7.
  | None -> false

let make () =
  <div class_="flex flex-col items-center gap-4">
    <Range_calendar
      aria_label="Trip dates"
      is_date_unavailable
      min_value=(D.today (D.get_local_time_zone ()))>
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
    <Description class_="text-center">
      "After selecting a start date, only dates within 7 days are available"
    </Description>
  </div>
```

### Weeks in Month

Set `weeks_in_month` to a fixed value, for example `6`, to keep the grid's
height as months change.

```ocaml title="range_calendar_weeks_in_month.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Range_calendar = Solidtype_heroui.Range_calendar
module Description = Solidtype_heroui.Description

let make () =
  <div class_="flex flex-col items-center gap-4">
    <Range_calendar aria_label="Trip dates" weeks_in_month=6>
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
    <Description class_="text-center">
      "Always shows 6 weeks per month to avoid layout shift when navigating"
    </Description>
  </div>
```

### Week View

`` visible_duration=(Range_calendar.Weeks n) `` shows one or more weeks at a
time, and its buttons page by them; `` page_behavior=`single `` pages a week
at a time. Its grid is named by the days it shows.

```ocaml title="range_calendar_week_view.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Range_calendar = Solidtype_heroui.Range_calendar
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
    <Range_calendar
      aria_label="Week view"
      visible_duration=(Range_calendar.Weeks (S.get count))>
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
  </div>
```

### Day View

`` visible_duration=(Range_calendar.Days n) `` shows a run of days, and its
buttons page by them; `` page_behavior=`single `` pages a day at a time.

```ocaml title="range_calendar_day_view.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Range_calendar = Solidtype_heroui.Range_calendar
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
    <Range_calendar
      aria_label="Day view" visible_duration=(Range_calendar.Days (S.get count))>
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
  </div>
```

### Allows Non-Contiguous Ranges

`allows_non_contiguous_ranges` lets a range cross unavailable dates.

```ocaml title="range_calendar_non_contiguous.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Range_calendar = Solidtype_heroui.Range_calendar
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate
module Description = Solidtype_heroui.Description

let now () = D.today (D.get_local_time_zone ())
let days n = D.Types.DateDuration.make ~days:n ()

(* Days two to five from today, and twelve and thirteen, are booked. *)
let is_date_unavailable d _ =
  let n = now () in
  List.exists
    (fun (a, b) ->
      Date.compare d (Date.add n (days a)) >= 0.
      && Date.compare d (Date.add n (days b)) <= 0.)
    [ (2, 5); (12, 13) ]

let make () =
  <div class_="flex flex-col items-center gap-4">
    <Range_calendar
      allows_non_contiguous_ranges=true
      aria_label="Trip dates"
      default_value={
                      Range_calendar.start = Date.add (now ()) (days 1);
                      end_ = Date.add (now ()) (days 9);
                    }
      first_day_of_week=`mon
      is_date_unavailable>
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
    <Description class_="text-center">
      "Non-contiguous ranges are allowed across unavailable dates"
    </Description>
  </div>
```

### Read Only

```ocaml title="range_calendar_read_only.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Range_calendar = Solidtype_heroui.Range_calendar
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate
module Description = Solidtype_heroui.Description

let make () =
  <div class_="flex flex-col items-center gap-4">
    <Range_calendar
      is_read_only=true
      aria_label="Trip dates"
      default_value=(let now = D.today (D.get_local_time_zone ()) in
                     {
                       Range_calendar.start = now;
                       end_ =
                         Date.add now (D.Types.DateDuration.make ~days:4 ());
                     })>
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
    <Description class_="text-center">
      "Range calendar is read-only"
    </Description>
  </div>
```

### Invalid

```ocaml title="range_calendar_invalid.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Range_calendar = Solidtype_heroui.Range_calendar
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate
module Description = Solidtype_heroui.Description

let make () =
  let now = D.today (D.get_local_time_zone ()) in
  let after n = Date.add now (D.Types.DateDuration.make ~days:n ()) in
  let value, set_value =
    S.create_signal { Range_calendar.start = after 6; end_ = after 14 }
  in
  let too_long () =
    let r = S.get value in
    Date.compare r.end_ r.start > 7.
  in
  <div class_="flex flex-col items-center gap-4">
    <Range_calendar
      aria_label="Trip dates"
      first_day_of_week=`mon
      is_invalid=(too_long ())
      value=(Js.Null.return (S.get value))
      on_change=(Option.iter (S.set set_value))>
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
    (if too_long () then
       <p class_="text-sm text-danger">"Maximum stay duration is 1 week"</p>
     else
       <Description class_="text-center">
         "Select a stay of up to 7 days"
       </Description>)
  </div>
```

### Focused Value

`focused_value` and `on_focus_change` control which date is focused.

```ocaml title="range_calendar_focused_value.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Range_calendar = Solidtype_heroui.Range_calendar
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate
module Description = Solidtype_heroui.Description
module Button = Solidtype_heroui.Button

let make () =
  let focused, set_focused = S.create_signal (D.parse_date "2025-06-15") in
  <div class_="flex flex-col items-center gap-4">
    <Range_calendar
      aria_label="Trip dates"
      focused_value=(S.get focused)
      on_focus_change=(S.set set_focused)>
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

`Range_calendar.Cell`'s children are drawn of its state, and
`Range_calendar.Cell_indicator` marks a day.

```ocaml title="range_calendar_indicators.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Range_calendar = Solidtype_heroui.Range_calendar
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate

let dates_with_events = [ 3; 7; 12; 15; 21; 28 ]

let make () =
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
        (fun date ->
          <Range_calendar.Cell date=(S.get date)>
            (fun (cell : Range_calendar.cell) ->
              let d = S.get date in
              Jsx.fragment
                [|
                  Jsx.string (S.get cell.formatted_date);
                  (if
                     D.is_today d (D.get_local_time_zone ())
                     || List.mem (Date.day d) dates_with_events
                   then <Range_calendar.Cell_indicator />
                   else Jsx.nothing);
                |])
          </Range_calendar.Cell>)
      </Range_calendar.Grid_body>
    </Range_calendar.Grid>
  </Range_calendar>
```

### Real-World Example

```ocaml title="range_calendar_booking.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Range_calendar = Solidtype_heroui.Range_calendar
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate
module Button = Solidtype_heroui.Button

let blocked_dates = [ 5; 6; 12; 13; 14; 20 ]
let weekend date = D.is_weekend date "en-GB"

let make () =
  let selected, set_selected = S.create_signal None in
  let is_date_unavailable date _ =
    weekend date || List.mem (Date.day date) blocked_dates
  in
  <div class_="flex flex-col items-center gap-4">
    <Range_calendar
      aria_label="Booking range"
      is_date_unavailable
      min_value=(D.today (D.get_local_time_zone ()))
      value=(Js.Null.fromOption (S.get selected))
      on_change=(S.set set_selected)>
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
          (fun date ->
            <Range_calendar.Cell date=(S.get date)>
              (fun (cell : Range_calendar.cell) ->
                let d = S.get date in
                Jsx.fragment
                  [|
                    Jsx.string (S.get cell.formatted_date);
                    (if
                       (not (S.get cell.is_unavailable))
                       && (not (weekend d))
                       && List.mem (Date.day d) blocked_dates
                     then <Range_calendar.Cell_indicator />
                     else Jsx.nothing);
                  |])
            </Range_calendar.Cell>)
        </Range_calendar.Grid_body>
      </Range_calendar.Grid>
    </Range_calendar>
    <div class_="flex flex-col gap-2 text-center">
      <div class_="flex items-center justify-center gap-4 text-xs text-muted">
        <span class_="flex items-center gap-1">
          <span class_="size-2 rounded-full bg-muted" /> "Blocked dates"
        </span>
        <span class_="flex items-center gap-1">
          <span class_="size-2 rounded-full bg-default" /> "Weekend/Unavailable"
        </span>
      </div>
      <Solidtype.Show.Some some=(S.get selected)>
        (fun r ->
          <Button size=`sm variant=`primary>
            (Jsx.string
               ("Book "
               ^ Date.to_string (S.get r).start ()
               ^ " -> "
               ^ Date.to_string (S.get r).end_ ()))
          </Button>)
      </Solidtype.Show.Some>
    </div>
  </div>
```

### Multiple Months

`visible_duration` and `offset` show several months side by side.

```ocaml title="range_calendar_multiple_months.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Range_calendar = Solidtype_heroui.Range_calendar

let make () =
  <Range_calendar
    aria_label="Trip dates"
    class_="@container-normal w-full max-w-none overflow-x-auto"
    visible_duration=(Range_calendar.Months 2)>
    <div class_="mx-auto flex w-max gap-8">
      <div class_="w-64">
        <Range_calendar.Header>
          <Range_calendar.Nav_button slot=`previous />
          <Range_calendar.Heading class_="flex-none" />
          <div class_="size-6" />
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
      </div>
      <div class_="w-64">
        <Range_calendar.Header>
          <div class_="size-6" />
          <Range_calendar.Heading
            class_="flex-none" offset=(Range_calendar.Months 1)
          />
          <Range_calendar.Nav_button slot=`next />
        </Range_calendar.Header>
        <Range_calendar.Grid offset=(Range_calendar.Months 1)>
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
      </div>
    </div>
  </Range_calendar>
```

### International Calendars

An `I18n.I18nProvider` locale with a calendar extension shows that calendar;
`on_change` gives dates in the calendar of the value given, else the
Gregorian.

```ocaml title="range_calendar_international.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Range_calendar = Solidtype_heroui.Range_calendar
module I18n = Solidtype_kobalte.I18n

let make () =
  <I18n.I18nProvider locale="hi-IN-u-ca-indian">
    <Range_calendar aria_label="Trip dates">
      <Range_calendar.Header>
        <Range_calendar.Year_picker_trigger>
          <Range_calendar.Year_picker_trigger_heading />
          <Range_calendar.Year_picker_trigger_indicator />
        </Range_calendar.Year_picker_trigger>
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
      <Range_calendar.Year_picker_grid>
        <Range_calendar.Year_picker_grid_body />
      </Range_calendar.Year_picker_grid>
    </Range_calendar>
  </I18n.I18nProvider>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="range_calendar_tailwind.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Range_calendar = Solidtype_heroui.Range_calendar
module D = Solidtype_internationalized_date

let cell_class =
  String.concat " "
    [
      "rounded-md";
      "**:data-[slot=range-calendar-cell-button]:rounded-md";
      "data-[outside-month=true]:text-muted \
       data-[outside-month=true]:opacity-50";
      "data-[hovered=true]:not-data-[selected=true]:**:data-[slot=range-calendar-cell-button]:bg-default";
      "data-[today=true]:**:data-[slot=range-calendar-cell-button]:bg-success-soft";
      "data-[today=true]:**:data-[slot=range-calendar-cell-button]:text-success-soft-foreground";
      "data-[today=true]:data-[hovered=true]:not-data-[selected=true]:**:data-[slot=range-calendar-cell-button]:bg-success-soft-hover";
      "data-[selected=true]:rounded-none data-[selected=true]:bg-success-soft";
      "data-[outside-month=true]:data-[selected=true]:bg-default/20";
      "data-[selection-start=true]:rounded-tl-md \
       data-[selection-start=true]:rounded-bl-md";
      "data-[selection-end=true]:rounded-tr-md \
       data-[selection-end=true]:rounded-br-md";
      "data-[selection-start=true]:**:data-[slot=range-calendar-cell-button]:bg-success";
      "data-[selection-start=true]:**:data-[slot=range-calendar-cell-button]:text-success-foreground";
      "data-[selection-start=true]:data-[pressed=true]:**:data-[slot=range-calendar-cell-button]:bg-success-hover";
      "data-[selection-end=true]:**:data-[slot=range-calendar-cell-button]:bg-success";
      "data-[selection-end=true]:**:data-[slot=range-calendar-cell-button]:text-success-foreground";
      "data-[selection-end=true]:data-[pressed=true]:**:data-[slot=range-calendar-cell-button]:bg-success-hover";
    ]

let make () =
  <Range_calendar
    aria_label="Hotel stay"
    class_="w-63 rounded-xl border border-border/80 bg-surface p-3 shadow-sm \
            ring-1 ring-success/10"
    default_value={
                    Range_calendar.start = D.parse_date "2025-02-08";
                    end_ = D.parse_date "2025-02-14";
                  }
    first_day_of_week=`mon>
    <Range_calendar.Header class_="px-0.5 pb-4">
      <Range_calendar.Heading class_="text-sm font-medium text-foreground" />
      <Range_calendar.Nav_button
        class_="rounded-md text-success hover:bg-success-soft active:scale-95"
        slot=`previous
      />
      <Range_calendar.Nav_button
        class_="rounded-md text-success hover:bg-success-soft active:scale-95"
        slot=`next
      />
    </Range_calendar.Header>
    <Range_calendar.Grid>
      <Range_calendar.Grid_header>
        (fun day ->
          <Range_calendar.Header_cell
            class_="pb-2 text-xs font-medium text-muted">
            (Jsx.string (S.get day))
          </Range_calendar.Header_cell>)
      </Range_calendar.Grid_header>
      <Range_calendar.Grid_body>
        (fun date ->
          <Range_calendar.Cell class_=cell_class date=(S.get date) />)
      </Range_calendar.Grid_body>
    </Range_calendar.Grid>
  </Range_calendar>
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

- `.range-calendar` - Root container.
- `.range-calendar--week-view`, `.range-calendar--day-view` - A week's or a day's view.
- `.range-calendar__header` - Header row containing nav buttons and heading.
- `.range-calendar__heading` - Current month label.
- `.range-calendar__nav-button` - Previous/next navigation controls.
- `.range-calendar__grid` - Main day grid.
- `.range-calendar__grid-header` - Weekday header row wrapper.
- `.range-calendar__grid-body` - Date rows wrapper.
- `.range-calendar__header-cell` - Weekday header cell.
- `.range-calendar__cell` - Interactive day cell.
- `.range-calendar__cell-button` - A day's content, chosen at the range's ends.
- `.range-calendar__cell-indicator` - Dot indicator inside a day cell.
- `.calendar-year-picker__trigger` - Year picker toggle button.
- `.calendar-year-picker__year-grid` - Overlay grid of selectable years.
- `.calendar-year-picker__year-cell` - Individual year option.

### Interactive States

- **Selected**: `[data-selected="true"]`
- **Selection start**: `[data-selection-start="true"]`
- **Selection end**: `[data-selection-end="true"]`
- **Today**: `[data-today="true"]`
- **Unavailable**: `[data-unavailable="true"]`
- **Outside month**: `[data-outside-month="true"]`
- **Hovered**: `[data-hovered="true"]`
- **Pressed**: `[data-pressed="true"]`
- **Focus visible**: `[data-focus-visible="true"]`
- **Disabled**: `[data-disabled="true"]`

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Range_calendar

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `value` | `value` | `range Js.Null.t` | | Controlled selected range; null controls it empty |
| `defaultValue` | `default_value` | `range` | | Initial selected range (uncontrolled) |
| `onChange` | `on_change` | `range option -> unit` | | Called when a range is chosen, or cleared |
| `allowsNonContiguousRanges` | `allows_non_contiguous_ranges` | `bool` | `false` | Allows ranges that span unavailable dates |
| `commitBehavior` | `commit_behavior` | `` [ `select \| `reset \| `clear ] `` | `` `select `` | What a range begun becomes as the pointer is let go outside the days, or the focus leaves |
| `focusedValue` | `focused_value` | `CalendarDate.t` | | Controlled focused date |
| `defaultFocusedValue` | `default_focused_value` | `CalendarDate.t` | its start, else today | Initial focused date |
| `onFocusChange` | `on_focus_change` | `CalendarDate.t -> unit` | | Called when focus moves to another date |
| `minValue` | `min_value` | `CalendarDate.t` | 1900-01-01 in its calendar | Earliest selectable date |
| `maxValue` | `max_value` | `CalendarDate.t` | 2099-12-31 in its calendar | Latest selectable date |
| `weeksInMonth` | `weeks_in_month` | `int` | the month's | The number of weeks in a month's grid |
| `isDateUnavailable` | `is_date_unavailable` | `CalendarDate.t -> CalendarDate.t option -> bool` | | Marks dates as unavailable, given a range begun's first date |
| `firstDayOfWeek` | `first_day_of_week` | `` [ `sun \| `mon \| `tue \| `wed \| `thu \| `fri \| `sat ] `` | the locale's | The first day of its weeks |
| `pageBehavior` | `page_behavior` | `` [ `visible \| `single ] `` | `` `visible `` | Whether paging moves by what is shown or by one unit |
| `selectionAlignment` | `selection_alignment` | `` [ `start \| `center \| `end_ ] `` | `` `center ``, or `` `start `` for a range longer than a view | Where the range stands in what is shown at first |
| `isDisabled` | `is_disabled` | `bool` | `false` | Disables interaction and selection |
| `isReadOnly` | `is_read_only` | `bool` | `false` | Days are focused but not chosen |
| `isInvalid` | `is_invalid` | `bool` | `false` | Marks the calendar as invalid |
| `visibleDuration` | `visible_duration` | `Range_calendar.duration` | `Months 1` | `Months n`, `Weeks n` or `Days n` |
| `defaultYearPickerOpen` | `default_year_picker_open` | `bool` | `false` | Initial open state of the year picker |
| `isYearPickerOpen` | `is_year_picker_open` | `bool` | | Controlled open state of the year picker |
| `onYearPickerOpenChange` | `on_year_picker_open_change` | `bool -> unit` | | Called when the year picker opens or closes |
| `aria-label` | `aria_label` | `string` | | Its name, beside the dates it shows |
| `className` | `class_` | `string` | | Added after HeroUI's classes |

### Composition Parts

They are [Calendar](calendar.md)'s parts, drawn in the
range's look.

| React | solidtype | Description |
|---|---|---|
| `RangeCalendar.Header` | `Range_calendar.Header` | Header container for navigation and heading |
| `RangeCalendar.Heading` | `Range_calendar.Heading` | The dates shown; `offset` and `format` |
| `RangeCalendar.NavButton` | `Range_calendar.Nav_button` | `` slot=`previous `` or `` slot=`next `` |
| `RangeCalendar.Grid` | `Range_calendar.Grid` | Day grid for one month; `offset` and `weekday_style` |
| `RangeCalendar.GridHeader` | `Range_calendar.Grid_header` | Weekday header, a function of each day's name |
| `RangeCalendar.GridBody` | `Range_calendar.Grid_body` | Date cells, a function of each date |
| `RangeCalendar.HeaderCell` | `Range_calendar.Header_cell` | Weekday label cell |
| `RangeCalendar.Cell` | `Range_calendar.Cell` | A day, its children drawn of its state |
| `RangeCalendar.CellIndicator` | `Range_calendar.Cell_indicator` | A dot marking a day |
| `RangeCalendar.YearPickerTrigger` | `Range_calendar.Year_picker_trigger` | Opens and closes the year picker |
| `RangeCalendar.YearPickerTriggerHeading` | `Range_calendar.Year_picker_trigger_heading` | The month shown, in the trigger |
| `RangeCalendar.YearPickerTriggerIndicator` | `Range_calendar.Year_picker_trigger_indicator` | The trigger's chevron |
| `RangeCalendar.YearPickerGrid` | `Range_calendar.Year_picker_grid` | The years; `format` and `visible_years` |
| `RangeCalendar.YearPickerGridBody` | `Range_calendar.Year_picker_grid_body` | The years' cells, or a function of each year |
| `RangeCalendar.YearPickerCell` | `Range_calendar.Year_picker_cell` | A year |

### Range_calendar.Cell's state

| React | solidtype | Type | Description |
|---|---|---|---|
| `formattedDate` | `formatted_date` | `string S.accessor` | Its day of the month |
| `isSelected` | `is_selected` | `bool S.accessor` | Whether the date is in the range shown |
| `isSelectionStart` | `is_selection_start` | `bool S.accessor` | Whether the date starts the range shown |
| `isSelectionEnd` | `is_selection_end` | `bool S.accessor` | Whether the date ends the range shown |
| `isUnavailable` | `is_unavailable` | `bool S.accessor` | Whether the date is unavailable |
| `isDisabled` | `is_disabled` | `bool S.accessor` | Whether the cell is disabled |
| `isOutsideMonth` | `is_outside_month` | `bool S.accessor` | Whether the date belongs to another month |
