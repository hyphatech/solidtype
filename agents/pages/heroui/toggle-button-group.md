# ToggleButtonGroup

Groups multiple ToggleButtons into a unified control, allowing users to select one or multiple options.

Original HeroUI documentation: [ToggleButtonGroup](https://heroui.com/en/docs/react/components/toggle-button-group).

## Usage

```ocaml title="toggle_button_group_usage.mlx"
module Toggle_button = Solidtype_heroui.Toggle_button
module Toggle_button_group = Solidtype_heroui.Toggle_button_group
module Gravity = Solidtype_gravity_icons

let make () =
  <Toggle_button_group selection_mode=`multiple aria_label="Text formatting">
    <Toggle_button is_icon_only=true aria_label="Bold" id="bold">
      <Gravity.Bold />
    </Toggle_button>
    <Toggle_button is_icon_only=true aria_label="Italic" id="italic">
      <Toggle_button_group.Separator /> <Gravity.Italic />
    </Toggle_button>
    <Toggle_button is_icon_only=true aria_label="Underline" id="underline">
      <Toggle_button_group.Separator /> <Gravity.Underline />
    </Toggle_button>
    <Toggle_button
      is_icon_only=true aria_label="Strikethrough" id="strikethrough">
      <Toggle_button_group.Separator /> <Gravity.Strikethrough />
    </Toggle_button>
  </Toggle_button_group>
```

## Parity

The same HeroUI ToggleButtonGroup twice, under the same props: in solidtype on
the left, in React on the right. Below them, every attribute of the two
groups: a marked row is one they disagree on, and a dimmed row is a
framework's own, which no style reads. The group's `role`, and React Aria's
`aria-orientation` and `aria-disabled`, are the two accessible patterns
above; `tabindex` is Kobalte's one Tab stop.

The marked rows are Kobalte's: its group is a `group` that takes the focus Tab gives it and passes it to a button, where React Aria's group of one choice is a `radiogroup` of the same buttons.

## Anatomy

```ocaml
<Toggle_button_group selection_mode=`multiple aria_label="Steps">
  <Toggle_button id="first">"First"</Toggle_button>
  <Toggle_button id="second">
    <Toggle_button_group.Separator /> "Second"
  </Toggle_button>
  <Toggle_button id="third">
    <Toggle_button_group.Separator /> "Third"
  </Toggle_button>
</Toggle_button_group>
```

## Examples

### Sizes

```ocaml title="toggle_button_group_sizes.mlx"
module Toggle_button = Solidtype_heroui.Toggle_button
module Toggle_button_group = Solidtype_heroui.Toggle_button_group
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex flex-col gap-4">
    <Toggle_button_group size=`sm aria_label="Alignment">
      <Toggle_button id="left">
        <Gravity.Text_align_left /> "Left"
      </Toggle_button>
      <Toggle_button id="center">
        <Toggle_button_group.Separator /> <Gravity.Text_align_center /> "Center"
      </Toggle_button>
      <Toggle_button id="right">
        <Toggle_button_group.Separator /> <Gravity.Text_align_right /> "Right"
      </Toggle_button>
    </Toggle_button_group>
    <Toggle_button_group size=`md aria_label="Alignment">
      <Toggle_button id="left">
        <Gravity.Text_align_left /> "Left"
      </Toggle_button>
      <Toggle_button id="center">
        <Toggle_button_group.Separator /> <Gravity.Text_align_center /> "Center"
      </Toggle_button>
      <Toggle_button id="right">
        <Toggle_button_group.Separator /> <Gravity.Text_align_right /> "Right"
      </Toggle_button>
    </Toggle_button_group>
    <Toggle_button_group size=`lg aria_label="Alignment">
      <Toggle_button id="left">
        <Gravity.Text_align_left /> "Left"
      </Toggle_button>
      <Toggle_button id="center">
        <Toggle_button_group.Separator /> <Gravity.Text_align_center /> "Center"
      </Toggle_button>
      <Toggle_button id="right">
        <Toggle_button_group.Separator /> <Gravity.Text_align_right /> "Right"
      </Toggle_button>
    </Toggle_button_group>
  </div>
```

### Orientation

```ocaml title="toggle_button_group_orientation.mlx"
module Toggle_button = Solidtype_heroui.Toggle_button
module Toggle_button_group = Solidtype_heroui.Toggle_button_group
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex gap-8">
    <Toggle_button_group aria_label="Alignment">
      <Toggle_button id="left">
        <Gravity.Text_align_left /> "Left"
      </Toggle_button>
      <Toggle_button id="center">
        <Toggle_button_group.Separator /> <Gravity.Text_align_center /> "Center"
      </Toggle_button>
      <Toggle_button id="right">
        <Toggle_button_group.Separator /> <Gravity.Text_align_right /> "Right"
      </Toggle_button>
    </Toggle_button_group>
    <Toggle_button_group orientation=`vertical aria_label="Alignment">
      <Toggle_button id="left">
        <Gravity.Text_align_left /> "Left"
      </Toggle_button>
      <Toggle_button id="center">
        <Toggle_button_group.Separator /> <Gravity.Text_align_center /> "Center"
      </Toggle_button>
      <Toggle_button id="right">
        <Toggle_button_group.Separator /> <Gravity.Text_align_right /> "Right"
      </Toggle_button>
    </Toggle_button_group>
  </div>
```

### Full Width

```ocaml title="toggle_button_group_full_width.mlx"
module Toggle_button = Solidtype_heroui.Toggle_button
module Toggle_button_group = Solidtype_heroui.Toggle_button_group
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="w-full max-w-md">
    <Toggle_button_group full_width=true aria_label="Alignment">
      <Toggle_button id="left">
        <Gravity.Text_align_left /> "Left"
      </Toggle_button>
      <Toggle_button id="center">
        <Toggle_button_group.Separator /> <Gravity.Text_align_center /> "Center"
      </Toggle_button>
      <Toggle_button id="right">
        <Toggle_button_group.Separator /> <Gravity.Text_align_right /> "Right"
      </Toggle_button>
    </Toggle_button_group>
  </div>
```

### Disabled

`is_disabled` disables all buttons in the group; a button's own
`is_disabled=false` keeps it enabled.

```ocaml title="toggle_button_group_disabled.mlx"
module Toggle_button = Solidtype_heroui.Toggle_button
module Toggle_button_group = Solidtype_heroui.Toggle_button_group
module Gravity = Solidtype_gravity_icons

(* A disabled group, and one whose third button keeps itself enabled, as
   HeroUI documents. *)
let make () =
  <div class_="flex flex-col gap-4">
    <Toggle_button_group is_disabled=true aria_label="Alignment">
      <Toggle_button id="left">
        <Gravity.Text_align_left /> "Left"
      </Toggle_button>
      <Toggle_button id="center">
        <Toggle_button_group.Separator /> <Gravity.Text_align_center /> "Center"
      </Toggle_button>
      <Toggle_button id="right">
        <Toggle_button_group.Separator /> <Gravity.Text_align_right /> "Right"
      </Toggle_button>
    </Toggle_button_group>
    <Toggle_button_group is_disabled=true aria_label="Alignment">
      <Toggle_button id="left">
        <Gravity.Text_align_left /> "Left"
      </Toggle_button>
      <Toggle_button id="center">
        <Toggle_button_group.Separator /> <Gravity.Text_align_center /> "Center"
      </Toggle_button>
      <Toggle_button id="right" is_disabled=false>
        <Toggle_button_group.Separator /> <Gravity.Text_align_right /> "Right"
      </Toggle_button>
    </Toggle_button_group>
  </div>
```

### Without Separator

Simply omit the `<Toggle_button_group.Separator />` component from your buttons.

```ocaml title="toggle_button_group_without_separator.mlx"
module Toggle_button = Solidtype_heroui.Toggle_button
module Toggle_button_group = Solidtype_heroui.Toggle_button_group
module Gravity = Solidtype_gravity_icons

let make () =
  <Toggle_button_group aria_label="Alignment">
    <Toggle_button id="left"><Gravity.Text_align_left /> "Left"</Toggle_button>
    <Toggle_button id="center">
      <Gravity.Text_align_center /> "Center"
    </Toggle_button>
    <Toggle_button id="right">
      <Gravity.Text_align_right /> "Right"
    </Toggle_button>
  </Toggle_button_group>
```

### Detached

Use `is_detached` to separate buttons with gaps instead of connecting them.

```ocaml title="toggle_button_group_detached.mlx"
module Toggle_button = Solidtype_heroui.Toggle_button
module Toggle_button_group = Solidtype_heroui.Toggle_button_group
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex flex-col gap-4">
    <Toggle_button_group is_detached=true aria_label="Alignment">
      <Toggle_button id="left">
        <Gravity.Text_align_left /> "Left"
      </Toggle_button>
      <Toggle_button id="center">
        <Gravity.Text_align_center /> "Center"
      </Toggle_button>
      <Toggle_button id="right">
        <Gravity.Text_align_right /> "Right"
      </Toggle_button>
    </Toggle_button_group>
    <Toggle_button_group
      is_detached=true orientation=`vertical aria_label="Alignment">
      <Toggle_button id="left">
        <Gravity.Text_align_left /> "Left"
      </Toggle_button>
      <Toggle_button id="center">
        <Gravity.Text_align_center /> "Center"
      </Toggle_button>
      <Toggle_button id="right">
        <Gravity.Text_align_right /> "Right"
      </Toggle_button>
    </Toggle_button_group>
  </div>
```

### Selection Mode

Use `` selection_mode=`single `` for mutually exclusive choices or
`` selection_mode=`multiple `` for independent toggles.

```ocaml title="toggle_button_group_selection_mode.mlx"
module Toggle_button = Solidtype_heroui.Toggle_button
module Toggle_button_group = Solidtype_heroui.Toggle_button_group
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex flex-col gap-6">
    <div class_="flex flex-col gap-2">
      <span class_="text-sm text-muted">"Single selection"</span>
      <Toggle_button_group
        default_selected_keys=[| "center" |]
        selection_mode=`single
        aria_label="Alignment">
        <Toggle_button id="left">
          <Gravity.Text_align_left /> "Left"
        </Toggle_button>
        <Toggle_button id="center">
          <Toggle_button_group.Separator />
          <Gravity.Text_align_center />
          "Center"
        </Toggle_button>
        <Toggle_button id="right">
          <Toggle_button_group.Separator /> <Gravity.Text_align_right /> "Right"
        </Toggle_button>
      </Toggle_button_group>
    </div>
    <div class_="flex flex-col gap-2">
      <span class_="text-sm text-muted">"Multiple selection"</span>
      <Toggle_button_group
        default_selected_keys=[| "bold"; "underline" |]
        selection_mode=`multiple
        aria_label="Text formatting">
        <Toggle_button is_icon_only=true aria_label="Bold" id="bold">
          <Gravity.Bold />
        </Toggle_button>
        <Toggle_button is_icon_only=true aria_label="Italic" id="italic">
          <Toggle_button_group.Separator /> <Gravity.Italic />
        </Toggle_button>
        <Toggle_button is_icon_only=true aria_label="Underline" id="underline">
          <Toggle_button_group.Separator /> <Gravity.Underline />
        </Toggle_button>
        <Toggle_button
          is_icon_only=true aria_label="Strikethrough" id="strikethrough">
          <Toggle_button_group.Separator /> <Gravity.Strikethrough />
        </Toggle_button>
      </Toggle_button_group>
    </div>
  </div>
```

### Controlled

`selected_keys` controls the selected buttons' ids, and `on_selection_change`
is called with them all.

```ocaml title="toggle_button_group_controlled.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Toggle_button = Solidtype_heroui.Toggle_button
module Toggle_button_group = Solidtype_heroui.Toggle_button_group
module Gravity = Solidtype_gravity_icons

let make () =
  let keys, set_keys = S.create_signal [| "bold" |] in
  <div class_="flex flex-col gap-4">
    <Toggle_button_group
      selected_keys=(S.get keys)
      selection_mode=`multiple
      on_selection_change=(S.set set_keys)
      aria_label="Text formatting">
      <Toggle_button is_icon_only=true aria_label="Bold" id="bold">
        <Gravity.Bold />
      </Toggle_button>
      <Toggle_button is_icon_only=true aria_label="Italic" id="italic">
        <Toggle_button_group.Separator /> <Gravity.Italic />
      </Toggle_button>
      <Toggle_button is_icon_only=true aria_label="Underline" id="underline">
        <Toggle_button_group.Separator /> <Gravity.Underline />
      </Toggle_button>
      <Toggle_button
        is_icon_only=true aria_label="Strikethrough" id="strikethrough">
        <Toggle_button_group.Separator /> <Gravity.Strikethrough />
      </Toggle_button>
    </Toggle_button_group>
    <p class_="text-sm text-muted">
      "Selected: "
      <span class_="font-medium">
        (Jsx.string
           (match S.get keys with
           | [||] -> "None"
           | ks -> String.concat ", " (Array.to_list ks)))
      </span>
    </p>
  </div>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes, on the group and on each button.

```ocaml title="toggle_button_group_tailwind.mlx"
module Toggle_button = Solidtype_heroui.Toggle_button
module Toggle_button_group = Solidtype_heroui.Toggle_button_group
module Gravity = Solidtype_gravity_icons

let make () =
  <Toggle_button_group
    class_="gap-1 rounded-full bg-surface-secondary p-1"
    default_selected_keys=[| "left" |]
    is_detached=true
    aria_label="Alignment">
    <Toggle_button class_="rounded-full" id="left">
      <Gravity.Text_align_left /> "Left"
    </Toggle_button>
    <Toggle_button class_="rounded-full" id="center">
      <Gravity.Text_align_center /> "Center"
    </Toggle_button>
    <Toggle_button class_="rounded-full" id="right">
      <Gravity.Text_align_right /> "Right"
    </Toggle_button>
  </Toggle_button_group>
```

### Global CSS

To customize the ToggleButtonGroup component classes, you can use the
`@layer components` directive.
[Learn more](https://tailwindcss.com/docs/adding-custom-styles#adding-component-classes).

```css
@layer components {
  .toggle-button-group {
    @apply gap-1;
  }

  .toggle-button-group__separator {
    @apply opacity-25;
  }
}
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

#### Base & Layout Classes

- `.toggle-button-group` - Base container styles
- `.toggle-button-group--horizontal` - Horizontal orientation
- `.toggle-button-group--vertical` - Vertical orientation
- `.toggle-button-group--full-width` - Full width modifier
- `.toggle-button-group__separator` - Separator element between buttons

#### Modifier Classes

- `.toggle-button-group--detached` - Detached mode (separated buttons with
  gaps)

### Interactive States

- **Disabled**: `[data-disabled="true"]` on the group, while it is disabled

Each button shows its own state, as [ToggleButton](toggle-button.md)
does.

## API Reference

Each prop beside the name HeroUI's React component gives it.

### ToggleButtonGroup

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `selectionMode` | `selection_mode` | `` [ `single \| `multiple ] `` | `` `single `` | Whether one or multiple buttons can be selected |
| `selectedKeys` | `selected_keys` | `string array` | | Controlled selection state |
| `defaultSelectedKeys` | `default_selected_keys` | `string array` | `[\|\|]` | Default selected keys (uncontrolled) |
| `onSelectionChange` | `on_selection_change` | `string array -> unit` | | Called when selection changes |
| `disallowEmptySelection` | `disallow_empty_selection` | `bool` | `false` | Prevents clearing all selections |
| `orientation` | `orientation` | `` [ `horizontal \| `vertical ] `` | `` `horizontal `` | Layout direction |
| `size` | `size` | `` [ `sm \| `md \| `lg ] `` | | Size propagated to child ToggleButtons |
| `isDetached` | `is_detached` | `bool` | `false` | Whether buttons are visually separated with gaps |
| `fullWidth` | `full_width` | `bool` | `false` | Whether the group fills available width |
| `isDisabled` | `is_disabled` | `bool` | `false` | Disables all buttons in the group |
| `aria-label` | `aria_label` | `string` | | Accessibility label for the group |
| `aria-labelledby` | `aria_labelledby` | `string` | | ID of elements that label the group |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | Its ToggleButtons |

### ToggleButtonGroup.Separator

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's class |

## Note

- Every `Toggle_button` inside the group takes its `size` and `is_disabled`
- Each `Toggle_button` must have a unique `id` that corresponds to the keys
  used in `selected_keys` / `default_selected_keys`
- `is_disabled` disables all child buttons; individual buttons can override
  this by setting `is_disabled=false`
- The component automatically handles border radius between buttons
- Add `<Toggle_button_group.Separator />` inside each `Toggle_button` (except
  the first) to show dividers between buttons
- Use `disallow_empty_selection` with `` selection_mode=`single `` to ensure
  one option is always selected
- The group is one Tab stop; the arrow keys move between its buttons
