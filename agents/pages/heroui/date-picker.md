# DatePicker

Composable date picker built on React Aria DatePicker with DateField and Calendar composition parts.

Its value is a `CalendarDate` of `solidtype-internationalized-date`, as a
[DateField](date-field.md)'s is; a date with a time is
`Date_picker.Date_time`'s, and one in a zone `Date_picker.Zoned`'s. The
[Calendar](calendar.md) in its popover takes its date, its
range and its state.

Its segments are in `en-GB`'s order, day before month, whatever the browser
reads, unless an `I18n.I18nProvider` names another locale. React's follows
the browser.

Original HeroUI documentation: [DatePicker](https://heroui.com/en/docs/react/components/date-picker).

## Usage

```ocaml title="date_picker_usage.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Calendar = Solidtype_heroui.Calendar
module Date_field = Solidtype_heroui.Date_field
module Date_picker = Solidtype_heroui.Date_picker
module Label = Solidtype_heroui.Label

let make () =
  <Date_picker class_="w-72" name="date">
    <Label>"Date"</Label>
    <Date_field.Group full_width=true>
      <Date_field.Input>
        (fun segment -> <Date_field.Segment segment=(S.get segment) />)
      </Date_field.Input>
      <Date_field.Suffix>
        <Date_picker.Trigger>
          <Date_picker.Trigger_indicator />
        </Date_picker.Trigger>
      </Date_field.Suffix>
    </Date_field.Group>
    <Date_picker.Popover>
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
    </Date_picker.Popover>
  </Date_picker>
```

## Parity

The same HeroUI DatePicker twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of the two pickers:
a marked row is one they disagree on.

## Anatomy

`Date_picker` is composed as HeroUI's is: a `Date_field.Group` of the field's
input, the trigger in its `Date_field.Suffix`, and a `Calendar` in the
popover.

```ocaml
<Date_picker>
  <Label />
  <Date_field.Group>
    <Date_field.Input>
      (fun segment -> <Date_field.Segment segment=(S.get segment) />)
    </Date_field.Input>
    <Date_field.Suffix>
      <Date_picker.Trigger><Date_picker.Trigger_indicator /></Date_picker.Trigger>
    </Date_field.Suffix>
  </Date_field.Group>
  <Date_picker.Popover>
    <Calendar aria_label="Choose date"> ... </Calendar>
  </Date_picker.Popover>
</Date_picker>
```

## Examples

### Disabled

```ocaml title="date_picker_disabled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Calendar = Solidtype_heroui.Calendar
module Date_field = Solidtype_heroui.Date_field
module Date_picker = Solidtype_heroui.Date_picker
module Label = Solidtype_heroui.Label
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate
module Description = Solidtype_heroui.Description

let make () =
  <Date_picker
    is_disabled=true
    class_="w-72"
    name="date"
    value=(Js.Nullable.return (D.today (D.get_local_time_zone ())))>
    <Label>"Date"</Label>
    <Date_field.Group full_width=true>
      <Date_field.Input>
        (fun segment -> <Date_field.Segment segment=(S.get segment) />)
      </Date_field.Input>
      <Date_field.Suffix>
        <Date_picker.Trigger>
          <Date_picker.Trigger_indicator />
        </Date_picker.Trigger>
      </Date_field.Suffix>
    </Date_field.Group>
    <Description>"This date picker is disabled."</Description>
    <Date_picker.Popover>
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
    </Date_picker.Popover>
  </Date_picker>
```

### Controlled

```ocaml title="date_picker_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Calendar = Solidtype_heroui.Calendar
module Date_field = Solidtype_heroui.Date_field
module Date_picker = Solidtype_heroui.Date_picker
module Label = Solidtype_heroui.Label
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate
module Description = Solidtype_heroui.Description
module Button = Solidtype_heroui.Button

let make () =
  let value, set_value =
    S.create_signal (Some (D.today (D.get_local_time_zone ())))
  in
  <div class_="flex w-72 flex-col gap-4">
    <Date_picker
      name="date"
      value=(Js.Nullable.fromOption (S.get value))
      on_change=(S.set set_value)>
      <Label>"Date"</Label>
      <Date_field.Group full_width=true>
        <Date_field.Input>
          (fun segment -> <Date_field.Segment segment=(S.get segment) />)
        </Date_field.Input>
        <Date_field.Suffix>
          <Date_picker.Trigger>
            <Date_picker.Trigger_indicator />
          </Date_picker.Trigger>
        </Date_field.Suffix>
      </Date_field.Group>
      <Date_picker.Popover>
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
      </Date_picker.Popover>
    </Date_picker>
    <Description>
      (Jsx.string
         ("Current value: "
         ^
         match S.get value with
         | Some d -> Date.to_string d ()
         | None -> "(empty)"))
    </Description>
    <div class_="flex gap-2">
      <Button
        variant=`tertiary
        on_click=(fun _ ->
                     S.set set_value (Some (D.today (D.get_local_time_zone ()))))>
        "Set today"
      </Button>
      <Button variant=`tertiary on_click=(fun _ -> S.set set_value None)>
        "Clear"
      </Button>
    </div>
  </div>
```

### Validation

```ocaml title="date_picker_validation.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Calendar = Solidtype_heroui.Calendar
module Date_field = Solidtype_heroui.Date_field
module Date_picker = Solidtype_heroui.Date_picker
module Label = Solidtype_heroui.Label
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate
module Field_error = Solidtype_heroui.Field_error

let make () =
  let value, set_value = S.create_signal None in
  let current = D.today (D.get_local_time_zone ()) in
  let is_invalid () =
    match S.get value with
    | Some v -> Date.compare v current < 0.
    | None -> false
  in
  <Date_picker
    is_required=true
    class_="w-72"
    is_invalid=(is_invalid ())
    min_value=current
    name="date"
    value=(Js.Nullable.fromOption (S.get value))
    on_change=(S.set set_value)>
    <Label>"Appointment date"</Label>
    <Date_field.Group full_width=true>
      <Date_field.Input>
        (fun segment -> <Date_field.Segment segment=(S.get segment) />)
      </Date_field.Input>
      <Date_field.Suffix>
        <Date_picker.Trigger>
          <Date_picker.Trigger_indicator />
        </Date_picker.Trigger>
      </Date_field.Suffix>
    </Date_field.Group>
    <Field_error>"Date must be today or in the future."</Field_error>
    <Date_picker.Popover>
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
    </Date_picker.Popover>
  </Date_picker>
```

### Format Options

Control how a picker's value is shown with `granularity`, `hour_cycle`,
`hide_time_zone` and `should_force_leading_zeros`. Its children may be a
function of its state, whose `state.time_value` and `state.set_time_value`
draw a `Time_field` in the popover.

```ocaml title="date_picker_format_options.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Calendar = Solidtype_heroui.Calendar
module Date_field = Solidtype_heroui.Date_field
module Date_picker = Solidtype_heroui.Date_picker
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

let group () =
  <Date_field.Group full_width=true>
    <Date_field.Input>
      (fun segment -> <Date_field.Segment segment=(S.get segment) />)
    </Date_field.Input>
    <Date_field.Suffix>
      <Date_picker.Trigger>
        <Date_picker.Trigger_indicator />
      </Date_picker.Trigger>
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

let make () =
  let granularity, set_granularity = S.create_signal (`minute : granularity) in
  let hour_cycle, set_hour_cycle = S.create_signal `h12 in
  let hide_time_zone, set_hide_time_zone = S.create_signal false in
  let leading_zeros, set_leading_zeros = S.create_signal false in
  let zone = D.get_local_time_zone () in
  let at_time () =
    D.parse_zoned_date_time ("2026-02-03T08:45:00[" ^ zone ^ "]") ()
  in
  (* The time field's granularity: the picker's, which has a time. *)
  let time_granularity () =
    match S.get granularity with
    | `day -> None
    | (`hour | `minute | `second) as g -> Some g
  in
  <div class_="flex flex-col gap-4">
    (match S.get granularity with
    | `day ->
        <Date_picker
          class_="w-fit min-w-72"
          default_value=(D.parse_date "2026-02-03")
          should_force_leading_zeros=(S.get leading_zeros)
          name="date">
          <Label>"Date and time"</Label>
          (group ())
          <Date_picker.Popover class_="flex flex-col gap-3">
            (calendar ())
          </Date_picker.Popover>
        </Date_picker>
    | `hour | `minute | `second ->
        <Date_picker.Zoned
          class_="w-fit min-w-72"
          default_value=(at_time ())
          placeholder_value=(at_time ())
          granularity=(S.get granularity)
          hide_time_zone=(S.get hide_time_zone)
          hour_cycle=(S.get hour_cycle)
          should_force_leading_zeros=(S.get leading_zeros)
          name="date">
          (fun (picker : D.Types.ZonedDateTime.t Date_picker.state) ->
            Jsx.fragment
              [|
                <Label>"Date and time"</Label>;
                group ();
                <Date_picker.Popover class_="flex flex-col gap-3">
                  (calendar ())
                  <div class_="flex items-center justify-between">
                    <Label>"Time"</Label>
                    <Time_field.Zoned
                      aria_label="Time"
                      ?granularity=(time_granularity ())
                      hide_time_zone=(S.get hide_time_zone)
                      hour_cycle=(S.get hour_cycle)
                      name="time"
                      placeholder_value=(at_time ())
                      should_force_leading_zeros=(S.get leading_zeros)
                      value=(Js.Nullable.fromOption
                               (S.get picker.state.time_value))
                      on_change=(Option.iter picker.state.set_time_value)>
                      <Time_field.Group variant=`secondary>
                        <Time_field.Input>
                          (fun segment ->
                            <Time_field.Segment segment=(S.get segment) />)
                        </Time_field.Input>
                      </Time_field.Group>
                    </Time_field.Zoned>
                  </div>
                </Date_picker.Popover>;
              |])
        </Date_picker.Zoned>)
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
    <div class_="flex min-w-80 flex-col gap-2">
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

