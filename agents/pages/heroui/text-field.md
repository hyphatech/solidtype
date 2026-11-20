# TextField

Composition-friendly text fields with labels, descriptions, and inline validation.

Original HeroUI documentation: [TextField](https://heroui.com/en/docs/react/components/text-field).

## Usage

```ocaml title="text_field_usage.mlx"
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module Text_area = Solidtype_heroui.Text_area
module Text_field = Solidtype_heroui.Text_field

let make () =
  <Text_field class_="w-full max-w-64" name="email">
    <Label>"Email"</Label>
    <Input type_="email" placeholder="Enter your email" />
  </Text_field>
```

## Parity

The same HeroUI TextField twice, under the same props: in solidtype on the left, in
React on the right. Below them, every attribute of the two inputs: a marked
row is one they disagree on, and a dimmed row is a framework's own, which no
style reads. Hover, focus and type in them to see the state each sets.

## Anatomy

```ocaml
<Text_field>
  <Label />
  <Input />
  <Description />
  <Field_error />
</Text_field>
```

`Text_field` combines label, input, description, and error into a single
accessible component. For standalone inputs, use
[Input](input.md) or [TextArea](text-area.md).

## Examples

### With Description

```ocaml title="text_field_description.mlx"
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module Text_area = Solidtype_heroui.Text_area
module Text_field = Solidtype_heroui.Text_field

let make () =
  <div class_="flex w-full max-w-64 flex-col gap-4">
    <Text_field name="username">
      <Label>"Username"</Label>
      <Input placeholder="Enter username" />
      <Description>"Choose a unique username for your account"</Description>
    </Text_field>
    <Text_field name="email">
      <Label>"Email"</Label>
      <Input type_="email" placeholder="Enter your email" />
      <Description>"We'll never share your email with anyone"</Description>
    </Text_field>
  </div>
```

### Required Field

A required field marks its label.

```ocaml title="text_field_required.mlx"
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module Text_area = Solidtype_heroui.Text_area
module Text_field = Solidtype_heroui.Text_field

let make () =
  <div class_="flex w-full max-w-64 flex-col gap-4">
    <Text_field is_required=true name="name">
      <Label>"Name"</Label> <Input placeholder="Enter your name" />
    </Text_field>
    <Text_field is_required=true name="email">
      <Label>"Email"</Label>
      <Input type_="email" placeholder="Enter your email" />
      <Description>"Required field"</Description>
    </Text_field>
  </div>
```

### Disabled State

```ocaml title="text_field_disabled.mlx"
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module Text_area = Solidtype_heroui.Text_area
module Text_field = Solidtype_heroui.Text_field

let make () =
  <div class_="flex w-full max-w-64 flex-col gap-4">
    <Text_field is_disabled=true name="disabled">
      <Label>"Disabled field"</Label>
      <Input placeholder="Cannot edit" />
      <Description>"This field is disabled"</Description>
    </Text_field>
    <Text_field is_disabled=true name="email" default_value="ada@example.org">
      <Label>"Email"</Label> <Input type_="email" />
    </Text_field>
  </div>
```

### Full Width

```ocaml title="text_field_full_width.mlx"
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module Text_area = Solidtype_heroui.Text_area
module Text_field = Solidtype_heroui.Text_field

let make () =
  <div class_="w-[400px] space-y-4">
    <Text_field full_width=true name="full-width">
      <Label>"Full width"</Label>
      <Input full_width=true placeholder="Takes the container's width" />
    </Text_field>
  </div>
```

### Validation

Use `is_invalid` together with `Field_error` to surface validation messages.
While the field is invalid, its description is hidden.

```ocaml title="text_field_validation.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module Text_area = Solidtype_heroui.Text_area
module Text_field = Solidtype_heroui.Text_field

let make () =
  let username, set_username = S.create_signal "" in
  let bio, set_bio = S.create_signal "" in
  let short name n =
    let length = String.length (S.get name) in
    length > 0 && length < n
  in
  <div class_="flex w-full max-w-64 flex-col gap-4">
    <Text_field
      is_required=true
      is_invalid=(short username 3)
      name="username"
      value=(S.get username)
      on_change=(S.set set_username)>
      <Label>"Username"</Label>
      <Input placeholder="jane_doe" />
      <Field_error>"Username must be at least 3 characters."</Field_error>
      <Description>"Choose a unique username for your profile."</Description>
    </Text_field>
    <Text_field
      is_required=true
      is_invalid=(short bio 20)
      name="bio"
      value=(S.get bio)
      on_change=(S.set set_bio)>
      <Label>"Bio"</Label>
      <Text_area placeholder="Tell us about yourself..." />
      <Field_error>"Bio must contain at least 20 characters."</Field_error>
      <Description>
        (Jsx.string
           ("Minimum 20 characters ("
           ^ string_of_int (String.length (S.get bio))
           ^ "/20)."))
      </Description>
    </Text_field>
  </div>
```

### Controlled

Control the value to synchronize counters, previews, or formatting.

```ocaml title="text_field_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module Text_area = Solidtype_heroui.Text_area
module Text_field = Solidtype_heroui.Text_field

let make () =
  let name, set_name = S.create_signal "" in
  <div class_="flex w-full max-w-64 flex-col gap-4">
    <Text_field name="name" value=(S.get name) on_change=(S.set set_name)>
      <Label>"Display name"</Label>
      <Input placeholder="Jane" />
      <Description>
        (Jsx.string
           ("Characters: " ^ string_of_int (String.length (S.get name))))
      </Description>
    </Text_field>
  </div>
```

### TextArea

Use [TextArea](text-area.md) instead of
[Input](input.md) for multiline content.

```ocaml title="text_field_text_area.mlx"
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module Text_area = Solidtype_heroui.Text_area
module Text_field = Solidtype_heroui.Text_field

let make () =
  <Text_field class_="w-full max-w-64" name="message">
    <Label>"Message"</Label>
    <Text_area placeholder="Write a message" />
    <Description>"Up to 500 characters"</Description>
  </Text_field>
```

### Input Types

```ocaml title="text_field_input_types.mlx"
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module Text_area = Solidtype_heroui.Text_area
module Text_field = Solidtype_heroui.Text_field

let make () =
  <div class_="flex w-full max-w-64 flex-col gap-4">
    <Text_field name="text">
      <Label>"Text"</Label> <Input type_="text" placeholder="Enter text" />
    </Text_field>
    <Text_field name="email">
      <Label>"Email"</Label>
      <Input type_="email" placeholder="name@example.org" />
    </Text_field>
    <Text_field name="password">
      <Label>"Password"</Label>
      <Input type_="password" placeholder="Enter password" />
    </Text_field>
    <Text_field name="number">
      <Label>"Number"</Label> <Input type_="number" placeholder="0" />
    </Text_field>
    <Text_field name="url">
      <Label>"URL"</Label>
      <Input type_="url" placeholder="https://example.org" />
    </Text_field>
  </div>
```

## Validation

A field is invalid as `is_invalid` says, from the application's own state,
and a [Form](form.md) refuses a submit while it is. There is
no `validate` function and no browser validation on submit. A server's errors
are the form's `validation_errors`.

## Not yet

HeroUI's In Surface example's surface-aware variant.

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes, on the field and on each part.

```ocaml title="text_field_tailwind.mlx"
module Description = Solidtype_heroui.Description
module Field_error = Solidtype_heroui.Field_error
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module Text_area = Solidtype_heroui.Text_area
module Text_field = Solidtype_heroui.Text_field

let make () =
  <Text_field class_="w-full max-w-64 gap-2" name="handle">
    <Label class_="text-xs font-medium tracking-wide uppercase">"Handle"</Label>
    <Input class_="rounded-full" placeholder="@ada" />
  </Text_field>
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

- `.textfield` - Root container with minimal styling (`flex flex-col gap-1`)
- `.textfield--full-width` - Full width modifier

Child components ([Label](label.md),
[Input](input.md), [TextArea](text-area.md),
[Description](description.md),
[FieldError](field-error.md)) have their own CSS classes and
styling. See their respective documentation for customization options.

### Interactive States

TextField automatically manages these data attributes based on its state:

- **Invalid**: `[data-invalid="true"]` - Automatically hides the description
  slot when invalid
- **Disabled**: `[data-disabled="true"]` - Applied when `is_disabled` is true
- **Read-only**: `[data-readonly="true"]` - Applied when `is_read_only` is true
- **Required**: `[data-required="true"]` - Applied when `is_required` is true;
  marks the label

## API Reference

Each prop beside the name HeroUI's React component gives it.

### TextField

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `variant` | `variant` | `` [ `primary \| `secondary ] `` | | Its input's variant, where the input sets none |
| `fullWidth` | `full_width` | `bool` | `false` | Whether the text field should take full width of its container |
| `value` | `value` | `string` | | Current value (controlled) |
| `defaultValue` | `default_value` | `string` | | Default value (uncontrolled) |
| `onChange` | `on_change` | `string -> unit` | | Handler called when the value changes |
| `isRequired` | `is_required` | `bool` | `false` | Whether user input is required before form submission |
| `isInvalid` | `is_invalid` | `bool` | `false` | Whether the value is invalid |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether the input is disabled |
| `isReadOnly` | `is_read_only` | `bool` | `false` | Whether the input can be selected but not changed |
| `name` | `name` | `string` | | Name of the input element, for HTML form submission |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `onBlur` | `on_blur` | `Dom.focusEvent -> unit` | | Called once focus leaves it for an element outside it |
| `children` | `children` | elements | | Child components (Label, Input, etc.) or a function of its state |
| `validate`, `validationBehavior` | — | | | Left out: it is invalid as `is_invalid` says; see Validation |
| `validationErrors` | — | | | A form's: `Form`'s `validation_errors` |

### Composition Components

TextField works with these separate components, used directly within it:

- **Label** - Field label component
- **Input** - Single-line text input
- **TextArea** - Multi-line text input
- **Description** - Helper text component
- **FieldError** - Validation error message
