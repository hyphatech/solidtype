# Tooltip

Displays informative text when users hover over or focus on an element.

A `Button` inside a tooltip is its trigger; wrap anything else in
`Tooltip.Trigger`.

Original HeroUI documentation: [Tooltip](https://heroui.com/en/docs/react/components/tooltip).

## Usage

```ocaml title="tooltip_usage.mlx"
module Button = Solidtype_heroui.Button
module Tooltip = Solidtype_heroui.Tooltip
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex items-center gap-4">
    <Tooltip delay_ms=0.>
      <Button variant=`secondary>"Hover me"</Button>
      <Tooltip.Content><p>"This is a tooltip"</p></Tooltip.Content>
    </Tooltip>
    <Tooltip delay_ms=0.>
      <Button is_icon_only=true aria_label="More information" variant=`tertiary>
        <Gravity.Circle_info />
      </Button>
      <Tooltip.Content><p>"More information"</p></Tooltip.Content>
    </Tooltip>
  </div>
```

## Parity

The same HeroUI Tooltip twice, under the same props, each open as it
starts and as its own trigger is hovered: in solidtype on the left, in React
on the right. Below them, every attribute of each trigger:
a marked row is one they disagree on, and a dimmed row is a framework's own,
which no style reads.

## Anatomy

```ocaml
<Tooltip>
  <Tooltip.Trigger><Button>"Hover for tooltip"</Button></Tooltip.Trigger>
  <Tooltip.Content>
    <Tooltip.Arrow />
    "Helpful information about this element"
  </Tooltip.Content>
</Tooltip>
```

## Examples

### Placement

```ocaml title="tooltip_placement.mlx"
module Button = Solidtype_heroui.Button
module Tooltip = Solidtype_heroui.Tooltip

let make () =
  <div class_="grid grid-cols-3 gap-4">
    <div />
    <Tooltip delay_ms=0.>
      <Button class_="w-full" variant=`tertiary>"Top"</Button>
      <Tooltip.Content show_arrow=true placement=`top>
        <Tooltip.Arrow /> <p>"Top placement"</p>
      </Tooltip.Content>
    </Tooltip>
    <div />
    <Tooltip delay_ms=0.>
      <Button class_="w-full" variant=`tertiary>"Left"</Button>
      <Tooltip.Content show_arrow=true placement=`left>
        <Tooltip.Arrow /> <p>"Left placement"</p>
      </Tooltip.Content>
    </Tooltip>
    <div class_="flex items-center justify-center">
      <span class_="text-sm text-muted">"Hover buttons"</span>
    </div>
    <Tooltip delay_ms=0.>
      <Button class_="w-full" variant=`tertiary>"Right"</Button>
      <Tooltip.Content show_arrow=true placement=`right>
        <Tooltip.Arrow /> <p>"Right placement"</p>
      </Tooltip.Content>
    </Tooltip>
    <div />
    <Tooltip delay_ms=0.>
      <Button class_="w-full" variant=`tertiary>"Bottom"</Button>
      <Tooltip.Content show_arrow=true placement=`bottom>
        <Tooltip.Arrow /> <p>"Bottom placement"</p>
      </Tooltip.Content>
    </Tooltip>
    <div />
  </div>
```

### With Arrow

```ocaml title="tooltip_with_arrow.mlx"
module Button = Solidtype_heroui.Button
module Tooltip = Solidtype_heroui.Tooltip

let make () =
  <div class_="flex items-center gap-4">
    <Tooltip delay_ms=0.>
      <Button variant=`secondary>"With Arrow"</Button>
      <Tooltip.Content show_arrow=true>
        <Tooltip.Arrow /> <p>"Tooltip with arrow indicator"</p>
      </Tooltip.Content>
    </Tooltip>
    <Tooltip delay_ms=0.>
      <Button variant=`primary>"Custom Offset"</Button>
      <Tooltip.Content show_arrow=true offset=12.>
        <Tooltip.Arrow /> <p>"Custom offset from trigger"</p>
      </Tooltip.Content>
    </Tooltip>
  </div>
```

### Custom Triggers

```ocaml title="tooltip_custom_triggers.mlx"
module Avatar = Solidtype_heroui.Avatar
module Chip = Solidtype_heroui.Chip
module Tooltip = Solidtype_heroui.Tooltip
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex items-center gap-6">
    <Tooltip delay_ms=0.>
      <Tooltip.Trigger aria_label="User avatar">
        <Avatar size=`sm>
          <Avatar.Image
            alt="Jane Doe"
            src="https://img.heroui.chat/image/avatar?w=400&h=400&u=4"
          />
          <Avatar.Fallback>"JD"</Avatar.Fallback>
        </Avatar>
      </Tooltip.Trigger>
      <Tooltip.Content show_arrow=true>
        <Tooltip.Arrow />
        <div class_="flex flex-col gap-0 py-1">
          <p class_="font-semibold">"Jane Doe"</p>
          <p class_="text-xs text-muted">"jane@example.com"</p>
        </div>
      </Tooltip.Content>
    </Tooltip>
    <Tooltip delay_ms=0.>
      <Tooltip.Trigger aria_label="Status chip">
        <Chip color=`success>
          <Gravity.Circle_check_fill width="12" />
          <Chip.Label>"Active"</Chip.Label>
        </Chip>
      </Tooltip.Trigger>
      <Tooltip.Content class_="flex items-center gap-1.5">
        <span class_="relative flex size-2">
          <span
            class_="absolute inline-flex h-full w-full animate-ping \
                    rounded-full bg-success opacity-75"
          />
          <span class_="relative inline-flex size-2 rounded-full bg-success" />
        </span>
        <p>"Jane is currently online"</p>
      </Tooltip.Content>
    </Tooltip>
    <Tooltip delay_ms=0.>
      <Tooltip.Trigger aria_label="Info icon">
        <div class_="rounded-full bg-accent-soft p-2">
          <Gravity.Circle_question class_="text-accent-soft-foreground" />
        </div>
      </Tooltip.Trigger>
      <Tooltip.Content show_arrow=true>
        <Tooltip.Arrow />
        <div class_="max-w-xs px-1 py-1.5">
          <p class_="mb-1 font-semibold">"Help Information"</p>
          <p class_="text-sm text-muted">
            "This is a helpful tooltip with more detailed information about \
             this feature."
          </p>
        </div>
      </Tooltip.Content>
    </Tooltip>
  </div>
```

### Render Function

`as_` overrides the default DOM element with a function of its props and its
state, as [Composition](composition.md#custom-dom-element)
shows.

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes.

```ocaml title="tooltip_tailwind.mlx"
module Button = Solidtype_heroui.Button
module Tooltip = Solidtype_heroui.Tooltip

let make () =
  <Tooltip delay_ms=0.>
    <Button variant=`secondary>"Share link"</Button>
    <Tooltip.Content
      class_="rounded-lg border border-border/80 bg-surface px-2.5 py-1 \
              text-xs text-foreground shadow-sm">
      <p>"Copied to clipboard"</p>
    </Tooltip.Content>
  </Tooltip>
```

### Global CSS

To customize the Tooltip component classes, you can use the
`@layer components` directive.
[Learn more](https://tailwindcss.com/docs/adding-custom-styles#adding-component-classes).

```css
@layer components {
  .tooltip {
    @apply rounded-xl shadow-lg;
  }

  .tooltip__trigger {
    @apply cursor-help;
  }
}
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### Global Delay Configuration

The default theme sets the opening delay to `1500ms` and the closing delay to
`500ms`. Override these CSS variables in your global stylesheet:

```css
:root {
  --tooltip-delay: 1500ms;
  --tooltip-close-delay: 500ms;
}

.light, [data-theme="light"] {
  --tooltip-delay: 1200ms;
}

.dark, [data-theme="dark"] {
  --tooltip-close-delay: 300ms;
}
```

Values support CSS time units such as `ms` and `s`. The `delay_ms` and
`close_delay_ms` props on an individual Tooltip override these global
settings.

### CSS Classes

- `.tooltip` - Base tooltip styles with animations
- `.tooltip__trigger` - Trigger element styles

### Interactive States

The component supports animation states:

- **Entering**: `[data-entering="true"]` - Applied during tooltip appearance
- **Exiting**: `[data-exiting="true"]` - Applied during tooltip disappearance
- **Placement**: `[data-placement="*"]` - Applied based on tooltip position

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Tooltip

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `delay` | `delay_ms` | `float` | `--tooltip-delay`, else 1500 | Delay in milliseconds before showing tooltip; configured globally with `--tooltip-delay` |
| `closeDelay` | `close_delay_ms` | `float` | `--tooltip-close-delay`, else 500 | Delay in milliseconds before hiding tooltip; configured globally with `--tooltip-close-delay` |
| `trigger` | `trigger` | `` `hover `` \| `` `focus `` | `` `hover `` | How the tooltip is triggered |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether the tooltip is disabled |
| `isOpen` | `is_open` | `bool` | | Whether it is open (controlled) |
| `defaultOpen` | `default_open` | `bool` | `false` | Whether it is open at first (uncontrolled) |
| `onOpenChange` | `on_open_change` | `bool -> unit` | | Handler called as it opens or closes |
| `children` | `children` | elements | | Trigger element and content |

### Tooltip.Content

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `placement` | `placement` | `` `top `` \| `` `bottom `` \| `` `left `` \| `` `right `` | `` `top `` | Placement of the tooltip |
| `offset` | `offset` | `float` | 3, 7 with the arrow | Distance from the trigger element |
| `showArrow` | `show_arrow` | `bool` | `false` | Whether to show the arrow indicator |
| `shouldFlip` | `should_flip` | `bool` | `true` | Whether it moves to the other side where there is no room |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | Content to display in the tooltip |

### Tooltip.Trigger

| React | solidtype | Type | Description |
|---|---|---|---|
| `aria-label` | `aria_label` | `string` | Its name, where its children give none |
| `className` | `class_` | `string` | Added after HeroUI's classes |
| `children` | `children` | elements | Element that triggers the tooltip |

### Tooltip.Arrow

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Additional CSS classes |
| `children` | `children` | elements | Custom arrow element |

## Note

- The tooltip opens as its trigger is hovered, after `delay_ms`, or reached by
  the keyboard, and closes after `close_delay_ms` once the pointer leaves, or
  on Escape
- The tooltip stays open while the pointer crosses from the trigger to it
- `Tooltip.Trigger` is reached by Tab; a button inside it is not nested in
  another button
