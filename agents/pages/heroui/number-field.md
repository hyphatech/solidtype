# NumberField

Number input fields with increment/decrement buttons, validation, and internationalized formatting.

Original HeroUI documentation: [NumberField](https://heroui.com/en/docs/react/components/number-field).

## Usage

HeroUI's examples, with HeroUI's icons from [`solidtype-gravity-icons`](../heroui.md#icons).

```ocaml title="number_field_usage.mlx"
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Number_field = Solidtype_heroui.Number_field

let make () =
  <Number_field
    class_="w-full max-w-64" default_value=1024. min_value=0. name="width">
    <Label>"Width"</Label>
    <Number_field.Group>
      <Number_field.Decrement_button />
      <Number_field.Input class_="w-[120px]" />
      <Number_field.Increment_button />
    </Number_field.Group>
  </Number_field>
```

## Parity

The same HeroUI NumberField twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of the two groups: a
marked row is one they disagree on.

## Anatomy

```ocaml
<Number_field>
  <Label>"Width"</Label>
  <Number_field.Group>
    <Number_field.Decrement_button />
    <Number_field.Input />
    <Number_field.Increment_button />
  </Number_field.Group>
  <Description>"In pixels"</Description>
  <Field_error>"Too wide"</Field_error>
</Number_field>
```

`Number_field` allows users to enter numeric values with optional
increment/decrement buttons. It supports internationalized formatting,
validation, and keyboard navigation.

## Examples

### Variants

The NumberField component supports two visual variants:

- **`` `primary ``** (default) - Standard styling with shadow, suitable for
  most use cases
- **`` `secondary ``** - Lower emphasis variant without shadow, suitable for
  use in Surface components

```ocaml title="number_field_variants.mlx"
module Label = Solidtype_heroui.Label
module Number_field = Solidtype_heroui.Number_field

let make () =
  <div class_="flex flex-col gap-4">
    <Number_field
      default_value=100. min_value=0. name="primary-width" variant=`primary>
      <Label>"Primary variant"</Label>
      <Number_field.Group>
        <Number_field.Decrement_button />
        <Number_field.Input class_="w-[120px]" />
        <Number_field.Increment_button />
      </Number_field.Group>
    </Number_field>
    <Number_field
      default_value=100. min_value=0. name="secondary-width" variant=`secondary>
      <Label>"Secondary variant"</Label>
      <Number_field.Group>
        <Number_field.Decrement_button />
        <Number_field.Input class_="w-[120px]" />
        <Number_field.Increment_button />
      </Number_field.Group>
    </Number_field>
  </div>
```

### In Surface

When used inside a [Surface](surface.md) component, use
`` variant=`secondary `` to apply the lower emphasis variant suitable for
surface backgrounds.

```ocaml title="number_field_surface.mlx"
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Number_field = Solidtype_heroui.Number_field
module Surface = Solidtype_heroui.Surface
module Format = Solidtype_kobalte.Types.NumberFormatOptions

let make () =
  <Surface class_="flex w-full max-w-[280px] flex-col gap-4 rounded-3xl p-6">
    <Number_field
      default_value=1024. min_value=0. name="width" variant=`secondary>
      <Label>"Width"</Label>
      <Number_field.Group>
        <Number_field.Decrement_button />
        <Number_field.Input class_="w-full" />
        <Number_field.Increment_button />
      </Number_field.Group>
      <Description>"Enter the width in pixels"</Description>
    </Number_field>
    <Number_field
      default_value=0.5
      format_options=(Format.make ~style:`percent ())
      max_value=1.
      min_value=0.
      name="percentage"
      step=0.1
      variant=`secondary>
      <Label>"Percentage"</Label>
      <Number_field.Group>
        <Number_field.Decrement_button />
        <Number_field.Input class_="w-full" />
        <Number_field.Increment_button />
      </Number_field.Group>
      <Description>"Value must be between 0 and 100"</Description>
    </Number_field>
  </Surface>
```

### With Description

```ocaml title="number_field_description.mlx"
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Number_field = Solidtype_heroui.Number_field
module Format = Solidtype_kobalte.Types.NumberFormatOptions

let make () =
  <div class_="flex w-full max-w-64 flex-col gap-4">
    <Number_field default_value=1024. min_value=0. name="width">
      <Label>"Width"</Label>
      <Number_field.Group>
        <Number_field.Decrement_button />
        <Number_field.Input class_="w-[120px]" />
        <Number_field.Increment_button />
      </Number_field.Group>
      <Description>"Enter the width in pixels"</Description>
    </Number_field>
    <Number_field
      default_value=0.5
      format_options=(Format.make ~style:`percent ())
      max_value=1.
      min_value=0.
      name="percentage"
      step=0.1>
      <Label>"Percentage"</Label>
      <Number_field.Group>
        <Number_field.Decrement_button />
        <Number_field.Input class_="w-[120px]" />
        <Number_field.Increment_button />
      </Number_field.Group>
      <Description>"Value must be between 0 and 100"</Description>
    </Number_field>
  </div>
