# Label

Renders an accessible label associated with form controls.

Inside a [TextField](text-field.md) or a
[Radio Group](radio-group.md) it names the field; the
[Switch](switch.md), [Checkbox](checkbox.md)
and Radio Group pages show it in its fields.

Original HeroUI documentation: [Label](https://heroui.com/en/docs/react/components/label).

## Usage

```ocaml title="label_usage.mlx"
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label

let make () =
  <div class_="flex flex-col gap-1">
    <Label for_="name">"Name"</Label>
    <Input class_="w-64" id="name" placeholder="Enter your name" type_="text" />
  </div>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="label_tailwind.mlx"
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label

let make () =
  <div class_="flex flex-col gap-1.5">
    <Label
      class_="text-xs font-semibold tracking-wide text-accent uppercase"
      for_="repo">
      "Repository"
    </Label>
    <Input class_="w-64 bg-field" id="repo" placeholder="heroui/react" />
  </div>
```

### Global CSS

To customize the Label component classes, you can use the `@layer components`
directive.
[Learn more](https://tailwindcss.com/docs/adding-custom-styles#adding-component-classes).

```css
@layer components {
  .label {
    @apply font-semibold;
  }
}
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

- `.label` - Base label styles with text styling
- `.label--required` or `[data-required="true"] > .label` - Shows required
  asterisk indicator
- `.label--disabled` or `[data-disabled="true"] .label` - Disabled state
  styling
- `.label--invalid` or `[data-invalid="true"] .label` or
  `[aria-invalid="true"] .label` - Invalid state styling (danger/red text
  color)

The required asterisk is not shown on a group's label (`role="group"`,
`role="radiogroup"` or `role="checkboxgroup"`) or inside a radio or a
checkbox (`data-slot="radio"` or `data-slot="checkbox"`), so a required group
shows one asterisk.

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Label

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's classes |
| `children` | `children` | elements | The content of the label |
| `isRequired` | `is_required` | `bool` | Whether to display a required indicator |
| `isDisabled` | `is_disabled` | `bool` | Whether the label is in a disabled state |
| `isInvalid` | `is_invalid` | `bool` | Whether the label is in an invalid state |

### Label.Slot

How a label renders inside a part, given its classes and its children:
`Switch.Content` and `Checkbox.Content` render it as a `<span>`, and
`Radio_group` as the label that names the group.

## Accessibility

- Renders a native `<label>` element, or the field's own label inside a
  `Text_field` or a `Radio_group`, which names its control
- Clicking the label focuses or activates the associated form control
- Communicates required and invalid states to screen readers through its
  field
