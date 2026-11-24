# Toolbar

A container for interactive controls with arrow key navigation.

Original HeroUI documentation: [Toolbar](https://heroui.com/en/docs/react/components/toolbar).

## Usage

```ocaml title="toolbar_usage.mlx"
module Button = Solidtype_heroui.Button
module Button_group = Solidtype_heroui.Button_group
module Separator = Solidtype_heroui.Separator
module Toggle_button = Solidtype_heroui.Toggle_button
module Toggle_button_group = Solidtype_heroui.Toggle_button_group
module Toolbar = Solidtype_heroui.Toolbar
module Gravity = Solidtype_gravity_icons

let make () =
  <Toolbar aria_label="Text formatting">
    <Toggle_button_group aria_label="Text style" selection_mode=`multiple>
      <Toggle_button is_icon_only=true aria_label="Bold" id="bold">
        <Gravity.Bold />
      </Toggle_button>
      <Toggle_button is_icon_only=true aria_label="Italic" id="italic">
        <Toggle_button_group.Separator /> <Gravity.Italic />
      </Toggle_button>
      <Toggle_button is_icon_only=true aria_label="Underline" id="underline">
        <Toggle_button_group.Separator /> <Gravity.Underline />
      </Toggle_button>
    </Toggle_button_group>
    <Separator />
    <Button_group variant=`tertiary>
      <Button is_icon_only=true aria_label="Copy"><Gravity.Copy /></Button>
      <Button is_icon_only=true aria_label="Cut">
        <Button_group.Separator /> <Gravity.Scissors />
      </Button>
    </Button_group>
  </Toolbar>
```

## Parity

The same HeroUI Toolbar twice, under the same props: in solidtype on the left,
in React on the right. Below them, every attribute of the two toolbars: a
marked row is one they disagree on, and a dimmed row is a framework's own,
which no style reads.

## Keys

The arrows of its orientation move the focus between its stops, what Tab
reaches inside it, the page's direction read for the horizontal ones, never
past either end. A toggle group is one stop, whose own arrows move among its
buttons. A `Separator` inside the toolbar runs across it, and a
`Button_group` or `Toggle_button_group` along it, unless either gives its
own orientation.

## Examples

### Vertical

```ocaml title="toolbar_vertical.mlx"
module Button = Solidtype_heroui.Button
module Button_group = Solidtype_heroui.Button_group
module Separator = Solidtype_heroui.Separator
module Toggle_button = Solidtype_heroui.Toggle_button
module Toggle_button_group = Solidtype_heroui.Toggle_button_group
module Toolbar = Solidtype_heroui.Toolbar
module Gravity = Solidtype_gravity_icons

let make () =
  <Toolbar aria_label="Tools" orientation=`vertical>
    <Toggle_button_group aria_label="Text style" selection_mode=`multiple>
      <Toggle_button is_icon_only=true aria_label="Bold" id="bold">
        <Gravity.Bold />
      </Toggle_button>
      <Toggle_button is_icon_only=true aria_label="Italic" id="italic">
        <Toggle_button_group.Separator /> <Gravity.Italic />
      </Toggle_button>
      <Toggle_button is_icon_only=true aria_label="Underline" id="underline">
        <Toggle_button_group.Separator /> <Gravity.Underline />
      </Toggle_button>
    </Toggle_button_group>
    <Separator />
    <Button_group variant=`tertiary>
      <Button is_icon_only=true aria_label="Undo">
        <Gravity.Arrow_uturn_ccw_left />
      </Button>
      <Button is_icon_only=true aria_label="Redo">
        <Button_group.Separator /> <Gravity.Arrow_uturn_cw_right />
      </Button>
    </Button_group>
  </Toolbar>
```

### Attached

```ocaml title="toolbar_attached.mlx"
module Button = Solidtype_heroui.Button
module Button_group = Solidtype_heroui.Button_group
module Separator = Solidtype_heroui.Separator
module Toggle_button = Solidtype_heroui.Toggle_button
module Toggle_button_group = Solidtype_heroui.Toggle_button_group
module Toolbar = Solidtype_heroui.Toolbar
module Gravity = Solidtype_gravity_icons

let make () =
  <Toolbar is_attached=true aria_label="Text formatting">
    <Toggle_button_group aria_label="Text style" selection_mode=`multiple>
      <Toggle_button is_icon_only=true aria_label="Bold" id="bold">
        <Gravity.Bold />
      </Toggle_button>
      <Toggle_button is_icon_only=true aria_label="Italic" id="italic">
        <Toggle_button_group.Separator /> <Gravity.Italic />
      </Toggle_button>
      <Toggle_button is_icon_only=true aria_label="Underline" id="underline">
        <Toggle_button_group.Separator /> <Gravity.Underline />
      </Toggle_button>
    </Toggle_button_group>
    <Separator />
    <Button_group variant=`tertiary>
      <Button is_icon_only=true aria_label="Copy"><Gravity.Copy /></Button>
      <Button is_icon_only=true aria_label="Cut">
        <Button_group.Separator /> <Gravity.Scissors />
      </Button>
    </Button_group>
  </Toolbar>
```

### With ButtonGroup

```ocaml title="toolbar_with_button_group.mlx"
module Button = Solidtype_heroui.Button
module Button_group = Solidtype_heroui.Button_group
module Separator = Solidtype_heroui.Separator
module Toggle_button = Solidtype_heroui.Toggle_button
module Toggle_button_group = Solidtype_heroui.Toggle_button_group
module Toolbar = Solidtype_heroui.Toolbar
module Gravity = Solidtype_gravity_icons

let make () =
  <Toolbar aria_label="Editor toolbar">
    <Button_group variant=`tertiary>
      <Button><Gravity.Arrow_uturn_ccw_left /> "Undo"</Button>
      <Button>
        <Button_group.Separator /> <Gravity.Arrow_uturn_cw_right /> "Redo"
      </Button>
    </Button_group>
    <Separator />
    <Toggle_button_group aria_label="Text style" selection_mode=`multiple>
      <Toggle_button is_icon_only=true aria_label="Bold" id="bold">
        <Gravity.Bold />
      </Toggle_button>
      <Toggle_button is_icon_only=true aria_label="Italic" id="italic">
        <Toggle_button_group.Separator /> <Gravity.Italic />
      </Toggle_button>
      <Toggle_button is_icon_only=true aria_label="Underline" id="underline">
        <Toggle_button_group.Separator /> <Gravity.Underline />
      </Toggle_button>
    </Toggle_button_group>
    <Separator />
    <Button_group variant=`tertiary>
      <Button is_icon_only=true aria_label="Align left">
        <Gravity.Text_align_left />
      </Button>
      <Button is_icon_only=true aria_label="Align center">
        <Button_group.Separator /> <Gravity.Text_align_center />
      </Button>
      <Button is_icon_only=true aria_label="Align right">
        <Button_group.Separator /> <Gravity.Text_align_right />
      </Button>
    </Button_group>
  </Toolbar>
```

## Customization

### Tailwind CSS

```ocaml title="toolbar_tailwind.mlx"
module Toggle_button = Solidtype_heroui.Toggle_button
module Toggle_button_group = Solidtype_heroui.Toggle_button_group
module Toolbar = Solidtype_heroui.Toolbar
module Gravity = Solidtype_gravity_icons

let toggle_class =
  "rounded-lg data-[selected=true]:bg-accent \
   data-[selected=true]:text-accent-foreground"

let make () =
  <Toolbar
    aria_label="Formatting toolbar"
    class_="gap-1 rounded-xl border border-border/80 bg-surface-secondary p-1.5">
    <Toggle_button_group
      aria_label="Text style" class_="gap-0.5" selection_mode=`multiple>
      <Toggle_button
        is_icon_only=true aria_label="Bold" class_=toggle_class id="bold">
        <Gravity.Bold />
      </Toggle_button>
      <Toggle_button
        is_icon_only=true aria_label="Italic" class_=toggle_class id="italic">
        <Gravity.Italic />
      </Toggle_button>
      <Toggle_button
        is_icon_only=true
        aria_label="Underline"
        class_=toggle_class
        id="underline">
        <Gravity.Underline />
      </Toggle_button>
    </Toggle_button_group>
  </Toolbar>
```

### Global CSS

```css
@layer components {
  .toolbar {
    @apply gap-4 rounded-lg bg-surface p-3;
  }
}
```

## Styling Reference

### CSS Classes

- `.toolbar` - Base container
- `.toolbar--horizontal` - Horizontal orientation (default)
- `.toolbar--vertical` - Vertical orientation
- `.toolbar--attached` - Attached variant with surface background and full rounding

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Toolbar

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `isAttached` | `is_attached` | `bool` | `false` | Whether the toolbar has a surface background with full rounding |
| `orientation` | `orientation` | `` [ `horizontal \| `vertical ] `` | `` `horizontal `` | The orientation of the toolbar |
| `aria-label` | `aria_label` | `string` | | An accessible label for the toolbar |
| `aria-labelledby` | `aria_labelledby` | `string` | | The id of an element that labels the toolbar |
| `children` | `children` | elements, or a function of its state | | Its controls |
| `className` | `class_` | `string` | | Added after HeroUI's classes |

### Render Props

| React | solidtype | Type | Description |
|---|---|---|---|
| `orientation` | `orientation` | `` [ `horizontal \| `vertical ] S.accessor `` | The current orientation of the toolbar |
