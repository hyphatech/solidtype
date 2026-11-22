# DateField

Date input field with labels, descriptions, and validation.

Its value is a `CalendarDate` of `solidtype-internationalized-date`, made by
`CalendarDate.make 2026 11 21`, `parse_date "2026-11-21"` or `today zone`; a
date with a time is `Date_field.Date_time`'s, and one in a zone
`Date_field.Zoned`'s.

Its segments are day before month, `dd/mm/yyyy`, whatever the browser reads,
unless an `I18n.I18nProvider` names another locale:
`<I18n.I18nProvider locale="en-US">` gives `mm/dd/yyyy`. React's follows the
browser.

Original HeroUI documentation: [DateField](https://heroui.com/en/docs/react/components/date-field).

## Usage

```ocaml title="date_field_usage.mlx"
module S = Solidtype.Solid
module Label = Solidtype_heroui.Label
module Date_field = Solidtype_heroui.Date_field

let make () =
  <Date_field class_="w-[256px]" name="date">
    <Label>"Date"</Label>
    <Date_field.Group>
      <Date_field.Input>
        (fun segment -> <Date_field.Segment segment=(S.get segment) />)
      </Date_field.Input>
    </Date_field.Group>
  </Date_field>
```

## Parity

The same HeroUI DateField twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of the two fields: a
marked row is one they disagree on.

## Anatomy

```ocaml
<Date_field>
  <Label />
  <Date_field.Group>
    <Date_field.Input>
      (fun segment -> <Date_field.Segment segment=(S.get segment) />)
    </Date_field.Input>
  </Date_field.Group>
  <Description />
  <Field_error />
</Date_field>
```

`Date_field` combines label, date input, description, and error into a single
accessible component.

## Examples

### With Icons

Add prefix or suffix icons to enhance the date field.

```ocaml title="date_field_prefix_icon.mlx"
module S = Solidtype.Solid
module Label = Solidtype_heroui.Label
module Date_field = Solidtype_heroui.Date_field
module Gravity = Solidtype_gravity_icons

let make () =
  <Date_field class_="w-[256px]" name="date">
    <Label>"Date"</Label>
    <Date_field.Group>
      <Date_field.Prefix>
        <Gravity.Calendar class_="size-4 text-muted" />
      </Date_field.Prefix>
      <Date_field.Input>
        (fun segment -> <Date_field.Segment segment=(S.get segment) />)
      </Date_field.Input>
    </Date_field.Group>
  </Date_field>
```

```ocaml title="date_field_suffix_icon.mlx"
module S = Solidtype.Solid
module Label = Solidtype_heroui.Label
module Date_field = Solidtype_heroui.Date_field
module Gravity = Solidtype_gravity_icons

let make () =
  <Date_field class_="w-[256px]" name="date">
    <Label>"Date"</Label>
    <Date_field.Group>
      <Date_field.Input>
        (fun segment -> <Date_field.Segment segment=(S.get segment) />)
      </Date_field.Input>
      <Date_field.Suffix>
        <Gravity.Calendar class_="size-4 text-muted" />
      </Date_field.Suffix>
    </Date_field.Group>
  </Date_field>
```

```ocaml title="date_field_prefix_suffix.mlx"
module S = Solidtype.Solid
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Date_field = Solidtype_heroui.Date_field
module Gravity = Solidtype_gravity_icons

let make () =
  <Date_field class_="w-[256px]" name="date">
    <Label>"Date"</Label>
    <Date_field.Group>
      <Date_field.Prefix>
        <Gravity.Calendar class_="size-4 text-muted" />
      </Date_field.Prefix>
      <Date_field.Input>
        (fun segment -> <Date_field.Segment segment=(S.get segment) />)
      </Date_field.Input>
      <Date_field.Suffix>
        <Gravity.Chevron_down class_="size-4 text-muted" />
      </Date_field.Suffix>
    </Date_field.Group>
    <Description>"Enter a date"</Description>
  </Date_field>
```

### Variants

`Date_field.Group` takes two variants: `` `primary ``, the default, with a
shadow, and `` `secondary ``, a lower emphasis without one, for a surface.

```ocaml title="date_field_variants.mlx"
module S = Solidtype.Solid
module Label = Solidtype_heroui.Label
module Date_field = Solidtype_heroui.Date_field

let make () =
  <div class_="flex flex-col gap-4">
    <Date_field class_="w-[256px]" name="primary-date">
      <Label>"Primary variant"</Label>
      <Date_field.Group variant=`primary>
        <Date_field.Input>
          (fun segment -> <Date_field.Segment segment=(S.get segment) />)
        </Date_field.Input>
      </Date_field.Group>
    </Date_field>
    <Date_field class_="w-[256px]" name="secondary-date">
      <Label>"Secondary variant"</Label>
      <Date_field.Group variant=`secondary>
        <Date_field.Input>
          (fun segment -> <Date_field.Segment segment=(S.get segment) />)
        </Date_field.Input>
      </Date_field.Group>
    </Date_field>
  </div>
```

### In Surface

When used inside a [Surface](surface.md) component, use
`` variant=`secondary `` on `Date_field.Group` to apply the lower emphasis
variant suitable for surface backgrounds.

```ocaml title="date_field_surface.mlx"
module S = Solidtype.Solid
module Description = Solidtype_heroui.Description
module Surface = Solidtype_heroui.Surface
module Label = Solidtype_heroui.Label
module Date_field = Solidtype_heroui.Date_field
module Gravity = Solidtype_gravity_icons

let make () =
  <Surface class_="flex w-full max-w-sm flex-col gap-4 rounded-3xl p-6">
    <Date_field class_="w-full" name="date">
      <Label>"Date"</Label>
      <Date_field.Group variant=`secondary>
        <Date_field.Input>
          (fun segment -> <Date_field.Segment segment=(S.get segment) />)
        </Date_field.Input>
      </Date_field.Group>
      <Description>"Enter a date"</Description>
    </Date_field>
    <Date_field class_="w-full" name="date-2">
      <Label>"Appointment date"</Label>
      <Date_field.Group variant=`secondary>
        <Date_field.Prefix>
          <Gravity.Calendar class_="size-4 text-muted" />
        </Date_field.Prefix>
        <Date_field.Input>
          (fun segment -> <Date_field.Segment segment=(S.get segment) />)
        </Date_field.Input>
      </Date_field.Group>
      <Description>"Enter a date for your appointment"</Description>
    </Date_field>
  </Surface>
```

### With Description

```ocaml title="date_field_description.mlx"
module S = Solidtype.Solid
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Date_field = Solidtype_heroui.Date_field

let make () =
  <div class_="flex flex-col gap-4">
    <Date_field class_="w-[256px]" name="date">
      <Label>"Birth date"</Label>
      <Date_field.Group>
        <Date_field.Input>
          (fun segment -> <Date_field.Segment segment=(S.get segment) />)
        </Date_field.Input>
      </Date_field.Group>
      <Description>"Enter your date of birth"</Description>
    </Date_field>
    <Date_field class_="w-[256px]" name="appointment-date">
      <Label>"Appointment date"</Label>
      <Date_field.Group>
        <Date_field.Input>
          (fun segment -> <Date_field.Segment segment=(S.get segment) />)
        </Date_field.Input>
      </Date_field.Group>
      <Description>"Enter a date for your appointment"</Description>
    </Date_field>
  </div>
```

### Required Field

```ocaml title="date_field_required.mlx"
module S = Solidtype.Solid
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Date_field = Solidtype_heroui.Date_field

let make () =
  <div class_="flex flex-col gap-4">
    <Date_field is_required=true class_="w-[256px]" name="date">
      <Label>"Date"</Label>
      <Date_field.Group>
        <Date_field.Input>
          (fun segment -> <Date_field.Segment segment=(S.get segment) />)
        </Date_field.Input>
      </Date_field.Group>
    </Date_field>
    <Date_field is_required=true class_="w-[256px]" name="start-date">
      <Label>"Start date"</Label>
      <Date_field.Group>
        <Date_field.Input>
          (fun segment -> <Date_field.Segment segment=(S.get segment) />)
        </Date_field.Input>
      </Date_field.Group>
      <Description>"Required field"</Description>
    </Date_field>
  </div>
```

### Disabled State

```ocaml title="date_field_disabled.mlx"
module S = Solidtype.Solid
module Description = Solidtype_heroui.Description
module D = Solidtype_internationalized_date
module Label = Solidtype_heroui.Label
module Date_field = Solidtype_heroui.Date_field

let make () =
  <div class_="flex flex-col gap-4">
    <Date_field
      is_disabled=true
      class_="w-[256px]"
      name="date"
      value=(Js.Null.return (D.today (D.get_local_time_zone ())))>
      <Label>"Date"</Label>
      <Date_field.Group>
        <Date_field.Input>
          (fun segment -> <Date_field.Segment segment=(S.get segment) />)
        </Date_field.Input>
      </Date_field.Group>
      <Description>"This date field is disabled"</Description>
    </Date_field>
    <Date_field is_disabled=true class_="w-[256px]" name="date-empty">
      <Label>"Date"</Label>
      <Date_field.Group>
        <Date_field.Input>
          (fun segment -> <Date_field.Segment segment=(S.get segment) />)
        </Date_field.Input>
      </Date_field.Group>
      <Description>"This date field is disabled"</Description>
    </Date_field>
  </div>
```

### Full Width

```ocaml title="date_field_full_width.mlx"
module S = Solidtype.Solid
module Label = Solidtype_heroui.Label
module Date_field = Solidtype_heroui.Date_field
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="w-[400px] space-y-4">
    <Date_field full_width=true name="date">
      <Label>"Date"</Label>
      <Date_field.Group>
        <Date_field.Input>
          (fun segment -> <Date_field.Segment segment=(S.get segment) />)
        </Date_field.Input>
      </Date_field.Group>
    </Date_field>
    <Date_field full_width=true name="date-icons">
      <Label>"Date"</Label>
      <Date_field.Group>
        <Date_field.Prefix>
          <Gravity.Calendar class_="size-4 text-muted" />
        </Date_field.Prefix>
        <Date_field.Input>
          (fun segment -> <Date_field.Segment segment=(S.get segment) />)
        </Date_field.Input>
        <Date_field.Suffix>
          <Gravity.Chevron_down class_="size-4 text-muted" />
        </Date_field.Suffix>
      </Date_field.Group>
    </Date_field>
  </div>
```

### Validation

Use `is_invalid` together with `Field_error` to surface validation messages.

```ocaml title="date_field_invalid.mlx"
module S = Solidtype.Solid
module Field_error = Solidtype_heroui.Field_error
module Label = Solidtype_heroui.Label
module Date_field = Solidtype_heroui.Date_field

let make () =
  <div class_="flex flex-col gap-4">
    <Date_field is_invalid=true is_required=true class_="w-[256px]" name="date">
      <Label>"Date"</Label>
      <Date_field.Group>
        <Date_field.Input>
          (fun segment -> <Date_field.Segment segment=(S.get segment) />)
        </Date_field.Input>
      </Date_field.Group>
      <Field_error>"Please enter a valid date"</Field_error>
    </Date_field>
    <Date_field is_invalid=true class_="w-[256px]" name="invalid-date">
      <Label>"Date"</Label>
      <Date_field.Group>
        <Date_field.Input>
          (fun segment -> <Date_field.Segment segment=(S.get segment) />)
        </Date_field.Input>
      </Date_field.Group>
      <Field_error>"Date must be in the future"</Field_error>
    </Date_field>
  </div>
```

### Granularity

`granularity` is the smallest unit a field with a time shows, `` `minute `` by
default; `` `day `` shows the date alone.

```ocaml title="date_field_granularity.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Label = Solidtype_heroui.Label
module List_box = Solidtype_heroui.List_box
module Select = Solidtype_heroui.Select
module Tooltip = Solidtype_heroui.Tooltip
module Date_field = Solidtype_heroui.Date_field
module D = Solidtype_internationalized_date
module Gravity = Solidtype_gravity_icons

let granularities =
  [|
    (`day, "day", "Day");
    (`hour, "hour", "Hour");
    (`minute, "minute", "Minute");
    (`second, "second", "Second");
  |]

let make () =
  let granularity, set_granularity = S.create_signal `day in
  let id () =
    match S.get granularity with
    | `day -> "day"
    | `hour -> "hour"
    | `minute -> "minute"
    | `second -> "second"
  in
  <div class_="flex gap-4">
    <Date_field.Zoned
      class_="w-[256px]"
      default_value=(D.parse_zoned_date_time
                       "2025-02-03T08:45:00[America/Los_Angeles]" ())
      placeholder_value=(D.parse_zoned_date_time
                           "2025-02-03T00:00:00[America/Los_Angeles]" ())
      granularity=(S.get granularity)
      name="granularity-date">
      <Label>"Appointment Date"</Label>
      <Date_field.Group>
        <Date_field.Input>
          (fun segment -> <Date_field.Segment segment=(S.get segment) />)
        </Date_field.Input>
      </Date_field.Group>
    </Date_field.Zoned>
    <div class_="flex flex-col gap-1">
      <div class_="flex items-center gap-2">
        <Label>"Granularity"</Label>
        <Tooltip delay_ms=0.>
          <Tooltip.Trigger aria_label="Granularity information">
            <Gravity.Circle_question class_="size-4 text-muted" />
          </Tooltip.Trigger>
          <Tooltip.Content placement=`bottom>
            <p>
              "Determines the smallest unit displayed in the date picker. By \
               default, this is \"day\" for dates, and \"minute\" for times."
            </p>
          </Tooltip.Content>
        </Tooltip>
      </div>
      <Select
        class_="w-[110px]"
        placeholder="Select granularity"
        value=[| id () |]
        variant=`secondary
        on_change=(fun ids ->
                    match
                      Array.find_opt
                        (fun (_, id, _) -> Array.exists (String.equal id) ids)
                        granularities
                    with
                    | Some (g, _, _) -> S.set set_granularity g
                    | None -> ())>
        <Select.Trigger><Select.Value /> <Select.Indicator /></Select.Trigger>
        <Select.Popover>
          <List_box>
            <Solidtype.For each=granularities>
              (fun (_, id, label) _ ->
                <List_box.Item id text_value=label>
                  (Jsx.string label) <List_box.Item_indicator />
                </List_box.Item>)
            </Solidtype.For>
          </List_box>
        </Select.Popover>
      </Select>
    </div>
  </div>
```

### Controlled

Control the value to synchronize with other components or state management.

```ocaml title="date_field_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Button = Solidtype_heroui.Button
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Date_field = Solidtype_heroui.Date_field
module D = Solidtype_internationalized_date

let make () =
  let value, set_value = S.create_signal None in
  <div class_="flex flex-col gap-4">
    <Date_field
      class_="w-[256px]"
      name="date"
      value=(Js.Null.fromOption (S.get value))
      on_change=(S.set set_value)>
      <Label>"Date"</Label>
      <Date_field.Group>
        <Date_field.Input>
          (fun segment -> <Date_field.Segment segment=(S.get segment) />)
        </Date_field.Input>
      </Date_field.Group>
      <Description>
        (Jsx.string
           ("Current value: "
           ^
           match S.get value with
           | Some d -> D.Types.CalendarDate.to_string d ()
           | None -> "(empty)"))
      </Description>
    </Date_field>
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

### Times and Zones

`Date_field.Date_time` and `Date_field.Zoned` edit a `CalendarDateTime` or a
`ZonedDateTime`, and give back the same kind. A zoned field needs a
`placeholder_value`, the zone a date typed while it is empty is in; it shows
the zone's name after the time, and its hour steps through an hour its clocks
repeat. The second field below is in Kyiv on the night its clocks go back.

```ocaml title="date_field_zoned.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Date_field = Solidtype_heroui.Date_field
module D = Solidtype_internationalized_date

let kyiv at = D.parse_zoned_date_time (at ^ "[Europe/Kyiv]") ()

let make () =
  let meeting, set_meeting = S.create_signal (Some (kyiv "2026-10-25T02:30")) in
  <div class_="flex flex-col gap-4">
    <Date_field.Date_time
      class_="w-[256px]"
      name="reminder"
      default_value=(D.parse_date_time "2026-11-21T09:30")>
      <Label>"Reminder"</Label>
      <Date_field.Group>
        <Date_field.Input>
          (fun segment -> <Date_field.Segment segment=(S.get segment) />)
        </Date_field.Input>
      </Date_field.Group>
    </Date_field.Date_time>
    <Date_field.Zoned
      class_="w-[320px]"
      name="meeting"
      value=(Js.Null.fromOption (S.get meeting))
      on_change=(S.set set_meeting)
      placeholder_value=(kyiv "2026-10-25T00:00")
      hour_cycle=`h24>
      <Label>"Meeting in Kyiv"</Label>
      <Date_field.Group>
        <Date_field.Input>
          (fun segment -> <Date_field.Segment segment=(S.get segment) />)
        </Date_field.Input>
      </Date_field.Group>
      <Description>
        (Jsx.string
           (match S.get meeting with
           | Some m -> D.Types.ZonedDateTime.to_string m ()
           | None -> "(empty)"))
      </Description>
    </Date_field.Zoned>
  </div>
```

### Form Example

Complete form example with validation and submission handling. The button has
no pending state while the date is sent.

```ocaml title="date_field_form.mlx"
module S = Solidtype.Solid
module Show = Solidtype.Show
module Button = Solidtype_heroui.Button
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Form = Solidtype_heroui.Form
module Label = Solidtype_heroui.Label
module Date_field = Solidtype_heroui.Date_field
module D = Solidtype_internationalized_date
module Gravity = Solidtype_gravity_icons

external prevent_default : Dom.event -> unit = "preventDefault" [@@mel.send]

let make () =
  let value, set_value = S.create_signal None in
  let is_submitting, set_is_submitting = S.create_signal false in
  let today = D.today (D.get_local_time_zone ()) in
  let is_invalid () =
    match S.get value with
    | Some d -> D.Types.CalendarDate.compare d today < 0.
    | None -> false
  in
  let handle_submit e =
    prevent_default e;
    match S.get value with
    | Some d when not (is_invalid ()) ->
        S.set set_is_submitting true;
        (* Simulate API call *)
        ignore
          (Js.Global.setTimeout
             ~f:(fun () ->
               Js.log2 "Date submitted:" d;
               S.set set_value None;
               S.set set_is_submitting false)
             1500
            : Js.Global.timeoutId)
    | Some _ | None -> ()
  in
  <Form class_="flex w-[280px] flex-col gap-4" on_submit=handle_submit>
    <Date_field
      is_required=true
      class_="w-full"
      is_invalid=(is_invalid ())
      min_value=today
      name="date"
      value=(Js.Null.fromOption (S.get value))
      on_change=(S.set set_value)>
      <Label>"Appointment date"</Label>
      <Date_field.Group>
        <Date_field.Prefix>
          <Gravity.Calendar class_="size-4 text-muted" />
        </Date_field.Prefix>
        <Date_field.Input>
          (fun segment -> <Date_field.Segment segment=(S.get segment) />)
        </Date_field.Input>
      </Date_field.Group>
      <Show
        when_=(is_invalid ())
        fallback=(<Description>"Enter a date from today onwards"</Description>)>
        <Field_error>"Date must be today or in the future"</Field_error>
      </Show>
    </Date_field>
    <Button
      class_="w-full"
      is_disabled=(Option.is_none (S.get value) || is_invalid ())
      type_=`submit
      variant=`primary>
      <Show when_=(not (S.get is_submitting))>"Submit"</Show>
      <Show when_=(S.get is_submitting)>"Submitting..."</Show>
    </Button>
  </Form>
```

### With Validation

A field is invalid while its value is before `min_value`, after `max_value` or
a day `is_date_unavailable` refuses, and while the application says so by
`is_invalid`.

```ocaml title="date_field_with_validation.mlx"
module S = Solidtype.Solid
module Show = Solidtype.Show
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Label = Solidtype_heroui.Label
module Date_field = Solidtype_heroui.Date_field
module D = Solidtype_internationalized_date

let make () =
  let value, set_value = S.create_signal None in
  let today = D.today (D.get_local_time_zone ()) in
  let is_invalid () =
    match S.get value with
    | Some d -> D.Types.CalendarDate.compare d today < 0.
    | None -> false
  in
  <div class_="flex flex-col gap-4">
    <Date_field
      is_required=true
      class_="w-[256px]"
      is_invalid=(is_invalid ())
      min_value=today
      name="date"
      value=(Js.Null.fromOption (S.get value))
      on_change=(S.set set_value)>
      <Label>"Date"</Label>
      <Date_field.Group>
        <Date_field.Input>
          (fun segment -> <Date_field.Segment segment=(S.get segment) />)
        </Date_field.Input>
      </Date_field.Group>
      <Show
        when_=(is_invalid ())
        fallback=(<Description>"Enter a date from today onwards"</Description>)>
        <Field_error>"Date must be today or in the future"</Field_error>
      </Show>
    </Date_field>
  </div>
```

### Render Function

`as_` overrides the default DOM element with a function of its props and its
state, as [Composition](composition.md#custom-dom-element)
shows.

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="date_field_tailwind.mlx"
module S = Solidtype.Solid
module Label = Solidtype_heroui.Label
module Date_field = Solidtype_heroui.Date_field

let make () =
  <Date_field class_="w-64" name="due-date">
    <Label>"Due date"</Label>
    <Date_field.Group
      class_="rounded-xl border border-border/80 bg-default shadow-sm"
      variant=`secondary>
      <Date_field.Input>
        (fun segment -> <Date_field.Segment segment=(S.get segment) />)
      </Date_field.Input>
    </Date_field.Group>
  </Date_field>
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

- `.date-field` - Root container with minimal styling (`flex flex-col gap-1`)
- `.date-field--full-width` - Full width modifier
- `.date-input-group` - Root container styling of `Date_field.Group`
- `.date-input-group--primary`, `.date-input-group--secondary` - Variants
- `.date-input-group__input` - Input wrapper styling
- `.date-input-group__input-container` - Scrollable container for grouping
  multiple inputs
- `.date-input-group__segment` - Individual date segment styling
- `.date-input-group__prefix` - Prefix element styling
- `.date-input-group__suffix` - Suffix element styling

Child components ([Label](label.md),
[Description](description.md),
[FieldError](field-error.md)) have their own CSS classes and
styling. See their respective documentation for customization options.

### Interactive States

DateField automatically manages these data attributes based on its state:

- **Invalid**: `[data-invalid="true"]` - Automatically hides the description
  slot when invalid
- **Required**: `[data-required="true"]` - Applied when `is_required` is true
- **Disabled**: `[data-disabled="true"]` - Applied when `is_disabled` is true
- **Read-only**: `[data-readonly="true"]` - Applied when `is_read_only` is true

`Date_field.Group`'s states:

- **Hover**: `[data-hovered="true"]`
- **Focus Within**: `[data-focus-within="true"]`
- **Focus Visible**: `[data-focus-visible="true"]`
- **Invalid**: `[data-invalid="true"]`
- **Disabled**: `[data-disabled="true"]`
- **Segment Focus**: `[data-focused="true"]` on segment elements
- **Segment Placeholder**: `[data-placeholder="true"]` on segment elements
- **Segment Type**: `[data-type="literal"]`, and a zoned field's zone
  `[data-type="timeZoneName"]`

## API Reference

Each prop beside the name HeroUI's React component gives it.

### DateField

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `value` | `value` | `CalendarDate.t Js.Null.t` | | Current value (controlled); null controls it empty |
| `defaultValue` | `default_value` | `CalendarDate.t` | | Default value (uncontrolled) |
| `onChange` | `on_change` | `CalendarDate.t option -> unit` | | Called as soon as its segments make a date other than its value, and with `None` once every segment is erased |
| `placeholderValue` | `placeholder_value` | `CalendarDate.t` | today | What an arrow key steps an empty segment from |
| `minValue` | `min_value` | `CalendarDate.t` | | The earliest date it is valid at |
| `maxValue` | `max_value` | `CalendarDate.t` | | The latest date it is valid at |
| `isDateUnavailable` | `is_date_unavailable` | `CalendarDate.t -> bool` | | A day it is invalid at |
| `shouldForceLeadingZeros` | `should_force_leading_zeros` | `bool` | the locale's | Whether to always show leading zeros in the month, day and hour |
| `isRequired` | `is_required` | `bool` | `false` | Whether user input is required before form submission |
| `isInvalid` | `is_invalid` | `bool` | `false` | Whether the value is invalid |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether the input is disabled |
| `isReadOnly` | `is_read_only` | `bool` | `false` | Whether the input can be selected but not changed |
| `name` | `name` | `string` | | Its name in a form, which is sent its value as `@internationalized/date` writes it, `2026-11-21` |
| `autoFocus` | `auto_focus` | `bool` | `false` | Whether its first segment is focused as it is drawn |
| `aria-label` | `aria_label` | `string` | | Accessibility label when no visible label is present |
| `fullWidth` | `full_width` | `bool` | `false` | Whether the date field should take full width of its container |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `onBlur` | `on_blur` | `Dom.focusEvent -> unit` | | Called once focus leaves it for an element outside it |
| `validate`, `validationBehavior` | — | | | A field validates nothing beyond its range: it is invalid as the application says, and out of its range at once |
| `granularity`, `hourCycle`, `hideTimeZone` | — | | | A date alone has no time: `Date_field.Date_time`'s and `Date_field.Zoned`'s |

### DateField.Date_time, DateField.Zoned

A DateField whose value is a `CalendarDateTime` or a `ZonedDateTime`. Each
takes DateField's props, its value and range of its own kind, and:

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `granularity` | `granularity` | `` [ `day \| `hour \| `minute \| `second ] `` | `` `minute `` | The smallest unit displayed, a time to the minute even while it is empty, where React's empty field with no placeholder shows a date alone |
| `hourCycle` | `hour_cycle` | `` [ `h12 \| `h24 ] `` | the locale's | Whether to display time in 12 or 24 hour format |
| `placeholderValue` | `placeholder_value` | `CalendarDateTime.t`, `ZonedDateTime.t` | today at midnight; required for a zoned field | What a date typed while it is empty is put on, a zoned one's zone too |
| `hideTimeZone` | `hide_time_zone` | `bool` | `false` | Whether a zoned field hides its zone's name |
| `name` | `name` | `string` | | Its name in a form, which is sent its value whole, `2026-11-21T09:30:00+02:00[Europe/Kyiv]` |

### DateField.Group

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `variant` | `variant` | `` [ `primary \| `secondary ] `` | `` `primary `` | Visual variant of the component. `` `primary `` is the default style with shadow. `` `secondary `` is a lower emphasis variant without shadow, suitable for use in surfaces |
| `fullWidth` | `full_width` | `bool` | its field's | Whether it takes its container's width |
| `className` | `class_` | `string` | | Added after HeroUI's classes |

### DateField.Input, DateField.Segment, DateField.InputContainer, DateField.Prefix, DateField.Suffix

Each takes `class_`, added after HeroUI's class; the input, a function of each
segment, rendering it; a segment, the `segment` it is; an input container, a
prefix and a suffix, their `children`.