```ocaml title="date_picker_form.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Calendar = Solidtype_heroui.Calendar
module Date_field = Solidtype_heroui.Date_field
module Date_picker = Solidtype_heroui.Date_picker
module Label = Solidtype_heroui.Label
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
    | Some v -> Date.compare v current < 0.
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
  <Form class_="flex w-72 flex-col gap-3" on_submit=submit>
    <Date_picker
      is_required=true
      is_invalid=(is_invalid ())
      min_value=current
      name="appointmentDate"
      value=(Js.Nullable.fromOption (S.get value))
      on_change=(S.set set_value)>
      <Label>"Appointment date"</Label>
      <Date_field.Group full_width=true>
        <Date_field.Input>
          (fun segment -> <Date_field.Segment segment=(S.get segment) />)
        </Date_field.Input>
        <Date_field.Suffix>
          <Date_picker.Trigger>
            <Date_picker.Trigger_indicator />
          </Date_picker.Trigger>
        </Date_field.Suffix>
      </Date_field.Group>
      (if is_invalid () then
         <Field_error>"Date must be today or in the future."</Field_error>
       else <Description>"Choose a valid appointment date."</Description>)
      <Date_picker.Popover>
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
      </Date_picker.Popover>
    </Date_picker>
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

`Date_picker.Trigger_indicator` draws HeroUI's calendar icon unless given
children.

```ocaml title="date_picker_custom_indicator.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Calendar = Solidtype_heroui.Calendar
module Date_field = Solidtype_heroui.Date_field
module Date_picker = Solidtype_heroui.Date_picker
module Label = Solidtype_heroui.Label
module Description = Solidtype_heroui.Description
module Icons = Solidtype_gravity_icons

