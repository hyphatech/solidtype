# CloseButton

Button component for closing dialogs, modals, or dismissing content.

Original HeroUI documentation: [CloseButton](https://heroui.com/en/docs/react/components/close-button).

## Usage

```ocaml title="close_button_usage.mlx"
module Close_button = Solidtype_heroui.Close_button

let make () = <Close_button />
```

## Parity

The same HeroUI CloseButton twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of the two elements:
a marked row is one they disagree on, and a dimmed row is a framework's own --
Solid's hydration key, React Aria's markers and the id it generates -- which no
style reads. Hover, focus and press them to see the state each sets.

## Examples

### Interactive

```ocaml title="close_button_interactive.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Close_button = Solidtype_heroui.Close_button

let make () =
  let count, set_count = S.create_signal 0 in
  let times () = string_of_int (S.get count) ^ " times" in
  <div class_="flex flex-col items-center justify-center gap-4">
    <Close_button
      aria_label=("Close (clicked " ^ times () ^ ")")
      on_click=(fun _ -> S.set set_count (S.get count + 1))
    />
    <span class_="text-sm text-muted">
      (Jsx.string ("Clicked: " ^ times ()))
    </span>
  </div>
```

### With Custom Icon

Its children take the place of the default close icon.

```ocaml title="close_button_custom_icon.mlx"
module Close_button = Solidtype_heroui.Close_button
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex items-center gap-4">
    <div class_="flex flex-col items-center gap-2">
      <Close_button><Gravity.Circle_xmark /></Close_button>
      <span class_="text-xs text-muted">"Custom Icon"</span>
    </div>
    <div class_="flex flex-col items-center gap-2">
      <Close_button><Gravity.Xmark /></Close_button>
      <span class_="text-xs text-muted">"Alternative Icon"</span>
    </div>
  </div>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="close_button_tailwind.mlx"
module Close_button = Solidtype_heroui.Close_button

let make () =
  <Close_button
    aria_label="Close"
    class_="size-8 rounded-full bg-default text-muted hover:bg-default-hover \
            hover:text-foreground active:scale-95"
  />
```

### Global CSS

HeroUI's classes are global, so a stylesheet restyles every close button, as
with HeroUI in React:

```css
@layer components {
  .close-button {
    @apply bg-red-100 text-red-800 hover:bg-red-200;
  }

  .close-button--custom {
    @apply rounded-full border-2 border-red-300;
  }
}
```

## Styling Reference

### CSS Classes

- `.close-button` - Base component styles
- `.close-button--default` - Default variant

### Interactive States

The component supports both CSS pseudo-classes and data attributes for
flexibility, set as a [`Button`](button.md#interactive-states)'s
are:

- **Hover**: `:hover` or `[data-hovered="true"]`
- **Active/Pressed**: `:active` or `[data-pressed="true"]`
- **Focus**: `:focus-visible` or `[data-focus-visible="true"]`
- **Disabled**: `:disabled` or `[data-disabled="true"]`

## API Reference

Each prop beside the name HeroUI's React component gives it.

### CloseButton

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `variant` | `variant` | `` [ `default ] `` | `` `default `` | Visual variant of the button |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether the button is disabled |
| `aria-label` | `aria_label` | `string` | `"Close"` | Accessible label for screen readers |
| `onPress` | `on_click` | `Dom.mouseEvent -> unit` | | Handler called when the button is pressed, by mouse, touch or keyboard |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements, or a function of `state` | the close icon | Content to display (defaults to close icon) |