```

### Required Field

```ocaml title="number_field_required.mlx"
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Number_field = Solidtype_heroui.Number_field

let make () =
  <div class_="flex w-full max-w-64 flex-col gap-4">
    <Number_field is_required=true min_value=0. name="quantity">
      <Label>"Quantity"</Label>
      <Number_field.Group>
        <Number_field.Decrement_button />
        <Number_field.Input class_="w-[120px]" />
        <Number_field.Increment_button />
      </Number_field.Group>
    </Number_field>
    <Number_field
      is_required=true default_value=1. max_value=10. min_value=1. name="rating">
      <Label>"Rating"</Label>
      <Number_field.Group>
        <Number_field.Decrement_button />
        <Number_field.Input class_="w-[120px]" />
        <Number_field.Increment_button />
      </Number_field.Group>
      <Description>"Rate from 1 to 10"</Description>
    </Number_field>
  </div>
```

### Disabled State

```ocaml title="number_field_disabled.mlx"
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Number_field = Solidtype_heroui.Number_field
module Format = Solidtype_kobalte.Types.NumberFormatOptions

let make () =
  <div class_="flex w-full max-w-64 flex-col gap-4">
    <Number_field
      is_disabled=true default_value=1024. min_value=0. name="width">
      <Label>"Width"</Label>
      <Number_field.Group>
        <Number_field.Decrement_button />
        <Number_field.Input class_="w-[120px]" />
        <Number_field.Increment_button />
      </Number_field.Group>
      <Description>"Enter the width in pixels"</Description>
    </Number_field>
    <Number_field
      is_disabled=true
      default_value=0.5
      format_options=(Format.make ~style:`percent ())
      max_value=1.
      min_value=0.
      name="percentage"
      step=0.1>
      <Label>"Percentage"</Label>
      <Number_field.Group>
        <Number_field.Decrement_button />
        <Number_field.Input class_="w-[120px]" />
        <Number_field.Increment_button />
      </Number_field.Group>
      <Description>"Value must be between 0 and 100"</Description>
    </Number_field>
  </div>
```

### Full Width

```ocaml title="number_field_full_width.mlx"
module Label = Solidtype_heroui.Label
module Number_field = Solidtype_heroui.Number_field

let make () =
  <div class_="w-[400px] space-y-4">
    <Number_field full_width=true default_value=1024. min_value=0. name="width">
      <Label>"Width"</Label>
      <Number_field.Group>
        <Number_field.Decrement_button />
        <Number_field.Input />
        <Number_field.Increment_button />
      </Number_field.Group>
    </Number_field>
  </div>
```

### Validation

Use `is_invalid` together with `Field_error` to surface validation messages.

```ocaml title="number_field_validation.mlx"
module Field_error = Solidtype_heroui.Field_error
module Label = Solidtype_heroui.Label
module Number_field = Solidtype_heroui.Number_field
module Format = Solidtype_kobalte.Types.NumberFormatOptions

let make () =
  <div class_="flex w-full max-w-64 flex-col gap-4">
    <Number_field
      is_invalid=true is_required=true min_value=0. name="quantity" value=(-5.)>
      <Label>"Quantity"</Label>
      <Number_field.Group>
        <Number_field.Decrement_button />
        <Number_field.Input class_="w-[120px]" />
        <Number_field.Increment_button />
      </Number_field.Group>
      <Field_error>"Quantity must be greater than or equal to 0"</Field_error>
    </Number_field>
    <Number_field
      is_invalid=true
      format_options=(Format.make ~style:`percent ())
      max_value=1.
      min_value=0.
      name="percentage"
      step=0.1
      value=1.5>
      <Label>"Percentage"</Label>
      <Number_field.Group>
        <Number_field.Decrement_button />
        <Number_field.Input class_="w-[120px]" />
        <Number_field.Increment_button />
      </Number_field.Group>
      <Field_error>"Percentage must be between 0 and 100"</Field_error>
    </Number_field>
  </div>
