# TextArea

Primitive multiline text input component that accepts standard HTML attributes.

Original HeroUI documentation: [TextArea](https://heroui.com/en/docs/react/components/text-area).

## Usage

```ocaml title="text_area_usage.mlx"
module Text_area = Solidtype_heroui.Text_area

let make () =
  <Text_area class_="w-64" placeholder="Write a message" aria_label="Message" />
```

For validation, labels, and error messages, see
[TextField](text-field.md).

## Examples

### Variants

The TextArea component supports two visual variants:

- **`` `primary ``** (default) - Standard styling with shadow, suitable for
  most use cases
- **`` `secondary ``** - Lower emphasis variant without shadow, suitable for
  use in Surface components

```ocaml title="text_area_variants.mlx"
module Text_area = Solidtype_heroui.Text_area

let make () =
  <div class_="flex w-64 flex-col gap-4">
    <Text_area placeholder="Primary" aria_label="Primary" variant=`primary />
    <Text_area placeholder="Secondary" aria_label="Secondary" variant=`secondary
    />
  </div>
```

### Rows and Resizing

```ocaml title="text_area_rows.mlx"
module Text_area = Solidtype_heroui.Text_area

let make () =
  <div class_="flex w-64 flex-col gap-4">
    <Text_area rows="2" placeholder="Two rows" aria_label="Two rows" />
    <Text_area
      rows="6"
      class_="resize-none"
      placeholder="Six rows, fixed"
      aria_label="Six rows"
    />
  </div>
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

- `.textarea` - Underlying `<textarea>` element styling
- `.textarea--primary`, `.textarea--secondary` - Variants
- `.textarea--full-width` - Full width modifier

### Interactive States

- **Hover**: `:hover` or `[data-hovered="true"]`
- **Focus Visible**: `:focus-visible` or `[data-focus-visible="true"]`
- **Invalid**: `[data-invalid="true"]`
- **Disabled**: `:disabled` or `[data-disabled="true"]`

## API Reference

TextArea accepts all standard HTML `<textarea>` attributes plus the following:

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `variant` | `variant` | `` [ `primary \| `secondary ] `` | `` `primary ``, or its field's | Visual variant of the component. `` `primary `` is the default style with shadow. `` `secondary `` is a lower emphasis variant without shadow, suitable for use in surfaces |
| `fullWidth` | `full_width` | `bool` | `false` | Whether the textarea should take full width of its container |
| `className` | `class_` | `string` | | Added after HeroUI's classes |

For validation props like `is_invalid`, `is_required`, and error handling, use
[TextField](text-field.md) with TextArea as a child component.
