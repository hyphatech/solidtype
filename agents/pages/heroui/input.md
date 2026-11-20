# Input

Primitive single-line text input component that accepts standard HTML attributes.

For validation, labels, and error messages, see
[TextField](text-field.md): inside one, an input takes the
field's value, state, label and description.

Original HeroUI documentation: [Input](https://heroui.com/en/docs/react/components/input).

## Usage

```ocaml title="input_usage.mlx"
module Input = Solidtype_heroui.Input

let make () =
  <Input class_="w-64" placeholder="Enter your name" aria_label="Name" />
```

## Examples

### Variants

The Input component supports two visual variants:

- **`` `primary ``** (default) - Standard styling with shadow, suitable for
  most use cases
- **`` `secondary ``** - Lower emphasis variant without shadow, suitable for
  use in Surface components

```ocaml title="input_variants.mlx"
module Input = Solidtype_heroui.Input

let make () =
  <div class_="flex w-64 flex-col gap-4">
    <Input placeholder="Primary input" aria_label="Primary" variant=`primary />
    <Input
      placeholder="Secondary input" aria_label="Secondary" variant=`secondary
    />
  </div>
```

### Full Width

```ocaml title="input_full_width.mlx"
module Input = Solidtype_heroui.Input

let make () =
  <div class_="w-[400px] space-y-3">
    <Input
      full_width=true placeholder="Full width input" aria_label="Full width"
    />
  </div>
```

### Input Types

```ocaml title="input_types.mlx"
module Input = Solidtype_heroui.Input

let make () =
  <div class_="flex w-64 flex-col gap-3">
    <Input type_="text" placeholder="Enter text" aria_label="Text" />
    <Input type_="email" placeholder="name@example.org" aria_label="Email" />
    <Input type_="password" placeholder="Enter password" aria_label="Password"
    />
    <Input type_="number" placeholder="0" aria_label="Number" />
    <Input type_="url" placeholder="https://example.org" aria_label="URL" />
  </div>
```

### Controlled

Alone, an input is an `<input>`: its value is its `value`, and its changes are its `on_input`.

```ocaml title="input_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Input = Solidtype_heroui.Input

external target : Dom.inputEvent -> Dom.htmlInputElement = "target" [@@mel.get]
external value_of : Dom.htmlInputElement -> string = "value" [@@mel.get]

let make () =
  let value, set_value = S.create_signal "heroui.com" in
  <div class_="flex w-64 flex-col gap-2">
    <Input
      aria_label="Domain"
      value=(S.get value)
      on_input=(fun e -> S.set set_value (value_of (target e)))
    />
    <span class_="px-1 text-sm text-muted">
      (Jsx.string ("https://" ^ S.get value))
    </span>
  </div>
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

- `.input` - Native input element styling
- `.input--primary`, `.input--secondary` - Variants
- `.input--full-width` - Full width modifier

### Interactive States

- **Hover**: `:hover` or `[data-hovered="true"]`
- **Focus Visible**: `:focus-visible` or `[data-focus-visible="true"]`
- **Invalid**: `[data-invalid="true"]` (also syncs with `aria_invalid`)
- **Disabled**: `:disabled` or `[data-disabled="true"]`

## API Reference

Input accepts all standard HTML `<input>` attributes plus the following:

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `variant` | `variant` | `` [ `primary \| `secondary ] `` | `` `primary ``, or its field's | Visual variant of the component. `` `primary `` is the default style with shadow. `` `secondary `` is a lower emphasis variant without shadow, suitable for use in surfaces |
| `fullWidth` | `full_width` | `bool` | `false` | Whether the input should take full width of its container |
| `className` | `class_` | `string` | | Added after HeroUI's classes |

For validation props like `is_invalid`, `is_required`, and error handling,
use [TextField](text-field.md) with Input as a child
component.