```

### Controlled

Control the value to synchronize with other components or perform custom
formatting.

```ocaml title="number_field_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Button = Solidtype_heroui.Button
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Number_field = Solidtype_heroui.Number_field

let make () =
  let value, set_value = S.create_signal 1024. in
  <div class_="flex w-full max-w-64 flex-col gap-4">
    <Number_field
      min_value=0. name="width" value=(S.get value) on_change=(S.set set_value)>
      <Label>"Width"</Label>
      <Number_field.Group>
        <Number_field.Decrement_button />
        <Number_field.Input class_="w-[120px]" />
        <Number_field.Increment_button />
      </Number_field.Group>
      <Description>
        (Jsx.string ("Current value: " ^ Js.Float.toString (S.get value)))
      </Description>
    </Number_field>
    <div class_="flex gap-2">
      <Button variant=`tertiary on_click=(fun _ -> S.set set_value 0.)>
        "Reset to 0"
      </Button>
      <Button variant=`tertiary on_click=(fun _ -> S.set set_value 2048.)>
        "Set to 2048"
      </Button>
    </div>
  </div>
```

### Step Values

Configure increment/decrement step values for precise control. A value is
kept on its step's grid within its range, with its step's decimals, so a
tenth added to 0.2 is 0.3; a button its step would not move is disabled.

```ocaml title="number_field_step.mlx"
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Number_field = Solidtype_heroui.Number_field

let make () =
  <div class_="flex w-full max-w-64 flex-col gap-4">
    <Number_field
      default_value=0. max_value=100. min_value=0. name="step1" step=1.>
      <Label>"Step: 1"</Label>
      <Number_field.Group>
        <Number_field.Decrement_button />
        <Number_field.Input class_="w-[120px]" />
        <Number_field.Increment_button />
      </Number_field.Group>
      <Description>"Increments by 1"</Description>
    </Number_field>
    <Number_field
      default_value=0. max_value=100. min_value=0. name="step5" step=5.>
      <Label>"Step: 5"</Label>
      <Number_field.Group>
        <Number_field.Decrement_button />
        <Number_field.Input class_="w-[120px]" />
        <Number_field.Increment_button />
      </Number_field.Group>
      <Description>"Increments by 5"</Description>
    </Number_field>
    <Number_field
      default_value=0. max_value=100. min_value=0. name="step10" step=10.>
      <Label>"Step: 10"</Label>
      <Number_field.Group>
        <Number_field.Decrement_button />
        <Number_field.Input class_="w-[120px]" />
        <Number_field.Increment_button />
      </Number_field.Group>
      <Description>"Increments by 10"</Description>
    </Number_field>
  </div>
```

### Format Options

Format numbers as currency, percentages, decimals, or units with
internationalization support: the input shows and reads its value in the
reader's locale, and tells a reader the value as it shows it.

```ocaml title="number_field_format.mlx"
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Number_field = Solidtype_heroui.Number_field
module Format = Solidtype_kobalte.Types.NumberFormatOptions

