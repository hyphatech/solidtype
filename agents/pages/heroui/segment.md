# Segment

A segmented control, for a few options of which one is selected.

A segmented control: a few options, one always selected. The arrow keys move
the selection, as in a radio group. Its look is a stylesheet the library
ships, imported as [Theming](theming.md#setup) shows.

## Usage

```ocaml title="segment_usage.mlx"
module Segment = Solidtype_heroui.Segment

let make () =
  <Segment aria_label="View" default_selected_key="dashboard">
    <Segment.Item id="dashboard">"Dashboard"</Segment.Item>
    <Segment.Item id="analytics">"Analytics"</Segment.Item>
    <Segment.Item id="reports">"Reports"</Segment.Item>
    <Segment.Item id="settings">"Settings"</Segment.Item>
  </Segment>
```

## Anatomy

```ocaml
<Segment aria_label="Billing">
  <Segment.Item id="monthly">"Monthly"</Segment.Item>
  <Segment.Item id="yearly"><Segment.Separator /> "Yearly"</Segment.Item>
</Segment>
```

## Examples

### Ghost

A transparent track, and the selected option in the accent colour.

```ocaml title="segment_ghost.mlx"
module Segment = Solidtype_heroui.Segment

let make () =
  <Segment
    variant=`ghost size=`sm aria_label="Period" default_selected_key="mtd">
    <Segment.Item id="1w">"1W"</Segment.Item>
    <Segment.Item id="4w">"4W"</Segment.Item>
    <Segment.Item id="1y">"1Y"</Segment.Item>
    <Segment.Item id="mtd">"MTD"</Segment.Item>
    <Segment.Item id="qtd">"QTD"</Segment.Item>
    <Segment.Item id="ytd">"YTD"</Segment.Item>
    <Segment.Item id="all">"ALL"</Segment.Item>
  </Segment>
```

### With Separators

A `Segment.Separator` goes inside an option, before its label.

```ocaml title="segment_with_separators.mlx"
module Segment = Solidtype_heroui.Segment

let make () =
  <Segment aria_label="View" default_selected_key="dashboard">
    <Segment.Item id="dashboard">
      <Segment.Separator /> "Dashboard"
    </Segment.Item>
    <Segment.Item id="analytics">
      <Segment.Separator /> "Analytics"
    </Segment.Item>
    <Segment.Item id="reports"><Segment.Separator /> "Reports"</Segment.Item>
    <Segment.Item id="settings"><Segment.Separator /> "Settings"</Segment.Item>
  </Segment>
```

### Controlled

`selected_key` controls the selected option's id, and `on_selection_change` is
called with each option chosen.

```ocaml title="segment_controlled.mlx"
module S = Solidtype.Solid
module Segment = Solidtype_heroui.Segment

let make () =
  let selected, set_selected = S.create_signal "analytics" in
  <div class_="flex flex-col items-start gap-4">
    <Segment
      aria_label="View"
      selected_key=(S.get selected)
      on_selection_change=(fun key -> S.set set_selected key)>
      <Segment.Item id="dashboard">"Dashboard"</Segment.Item>
      <Segment.Item id="analytics">"Analytics"</Segment.Item>
      <Segment.Item id="reports">"Reports"</Segment.Item>
      <Segment.Item id="settings">"Settings"</Segment.Item>
    </Segment>
    <p class_="text-sm text-muted">
      "Selected: " (Solidtype.Jsx.string (S.get selected))
    </p>
  </div>
```

### Disabled

```ocaml title="segment_disabled.mlx"
module Segment = Solidtype_heroui.Segment

let make () =
  <Segment is_disabled=true aria_label="View" default_selected_key="dashboard">
    <Segment.Item id="dashboard">"Dashboard"</Segment.Item>
    <Segment.Item id="analytics">"Analytics"</Segment.Item>
    <Segment.Item id="reports">"Reports"</Segment.Item>
    <Segment.Item id="settings">"Settings"</Segment.Item>
  </Segment>
```

### Disabled Item

```ocaml title="segment_disabled_item.mlx"
module Segment = Solidtype_heroui.Segment

let make () =
  <Segment aria_label="View" default_selected_key="dashboard">
    <Segment.Item id="dashboard">"Dashboard"</Segment.Item>
    <Segment.Item id="analytics" is_disabled=true>"Analytics"</Segment.Item>
    <Segment.Item id="reports">"Reports"</Segment.Item>
  </Segment>
```

### Sizes

```ocaml title="segment_sizes.mlx"
module For = Solidtype.For
module Segment = Solidtype_heroui.Segment

let make () =
  <div class_="flex flex-col items-start gap-6">
    <For each=[| `sm; `md; `lg |]>
      (fun size _ ->
        <Segment size aria_label="View" default_selected_key="dashboard">
          <Segment.Item id="dashboard">"Dashboard"</Segment.Item>
          <Segment.Item id="analytics">"Analytics"</Segment.Item>
          <Segment.Item id="reports">"Reports"</Segment.Item>
          <Segment.Item id="settings">"Settings"</Segment.Item>
        </Segment>)
    </For>
  </div>
```

### Theme Switcher

An option of an icon alone is named by its `aria_label`.

```ocaml title="segment_theme_switcher.mlx"
module Segment = Solidtype_heroui.Segment
module Gravity = Solidtype_gravity_icons

