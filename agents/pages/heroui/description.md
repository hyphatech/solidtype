# Description

Provides supplementary text for form fields and other components.

Original HeroUI documentation: [Description](https://heroui.com/en/docs/react/components/description).

## Usage

```ocaml title="description_usage.mlx"
module Description = Solidtype_heroui.Description
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label

let make () =
  <div class_="flex flex-col gap-1">
    <Label for_="email">"Email"</Label>
    <Input
      aria_describedby="email-description"
      class_="w-64"
      id="email"
      placeholder="you@example.com"
      type_="email"
    />
    <Description id="email-description">
      "We'll never share your email with anyone else."
    </Description>
  </div>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="description_tailwind.mlx"
module Description = Solidtype_heroui.Description
module Input = Solidtype_heroui.Input
module Label = Solidtype_heroui.Label

let make () =
  <div class_="flex w-64 flex-col gap-1">
    <Label for_="workspace-slug">"Workspace URL"</Label>
    <Input id="workspace-slug" placeholder="acme" type_="text" />
    <Description
      class_="leading-relaxed tracking-wide" id="workspace-slug-hint">
      "Lowercase letters and hyphens only. Used in app.heroui.com/acme"
    </Description>
  </div>
```

## Styling Reference

### CSS Classes

- `.description` - Base description styles with `muted` text color

## API Reference

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's classes |
| `children` | `children` | elements | The content of the description |

### Description.Slot

How a description renders inside a part, given its classes and its
children.

## Accessibility

The Description component enhances accessibility by:

- Describing what it is in: inside a [TextField](text-field.md)
  the field's input, inside a [RadioGroup](radio-group.md) the
  group, and inside a radio the radio's input
- Providing the `data-slot="description"` attribute
- Supporting proper text contrast ratios
