# ErrorMessage

An error message for non-form components such as a TagGroup.

It shows inside a [TagGroup](tag-group.md), which it
describes, and draws nothing elsewhere. A form field's error is a
[FieldError](field-error.md).

Original HeroUI documentation: [ErrorMessage](https://heroui.com/en/docs/react/components/error-message).

## Usage

```ocaml title="error_message_usage.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Description = Solidtype_heroui.Description
module Error_message = Solidtype_heroui.Error_message
module Label = Solidtype_heroui.Label
module Tag = Solidtype_heroui.Tag
module Tag_group = Solidtype_heroui.Tag_group

let make () =
  let selected, set_selected = S.create_signal [||] in
  <Tag_group
    selected_keys=(S.get selected)
    selection_mode=`multiple
    on_selection_change=(S.set set_selected)>
    <Label>"Required Categories"</Label>
    <Tag_group.List>
      <Tag id="news">"News"</Tag>
      <Tag id="travel">"Travel"</Tag>
      <Tag id="gaming">"Gaming"</Tag>
      <Tag id="shopping">"Shopping"</Tag>
    </Tag_group.List>
    <Description>"Select at least one category"</Description>
    <Error_message>
      (Jsx.string
         (if Array.length (S.get selected) = 0 then
            "Please select at least one category"
          else ""))
    </Error_message>
  </Tag_group>
```

## Anatomy

```ocaml
<Tag_group>
  <Label />
  <Tag_group.List> <Tag /> </Tag_group.List>
  <Description />
  <Error_message />
</Tag_group>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's class.

```ocaml title="error_message_custom_styles.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Description = Solidtype_heroui.Description
module Error_message = Solidtype_heroui.Error_message
module Label = Solidtype_heroui.Label
module Tag = Solidtype_heroui.Tag
module Tag_group = Solidtype_heroui.Tag_group

let make () =
  let selected, set_selected = S.create_signal [||] in
  <Tag_group
    class_="w-full max-w-xs gap-1.5"
    selected_keys=(S.get selected)
    selection_mode=`multiple
    on_selection_change=(S.set set_selected)>
    <Label>"Topics"</Label>
    <Tag_group.List>
      <Tag id="api">"API"</Tag>
      <Tag id="design">"Design"</Tag>
      <Tag id="docs">"Docs"</Tag>
    </Tag_group.List>
    <Description>"Pick at least one topic"</Description>
    <Error_message class_="font-medium text-danger">
      (Jsx.string
         (if Array.length (S.get selected) = 0 then "Choose at least one topic"
          else ""))
    </Error_message>
  </Tag_group>
```

## Styling Reference

### CSS Classes

- `.error-message` - Base error message styles with danger color
- `[slot="errorMessage"]` - The slot it fills

## API Reference

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's class |
| `children` | `children` | nodes | The error message content |

## Accessibility

- Its component's list is described by it, after its description.