let make () =
  <Date_picker class_="w-72" name="date">
    <Label>"Date"</Label>
    <Date_field.Group full_width=true>
      <Date_field.Input>
        (fun segment -> <Date_field.Segment segment=(S.get segment) />)
      </Date_field.Input>
      <Date_field.Suffix>
        <Date_picker.Trigger>
          <Date_picker.Trigger_indicator>
            <Icons.Chevron_down class_="size-4" />
          </Date_picker.Trigger_indicator>
        </Date_picker.Trigger>
      </Date_field.Suffix>
    </Date_field.Group>
    <Description>
      "Replace the default calendar icon by passing custom children."
    </Description>
    <Date_picker.Popover>
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
    </Date_picker.Popover>
  </Date_picker>
```

### Render Function

```ocaml title="date_picker_render_function.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Calendar = Solidtype_heroui.Calendar
module Date_field = Solidtype_heroui.Date_field
module Date_picker = Solidtype_heroui.Date_picker
module Label = Solidtype_heroui.Label

let make () =
  <Date_picker
    class_="w-72"
    name="date"
    as_=(fun p _ -> <div props=p data_custom="date-picker" />)>
    <Label as_=(fun p -> <span props=p data_custom="date-picker-label" />)>
      "Date"
    </Label>
    <Date_field.Group
      full_width=true
      as_=(fun p _ -> <div props=p data_custom="date-field-group" />)>
      <Date_field.Input
        as_=(fun p -> <div props=p data_custom="date-field-input" />)>
        (fun segment ->
          <Date_field.Segment
            as_=(fun p -> <span props=p data_custom="date-field-segment" />)
            segment=(S.get segment)
          />)
      </Date_field.Input>
      <Date_field.Suffix>
        <Date_picker.Trigger
          as_=(fun p -> <button props=p data_custom="date-picker-trigger" />)>
          <Date_picker.Trigger_indicator />
        </Date_picker.Trigger>
      </Date_field.Suffix>
    </Date_field.Group>
    <Date_picker.Popover>
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
    </Date_picker.Popover>
  </Date_picker>