let make () =
  <Segment size=`sm aria_label="Theme" default_selected_key="system">
    <Segment.Item id="light" aria_label="Light"><Gravity.Sun /></Segment.Item>
    <Segment.Item id="dark" aria_label="Dark"><Gravity.Moon /></Segment.Item>
    <Segment.Item id="system" aria_label="System">
      <Gravity.Display />
    </Segment.Item>
  </Segment>
```

### Two Items

```ocaml title="segment_two_items.mlx"
module Segment = Solidtype_heroui.Segment

let make () =
  <Segment size=`sm aria_label="Billing" default_selected_key="monthly">
    <Segment.Item id="monthly">"Monthly"</Segment.Item>
    <Segment.Item id="yearly">"Yearly"</Segment.Item>
  </Segment>
```

### With Icons

```ocaml title="segment_with_icons.mlx"
module Segment = Solidtype_heroui.Segment
module Gravity = Solidtype_gravity_icons

let make () =
  <Segment aria_label="Section" default_selected_key="dashboard">
    <Segment.Item id="dashboard">
      <Gravity.Layout_cells_large /> "Dashboard"
    </Segment.Item>
    <Segment.Item id="analytics">
      <Gravity.Chart_column /> "Analytics"
    </Segment.Item>
    <Segment.Item id="team"><Gravity.Persons /> "Team"</Segment.Item>
    <Segment.Item id="settings"><Gravity.Gear /> "Settings"</Segment.Item>
  </Segment>
```

### Icon Expand

`Segment.Item.is_selected ()`, called in a component inside an option, is
whether that option is selected, read with `S.get`: here each label shows
only in the selected option.

```ocaml title="segment_icon_expand.mlx"
module S = Solidtype.Solid
module Segment = Solidtype_heroui.Segment
module Gravity = Solidtype_gravity_icons

(* An option's label, its width and opacity nothing while its option is not
   selected: a grid column that grows from none to the label's own width. *)
module Label = struct
  let%component make ~(text : string) () =
    let selected = Segment.Item.is_selected () in
    <span
      class_=("grid transition-[grid-template-columns,opacity] duration-200 \
               ease-out motion-reduce:transition-none "
             ^
             if S.get selected then "grid-cols-[1fr] opacity-100"
             else "grid-cols-[0fr] opacity-0")>
      <span
        class_=("min-w-0 overflow-hidden whitespace-nowrap \
                 transition-[padding] duration-200 ease-out \
                 motion-reduce:transition-none "
               ^ if S.get selected then "ps-1.5" else "ps-0")>
        (Solidtype.Jsx.string (S.get text))
      </span>
    </span>
end

let make () =
  <Segment
    variant=`ghost aria_label="Navigation" default_selected_key="meetings">
    <Segment.Item id="home" aria_label="Home" class_="gap-0">
      <Gravity.House /> <Label text="Home" />
    </Segment.Item>
    <Segment.Item id="chat" aria_label="Chat" class_="gap-0">
      <Gravity.Comment /> <Label text="Chat" />
    </Segment.Item>
    <Segment.Item id="meetings" aria_label="Meetings" class_="gap-0">
      <Gravity.Video /> <Label text="Meetings" />
    </Segment.Item>
    <Segment.Item id="inbox" aria_label="Inbox" class_="gap-0">
      <Gravity.Tray /> <Label text="Inbox" />
    </Segment.Item>
  </Segment>
```

## Styling Reference

### CSS Classes

- `.segment`, and its sizes `.segment--sm`, `.segment--md`, `.segment--lg`
- `.segment--ghost`
- `.segment__item`, its sizes `.segment__item--sm`, `.segment__item--md`,
  `.segment__item--lg`, and `.segment__item--ghost`
- `.segment__indicator`, and `.segment__indicator--ghost`
- `.segment__separator`

### Interactive States

On `.segment__item`:

- **Selected**: `[data-selected="true"]`
- **Hovered**: `[data-hovered="true"]`, which dims an option not selected
- **Focus visible**: `[data-focus-visible="true"]`
- **Disabled**: `[data-disabled="true"]`

And on `.segment`, `[data-disabled="true"]` while it is disabled.

## API Reference

Each prop beside its name in React's convention.

### Segment

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `variant` | `variant` | `` [ `default \| `ghost ] `` | `` `default `` | Visual style variant |
| `size` | `size` | `` [ `sm \| `md \| `lg ] `` | `` `md `` | Its size |
| `selectedKey` | `selected_key` | `string` | | The selected option's id (controlled) |
| `defaultSelectedKey` | `default_selected_key` | `string` | | The option selected at first (uncontrolled) |
| `onSelectionChange` | `on_selection_change` | `string -> unit` | | Called with each option chosen |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether every option is disabled |
| `name` | `name` | `string` | | Its radios' name in a form |
| `aria-label` | `aria_label` | `string` | | Its name |
| `aria-labelledby` | `aria_labelledby` | `string` | | The id of what names it |
| `className` | `class_` | `string` | | Added after its own classes |
| `children` | `children` | elements | | Its options |

### Segment.Item

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `id` | `id` | `string` | | Its key |
| `isDisabled` | `is_disabled` | `bool` | `false` | Whether it is disabled |
| `aria-label` | `aria_label` | `string` | | Its name, where its children give none |
| `className` | `class_` | `string` | | Added after its own classes |
| `children` | `children` | elements | | Its label; `Segment.Item.is_selected` in place of a render function |

### Segment.Separator

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after its own classes |