let make () =
  <div class_="flex w-full max-w-64 flex-col gap-4">
    <Number_field
      default_value=99.
      min_value=0.
      name="currency-eur"
      format_options=(Format.make ~currency:"EUR" ~currency_sign:`accounting
                        ~style:`currency ())>
      <Label>"Currency (EUR - Accounting)"</Label>
      <Number_field.Group>
        <Number_field.Decrement_button />
        <Number_field.Input class_="w-[120px]" />
        <Number_field.Increment_button />
      </Number_field.Group>
      <Description>"Accounting format with EUR currency"</Description>
    </Number_field>
    <Number_field
      default_value=99.99
      min_value=0.
      name="currency-usd"
      format_options=(Format.make ~currency:"USD" ~style:`currency ())>
      <Label>"Currency (USD)"</Label>
      <Number_field.Group>
        <Number_field.Decrement_button />
        <Number_field.Input class_="w-[120px]" />
        <Number_field.Increment_button />
      </Number_field.Group>
      <Description>"Standard USD currency format"</Description>
    </Number_field>
    <Number_field
      default_value=0.5
      format_options=(Format.make ~style:`percent ())
      max_value=1.
      min_value=0.
      name="percentage"
      step=0.01>
      <Label>"Percentage"</Label>
      <Number_field.Group>
        <Number_field.Decrement_button />
        <Number_field.Input class_="w-[120px]" />
        <Number_field.Increment_button />
      </Number_field.Group>
      <Description>"Percentage format (0-1, where 0.5 = 50%)"</Description>
    </Number_field>
    <Number_field
      default_value=1234.56
      min_value=0.
      name="decimal"
      format_options=(Format.make ~maximum_fraction_digits:2.
                        ~minimum_fraction_digits:2. ~style:`decimal ())>
      <Label>"Decimal (2 decimal places)"</Label>
      <Number_field.Group>
        <Number_field.Decrement_button />
        <Number_field.Input class_="w-[120px]" />
        <Number_field.Increment_button />
      </Number_field.Group>
      <Description>"Decimal format with 2 decimal places"</Description>
    </Number_field>
    <Number_field
      default_value=1000.
      min_value=0.
      name="unit"
      format_options=(Format.make ~style:`unit ~unit:"kilogram"
                        ~unit_display:`short ())>
      <Label>"Unit (Kilograms)"</Label>
      <Number_field.Group>
        <Number_field.Decrement_button />
        <Number_field.Input class_="w-[120px]" />
        <Number_field.Increment_button />
      </Number_field.Group>
      <Description>"Unit format with kilograms"</Description>
    </Number_field>
  </div>
```

### Form Example

Complete form integration with validation and submission handling.

```ocaml title="number_field_form.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Show = Solidtype.Show
module Button = Solidtype_heroui.Button
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Form = Solidtype_heroui.Form
module Label = Solidtype_heroui.Label
module Number_field = Solidtype_heroui.Number_field
module Spinner = Solidtype_heroui.Spinner

external prevent_default : Dom.event -> unit = "preventDefault" [@@mel.send]

let stock_available = 3.
let stock = Js.Float.toString stock_available

let make () =
  (* Empty is not a number. *)
  let value, set_value = S.create_signal Float.nan in
  let is_submitting, set_is_submitting = S.create_signal false in
  let is_out_of_stock () =
    (not (Float.is_nan (S.get value))) && S.get value > stock_available
  in
  let unavailable () =
    let v = S.get value in
    Float.is_nan v || v < 1. || v > stock_available
  in
  let handle_submit e =
    prevent_default e;
    if not (unavailable ()) then (
      S.set set_is_submitting true;
      (* Simulate API call *)
      ignore
        (Js.Global.setTimeout
           ~f:(fun () ->
             Js.log2 "Order submitted, quantity:" (S.get value);
             S.set set_value Float.nan;
             S.set set_is_submitting false)
           1500
          : Js.Global.timeoutId))
  in
  <Form class_="flex w-[280px] flex-col gap-4" on_submit=handle_submit>
    <Number_field
      is_required=true
      is_invalid=(is_out_of_stock ())
      max_value=5.
      min_value=1.
      name="quantity"
      value=(S.get value)
      on_change=(S.set set_value)>
      <Label>"Order quantity"</Label>
      <Number_field.Group>
        <Number_field.Decrement_button />
        <Number_field.Input class_="w-[120px]" />
        <Number_field.Increment_button />
      </Number_field.Group>
      <Show
        when_=(is_out_of_stock ())
        fallback=(<Description>
                    (Jsx.string ("Only " ^ stock ^ " items available"))
                  </Description>)>
        <Field_error>
          (Jsx.string ("Only " ^ stock ^ " items left in stock"))
        </Field_error>
      </Show>
    </Number_field>
    <Button
      class_="w-full"
      is_disabled=(unavailable ())
      type_=`submit
      variant=`primary>
      <Show when_=(not (S.get is_submitting))>"Place Order"</Show>
      <Show when_=(S.get is_submitting)>
        <Spinner color=`current size=`sm /> "Processing..."
      </Show>
    </Button>
  </Form>
```

### With Validation

Implement custom validation logic with controlled values.

```ocaml title="number_field_with_validation.mlx"
module S = Solidtype.Solid
module Show = Solidtype.Show
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Label = Solidtype_heroui.Label
module Number_field = Solidtype_heroui.Number_field
module Format = Solidtype_kobalte.Types.NumberFormatOptions

let make () =
  (* Empty is not a number. *)
  let value, set_value = S.create_signal Float.nan in
  let is_invalid () =
    let v = S.get value in
    (not (Float.is_nan v)) && (v < 0. || v > 100.)
  in
  <div class_="flex w-full max-w-64 flex-col gap-4">
    <Number_field
      is_required=true
      format_options=(Format.make ~style:`percent ())
      is_invalid=(is_invalid ())
      max_value=1.
      min_value=0.
      name="percentage"
      step=0.1
      value=(S.get value)
      on_change=(S.set set_value)>
      <Label>"Percentage"</Label>
      <Number_field.Group>
        <Number_field.Decrement_button />
        <Number_field.Input class_="w-[120px]" />
        <Number_field.Increment_button />
      </Number_field.Group>
      <Show
        when_=(is_invalid ())
        fallback=(<Description>"Enter a value between 0 and 100"</Description>)>
        <Field_error>"Percentage must be between 0 and 100"</Field_error>
      </Show>
    </Number_field>
  </div>