```

### International Calendar

An `I18n.I18nProvider` locale with a calendar extension shows that calendar;
`on_change` gives a date in the calendar of the value given, else the
Gregorian.

```ocaml title="date_picker_international.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Calendar = Solidtype_heroui.Calendar
module Date_field = Solidtype_heroui.Date_field
module Date_picker = Solidtype_heroui.Date_picker
module Label = Solidtype_heroui.Label
module D = Solidtype_internationalized_date
module Date = D.Types.CalendarDate
module I18n = Solidtype_kobalte.I18n

let make () =
  <I18n.I18nProvider locale="hi-IN-u-ca-indian">
    <Date_picker
      class_="w-72"
      default_value=(D.today (D.get_local_time_zone ()))
      name="international-date">
      <Label>"Event date"</Label>
      <Date_field.Group full_width=true>
        <Date_field.Input>
          (fun segment -> <Date_field.Segment segment=(S.get segment) />)
        </Date_field.Input>
        <Date_field.Suffix>
          <Date_picker.Trigger>
            <Date_picker.Trigger_indicator />
          </Date_picker.Trigger>
        </Date_field.Suffix>
      </Date_field.Group>
      <Date_picker.Popover>
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
      </Date_picker.Popover>
    </Date_picker>
  </I18n.I18nProvider>
```

## Customization

### Tailwind CSS

```ocaml title="date_picker_tailwind.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Calendar = Solidtype_heroui.Calendar
module Date_field = Solidtype_heroui.Date_field
module Date_picker = Solidtype_heroui.Date_picker
module Label = Solidtype_heroui.Label

