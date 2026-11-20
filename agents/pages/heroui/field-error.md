# FieldError

Displays validation error messages for form fields.

It is used inside a field: outside one it raises `Invalid_argument`.

Original HeroUI documentation: [FieldError](https://heroui.com/en/docs/react/components/field-error).

## Usage

The FieldError component displays validation error messages for form fields.
It automatically appears when the parent field is marked as invalid.

```ocaml title="field_error_usage.mlx"
module S = Solidtype.Solid
module Field_error = Solidtype_heroui.Field_error
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module Text_field = Solidtype_heroui.Text_field

let make () =
  let value, set_value = S.create_signal "jr" in
  let invalid () =
    let n = String.length (S.get value) in
    n > 0 && n < 3
  in
  <Text_field
    class_="w-64"
    is_invalid=(invalid ())
    value=(S.get value)
    on_change=(S.set set_value)>
    <Label>"Username"</Label>
    <Input placeholder="Enter username" />
    <Field_error>"Username must be at least 3 characters"</Field_error>
  </Text_field>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="field_error_tailwind.mlx"
module S = Solidtype.Solid
module Field_error = Solidtype_heroui.Field_error
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label
module Text_field = Solidtype_heroui.Text_field

let make () =
  let value, set_value = S.create_signal "jr" in
  let invalid () =
    let n = String.length (S.get value) in
    n > 0 && n < 3
  in
  <Text_field
    class_="w-64"
    is_invalid=(invalid ())
    value=(S.get value)
    on_change=(S.set set_value)>
    <Label>"Handle"</Label>
    <Input class_="bg-field font-mono" placeholder="min. 3 characters" />
    <Field_error class_="font-medium">
      "Handle must be at least 3 characters"
    </Field_error>
  </Text_field>
```

## Styling Reference

### CSS Classes

- `.field-error` - Base error styles with danger color
- Only shows when the `data-visible` attribute is present
- Text is truncated with ellipsis for long messages

## API Reference

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's class |
| `children` | `children` | elements, or a function of `state` | Error message content or render function; a form's server error for the field, while it stands, shows instead |

## Accessibility

The FieldError component ensures accessibility by:

- Describing the field's input while it shows, so a screen reader reads the
  error with it
- Providing visual and programmatic error indication
- Automatically managing visibility based on validation state