```

### Custom Icons

Customize the increment and decrement button icons.

```ocaml title="number_field_custom_icons.mlx"
module Description = Solidtype_heroui.Description
module Label = Solidtype_heroui.Label
module Number_field = Solidtype_heroui.Number_field
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex w-full max-w-64 flex-col gap-4">
    <Number_field default_value=1024. min_value=0. name="width">
      <Label>"Width (Custom Icons)"</Label>
      <Number_field.Group>
        <Number_field.Decrement_button>
          <Gravity.Magnifier_minus />
        </Number_field.Decrement_button>
        <Number_field.Input class_="w-[120px]" />
        <Number_field.Increment_button>
          <Gravity.Magnifier_plus />
        </Number_field.Increment_button>
      </Number_field.Group>
      <Description>"Custom icon children"</Description>
    </Number_field>
  </div>
```

### With Chevrons

Use chevron icons in a vertical layout for a different visual style.

```ocaml title="number_field_chevrons.mlx"
module Label = Solidtype_heroui.Label
module Number_field = Solidtype_heroui.Number_field
module Format = Solidtype_kobalte.Types.NumberFormatOptions
module Gravity = Solidtype_gravity_icons

let make () =
  <Number_field
    class_="w-full max-w-64"
    default_value=99.
    min_value=0.
    name="amount"
    format_options=(Format.make ~currency:"EUR" ~currency_sign:`accounting
                      ~style:`currency ())>
    <Label>"Number field with chevrons"</Label>
    <Number_field.Group class_="flex">
      <Number_field.Input class_="flex-1" />
      <div class_="flex h-full flex-col border-s border-field-placeholder/15">
        <Number_field.Increment_button
          class_="flex h-1/2 w-6 items-center justify-center rounded-none \
                  border-0 pt-0.5 text-sm">
          <Gravity.Chevron_up width="11" height="11" />
        </Number_field.Increment_button>
        <Number_field.Decrement_button
          class_="flex h-1/2 w-6 items-center justify-center rounded-none \
                  border-0 pb-0.5 text-sm">
          <Gravity.Chevron_down width="11" height="11" />
        </Number_field.Decrement_button>
      </div>
    </Number_field.Group>
  </Number_field>
