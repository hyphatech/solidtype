# ToggleButton

An interactive toggle control for on/off or selected/unselected states.

Inside a [ToggleButtonGroup](toggle-button-group.md) it is
the group's button of its `id`.

Original HeroUI documentation: [ToggleButton](https://heroui.com/en/docs/react/components/toggle-button).

## Usage

```ocaml title="toggle_button_usage.mlx"
module Toggle_button = Solidtype_heroui.Toggle_button
module Gravity = Solidtype_gravity_icons

let make () = <Toggle_button><Gravity.Heart /> "Like"</Toggle_button>
```

## Parity

The same HeroUI ToggleButton twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of the two buttons:
a marked row is one they disagree on, and a dimmed row is a framework's own,
which no style reads. React Aria writes `tabindex="0"` on the button, which a
button has anyway; Kobalte marks a button that is on with an empty
`data-pressed`, which HeroUI's styles, reading `data-pressed="true"` for a
press, never match.

## Examples

### Variants

```ocaml title="toggle_button_variants.mlx"
module Toggle_button = Solidtype_heroui.Toggle_button
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex items-center gap-3">
    <Toggle_button><Gravity.Heart /> "Default"</Toggle_button>
    <Toggle_button variant=`ghost><Gravity.Heart /> "Ghost"</Toggle_button>
  </div>
```

### Icon Only

An icon alone is named by `aria_label`.

```ocaml title="toggle_button_icon_only.mlx"
module Toggle_button = Solidtype_heroui.Toggle_button
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex items-center gap-3">
    <Toggle_button is_icon_only=true aria_label="Like">
      <Gravity.Heart />
    </Toggle_button>
    <Toggle_button is_icon_only=true aria_label="Bookmark" variant=`ghost>
      <Gravity.Bookmark />
    </Toggle_button>
  </div>
```

### Sizes

```ocaml title="toggle_button_sizes.mlx"
module Toggle_button = Solidtype_heroui.Toggle_button
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex flex-col gap-6">
    <div class_="flex items-center gap-3">
      <Toggle_button size=`sm><Gravity.Heart /> "Small"</Toggle_button>
      <Toggle_button size=`md><Gravity.Heart /> "Medium"</Toggle_button>
      <Toggle_button size=`lg><Gravity.Heart /> "Large"</Toggle_button>
    </div>
    <div class_="flex items-center gap-3">
      <Toggle_button is_icon_only=true aria_label="Like" size=`sm>
        <Gravity.Heart />
      </Toggle_button>
      <Toggle_button is_icon_only=true aria_label="Like" size=`md>
        <Gravity.Heart />
      </Toggle_button>
      <Toggle_button is_icon_only=true aria_label="Like" size=`lg>
        <Gravity.Heart />
      </Toggle_button>
    </div>
  </div>
```

### Disabled

```ocaml title="toggle_button_disabled.mlx"
module Toggle_button = Solidtype_heroui.Toggle_button
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex items-center gap-3">
    <Toggle_button is_disabled=true><Gravity.Heart /> "Like"</Toggle_button>
    <Toggle_button default_selected=true is_disabled=true>
      <Gravity.Heart_fill /> "Like"
    </Toggle_button>
  </div>
```

### Controlled

`is_selected` controls its state, and `on_change` is called with the new one.
Its content may also be a function of its state, `s.is_selected`.

```ocaml title="toggle_button_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Toggle_button = Solidtype_heroui.Toggle_button
module Gravity = Solidtype_gravity_icons

(* The button's state is the page's signal, which its content reads too, as
   React's render prop reads the button's. *)
let make () =
  let selected, set_selected = S.create_signal false in
  <div class_="flex flex-col gap-4">
    <Toggle_button is_selected=(S.get selected) on_change=(S.set set_selected)>
      (if S.get selected then <Gravity.Heart_fill /> else <Gravity.Heart />)
      (Jsx.string (if S.get selected then "Liked" else "Like"))
    </Toggle_button>
    <p class_="text-sm text-muted">
      "Status: "
      <span class_="font-medium">
        (Jsx.string (if S.get selected then "Selected" else "Not selected"))
      </span>
    </p>
  </div>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="toggle_button_tailwind.mlx"
module Toggle_button = Solidtype_heroui.Toggle_button
module Gravity = Solidtype_gravity_icons

let make () =
  <Toggle_button
    class_="gap-2 rounded-full border border-border/80 bg-surface px-4 \
            text-foreground shadow-sm data-[selected=true]:border-accent/30 \
            data-[selected=true]:bg-accent-soft \
            data-[selected=true]:text-accent-soft-foreground \
            [&_svg]:text-muted data-[selected=true]:[&_svg]:text-accent">
    <Gravity.Heart /> "Save article"
  </Toggle_button>
```

### Global CSS

To customize the ToggleButton component classes, you can use the
`@layer components` directive.
[Learn more](https://tailwindcss.com/docs/adding-custom-styles#adding-component-classes).

```css
@layer components {
  .toggle-button {
    @apply bg-purple-500 text-white;
  }

  .toggle-button--icon-only {
    @apply rounded-lg;
  }
}
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

#### Base & Size Classes

- `.toggle-button` - Base toggle button styles
- `.toggle-button--sm` - Small size variant
- `.toggle-button--md` - Medium size variant (default)
- `.toggle-button--lg` - Large size variant

#### Variant Classes

- `.toggle-button--default` - Default variant with filled background
- `.toggle-button--ghost` - Ghost variant with transparent background

#### Modifier Classes

- `.toggle-button--icon-only` - Icon-only toggle button
- `.toggle-button--icon-only.toggle-button--sm` - Small icon-only
- `.toggle-button--icon-only.toggle-button--lg` - Large icon-only

### Interactive States

The toggle button supports both CSS pseudo-classes and data attributes for
flexibility:

- **Selected**: `[data-selected="true"]` (accent background and foreground)
- **Hover**: `:hover` or `[data-hovered="true"]`
- **Active/Pressed**: `:active` or `[data-pressed="true"]` (includes scale
  transform)
- **Focus**: `:focus-visible` or `[data-focus-visible="true"]` (shows focus
  ring)
- **Disabled**: `:disabled` or `[data-disabled="true"]` (reduced opacity, no
  pointer events)

## API Reference

Each prop beside the name HeroUI's React component gives it.

### ToggleButton

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `variant` | `variant` | `` [ `default \| `ghost ] `` | `` `default `` | Visual style variant |
| `size` | `size` | `` [ `sm \| `md \| `lg ] `` | `` `md ``, or its group's | Size of the toggle button |
| `isIconOnly` | `is_icon_only` | `bool` | `false` | Whether the button contains only an icon |
| `id` | `id` | `string` | | Its key in a group |
| `isSelected` | `is_selected` | `bool` | | Controlled selected state |
| `defaultSelected` | `default_selected` | `bool` | `false` | Default selected state (uncontrolled) |
| `onChange` | `on_change` | `bool -> unit` | | Handler called when selection changes |
| `isDisabled` | `is_disabled` | `bool` | `false`, or its group's | Whether the toggle button is disabled |
| `onPress` | `on_click` | `Dom.mouseEvent -> unit` | | Handler called when the button is clicked |
| `aria-label` | `aria_label` | `string` | | Its name, where it shows an icon alone |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements, or a function of its state | | Button content or render function |

### Render Props

When its children are a function, it is given these values, each read where
Solid tracks it:

| React | solidtype | Description |
|---|---|---|
| `isSelected` | `is_selected` | Whether the button is currently selected |
| `isPressed` | `is_pressed` | Whether the button is currently pressed |
| `isHovered` | `is_hovered` | Whether the button is hovered |
| `isFocused` | `is_focused` | Whether the button is focused |
| `isFocusVisible` | `is_focus_visible` | Whether the button should show focus indicator |
| `isDisabled` | `is_disabled` | Whether the button is disabled |