let make () =
  <Date_picker class_="w-72" name="event-date">
    <Label>"Event date"</Label>
    <Date_field.Group
      full_width=true
      class_="rounded-xl border border-border/80 bg-default shadow-sm"
      variant=`secondary>
      <Date_field.Input>
        (fun segment -> <Date_field.Segment segment=(S.get segment) />)
      </Date_field.Input>
      <Date_field.Suffix>
        <Date_picker.Trigger class_="text-muted">
          <Date_picker.Trigger_indicator />
        </Date_picker.Trigger>
      </Date_field.Suffix>
    </Date_field.Group>
    <Date_picker.Popover class_="border border-border/80 shadow-sm">
      <Calendar aria_label="Event date" class_="rounded-2xl bg-surface p-2">
        <Calendar.Header>
          <Calendar.Heading class_="font-medium text-foreground" />
          <Calendar.Nav_button
            class_="text-muted hover:bg-default" slot=`previous
          />
          <Calendar.Nav_button class_="text-muted hover:bg-default" slot=`next
          />
        </Calendar.Header>
        <Calendar.Grid>
          <Calendar.Grid_header>
            (fun day ->
              <Calendar.Header_cell class_="text-xs text-muted">
                (Jsx.string (S.get day))
              </Calendar.Header_cell>)
          </Calendar.Grid_header>
          <Calendar.Grid_body>
            (fun date ->
              <Calendar.Cell
                class_="rounded-lg data-[selected=true]:bg-accent \
                        data-[selected=true]:text-accent-foreground"
                date=(S.get date)
              />)
          </Calendar.Grid_body>
        </Calendar.Grid>
      </Calendar>
    </Date_picker.Popover>
  </Date_picker>
```

## Styling Reference

HeroUI follows [BEM](https://bem.info/en/methodology/) naming for reusable
customization.

### CSS Classes

- `.date-picker` - Root wrapper.
- `.date-picker__trigger` - Trigger part that opens the popover.
- `.date-picker__trigger-indicator` - Default or custom indicator slot.
- `.date-picker__popover` - Popover content wrapper.

### Interactive States

- **Open**: `[data-pressed="true"]` on the trigger, `[data-open="true"]` on the root.
- **Disabled**: `[data-disabled="true"]` on the trigger.
- **Focus visible**: `[data-focus-visible="true"]` on the trigger.
- **Hover**: `[data-hovered="true"]` on the trigger.

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Date_picker

It takes every prop a [DateField](date-field.md) takes, and:

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `value` | `value` | `CalendarDate.t Js.Nullable.t` | | Controlled selected date; null controls it empty |
| `defaultValue` | `default_value` | `CalendarDate.t` | | Default selected value in uncontrolled mode |
| `onChange` | `on_change` | `CalendarDate.t option -> unit` | | Called when the selected date changes |
| `isOpen` | `is_open` | `bool` | | Controlled popover open state |
| `defaultOpen` | `default_open` | `bool` | `false` | Initial popover open state |
| `onOpenChange` | `on_open_change` | `bool -> unit` | | Called when the popover opens or closes |
| `shouldCloseOnSelect` | `should_close_on_select` | `bool` | `true` | Whether choosing a day closes the popover |
| `firstDayOfWeek` | `first_day_of_week` | `` [ `sun \| `mon \| ... ] `` | the locale's | The calendar's first day of the week |
| `pageBehavior` | `page_behavior` | `` [ `visible \| `single ] `` | `` `visible `` | How the calendar pages |
| `isDisabled` | `is_disabled` | `bool` | `false` | Disables date selection and the trigger |
| `isInvalid` | `is_invalid` | `bool` | `false` | Marks the field as invalid |
| `minValue` | `min_value` | `CalendarDate.t` | | Minimum selectable date |
| `maxValue` | `max_value` | `CalendarDate.t` | | Maximum selectable date |
| `name` | `name` | `string` | | Name used for form submission |
| `children` | children | elements, or `state -> Jsx.element` | | Composed content or a function of its state |
| `render` | `as_` | `Html.Div.props -> state -> Jsx.element` | | Draws the root as another element |

### Composition Parts

| React | solidtype | Description |
|---|---|---|
| `DatePicker.Root` | `Date_picker` | Root date picker container and state owner |
| `DatePicker.Trigger` | `Date_picker.Trigger` | Trigger button, usually inside `Date_field.Suffix` |
| `DatePicker.TriggerIndicator` | `Date_picker.Trigger_indicator` | Indicator slot with the default calendar icon |
| `DatePicker.Popover` | `Date_picker.Popover` | Popover wrapper for `Calendar` content; `placement` and `offset` |
