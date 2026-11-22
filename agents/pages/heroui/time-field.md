# TimeField

Time input field with labels, descriptions, and validation.

Its value is a `Time` of `solidtype-internationalized-date`, made by
`Time.make ~hour:14 ~minute:30 ()` or `parse_time "14:30"`; a time on a date
is `Time_field.Date_time`'s, and a time in a zone `Time_field.Zoned`'s.

Its clock is `en-GB`'s, 24 hours, whatever the browser reads, unless an
`I18n.I18nProvider` names another locale: `<I18n.I18nProvider locale="en-US">`
gives a 12-hour clock. React's follows the browser.

Original HeroUI documentation: [TimeField](https://heroui.com/en/docs/react/components/time-field).

## Usage

```ocaml title="time_field_usage.mlx"
module S = Solidtype.Solid
module Label = Solidtype_heroui.Label
module Time_field = Solidtype_heroui.Time_field

let make () =
  <Time_field class_="w-[256px]" name="time">
    <Label>"Time"</Label>
    <Time_field.Group>
      <Time_field.Input>
        (fun segment -> <Time_field.Segment segment=(S.get segment) />)
      </Time_field.Input>
    </Time_field.Group>
  </Time_field>
```

## Parity

The same HeroUI TimeField twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of the two fields: a
marked row is one they disagree on.

The marked rows are Kobalte's: its field is a `group` named by its label and described by its value as a whole, where React Aria names each segment.

## Anatomy

```ocaml
<Time_field>
  <Label />
  <Time_field.Group>
    <Time_field.Input>
      (fun segment -> <Time_field.Segment segment=(S.get segment) />)
    </Time_field.Input>
  </Time_field.Group>
  <Description />
  <Field_error />
</Time_field>
```

`Time_field` combines label, time input, description, and error into a single
accessible component.

## Examples

### With Icons

Add prefix or suffix icons to enhance the time field.

```ocaml title="time_field_prefix_icon.mlx"
module S = Solidtype.Solid
module Label = Solidtype_heroui.Label
module Time_field = Solidtype_heroui.Time_field
module Gravity = Solidtype_gravity_icons

let make () =
  <Time_field class_="w-[256px]" name="time">
    <Label>"Time"</Label>
    <Time_field.Group>
      <Time_field.Prefix>
        <Gravity.Clock class_="size-4 text-muted" />
      </Time_field.Prefix>
      <Time_field.Input>
        (fun segment -> <Time_field.Segment segment=(S.get segment) />)
      </Time_field.Input>
    </Time_field.Group>
  </Time_field>
```

```ocaml title="time_field_suffix_icon.mlx"
module S = Solidtype.Solid
module Label = Solidtype_heroui.Label
module Time_field = Solidtype_heroui.Time_field
module Gravity = Solidtype_gravity_icons

let make () =
  <Time_field class_="w-[256px]" name="time">
    <Label>"Time"</Label>
    <Time_field.Group>
      <Time_field.Input>
        (fun segment -> <Time_field.Segment segment=(S.get segment) />)
      </Time_field.Input>
      <Time_field.Suffix>
        <Gravity.Clock class_="size-4 text-muted" />
      </Time_field.Suffix>
    </Time_field.Group>
  </Time_field>
```

```ocaml title="time_field_prefix_suffix.mlx"
module S = Solidtype.Solid
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Time_field = Solidtype_heroui.Time_field
module Gravity = Solidtype_gravity_icons

let make () =
  <Time_field class_="w-[256px]" name="time">
    <Label>"Time"</Label>
    <Time_field.Group>
      <Time_field.Prefix>
        <Gravity.Clock class_="size-4 text-muted" />
      </Time_field.Prefix>
      <Time_field.Input>
        (fun segment -> <Time_field.Segment segment=(S.get segment) />)
      </Time_field.Input>
      <Time_field.Suffix>
        <Gravity.Chevron_down class_="size-4 text-muted" />
      </Time_field.Suffix>
    </Time_field.Group>
    <Description>"Enter a time"</Description>
  </Time_field>
```

### On Surface

When used inside a [Surface](surface.md) component, use
`` variant=`secondary `` on `Time_field.Group` to apply the lower emphasis
variant suitable for surface backgrounds.

```ocaml title="time_field_surface.mlx"
module S = Solidtype.Solid
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Surface = Solidtype_heroui.Surface
module Time_field = Solidtype_heroui.Time_field
module Gravity = Solidtype_gravity_icons

let make () =
  <Surface class_="flex w-full max-w-sm flex-col gap-4 rounded-3xl p-6">
    <Time_field class_="w-full" name="time">
      <Label>"Time"</Label>
      <Time_field.Group variant=`secondary>
        <Time_field.Input>
          (fun segment -> <Time_field.Segment segment=(S.get segment) />)
        </Time_field.Input>
      </Time_field.Group>
      <Description>"Enter a time"</Description>
    </Time_field>
    <Time_field class_="w-full" name="time-2">
      <Label>"Appointment time"</Label>
      <Time_field.Group variant=`secondary>
        <Time_field.Prefix>
          <Gravity.Clock class_="size-4 text-muted" />
        </Time_field.Prefix>
        <Time_field.Input>
          (fun segment -> <Time_field.Segment segment=(S.get segment) />)
        </Time_field.Input>
      </Time_field.Group>
      <Description>"Enter a time for your appointment"</Description>
    </Time_field>
  </Surface>
```

### With Description

```ocaml title="time_field_description.mlx"
module S = Solidtype.Solid
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Time_field = Solidtype_heroui.Time_field

let make () =
  <div class_="flex flex-col gap-4">
    <Time_field class_="w-[256px]" name="time">
      <Label>"Start time"</Label>
      <Time_field.Group>
        <Time_field.Input>
          (fun segment -> <Time_field.Segment segment=(S.get segment) />)
        </Time_field.Input>
      </Time_field.Group>
      <Description>"Enter the start time"</Description>
    </Time_field>
    <Time_field class_="w-[256px]" name="end-time">
      <Label>"End time"</Label>
      <Time_field.Group>
        <Time_field.Input>
          (fun segment -> <Time_field.Segment segment=(S.get segment) />)
        </Time_field.Input>
      </Time_field.Group>
      <Description>"Enter the end time"</Description>
    </Time_field>
  </div>
```

### Required Field

```ocaml title="time_field_required.mlx"
module S = Solidtype.Solid
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Time_field = Solidtype_heroui.Time_field

let make () =
  <div class_="flex flex-col gap-4">
    <Time_field is_required=true class_="w-[256px]" name="time">
      <Label>"Time"</Label>
      <Time_field.Group>
        <Time_field.Input>
          (fun segment -> <Time_field.Segment segment=(S.get segment) />)
        </Time_field.Input>
      </Time_field.Group>
    </Time_field>
    <Time_field is_required=true class_="w-[256px]" name="appointment-time">
      <Label>"Appointment time"</Label>
      <Time_field.Group>
        <Time_field.Input>
          (fun segment -> <Time_field.Segment segment=(S.get segment) />)
        </Time_field.Input>
      </Time_field.Group>
      <Description>"Required field"</Description>
    </Time_field>
  </div>
```

### Disabled State

```ocaml title="time_field_disabled.mlx"
module S = Solidtype.Solid
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Time_field = Solidtype_heroui.Time_field
module D = Solidtype_internationalized_date
module Time = D.Types.Time

(* The time now, in the reader's time zone. *)
let now () =
  let current = D.now (D.get_local_time_zone ()) in
  Time.make
    ~hour:(D.Types.ZonedDateTime.hour current)
    ~minute:(D.Types.ZonedDateTime.minute current)
    ~second:(D.Types.ZonedDateTime.second current)
    ()

let make () =
  let time_value = now () in
  <div class_="flex flex-col gap-4">
    <Time_field
      is_disabled=true
      class_="w-[256px]"
      name="time"
      value=(Js.Nullable.return time_value)>
      <Label>"Time"</Label>
      <Time_field.Group>
        <Time_field.Input>
          (fun segment -> <Time_field.Segment segment=(S.get segment) />)
        </Time_field.Input>
      </Time_field.Group>
      <Description>"This time field is disabled"</Description>
    </Time_field>
    <Time_field is_disabled=true class_="w-[256px]" name="time-empty">
      <Label>"Time"</Label>
      <Time_field.Group>
        <Time_field.Input>
          (fun segment -> <Time_field.Segment segment=(S.get segment) />)
        </Time_field.Input>
      </Time_field.Group>
      <Description>"This time field is disabled"</Description>
    </Time_field>
  </div>
```

### Full Width

```ocaml title="time_field_full_width.mlx"
module S = Solidtype.Solid
module Label = Solidtype_heroui.Label
module Time_field = Solidtype_heroui.Time_field
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="w-[400px] space-y-4">
    <Time_field full_width=true name="time">
      <Label>"Time"</Label>
      <Time_field.Group full_width=true>
        <Time_field.Input>
          (fun segment -> <Time_field.Segment segment=(S.get segment) />)
        </Time_field.Input>
      </Time_field.Group>
    </Time_field>
    <Time_field full_width=true name="time-icons">
      <Label>"Time"</Label>
      <Time_field.Group full_width=true>
        <Time_field.Prefix>
          <Gravity.Clock class_="size-4 text-muted" />
        </Time_field.Prefix>
        <Time_field.Input>
          (fun segment -> <Time_field.Segment segment=(S.get segment) />)
        </Time_field.Input>
        <Time_field.Suffix>
          <Gravity.Chevron_down class_="size-4 text-muted" />
        </Time_field.Suffix>
      </Time_field.Group>
    </Time_field>
  </div>
```

### Validation

Use `is_invalid` together with `Field_error` to surface validation messages.

```ocaml title="time_field_invalid.mlx"
module S = Solidtype.Solid
module Field_error = Solidtype_heroui.Field_error
module Label = Solidtype_heroui.Label
module Time_field = Solidtype_heroui.Time_field

let make () =
  <div class_="flex flex-col gap-4">
    <Time_field is_invalid=true is_required=true class_="w-[256px]" name="time">
      <Label>"Time"</Label>
      <Time_field.Group>
        <Time_field.Input>
          (fun segment -> <Time_field.Segment segment=(S.get segment) />)
        </Time_field.Input>
      </Time_field.Group>
      <Field_error>"Please enter a valid time"</Field_error>
    </Time_field>
    <Time_field is_invalid=true class_="w-[256px]" name="invalid-time">
      <Label>"Time"</Label>
      <Time_field.Group>
        <Time_field.Input>
          (fun segment -> <Time_field.Segment segment=(S.get segment) />)
        </Time_field.Input>
      </Time_field.Group>
      <Field_error>"Time must be within business hours"</Field_error>
    </Time_field>
  </div>
```

### Controlled

Control the value to synchronize with other components or state management.

```ocaml title="time_field_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Button = Solidtype_heroui.Button
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Time_field = Solidtype_heroui.Time_field
module D = Solidtype_internationalized_date
module Time = D.Types.Time

(* The time now, in the reader's time zone. *)
let now () =
  let current = D.now (D.get_local_time_zone ()) in
  Time.make
    ~hour:(D.Types.ZonedDateTime.hour current)
    ~minute:(D.Types.ZonedDateTime.minute current)
    ~second:(D.Types.ZonedDateTime.second current)
    ()

let make () =
  let value, set_value = S.create_signal None in
  <div class_="flex flex-col gap-4">
    <Time_field
      class_="w-[256px]"
      name="time"
      value=(Js.Nullable.fromOption (S.get value))
      on_change=(S.set set_value)>
      <Label>"Time"</Label>
      <Time_field.Group>
        <Time_field.Input>
          (fun segment -> <Time_field.Segment segment=(S.get segment) />)
        </Time_field.Input>
      </Time_field.Group>
      <Description>
        (Jsx.string
           ("Current value: "
           ^
           match S.get value with
           | Some t -> Time.to_string t ()
           | None -> "(empty)"))
      </Description>
    </Time_field>
    <div class_="flex gap-2">
      <Button
        variant=`tertiary on_click=(fun _ -> S.set set_value (Some (now ())))>
        "Set now"
      </Button>
      <Button variant=`tertiary on_click=(fun _ -> S.set set_value None)>
        "Clear"
      </Button>
    </div>
  </div>
```

### Dates and Zones

`Time_field.Date_time` and `Time_field.Zoned` edit the time of a
`CalendarDateTime` or a `ZonedDateTime`, and give back the same kind, its date
and zone kept. Each requires a `placeholder_value`: the date, and the zone, a
time typed while it is empty is put on. A zoned field shows its zone's name
after the time, and a time its zone's clocks skip becomes the one after it.
The field below is in Kyiv on the day its clocks go forward, at 03:00.

```ocaml title="time_field_zoned.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Time_field = Solidtype_heroui.Time_field
module D = Solidtype_internationalized_date

(* A meeting in Kyiv on 29 March 2026, when its clocks go from 03:00 to 04:00:
   a time typed in that hour is the one after it. *)
let day = D.parse_zoned_date_time "2026-03-29T00:00[Europe/Kyiv]" ()

let make () =
  let value, set_value =
    S.create_signal
      (Some (D.parse_zoned_date_time "2026-03-29T09:30[Europe/Kyiv]" ()))
  in
  <Time_field.Zoned
    class_="w-[256px]"
    name="meeting"
    value=(Js.Nullable.fromOption (S.get value))
    placeholder_value=day
    on_change=(S.set set_value)>
    <Label>"Meeting in Kyiv"</Label>
    <Time_field.Group>
      <Time_field.Input>
        (fun segment -> <Time_field.Segment segment=(S.get segment) />)
      </Time_field.Input>
    </Time_field.Group>
    <Description>
      (Jsx.string
         (match S.get value with
         | Some v -> D.Types.ZonedDateTime.to_string v ()
         | None -> "(empty)"))
    </Description>
  </Time_field.Zoned>
```

### Form Example

Complete form example with validation and submission handling. The button has
no pending state while the time is sent.

```ocaml title="time_field_form.mlx"
module S = Solidtype.Solid
module Show = Solidtype.Show
module Button = Solidtype_heroui.Button
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Form = Solidtype_heroui.Form
module Label = Solidtype_heroui.Label
module Time_field = Solidtype_heroui.Time_field
module D = Solidtype_internationalized_date
module Time = D.Types.Time
module Gravity = Solidtype_gravity_icons

external prevent_default : Dom.event -> unit = "preventDefault" [@@mel.send]

let min_time = D.parse_time "09:00"
let max_time = D.parse_time "17:00"

let make () =
  let value, set_value = S.create_signal None in
  let is_submitting, set_is_submitting = S.create_signal false in
  let is_invalid () =
    match S.get value with
    | Some t -> Time.compare t min_time < 0. || Time.compare t max_time > 0.
    | None -> false
  in
  let handle_submit e =
    prevent_default e;
    match S.get value with
    | Some t when not (is_invalid ()) ->
        S.set set_is_submitting true;
        (* Simulate API call *)
        ignore
          (Js.Global.setTimeout
             ~f:(fun () ->
               Js.log2 "Time submitted:" t;
               S.set set_value None;
               S.set set_is_submitting false)
             1500
            : Js.Global.timeoutId)
    | Some _ | None -> ()
  in
  <Form class_="flex w-[280px] flex-col gap-4" on_submit=handle_submit>
    <Time_field
      is_required=true
      class_="w-full"
      is_invalid=(is_invalid ())
      name="time"
      min_value=min_time
      max_value=max_time
      value=(Js.Nullable.fromOption (S.get value))
      on_change=(S.set set_value)>
      <Label>"Appointment time"</Label>
      <Time_field.Group>
        <Time_field.Prefix>
          <Gravity.Clock class_="size-4 text-muted" />
        </Time_field.Prefix>
        <Time_field.Input>
          (fun segment -> <Time_field.Segment segment=(S.get segment) />)
        </Time_field.Input>
      </Time_field.Group>
      <Show
        when_=(is_invalid ())
        fallback=(<Description>
                    "Enter a time between 9:00 AM and 5:00 PM"
                  </Description>)>
        <Field_error>"Time must be between 9:00 AM and 5:00 PM"</Field_error>
      </Show>
    </Time_field>
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

TimeField supports validation with `min_value`, `max_value`, and the
application's own checks, given as `is_invalid`.

```ocaml title="time_field_with_validation.mlx"
module S = Solidtype.Solid
module Show = Solidtype.Show
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Label = Solidtype_heroui.Label
module Time_field = Solidtype_heroui.Time_field
module D = Solidtype_internationalized_date
module Time = D.Types.Time

let min_time = D.parse_time "09:00"
let max_time = D.parse_time "17:00"

let make () =
  let value, set_value = S.create_signal None in
  let is_invalid () =
    match S.get value with
    | Some t -> Time.compare t min_time < 0. || Time.compare t max_time > 0.
    | None -> false
  in
  <div class_="flex flex-col gap-4">
    <Time_field
      is_required=true
      class_="w-[256px]"
      is_invalid=(is_invalid ())
      name="time"
      min_value=min_time
      max_value=max_time
      value=(Js.Nullable.fromOption (S.get value))
      on_change=(S.set set_value)>
      <Label>"Time"</Label>
      <Time_field.Group>
        <Time_field.Input>
          (fun segment -> <Time_field.Segment segment=(S.get segment) />)
        </Time_field.Input>
      </Time_field.Group>
      <Show
        when_=(is_invalid ())
        fallback=(<Description>
                    "Enter a time between 9:00 AM and 5:00 PM"
                  </Description>)>
        <Field_error>"Time must be between 9:00 AM and 5:00 PM"</Field_error>
      </Show>
    </Time_field>
  </div>
```

### Render Function

`as_` overrides the default DOM element with a function of its props and its
state, as [Composition](composition.md#custom-dom-element)
shows.

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="time_field_tailwind.mlx"
module S = Solidtype.Solid
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Time_field = Solidtype_heroui.Time_field

let make () =
  <Time_field class_="w-full max-w-48 gap-1.5" name="reminder">
    <Label class_="font-medium text-foreground">"Reminder time"</Label>
    <Description>"Daily check-in notification."</Description>
    <Time_field.Group
      class_="rounded-xl border border-border/80 bg-surface px-2 py-1 \
              shadow-sm ring-1 ring-accent/5 focus-within:border-accent/25 \
              focus-within:ring-2 focus-within:ring-accent/15">
      <Time_field.Input>
        (fun segment ->
          <Time_field.Segment class_="text-foreground" segment=(S.get segment)
          />)
      </Time_field.Input>
    </Time_field.Group>
  </Time_field>
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

- `.time-field` - Root container with minimal styling (`flex flex-col gap-1`)
- `.time-field--full-width` - Full width modifier
- `.date-input-group` - Root container styling of `Time_field.Group`
- `.date-input-group--primary`, `.date-input-group--secondary` - Variants
- `.date-input-group__input` - Input wrapper styling
- `.date-input-group__segment` - Individual time segment styling
- `.date-input-group__prefix` - Prefix element styling
- `.date-input-group__suffix` - Suffix element styling

Child components ([Label](label.md),
[Description](description.md),
[FieldError](field-error.md)) have their own CSS classes and
styling. See their respective documentation for customization options.

### Interactive States

TimeField automatically manages these data attributes based on its state:

- **Invalid**: `[data-invalid="true"]` - Automatically hides the description
  slot when invalid
- **Required**: `[data-required="true"]` - Applied when `is_required` is true
- **Disabled**: `[data-disabled="true"]` - Applied when `is_disabled` is true
- **Read-only**: `[data-readonly="true"]` - Applied when `is_read_only` is true

`Time_field.Group`'s states:

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

### TimeField

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `value` | `value` | `Time.t Js.Nullable.t` | | Current value (controlled); null controls it empty |
| `defaultValue` | `default_value` | `Time.t` | | Default value (uncontrolled) |
| `onChange` | `on_change` | `Time.t option -> unit` | | Called once every segment has its part and the time is another, and with `None` once every segment is erased |
| `placeholderValue` | `placeholder_value` | `Time.t` | midnight | Placeholder time an arrow key steps an empty segment from |
| `minValue` | `min_value` | `Time.t` | | The minimum allowed time that a user may select |
| `maxValue` | `max_value` | `Time.t` | | The maximum allowed time that a user may select |
| `granularity` | `granularity` | `` [ `hour \| `minute \| `second ] `` | `` `minute `` | Determines the smallest unit displayed in the time picker |
| `hourCycle` | `hour_cycle` | `` [ `h12 \| `h24 ] `` | the locale's | Whether to display time in 12 or 24 hour format |
| `shouldForceLeadingZeros` | `should_force_leading_zeros` | `bool` | the locale's | Whether to always show leading zeros in the hour field |
| `isRequired` | `is_required` | `bool` | `false` | Whether user input is required before form submission |
| `isInvalid` | `is_invalid` | `bool` | `false` | Whether the value is invalid |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether the input is disabled |
| `isReadOnly` | `is_read_only` | `bool` | `false` | Whether the input can be selected but not changed |
| `name` | `name` | `string` | | Its name in a form, which is sent its value as `@internationalized/date` writes it, `14:30:00` |
| `aria-label` | `aria_label` | `string` | | Accessibility label when no visible label is present |
| `fullWidth` | `full_width` | `bool` | `false` | Whether the time field should take full width of its container |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `onBlur` | `on_blur` | `Dom.focusEvent -> unit` | | Called once focus leaves it for an element outside it |
| `validate`, `validationBehavior` | — | | | A field validates nothing itself: it is invalid as the application says |
| `hideTimeZone` | — | | | A time of day has no zone: `Time_field.Zoned`'s |

### TimeField.Date_time, TimeField.Zoned

A TimeField whose value is a `CalendarDateTime` or a `ZonedDateTime`; it shows
only the time. Each takes TimeField's props, its value of its own kind, and:

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `placeholderValue` | `placeholder_value` | `CalendarDateTime.t`, `ZonedDateTime.t` | required | The date, and the zone, a time typed while it is empty is put on, and what an arrow key steps an empty segment from |
| `minValue`, `maxValue` | `min_value`, `max_value` | `Time.t` | | The earliest and latest time of day, on any date |
| `hideTimeZone` | `hide_time_zone` | `bool` | `false` | Whether to hide the time zone abbreviation |
| `name` | `name` | `string` | | Its name in a form, which is sent its value whole, `2026-03-29T09:30:00+03:00[Europe/Kyiv]`: React's sends the time alone, its date and zone lost |

### TimeField.Group

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `variant` | `variant` | `` [ `primary \| `secondary ] `` | `` `primary `` | Visual variant of the component. `` `primary `` is the default style with shadow. `` `secondary `` is a lower emphasis variant without shadow, suitable for use in surfaces |
| `fullWidth` | `full_width` | `bool` | its field's | Whether it takes its container's width |
| `className` | `class_` | `string` | | Added after HeroUI's classes |

### TimeField.Input, TimeField.Segment, TimeField.Prefix, TimeField.Suffix

Each takes `class_`, added after HeroUI's class; the input, a function of each
segment, rendering it; a segment, the `segment` it is; a prefix and a suffix,
their `children`.