```

### Render Function

`as_` draws another element in its place, given its props and its state, as [Composition](composition.md#custom-dom-element) shows.

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="number_field_tailwind.mlx"
module Label = Solidtype_heroui.Label
module Number_field = Solidtype_heroui.Number_field

let make () =
  <Number_field
    class_="w-full max-w-48"
    default_value=2.
    min_value=1.
    name="guests"
    variant=`secondary>
    <Label class_="font-medium text-foreground">"Guests"</Label>
    <Number_field.Group class_="rounded-xl bg-default">
      <Number_field.Decrement_button class_="text-muted hover:text-foreground"
      />
      <Number_field.Input class_="text-center tabular-nums" />
      <Number_field.Increment_button class_="text-muted hover:text-foreground"
      />
    </Number_field.Group>
  </Number_field>
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

- `.number-field` - Root container with minimal styling (`flex flex-col
  gap-1`)
- `.number-field__group` - Container for input and buttons with border and
  background styling
- `.number-field__input` - The numeric input field
- `.number-field__increment-button` - Button to increment the value
- `.number-field__decrement-button` - Button to decrement the value
- `.number-field--primary` - Primary variant with shadow (default)
- `.number-field--secondary` - Secondary variant without shadow, suitable
  for use in surfaces
- `.number-field--full-width`, `.number-field__group--full-width` - Full
  width modifiers

Child components ([Label](label.md),
[Description](description.md),
[FieldError](field-error.md)) have their own CSS classes and
styling. See their respective documentation for customization options.

### Interactive States

NumberField automatically manages these data attributes based on its state:

- **Invalid**: `[data-invalid="true"]` - Automatically hides the description
  slot when invalid
- **Disabled**: `[data-disabled="true"]` - Applied when `is_disabled` is true
- **Focus within**: `[data-focus-within="true"]` on the group - Applied when
  the input or buttons are focused
- **Focus visible**: `[data-focus-visible="true"]` on the input and buttons -
  Applied when focus is visible (keyboard navigation)
- **Hover**: `[data-hovered="true"]` on the group, the input and the buttons

## API Reference

Each prop beside the name HeroUI's React component gives it.

### NumberField

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `variant` | `variant` | `` [ `primary \| `secondary ] `` | `` `primary `` | Visual variant of the component. `` `primary `` is the default style with shadow. `` `secondary `` is a lower emphasis variant without shadow, suitable for use in surfaces |
| `fullWidth` | `full_width` | `bool` | `false` | Whether the number field should take full width of its container |
| `value` | `value` | `float` | | Current value (controlled) |
| `defaultValue` | `default_value` | `float` | | Default value (uncontrolled) |
| `onChange` | `on_change` | `float -> unit` | | Handler called when the value changes |
| `minValue` | `min_value` | `float` | | Minimum allowed value |
| `maxValue` | `max_value` | `float` | | Maximum allowed value |
| `step` | `step` | `float` | `1.` | Step value for increment/decrement operations |
| `isDisabled` | `is_disabled` | `bool` | | Whether it is disabled, else as its fieldset is |
| `isInvalid` | `is_invalid` | `bool` | `false` | Whether the value is invalid |
| `isReadOnly` | `is_read_only` | `bool` | `false` | Whether the input can be selected but not changed |
| `isWheelDisabled` | `is_wheel_disabled` | `bool` | `false` | Whether the wheel leaves it alone |
| `isRequired` | `is_required` | `bool` | `false` | Whether user input is required before form submission |
| `name` | `name` | `string` | | Name of the input element, for HTML form submission |
| `aria-label` | `aria_label` | `string` | | Accessibility label when no visible label is present |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `onBlur` | `on_blur` | `Dom.focusEvent -> unit` | | Called once focus leaves it for an element outside it |
| `formatOptions` | `format_options` | `Solidtype_kobalte.Types.NumberFormatOptions.t` | | Options for formatting numbers (currency, percent, decimal, unit) |
| `validate` | — | | | A field validates nothing itself: its `is_invalid` and `Field_error` come from the application's state |

### NumberField.Group, Input, IncrementButton, DecrementButton

Each takes `class_`, added after HeroUI's class; the input a `placeholder`;
a button `children`, the icon or content for the button, defaulting to a
plus or minus icon.

## Note

- The arrow keys step the value, as the buttons do
- The wheel steps it while its input has the focus: turned down it steps up,
  turned up it steps down
- A wheel turn mostly sideways, one with Control held, or one over a field
  read-only or `is_wheel_disabled` steps nothing
