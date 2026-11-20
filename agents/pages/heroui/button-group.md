# ButtonGroup

Group related buttons together with consistent styling and spacing.

Original HeroUI documentation: [ButtonGroup](https://heroui.com/en/docs/react/components/button-group).

## Usage

HeroUI's examples, with HeroUI's icons from [`solidtype-gravity-icons`](../heroui.md#icons).

```ocaml title="button_group_usage.mlx"
module Button = Solidtype_heroui.Button
module Button_group = Solidtype_heroui.Button_group
module Chip = Solidtype_heroui.Chip
module Description = Solidtype_heroui.Description
module Dropdown = Solidtype_heroui.Dropdown
module Label = Solidtype_heroui.Label
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex flex-col items-start gap-6">
    <div class_="flex flex-col gap-2">
      <Button_group>
        <Button>"Merge pull request"</Button>
        <Dropdown>
          <Button is_icon_only=true aria_label="More options">
            <Button_group.Separator /> <Gravity.Chevron_down />
          </Button>
          <Dropdown.Popover class_="max-w-[290px]" placement=`bottom_end>
            <Dropdown.Menu>
              <Dropdown.Item
                class_="flex flex-col items-start gap-1"
                id="merge"
                text_value="Create a merge commit">
                <Label>"Create a merge commit"</Label>
                <Description>
                  "All commits from this branch will be added to the base \
                   branch"
                </Description>
              </Dropdown.Item>
              <Dropdown.Item
                class_="flex flex-col items-start gap-1"
                id="squash-and-merge"
                text_value="Squash and merge">
                <Label>"Squash and merge"</Label>
                <Description>
                  "The 14 commits from this branch will be combined into one \
                   commit in the base branch"
                </Description>
              </Dropdown.Item>
              <Dropdown.Item
                class_="flex flex-col items-start gap-1"
                id="rebase-and-merge"
                text_value="Rebase and merge">
                <Label>"Rebase and merge"</Label>
                <Description>
                  "The 14 commits from this branch will be rebased and added \
                   to the base branch"
                </Description>
              </Dropdown.Item>
            </Dropdown.Menu>
          </Dropdown.Popover>
        </Dropdown>
      </Button_group>
    </div>
    <div class_="flex flex-col gap-2">
      <div class_="flex flex-wrap gap-x-2 gap-y-4">
        <Button_group variant=`tertiary>
          <Button>
            <Gravity.Code_fork class_="size-3.5" />
            "Fork"
            <Chip color=`accent size=`sm variant=`soft>"24"</Chip>
          </Button>
          <Button is_icon_only=true aria_label="More fork options">
            <Button_group.Separator /> <Gravity.Chevron_down />
          </Button>
        </Button_group>
        <Button_group variant=`tertiary>
          <Button is_icon_only=true aria_label="Show QR code">
            <Gravity.Qr_code />
          </Button>
          <Button><Button_group.Separator /> "Scan to pay"</Button>
        </Button_group>
        <Button_group variant=`tertiary>
          <Button>
            <Gravity.Thumbs_up />
            <span class_="text-xs font-semibold">"2.4K"</span>
          </Button>
          <Button is_icon_only=true aria_label="Dislike">
            <Button_group.Separator /> <Gravity.Thumbs_down />
          </Button>
        </Button_group>
        <Button_group variant=`tertiary>
          <Button><Gravity.Star class_="size-3.5" /> "Star"</Button>
          <Button class_="px-2">
            <Button_group.Separator />
            <Chip color=`accent size=`sm variant=`soft>"104"</Chip>
          </Button>
        </Button_group>
        <Button_group variant=`tertiary>
          <Button><Gravity.Pin /> "Pinned"</Button>
          <Button is_icon_only=true aria_label="More pin options">
            <Button_group.Separator /> <Gravity.Chevron_down />
          </Button>
        </Button_group>
      </div>
    </div>
    <div class_="flex flex-col gap-2">
      <Button_group variant=`tertiary>
        <Button><Gravity.Chevron_left /> "Previous"</Button>
        <Button>
          <Button_group.Separator /> "Next" <Gravity.Chevron_right />
        </Button>
      </Button_group>
    </div>
    <div class_="flex flex-col gap-2">
      <Button_group variant=`tertiary>
        <Button><Gravity.Picture /> "Photos"</Button>
        <Button><Button_group.Separator /> <Gravity.Video /> "Videos"</Button>
        <Button is_icon_only=true aria_label="More options">
          <Button_group.Separator /> <Gravity.Ellipsis />
        </Button>
      </Button_group>
    </div>
    <div class_="flex flex-col gap-2">
      <Button_group variant=`tertiary>
        <Button>"Left"</Button>
        <Button><Button_group.Separator /> "Center"</Button>
        <Button><Button_group.Separator /> "Right"</Button>
      </Button_group>
    </div>
    <div class_="flex flex-col gap-2">
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
        <Button is_icon_only=true aria_label="Justify">
          <Button_group.Separator /> <Gravity.Text_align_justify />
        </Button>
      </Button_group>
    </div>
  </div>
```

## Parity

The same HeroUI ButtonGroup twice, under the same props: in solidtype on the
left, in React on the right. Below them, every attribute of the two groups:
a marked row is one they disagree on, and a dimmed row is a framework's own --
Solid's hydration key, React Aria's markers and the id it generates -- which no
style reads.

## Anatomy

```ocaml
<Button_group>
  <Button>"First"</Button>
  <Button><Button_group.Separator /> "Second"</Button>
  <Button><Button_group.Separator /> "Third"</Button>
</Button_group>
```

`Button_group` wraps several `Button`s together, applying consistent
styling, spacing and automatic border radius handling. It passes `size`,
`variant`, `is_disabled` and `full_width` to every button inside it.

## Examples

### Variants

```ocaml title="button_group_variants.mlx"
module Button = Solidtype_heroui.Button
module Button_group = Solidtype_heroui.Button_group

let group ~label ~variant =
  <div class_="flex flex-col gap-2">
    <p class_="text-sm text-muted">(Solidtype.Jsx.string label)</p>
    <Button_group variant>
      <Button>"First"</Button>
      <Button><Button_group.Separator /> "Second"</Button>
      <Button><Button_group.Separator /> "Third"</Button>
    </Button_group>
  </div>

let make () =
  <div class_="flex flex-col gap-6">
    (group ~label:"Primary" ~variant:`primary)
    (group ~label:"Secondary" ~variant:`secondary)
    (group ~label:"Tertiary" ~variant:`tertiary)
    (group ~label:"Outline" ~variant:`outline)
    (group ~label:"Ghost" ~variant:`ghost)
    (group ~label:"Danger" ~variant:`danger)
  </div>
```

### Sizes

```ocaml title="button_group_sizes.mlx"
module Button = Solidtype_heroui.Button
module Button_group = Solidtype_heroui.Button_group

let group ~label ~size =
  <div class_="flex flex-col items-start gap-2">
    <p class_="text-sm text-muted">(Solidtype.Jsx.string label)</p>
    <Button_group size variant=`secondary>
      <Button>"First"</Button>
      <Button><Button_group.Separator /> "Second"</Button>
      <Button><Button_group.Separator /> "Third"</Button>
    </Button_group>
  </div>

let make () =
  <div class_="flex flex-col gap-4">
    (group ~label:"Small" ~size:`sm)
    (group ~label:"Medium (default)" ~size:`md)
    (group ~label:"Large" ~size:`lg)
  </div>
```

### Orientation

`orientation` arranges the buttons horizontally or vertically.

```ocaml title="button_group_orientation.mlx"
module Button = Solidtype_heroui.Button
module Button_group = Solidtype_heroui.Button_group
module Gravity = Solidtype_gravity_icons

let group ~label ~orientation =
  <div class_="flex flex-col gap-2">
    <span class_="text-sm text-muted">(Solidtype.Jsx.string label)</span>
    <Button_group orientation variant=`tertiary>
      <Button is_icon_only=true aria_label="Align left">
        <Gravity.Text_align_left />
      </Button>
      <Button is_icon_only=true aria_label="Align center">
        <Button_group.Separator /> <Gravity.Text_align_center />
      </Button>
      <Button is_icon_only=true aria_label="Align right">
        <Button_group.Separator /> <Gravity.Text_align_right />
      </Button>
      <Button is_icon_only=true aria_label="Justify">
        <Button_group.Separator /> <Gravity.Text_align_justify />
      </Button>
    </Button_group>
  </div>

let make () =
  <div class_="flex items-start gap-8">
    (group ~label:"Horizontal" ~orientation:`horizontal)
    (group ~label:"Vertical" ~orientation:`vertical)
  </div>
```

### With Icons

```ocaml title="button_group_icons.mlx"
module Button = Solidtype_heroui.Button
module Button_group = Solidtype_heroui.Button_group
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="flex flex-col gap-6">
    <div class_="flex flex-col items-start gap-2">
      <p class_="text-sm text-muted">"With icons"</p>
      <Button_group variant=`secondary>
        <Button><Gravity.Globe /> "Search"</Button>
        <Button><Button_group.Separator /> <Gravity.Plus /> "Add"</Button>
        <Button>
          <Button_group.Separator /> <Gravity.Trash_bin /> "Delete"
        </Button>
      </Button_group>
    </div>
    <div class_="flex flex-col items-start gap-2">
      <p class_="text-sm text-muted">"Icon only buttons"</p>
      <Button_group variant=`tertiary>
        <Button is_icon_only=true aria_label="Search"><Gravity.Globe /></Button>
        <Button is_icon_only=true aria_label="Add">
          <Button_group.Separator /> <Gravity.Plus />
        </Button>
        <Button is_icon_only=true aria_label="Delete">
          <Button_group.Separator /> <Gravity.Trash_bin />
        </Button>
      </Button_group>
    </div>
  </div>
```

### Full Width

```ocaml title="button_group_full_width.mlx"
module Button = Solidtype_heroui.Button
module Button_group = Solidtype_heroui.Button_group
module Gravity = Solidtype_gravity_icons

let make () =
  <div class_="w-[400px] space-y-3">
    <Button_group full_width=true>
      <Button>"First"</Button>
      <Button><Button_group.Separator /> "Second"</Button>
      <Button><Button_group.Separator /> "Third"</Button>
    </Button_group>
    <Button_group full_width=true>
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
  </div>
```

### Disabled State

A button's own `is_disabled` overrides its group's.

```ocaml title="button_group_disabled.mlx"
module Button = Solidtype_heroui.Button
module Button_group = Solidtype_heroui.Button_group

let make () =
  <div class_="flex flex-col gap-6">
    <div class_="flex flex-col items-start gap-2">
      <p class_="text-sm text-muted">"All buttons disabled"</p>
      <Button_group is_disabled=true>
        <Button>"First"</Button>
        <Button><Button_group.Separator /> "Second"</Button>
        <Button><Button_group.Separator /> "Third"</Button>
      </Button_group>
    </div>
    <div class_="flex flex-col items-start gap-2">
      <p class_="text-sm text-muted">
        "Group disabled, but one button overrides"
      </p>
      <Button_group is_disabled=true>
        <Button>"First"</Button>
        <Button><Button_group.Separator /> "Second"</Button>
        <Button is_disabled=false>
          <Button_group.Separator /> "Third (enabled)"
        </Button>
      </Button_group>
    </div>
  </div>
```

### Without Separator

A button without a `Button_group.Separator` draws no line before it.

```ocaml title="button_group_without_separator.mlx"
module Button = Solidtype_heroui.Button
module Button_group = Solidtype_heroui.Button_group

let make () =
  <Button_group>
    <Button>"First"</Button> <Button>"Second"</Button> <Button>"Third"</Button>
  </Button_group>
```

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes, on the group and on each button.

```ocaml title="button_group_tailwind.mlx"
module Button = Solidtype_heroui.Button
module Button_group = Solidtype_heroui.Button_group
module Description = Solidtype_heroui.Description
module Dropdown = Solidtype_heroui.Dropdown
module Label = Solidtype_heroui.Label
module Gravity = Solidtype_gravity_icons

let make () =
  <Button_group>
    <Button class_="rounded-none bg-[#08872B] data-hovered:bg-[#0FBF3E]">
      "Merge pull request"
    </Button>
    <Dropdown>
      <Button
        is_icon_only=true
        aria_label="Merge options"
        class_="rounded-none bg-[#08872B] data-hovered:bg-[#0FBF3E]">
        <Button_group.Separator /> <Gravity.Chevron_down class_="size-4" />
      </Button>
      <Dropdown.Popover
        class_="max-w-[290px] rounded-none" placement=`bottom_end>
        <Dropdown.Menu>
          <Dropdown.Item
            class_="flex flex-col items-start gap-1 rounded-none"
            id="merge"
            text_value="Create a merge commit">
            <Label>"Create a merge commit"</Label>
            <Description>
              "All commits from this branch will be added to the base branch"
            </Description>
          </Dropdown.Item>
          <Dropdown.Item
            class_="flex flex-col items-start gap-1 rounded-none"
            id="squash-and-merge"
            text_value="Squash and merge">
            <Label>"Squash and merge"</Label>
            <Description>
              "The 14 commits from this branch will be combined into one \
               commit in the base branch"
            </Description>
          </Dropdown.Item>
          <Dropdown.Item
            class_="flex flex-col items-start gap-1 rounded-none"
            id="rebase-and-merge"
            text_value="Rebase and merge">
            <Label>"Rebase and merge"</Label>
            <Description>
              "The 14 commits from this branch will be rebased and added to \
               the base branch"
            </Description>
          </Dropdown.Item>
        </Dropdown.Menu>
      </Dropdown.Popover>
    </Dropdown>
  </Button_group>
```

### Global CSS

HeroUI's classes are global, so a stylesheet restyles every group, as with
HeroUI in React:

```css
@layer components {
  .button-group {
    @apply gap-2 rounded-lg;
  }

  .button-group__separator {
    @apply opacity-25;
  }
}
```

## Styling Reference

### CSS Classes

- `.button-group` - Base button group container
- `.button-group--horizontal`, `.button-group--vertical` - Orientations
- `.button-group--full-width` - Full width modifier
- `.button-group__separator` - Separator element between buttons

The group applies border radius to its buttons:

- The first button gets a rounded start edge
- The last button gets a rounded end edge
- Middle buttons have no border radius
- A single button gets full border radius on all edges

### Interactive States

- **Disabled**: `[data-disabled="true"]` on the group, while it is disabled

Each button shows its own state, as `Solidtype_heroui.Button` does.

## API Reference

Each prop beside the name HeroUI's React component gives it.

### ButtonGroup

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `variant` | `variant` | `` [ `primary \| `secondary \| `tertiary \| `outline \| `ghost \| `danger \| `danger_soft ] `` | | Visual style variant applied to all buttons in the group |
| `size` | `size` | `` [ `sm \| `md \| `lg ] `` | | Size applied to all buttons in the group |
| `orientation` | `orientation` | `` [ `horizontal \| `vertical ] `` | `` `horizontal `` | The orientation of the button group |
| `fullWidth` | `full_width` | `bool` | `false` | Whether the button group should take full width of its container |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether all buttons in the group are disabled (can be overridden on individual buttons) |
| `className` | `class_` | `string` | | Added after HeroUI's classes |
| `children` | `children` | elements | | Button components to group together |

### ButtonGroup.Separator

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after HeroUI's class |

## Note

- Every `Button` inside the group takes its `size`, `variant`, `is_disabled`
  and `full_width`, a Dropdown's trigger too
- A button's own prop overrides the group's: `is_disabled=false` keeps it
  enabled in a disabled group
- Add `<Button_group.Separator />` inside each button but the first to show
  dividers between buttons
- Buttons in a group have their pressed scale removed for a more cohesive
  appearance
