# DateRangePicker

Composable date range picker built on React Aria DateRangePicker with DateField and RangeCalendar composition parts.

Its value is a `Date_range_picker.range`, `{ start; end_ }`, of
`CalendarDate`s of `solidtype-internationalized-date`, told once both ends
are there, and `None` as one is erased; a range of dates with times is
`Date_range_picker.Date_time`'s, and one in a zone `Date_range_picker.Zoned`'s.
The [RangeCalendar](range-calendar.md) in its popover takes
its range and chooses it.

Its segments are in `en-GB`'s order, day before month, whatever the browser
reads, unless an `I18n.I18nProvider` names another locale. React's follows
the browser. A range whose end is before its start is invalid at once, where
React's shows it so only once a value is committed.

Original HeroUI documentation: [DateRangePicker](https://heroui.com/en/docs/react/components/date-range-picker).

## Usage

```ocaml title="date_range_picker_usage.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Date_field = Solidtype_heroui.Date_field
module Date_range_picker = Solidtype_heroui.Date_range_picker
module Label = Solidtype_heroui.Label
module Range_calendar = Solidtype_heroui.Range_calendar

let make () =
  <Date_range_picker class_="w-80" end_name="endDate" start_name="startDate">
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
    </Date_range_picker.Popover>
  </Date_range_picker>
```

## Parity

The same HeroUI DateRangePicker twice, under the same props: in solidtype on
the left, in React on the right. Below them, every attribute of the two
pickers: a marked row is one they disagree on.

## Anatomy

`Date_range_picker` is composed as HeroUI's is: a `Date_field.Group` of two
`Date_field.Input`s given their `slot`, `"start"` and `"end"`, a
`Date_range_picker.Range_separator` between them, the trigger in its
`Date_field.Suffix`, and a `Range_calendar` in the popover.

```ocaml
<Date_range_picker>
  <Label />
  <Date_field.Group>
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
    <Range_calendar aria_label="Choose trip dates"> ... </Range_calendar>
  </Date_range_picker.Popover>
</Date_range_picker>
```

## Examples

### Disabled

```ocaml title="date_range_picker_disabled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Date_field = Solidtype_heroui.Date_field
module Date_range_picker = Solidtype_heroui.Date_range_picker
module Label = Solidtype_heroui.Label
module Range_calendar = Solidtype_heroui.Range_calendar
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate
module Description = Solidtype_heroui.Description

let days n = D.Types.DateDuration.make ~days:n ()

let from_today n =
  let start = D.today (D.get_local_time_zone ()) in
  { Date_range_picker.start; end_ = Date.add start (days n) }

let make () =
  <Date_range_picker
    is_disabled=true
    class_="w-80"
    end_name="endDate"
    start_name="startDate"
    value=(Js.Nullable.return (from_today 4))>
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
    <Description>"This date range picker is disabled."</Description>
    <Date_range_picker.Popover>
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
    </Date_range_picker.Popover>
  </Date_range_picker>
```

### Controlled

```ocaml title="date_range_picker_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Date_field = Solidtype_heroui.Date_field
module Date_range_picker = Solidtype_heroui.Date_range_picker
module Label = Solidtype_heroui.Label
module Range_calendar = Solidtype_heroui.Range_calendar
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate
module Description = Solidtype_heroui.Description
module Button = Solidtype_heroui.Button

let days n = D.Types.DateDuration.make ~days:n ()

let from_today n =
  let start = D.today (D.get_local_time_zone ()) in
  { Date_range_picker.start; end_ = Date.add start (days n) }

let make () =
  let value, set_value = S.create_signal (Some (from_today 4)) in
  <div class_="flex w-80 flex-col gap-4">
    <Date_range_picker
      end_name="endDate"
      start_name="startDate"
      value=(Js.Nullable.fromOption (S.get value))
      on_change=(S.set set_value)>
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
      </Date_range_picker.Popover>
    </Date_range_picker>
    <Description>
      (Jsx.string "Current value: ")
      ((fun r ->
         Jsx.string
           (match r with
           | Some ({ start; end_ } : Date.t Date_range_picker.range) ->
               Date.to_string start () ^ " -> " ^ Date.to_string end_ ()
           | None -> "(empty)"))
         (S.get value))
    </Description>
    <div class_="flex gap-2">
      <Button
        variant=`tertiary
        on_click=(fun _ -> S.set set_value (Some (from_today 6)))>
        "Set week"
      </Button>
      <Button variant=`tertiary on_click=(fun _ -> S.set set_value None)>
        "Clear"
      </Button>
    </div>
  </div>
```

### Validation

```ocaml title="date_range_picker_validation.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Date_field = Solidtype_heroui.Date_field
module Date_range_picker = Solidtype_heroui.Date_range_picker
module Label = Solidtype_heroui.Label
module Range_calendar = Solidtype_heroui.Range_calendar
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate
module Field_error = Solidtype_heroui.Field_error

let make () =
  let value, set_value = S.create_signal None in
  let current = D.today (D.get_local_time_zone ()) in
  let is_invalid () =
    match S.get value with
    | Some ({ start; end_ } : Date.t Date_range_picker.range) ->
        Date.compare start current < 0. || Date.compare end_ start < 0.
    | None -> false
  in
  <Date_range_picker
    is_required=true
    class_="w-80"
    end_name="endDate"
    start_name="startDate"
    is_invalid=(is_invalid ())
    min_value=current
    value=(Js.Nullable.fromOption (S.get value))
    on_change=(S.set set_value)>
    <Label>"Booking period"</Label>
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
    <Field_error>"Select a valid range starting today or later."</Field_error>
    <Date_range_picker.Popover>
      <Range_calendar aria_label="Booking period">
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
    </Date_range_picker.Popover>
  </Date_range_picker>
```

### Format Options

Control how a range is shown with `granularity`, `hour_cycle`,
`hide_time_zone` and `should_force_leading_zeros`. Its children may be a
function of its state, whose `state.time_range` and `state.set_time` draw a
time field for each end in the popover.

```ocaml title="date_range_picker_format_options.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Range_calendar = Solidtype_heroui.Range_calendar
module Date_field = Solidtype_heroui.Date_field
module Date_range_picker = Solidtype_heroui.Date_range_picker
module Separator = Solidtype_heroui.Separator
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Select = Solidtype_heroui.Select
module Switch = Solidtype_heroui.Switch
module Time_field = Solidtype_heroui.Time_field
module D = Solidtype_internationalized_date

type granularity = [ `day | `hour | `minute | `second ]

let granularities : (string * string * granularity) array =
  [|
    ("day", "Day", `day);
    ("hour", "Hour", `hour);
    ("minute", "Minute", `minute);
    ("second", "Second", `second);
  |]

let hour_cycles = [| ("12", "12-hour", `h12); ("24", "24-hour", `h24) |]

let calendar () =
  <Range_calendar aria_label="Trip dates" class_="w-full">
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

let group () =
  <Date_field.Group>
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

let choice ~label ~options ~value ~on_change =
  <Select
    class_="w-[120px]"
    variant=`secondary
    value=[| value () |]
    on_change=(fun ids -> match ids with [| id |] -> on_change id | _ -> ())>
    <Label>(Jsx.string label)</Label>
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

let switch ~on ~set text =
  <Switch is_selected=(on ()) on_change=set>
    <Switch.Content>
      <Switch.Control><Switch.Thumb /></Switch.Control> (Jsx.string text)
    </Switch.Content>
  </Switch>

(* The range as a short date range, its times left out. *)
let selected (r : D.Types.ZonedDateTime.t Date_range_picker.range option) =
  match r with
  | Some { start; end_ } ->
      Js.String.concat
        ~other:
          (D.Types.DateFormatter.format_range
             (D.Types.DateFormatter.make "en-GB"
                ~options:
                  (D.Types.DateTimeFormatOptions.make ~day:"numeric"
                     ~month:"short" ~year:"numeric" ())
                ())
             (D.Types.ZonedDateTime.to_date start ())
             (D.Types.ZonedDateTime.to_date end_ ()))
        "Selected: "
  | None -> "Selected: No date selected"

let make () =
  let granularity, set_granularity = S.create_signal (`minute : granularity) in
  let hour_cycle, set_hour_cycle = S.create_signal `h12 in
  let hide_time_zone, set_hide_time_zone = S.create_signal false in
  let leading_zeros, set_leading_zeros = S.create_signal false in
  let zone = D.get_local_time_zone () in
  let at time = D.parse_zoned_date_time (time ^ "[" ^ zone ^ "]") () in
  let time_granularity () =
    match S.get granularity with
    | `day -> None
    | (`hour | `minute | `second) as g -> Some g
  in
  let time_field ~label ~name ~value ~set =
    <div class_="flex items-center justify-between">
      <Label>(Jsx.string label)</Label>
      <Time_field.Zoned
        aria_label=label
        ?granularity=(time_granularity ())
        hide_time_zone=(S.get hide_time_zone)
        hour_cycle=(S.get hour_cycle)
        name
        placeholder_value=(at "2026-02-03T08:45:00")
        should_force_leading_zeros=(S.get leading_zeros)
        value=(Js.Nullable.fromOption (value ()))
        on_change=(Option.iter set)>
        <Time_field.Group variant=`secondary>
          <Time_field.Input>
            (fun segment -> <Time_field.Segment segment=(S.get segment) />)
          </Time_field.Input>
        </Time_field.Group>
      </Time_field.Zoned>
    </div>
  in
  <div class_="flex w-full flex-col gap-4">
    (match S.get granularity with
    | `day ->
        <Date_range_picker
          class_="w-max min-w-80"
          default_value={
                          start = D.parse_date "2025-02-03";
                          end_ = D.parse_date "2025-02-10";
                        }
          end_name="endDate"
          should_force_leading_zeros=(S.get leading_zeros)
          start_name="startDate">
          <Label>"Date range"</Label>
          (group ())
          <Date_range_picker.Popover
            class_="flex w-full max-w-63 flex-col gap-3">
            (calendar ())
          </Date_range_picker.Popover>
        </Date_range_picker>
    | `hour | `minute | `second ->
        <Date_range_picker.Zoned
          class_="w-max min-w-80"
          default_value={
                          start = at "2026-02-03T08:45:00";
                          end_ = at "2026-02-10T18:45:00";
                        }
          placeholder_value=(at "2026-02-03T08:45:00")
          end_name="endDate"
          granularity=(S.get granularity)
          hide_time_zone=(S.get hide_time_zone)
          hour_cycle=(S.get hour_cycle)
          should_force_leading_zeros=(S.get leading_zeros)
          start_name="startDate">
          (fun (picker : D.Types.ZonedDateTime.t Date_range_picker.state) ->
            Jsx.fragment
              [|
                <Label>"Date range"</Label>;
                group ();
                <Date_range_picker.Popover
                  class_="flex w-full max-w-63 flex-col gap-3">
                  (calendar ())
                  <div class_="flex flex-col gap-3">
                    (time_field ~label:"Start Time" ~name:"startTime"
                       ~value:(fun () -> fst (S.get picker.state.time_range))
                       ~set:(picker.state.set_time `start))
                    (time_field ~label:"End Time" ~name:"endTime"
                       ~value:(fun () -> snd (S.get picker.state.time_range))
                       ~set:(picker.state.set_time `end_))
                  </div>
                  <span class_="mt-1 text-xs text-muted">
                    (Jsx.string (selected (S.get picker.state.range)))
                  </span>
                </Date_range_picker.Popover>;
              |])
        </Date_range_picker.Zoned>)
    <Separator class_="my-5" />
    <Label class_="text-xs font-medium text-muted">"Format Options"</Label>
    <div class_="flex flex-wrap gap-4">
      <div class_="flex flex-col gap-1">
        (choice ~label:"Granularity"
           ~options:(Array.map (fun (id, name, _) -> (id, name)) granularities)
           ~value:(fun () ->
             match S.get granularity with
             | `day -> "day"
             | `hour -> "hour"
             | `minute -> "minute"
             | `second -> "second")
           ~on_change:(fun id ->
             Array.iter
               (fun (i, _, g) ->
                 if String.equal i id then S.set set_granularity g)
               granularities))
      </div>
      <div class_="flex flex-col gap-1">
        (choice ~label:"Hour cycle"
           ~options:(Array.map (fun (id, name, _) -> (id, name)) hour_cycles)
           ~value:(fun () ->
             match S.get hour_cycle with `h12 -> "12" | `h24 -> "24")
           ~on_change:(fun id ->
             Array.iter
               (fun (i, _, c) ->
                 if String.equal i id then S.set set_hour_cycle c)
               hour_cycles))
      </div>
    </div>
    <div class_="flex min-w-[529px] flex-col gap-2">
      (switch
         ~on:(fun () -> S.get hide_time_zone)
         ~set:(S.set set_hide_time_zone) "Hide timezone")
      (switch
         ~on:(fun () -> S.get leading_zeros)
         ~set:(S.set set_leading_zeros) "Force leading zeros")
    </div>
  </div>
```

### Form Example

```ocaml title="date_range_picker_form.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Date_field = Solidtype_heroui.Date_field
module Date_range_picker = Solidtype_heroui.Date_range_picker
module Label = Solidtype_heroui.Label
module Range_calendar = Solidtype_heroui.Range_calendar
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate
module Description = Solidtype_heroui.Description
module Button = Solidtype_heroui.Button
module Field_error = Solidtype_heroui.Field_error
module Form = Solidtype_heroui.Form

external set_timeout : (unit -> unit) -> int -> unit = "setTimeout"
external prevent_default : Dom.event -> unit = "preventDefault" [@@mel.send]

let make () =
  let value, set_value = S.create_signal None in
  let submitting, set_submitting = S.create_signal false in
  let current = D.today (D.get_local_time_zone ()) in
  let is_invalid () =
    match S.get value with
    | Some ({ start; end_ } : Date.t Date_range_picker.range) ->
        Date.compare start current < 0. || Date.compare end_ start < 0.
    | None -> false
  in
  let submit e =
    prevent_default e;
    if Option.is_some (S.get value) && not (is_invalid ()) then (
      S.set set_submitting true;
      set_timeout
        (fun () ->
          S.set set_value None;
          S.set set_submitting false)
        1200)
  in
  <Form class_="flex w-80 flex-col gap-3" on_submit=submit>
    <Date_range_picker
      is_required=true
      end_name="tripEndDate"
      is_invalid=(is_invalid ())
      min_value=current
      start_name="tripStartDate"
      value=(Js.Nullable.fromOption (S.get value))
      on_change=(S.set set_value)>
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
      (if is_invalid () then
         <Field_error>"Please choose a valid range in the future."</Field_error>
       else
         <Description>"Select your check-in and check-out dates."</Description>)
      <Date_range_picker.Popover>
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
      </Date_range_picker.Popover>
    </Date_range_picker>
    <Button
      class_="w-full"
      is_disabled=(Option.is_none (S.get value) || is_invalid ())
      is_pending=(S.get submitting)
      type_=`submit>
      (Jsx.string (if S.get submitting then "Submitting..." else "Submit"))
    </Button>
  </Form>
```

### Custom Indicator

`Date_range_picker.Trigger_indicator` draws HeroUI's calendar icon unless
given children.

```ocaml title="date_range_picker_custom_indicator.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Date_field = Solidtype_heroui.Date_field
module Date_range_picker = Solidtype_heroui.Date_range_picker
module Label = Solidtype_heroui.Label
module Range_calendar = Solidtype_heroui.Range_calendar
module Description = Solidtype_heroui.Description
module Icons = Solidtype_gravity_icons

let make () =
  <Date_range_picker class_="w-80" end_name="endDate" start_name="startDate">
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
          <Date_range_picker.Trigger_indicator>
            <Icons.Chevron_down class_="size-4" />
          </Date_range_picker.Trigger_indicator>
        </Date_range_picker.Trigger>
      </Date_field.Suffix>
    </Date_field.Group>
    <Description>
      "Replace the default calendar icon by passing custom children."
    </Description>
    <Date_range_picker.Popover>
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
    </Date_range_picker.Popover>
  </Date_range_picker>
```

### Render Function

```ocaml title="date_range_picker_render_function.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Date_field = Solidtype_heroui.Date_field
module Date_range_picker = Solidtype_heroui.Date_range_picker
module Label = Solidtype_heroui.Label
module Range_calendar = Solidtype_heroui.Range_calendar

let make () =
  <Date_range_picker
    class_="w-80"
    end_name="endDate"
    start_name="startDate"
    as_=(fun p _ -> <div data_custom="foo" props=p />)>
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
    </Date_range_picker.Popover>
  </Date_range_picker>
```

### International Calendar

An `I18n.I18nProvider` locale with a calendar extension shows that calendar;
`on_change` gives dates in the calendar of the value given, else the
Gregorian.

```ocaml title="date_range_picker_international.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Date_field = Solidtype_heroui.Date_field
module Date_range_picker = Solidtype_heroui.Date_range_picker
module Label = Solidtype_heroui.Label
module Range_calendar = Solidtype_heroui.Range_calendar
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate
module I18n = Solidtype_kobalte.I18n

let days n = D.Types.DateDuration.make ~days:n ()

let from_today n =
  let start = D.today (D.get_local_time_zone ()) in
  { Date_range_picker.start; end_ = Date.add start (days n) }

let make () =
  <I18n.I18nProvider locale="hi-IN-u-ca-indian">
    <Date_range_picker
      class_="w-80"
      default_value=(from_today 7)
      end_name="endDate"
      start_name="startDate">
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
      </Date_range_picker.Popover>
    </Date_range_picker>
  </I18n.I18nProvider>
```

## Customization

### Tailwind CSS

```ocaml title="date_range_picker_tailwind.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Date_field = Solidtype_heroui.Date_field
module Date_range_picker = Solidtype_heroui.Date_range_picker
module Label = Solidtype_heroui.Label
module Range_calendar = Solidtype_heroui.Range_calendar

let make () =
  <Date_range_picker class_="w-80" end_name="checkout" start_name="checkin">
    <Label>"Stay dates"</Label>
    <Date_field.Group
      full_width=true
      class_="rounded-xl border border-border/80 bg-default shadow-sm"
      variant=`secondary>
      <Date_field.Input slot="start">
        (fun segment -> <Date_field.Segment segment=(S.get segment) />)
      </Date_field.Input>
      <Date_range_picker.Range_separator class_="text-muted" />
      <Date_field.Input slot="end">
        (fun segment -> <Date_field.Segment segment=(S.get segment) />)
      </Date_field.Input>
      <Date_field.Suffix>
        <Date_range_picker.Trigger class_="text-muted">
          <Date_range_picker.Trigger_indicator />
        </Date_range_picker.Trigger>
      </Date_field.Suffix>
    </Date_field.Group>
    <Date_range_picker.Popover class_="border border-border/80 shadow-sm">
      <Range_calendar
        aria_label="Stay dates" class_="rounded-2xl bg-surface p-2">
        <Range_calendar.Header>
          <Range_calendar.Heading class_="font-medium text-foreground" />
          <Range_calendar.Nav_button
            class_="text-muted hover:bg-default" slot=`previous
          />
          <Range_calendar.Nav_button
            class_="text-muted hover:bg-default" slot=`next
          />
        </Range_calendar.Header>
        <Range_calendar.Grid>
          <Range_calendar.Grid_header>
            (fun day ->
              <Range_calendar.Header_cell class_="text-xs text-muted">
                (Jsx.string (S.get day))
              </Range_calendar.Header_cell>)
          </Range_calendar.Grid_header>
          <Range_calendar.Grid_body>
            (fun date -> <Range_calendar.Cell date=(S.get date) />)
          </Range_calendar.Grid_body>
        </Range_calendar.Grid>
      </Range_calendar>
    </Date_range_picker.Popover>
  </Date_range_picker>
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

- `.date-range-picker` - Root wrapper.
- `.date-range-picker__trigger` - Trigger part that opens the popover.
- `.date-range-picker__trigger-indicator` - Default or custom indicator slot.
- `.date-range-picker__range-separator` - Separator between the start and end inputs.
- `.date-range-picker__popover` - Popover content wrapper.

### Interactive States

- **Open**: `[data-pressed="true"]` on the trigger, `[data-open="true"]` on the root.
- **Disabled**: `[data-disabled="true"]` on the trigger.
- **Focus visible**: `[data-focus-visible="true"]` on the trigger.
- **Hover**: `[data-hovered="true"]` on the trigger.

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Date_range_picker

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `value` | `value` | `CalendarDate.t range Js.Nullable.t` | | Controlled selected range; null controls it empty |
| `defaultValue` | `default_value` | `CalendarDate.t range` | | Default selected range in uncontrolled mode |
| `onChange` | `on_change` | `CalendarDate.t range option -> unit` | | Called when the selected range changes |
| `isOpen` | `is_open` | `bool` | | Controlled popover open state |
| `defaultOpen` | `default_open` | `bool` | `false` | Initial popover open state |
| `onOpenChange` | `on_open_change` | `bool -> unit` | | Called when the popover opens or closes |
| `shouldCloseOnSelect` | `should_close_on_select` | `bool` | `true` | Whether choosing a range closes the popover |
| `isDisabled` | `is_disabled` | `bool` | `false` | Disables range selection and the trigger |
| `isInvalid` | `is_invalid` | `bool` | `false` | Marks the field as invalid |
| `minValue` | `min_value` | `CalendarDate.t` | | Minimum selectable date |
| `maxValue` | `max_value` | `CalendarDate.t` | | Maximum selectable date |
| `startName` | `start_name` | `string` | | Name of the start date in form submission |
| `endName` | `end_name` | `string` | | Name of the end date in form submission |
| `children` | children | elements, or `state -> Jsx.element` | | Composed content or a function of its state |
| `render` | `as_` | `Html.Div.props -> state -> Jsx.element` | | Draws the root as another element |

### Composition Parts

| React | solidtype | Description |
|---|---|---|
| `DateRangePicker.Root` | `Date_range_picker` | Root date range picker container and state owner |
| `DateRangePicker.Trigger` | `Date_range_picker.Trigger` | Trigger button, usually inside `Date_field.Suffix` |
| `DateRangePicker.TriggerIndicator` | `Date_range_picker.Trigger_indicator` | Indicator slot with the default calendar icon |
| `DateRangePicker.RangeSeparator` | `Date_range_picker.Range_separator` | Separator between the start and end inputs |
| `DateRangePicker.Popover` | `Date_range_picker.Popover` | Popover wrapper for `Range_calendar` content |
