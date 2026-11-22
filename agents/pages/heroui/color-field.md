# ColorField

Color input field with labels, descriptions, and validation.

Its value is a `Types.Color.t`, read from any CSS colour by
`Solidtype_kobalte.Colors.parse_color`, or none. What is typed is committed
as focus leaves the input and by Enter. The arrow keys, Page Up and Page Down,
Home and End, and the wheel while the input has the focus, step its value.

Original HeroUI documentation: [ColorField](https://heroui.com/en/docs/react/components/color-field).

## Usage

HeroUI's examples.

```ocaml title="color_field_usage.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Color_field = Solidtype_heroui.Color_field
module Color_swatch = Solidtype_heroui.Color_swatch
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Label = Solidtype_heroui.Label
module Colors = Solidtype_kobalte.Colors
module Color = Solidtype_kobalte.Types.Color

(* A swatch of no colour, where HeroUI's is given none. *)
let shown c = Option.value c ~default:(Colors.parse_color "rgba(0, 0, 0, 0)")

let make () =
  let color, set_color =
    S.create_signal (Some (Colors.parse_color "#0485F7"))
  in
  <Color_field
    class_="w-[280px]"
    name="color"
    value=(Js.Null.fromOption (S.get color))
    on_change=(S.set set_color)>
    <Label>"Color"</Label>
    <Color_field.Group>
      <Color_field.Prefix>
        <Color_swatch color=(shown (S.get color)) size=`xs />
      </Color_field.Prefix>
      <Color_field.Input />
    </Color_field.Group>
  </Color_field>
```

## Parity

The same HeroUI ColorField twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of the two fields:
a marked row is one they disagree on.

The marked row is Kobalte's: its field is a `group` its label names, where React Aria's has no role.

## Anatomy

```ocaml
<Color_field>
  <Label>"Color"</Label>
  <Color_field.Group>
    <Color_field.Prefix>
      <Color_swatch color=(Colors.parse_color "#0485F7") size=`xs />
    </Color_field.Prefix>
    <Color_field.Input />
    <Color_field.Suffix>"..."</Color_field.Suffix>
  </Color_field.Group>
  <Description>"..."</Description>
  <Field_error>"..."</Field_error>
</Color_field>
```

`Color_field` combines label, color input, description, and error into a
single accessible component.

## Examples

### Variants

`Color_field.Group` supports two visual variants:

- `` `primary `` (default) - Standard styling with shadow, suitable for most
  use cases
- `` `secondary `` - Lower emphasis variant without shadow, suitable for use
  in `Surface` components

```ocaml title="color_field_variants.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Color_field = Solidtype_heroui.Color_field
module Color_swatch = Solidtype_heroui.Color_swatch
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Label = Solidtype_heroui.Label
module Colors = Solidtype_kobalte.Colors
module Color = Solidtype_kobalte.Types.Color

let make () =
  <div class_="flex flex-col gap-4">
    <Color_field
      class_="w-[280px]"
      default_value=(Colors.parse_color "#0485F7")
      name="primary-color">
      <Label>"Primary variant"</Label>
      <Color_field.Group variant=`primary>
        <Color_field.Input />
      </Color_field.Group>
    </Color_field>
    <Color_field
      class_="w-[280px]"
      default_value=(Colors.parse_color "#F43F5E")
      name="secondary-color">
      <Label>"Secondary variant"</Label>
      <Color_field.Group variant=`secondary>
        <Color_field.Input />
      </Color_field.Group>
    </Color_field>
  </div>
```

### On Surface

When used inside a [Surface](surface.md) component, use
``variant=`secondary`` on `Color_field.Group` to apply the lower emphasis
variant suitable for surface backgrounds.

```ocaml title="color_field_on_surface.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Color_field = Solidtype_heroui.Color_field
module Color_swatch = Solidtype_heroui.Color_swatch
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Label = Solidtype_heroui.Label
module Colors = Solidtype_kobalte.Colors
module Color = Solidtype_kobalte.Types.Color
module Surface = Solidtype_heroui.Surface

let make () =
  <Surface class_="w-[320px] p-4">
    <Color_field default_value=(Colors.parse_color "#3B82F6") name="color">
      <Label>"Theme Color"</Label>
      <Color_field.Group variant=`secondary>
        <Color_field.Input />
      </Color_field.Group>
      <Description>"Select your theme color"</Description>
    </Color_field>
  </Surface>
```

### With Description

```ocaml title="color_field_with_description.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Color_field = Solidtype_heroui.Color_field
module Color_swatch = Solidtype_heroui.Color_swatch
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Label = Solidtype_heroui.Label
module Colors = Solidtype_kobalte.Colors
module Color = Solidtype_kobalte.Types.Color

let make () =
  <div class_="flex flex-col gap-4">
    <Color_field
      class_="w-[280px]"
      default_value=(Colors.parse_color "#3B82F6")
      name="color">
      <Label>"Primary Color"</Label>
      <Color_field.Group><Color_field.Input /></Color_field.Group>
      <Description>"Enter your brand's primary color"</Description>
    </Color_field>
    <Color_field
      class_="w-[280px]"
      default_value=(Colors.parse_color "#F59E0B")
      name="accent-color">
      <Label>"Accent Color"</Label>
      <Color_field.Group><Color_field.Input /></Color_field.Group>
      <Description>"Used for highlights and CTAs"</Description>
    </Color_field>
  </div>
```

### Required Field

```ocaml title="color_field_required.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Color_field = Solidtype_heroui.Color_field
module Color_swatch = Solidtype_heroui.Color_swatch
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Label = Solidtype_heroui.Label
module Colors = Solidtype_kobalte.Colors
module Color = Solidtype_kobalte.Types.Color

let make () =
  <div class_="flex flex-col gap-4">
    <Color_field class_="w-[280px]" name="color" is_required=true>
      <Label>"Brand Color"</Label>
      <Color_field.Group>
        <Color_field.Input placeholder="#000000" />
      </Color_field.Group>
    </Color_field>
    <Color_field class_="w-[280px]" name="theme-color" is_required=true>
      <Label>"Theme Color"</Label>
      <Color_field.Group>
        <Color_field.Input placeholder="#000000" />
      </Color_field.Group>
      <Description>"Required field"</Description>
    </Color_field>
  </div>
```

### Disabled State

```ocaml title="color_field_disabled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Color_field = Solidtype_heroui.Color_field
module Color_swatch = Solidtype_heroui.Color_swatch
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Label = Solidtype_heroui.Label
module Colors = Solidtype_kobalte.Colors
module Color = Solidtype_kobalte.Types.Color

let make () =
  <div class_="flex flex-col gap-4">
    <Color_field
      class_="w-[280px]"
      default_value=(Colors.parse_color "#0485F7")
      name="color"
      is_disabled=true>
      <Label>"Color"</Label>
      <Color_field.Group><Color_field.Input /></Color_field.Group>
      <Description>"This color field is disabled"</Description>
    </Color_field>
    <Color_field class_="w-[280px]" name="color-empty" is_disabled=true>
      <Label>"Color"</Label>
      <Color_field.Group>
        <Color_field.Input placeholder="#000000" />
      </Color_field.Group>
      <Description>"This color field is disabled"</Description>
    </Color_field>
  </div>
```

### Full Width

```ocaml title="color_field_full_width.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Color_field = Solidtype_heroui.Color_field
module Color_swatch = Solidtype_heroui.Color_swatch
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Label = Solidtype_heroui.Label
module Colors = Solidtype_kobalte.Colors
module Color = Solidtype_kobalte.Types.Color

let make () =
  <div class_="w-[400px] space-y-4">
    <Color_field
      default_value=(Colors.parse_color "#10B981") name="color" full_width=true>
      <Label>"Brand Color"</Label>
      <Color_field.Group><Color_field.Input /></Color_field.Group>
    </Color_field>
    <Color_field
      default_value=(Colors.parse_color "#8B5CF6")
      name="color-with-suffix"
      full_width=true>
      <Label>"Theme Color"</Label>
      <Color_field.Group><Color_field.Input /></Color_field.Group>
    </Color_field>
  </div>
```

### Validation

Use `is_invalid` together with `Field_error` to surface validation messages.

```ocaml title="color_field_validation.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Color_field = Solidtype_heroui.Color_field
module Color_swatch = Solidtype_heroui.Color_swatch
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Label = Solidtype_heroui.Label
module Colors = Solidtype_kobalte.Colors
module Color = Solidtype_kobalte.Types.Color

let make () =
  <div class_="flex flex-col gap-4">
    <Color_field
      class_="w-[280px]" name="color" is_invalid=true is_required=true>
      <Label>"Color"</Label>
      <Color_field.Group>
        <Color_field.Input placeholder="#000000" />
      </Color_field.Group>
      <Field_error>"Please enter a valid hex color"</Field_error>
    </Color_field>
    <Color_field class_="w-[280px]" is_invalid=true name="invalid-color">
      <Label>"Background Color"</Label>
      <Color_field.Group><Color_field.Input /></Color_field.Group>
      <Field_error>"Invalid color format. Use hex (e.g., #FF5733)"</Field_error>
    </Color_field>
  </div>
```

### Channel Editing

`Color_field` supports editing individual color channels (hue, saturation,
lightness, red, green, blue, alpha) by setting the `color_space` and `channel`
props. Each input here takes `min-w-0`, so the `%` after it fits.

```ocaml title="color_field_channel_editing.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Color_field = Solidtype_heroui.Color_field
module Color_swatch = Solidtype_heroui.Color_swatch
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Label = Solidtype_heroui.Label
module Colors = Solidtype_kobalte.Colors
module Color = Solidtype_kobalte.Types.Color

let make () =
  let color, set_color =
    S.create_signal (Some (Colors.parse_color "#7F007F"))
  in
  let channel ~channel ~name ~label ~suffix =
    <Color_field
      channel
      class_="w-[100px]"
      color_space=`hsl
      name
      value=(Js.Null.fromOption (S.get color))
      on_change=(S.set set_color)>
      <Label>(Jsx.string label)</Label>
      <Color_field.Group>
        <Color_field.Input class_="min-w-0" />
        (if suffix then
           <Color_field.Suffix>
             <span class_="text-sm text-muted">"%"</span>
           </Color_field.Suffix>
         else Jsx.string "")
      </Color_field.Group>
    </Color_field>
  in
  <div class_="flex flex-col gap-4">
    <p class_="text-sm text-muted">"Edit individual HSL channels:"</p>
    <div class_="flex gap-4">
      (channel ~channel:`hue ~name:"hue" ~label:"Hue" ~suffix:false)
      (channel ~channel:`saturation ~name:"saturation" ~label:"Saturation"
         ~suffix:true)
      (channel ~channel:`lightness ~name:"lightness" ~label:"Lightness"
         ~suffix:true)
    </div>
    <div class_="flex items-center gap-2">
      <Color_swatch
        color=(Option.value (S.get color)
                 ~default:(Colors.parse_color "rgba(0, 0, 0, 0)"))
        size=`md
      />
      <span class_="text-sm">
        "Current: "
        (Jsx.string
           (match S.get color with
           | Some c -> Color.to_string c ~format:`hex ()
           | None -> "(empty)"))
      </span>
    </div>
  </div>
```

### Controlled

Control the value to synchronize with other components or state management.

```ocaml title="color_field_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Color_field = Solidtype_heroui.Color_field
module Color_swatch = Solidtype_heroui.Color_swatch
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Label = Solidtype_heroui.Label
module Colors = Solidtype_kobalte.Colors
module Color = Solidtype_kobalte.Types.Color
module Button = Solidtype_heroui.Button

(* A swatch of no colour, where HeroUI's is given none. *)
let shown c = Option.value c ~default:(Colors.parse_color "rgba(0, 0, 0, 0)")

let make () =
  let value, set_value =
    S.create_signal (Some (Colors.parse_color "#0485F7"))
  in
  <div class_="flex flex-col gap-4">
    <Color_field
      class_="w-[280px]"
      name="color"
      value=(Js.Null.fromOption (S.get value))
      on_change=(S.set set_value)>
      <Label>"Color"</Label>
      <Color_field.Group>
        <Color_field.Prefix>
          <Color_swatch color=(shown (S.get value)) size=`xs />
        </Color_field.Prefix>
        <Color_field.Input />
      </Color_field.Group>
      <Description>
        "Current value: "
        (Jsx.string
           (match S.get value with
           | Some c -> Color.to_string c ~format:`hex ()
           | None -> "(empty)"))
      </Description>
    </Color_field>
    <div class_="flex gap-2">
      <Button
        variant=`tertiary
        on_click=(fun _ ->
                     S.set set_value (Some (Colors.parse_color "#EF4444")))>
        "Set Red"
      </Button>
      <Button
        variant=`tertiary
        on_click=(fun _ ->
                     S.set set_value (Some (Colors.parse_color "#10B981")))>
        "Set Green"
      </Button>
      <Button variant=`tertiary on_click=(fun _ -> S.set set_value None)>
        "Clear"
      </Button>
    </div>
  </div>
```

### Form Example

Complete form example with validation and submission handling.

```ocaml title="color_field_form.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Color_field = Solidtype_heroui.Color_field
module Color_swatch = Solidtype_heroui.Color_swatch
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Label = Solidtype_heroui.Label
module Colors = Solidtype_kobalte.Colors
module Color = Solidtype_kobalte.Types.Color
module Button = Solidtype_heroui.Button
module Form = Solidtype_heroui.Form

external prevent_default : Dom.event -> unit = "preventDefault" [@@mel.send]

(* A swatch of no colour, where HeroUI's is given none. *)
let shown c = Option.value c ~default:(Colors.parse_color "rgba(0, 0, 0, 0)")

(* How long the save it stands in for takes. *)
let save_ms = 1500

let make () =
  let value, set_value = S.create_signal None in
  let submitting, set_submitting = S.create_signal false in
  let timer = ref None in
  S.on_cleanup (fun () -> Option.iter Js.Global.clearTimeout !timer);
  <Form
    class_="flex w-[280px] flex-col gap-4"
    on_submit=(fun e ->
                prevent_default e;
                match S.get value with
                | None -> ()
                | Some _ ->
                    S.set set_submitting true;
                    timer :=
                      Some
                        (Js.Global.setTimeout
                           ~f:(fun () ->
                             S.set set_value None;
                             S.set set_submitting false)
                           save_ms))>
    <Color_field
      full_width=true
      is_required=true
      class_="w-full"
      name="brand-color"
      value=(Js.Null.fromOption (S.get value))
      on_change=(S.set set_value)>
      <Label>"Brand Color"</Label>
      <Color_field.Group>
        <Color_field.Prefix>
          <Color_swatch color=(shown (S.get value)) size=`xs />
        </Color_field.Prefix>
        <Color_field.Input placeholder="#000000" />
      </Color_field.Group>
      <Description>"Choose your brand's primary color"</Description>
    </Color_field>
    <Button
      class_="w-full"
      is_disabled=(Option.is_none (S.get value))
      is_pending=(S.get submitting)
      type_=`submit
      variant=`primary>
      (Jsx.string (if S.get submitting then "Saving..." else "Save Color"))
    </Button>
  </Form>
```

### Render Function

`as_` draws another element in its place, given its props and its state, as [Composition](composition.md#custom-dom-element) shows.

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes, on each part.

```ocaml title="color_field_custom_styles.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Color_field = Solidtype_heroui.Color_field
module Color_swatch = Solidtype_heroui.Color_swatch
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Label = Solidtype_heroui.Label
module Colors = Solidtype_kobalte.Colors
module Color = Solidtype_kobalte.Types.Color

(* A swatch of no colour, where HeroUI's is given none. *)
let shown c = Option.value c ~default:(Colors.parse_color "rgba(0, 0, 0, 0)")

let make () =
  let color, set_color =
    S.create_signal (Some (Colors.parse_color "#6366F1"))
  in
  <Color_field
    class_="w-full max-w-xs gap-1.5"
    name="accent-color"
    value=(Js.Null.fromOption (S.get color))
    on_change=(S.set set_color)>
    <Label class_="font-medium text-foreground">"Accent color"</Label>
    <Description>"Applied to buttons, links, and focus rings."</Description>
    <Color_field.Group
      class_="rounded-xl bg-default shadow-none focus-within:ring-2 \
              focus-within:ring-accent/15"
      variant=`secondary>
      <Color_field.Prefix>
        <Color_swatch class_="rounded-md" color=(shown (S.get color)) size=`xs
        />
      </Color_field.Prefix>
      <Color_field.Input
        class_="font-mono text-sm text-foreground placeholder:text-muted"
      />
    </Color_field.Group>
  </Color_field>
```

## Styling Reference

### CSS Classes

- `.color-field` - Root container with minimal styling (`flex flex-col gap-1`)
- `.color-field--full-width` - Full width modifier
- `.color-input-group` - Group root container styling
- `.color-input-group--primary`, `.color-input-group--secondary` - Group
  variants
- `.color-input-group--full-width` - Group full width modifier
- `.color-input-group__input` - Input wrapper styling
- `.color-input-group__prefix` - Prefix element styling
- `.color-input-group__suffix` - Suffix element styling

Child components ([Label](label.md),
[Description](description.md),
[FieldError](field-error.md)) have their own CSS classes and
styling. See their respective documentation for customization options.

### Interactive States

The field manages these data attributes based on its state:

- **Channel**: `[data-channel]` - The channel it edits, or `hex`
- **Invalid**: `[data-invalid="true"]` - Applied while it is invalid
- **Required**: `[data-required="true"]` - Applied when `is_required` is true
- **Disabled**: `[data-disabled="true"]` - Applied when `is_disabled` is true
- **Read Only**: `[data-readonly="true"]` - Applied when `is_read_only` is
  true

The group:

- **Hover**: `[data-hovered="true"]`
- **Focus Within**: `[data-focus-within="true"]`, and
  `[data-focus-visible="true"]` from the keyboard
- **Invalid**: `[data-invalid="true"]`
- **Disabled**: `[data-disabled="true"]`

The input: `[data-hovered="true"]`, `[data-focused="true"]`,
`[data-focus-visible="true"]`, `[data-invalid="true"]`,
`[data-disabled="true"]`.

## API Reference

Each prop beside the name HeroUI's React component gives it.

### ColorField

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `value` | `value` | `Types.Color.t Js.Null.t` | | Current value (controlled), null for none |
| `defaultValue` | `default_value` | `Types.Color.t` | | Default value (uncontrolled) |
| `onChange` | `on_change` | `Types.Color.t option -> unit` | | Handler called when the value changes, `None` for none |
| `channel` | `channel` | `Color_field.channel` | | The color channel to edit, fixed as it is made. If not provided, edits hex value |
| `colorSpace` | `color_space` | `` [ `rgb \| `hsl \| `hsb ] `` | its value's | The color space that the color field operates in when `channel` is provided |
| `fullWidth` | `full_width` | `bool` | `false` | Whether the color field should take full width of its container |
| `isRequired` | `is_required` | `bool` | `false` | Whether user input is required before form submission |
| `isInvalid` | `is_invalid` | `bool` | `false` | Whether the value is invalid; so too while a form's error names it |
| `validate`, `validationBehavior` | — | | | A field validates nothing itself: it is invalid as the application says |
| `isDisabled` | `is_disabled` | `bool` | its fieldset's | Whether the input is disabled |
| `isReadOnly` | `is_read_only` | `bool` | `false` | Whether the input can be selected but not changed |
| `isWheelDisabled` | `is_wheel_disabled` | `bool` | `false` | Whether to disable changing the value with scroll |
| `name` | `name` | `string` | | Name of the input element, for HTML form submission: the hex or the channel's value |
| `autoFocus` | — | | | The input's own `autofocus` |
| `aria-label` | `aria_label` | `string` | | Accessibility label when no visible label is present |
| `onBlur` | `on_blur` | `Dom.focusEvent -> unit` | | Called as focus leaves it |
| `className` | `class_` | `string` | | Added after HeroUI's class |
| `render` | `as_` | a function of its props and state | | Draws another element in its place |

Any other attribute, `id` or `aria_describedby`, is the field's element's.

### ColorField.Group

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `variant` | `variant` | `` [ `primary \| `secondary ] `` | `` `primary `` | Visual variant of the component. `` `primary `` is the default style with shadow. `` `secondary `` is a lower emphasis variant without shadow, suitable for use in surfaces |
| `fullWidth` | `full_width` | `bool` | `false` | Whether the color input group should take full width of its container |
| `className` | `class_` | `string` | | Added after HeroUI's class |

A press on the group but on its input gives the input the focus.

### ColorField.Input, ColorField.Prefix, ColorField.Suffix

Each takes `class_`, added after HeroUI's class, and every attribute of its
element; the input its `placeholder`, shown while it is empty, the prefix and
the suffix their `children`.
