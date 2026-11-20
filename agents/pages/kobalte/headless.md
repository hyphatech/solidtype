# Headless components

Components Kobalte lacks, made as Kobalte makes its own, of its hooks, and Kobalte's own, fixed.

Kobalte 0.13 has no table, no colour swatch picker, no calendar, no tag
group. `solidtype-headless`
holds such components, made the way Kobalte makes its own: of Kobalte's
hooks, bound as `Solidtype_kobalte.Selection`, with no style. Each part is
the element it names, its roles, keys and state as attributes, state in
Kobalte's convention, present and empty, `data-selected=""`. A part takes
every attribute its element does -- a class, a style, a `ref`, a handler --
and passes them on after its own, so a style's attribute wins and a caller's
`ref` and handlers are called beside its own. Its state is a context a style
reads, as Kobalte's `useXContext` is.

[HeroUI's ports](../heroui.md) are built on them, as on Kobalte's own:
the port adds HeroUI's classes and React Aria's state, the component's
behaviour and accessibility stay its own.

```sh
opam install solidtype-headless
```

```lisp
(libraries solidtype solidtype-kobalte solidtype-headless melange.dom)
```

## Table

`Solidtype_headless.Table` is a `<table role="grid">` whose rows are a list
of Kobalte's: Tab reaches its focused row, the arrow keys, Home and End,
Page Up and Page Down and typing move between rows, Right and Left along a
row's cells, and Up and Down between a cell and the one above or below it.
Its rows are selected as `selection_mode` says, by a press, Space or Enter,
Shift and the platform's key extending and adding; a press that begins in a
control inside a row is the control's, and so is a key pressed in one, but
for the arrows, Home and End from a control that takes no text, which move
from its cell. A row's action, its `on_action` and
the root's `on_row_action`, and its link, `href`, run as React Aria runs them:
Enter, and a press where it cannot select, or a double press with `` `replace``.
A column that `allows_sorting` is
`aria-sort`, and pressed, or given Enter or Space, asks for its sort. A cell
given focus keeps it, and an arrow that reaches no cell moves nothing.
`Table.Load_more`, after the body's last row, asks for more rows as it comes
into view of what scrolls the table, never while they load. In a
`Table.Resizable_container` the columns are laid out at a fixed width, as each
column's `width` or `default_width` asks, and a `Table.Column_resizer` resizes
its column, dragged, or reached by Tab and stepped by the keys. Given a
`tree_column`, it is a tree grid: a `Table.Row` written among another's cells
is drawn after it while it is expanded, and the arrows expand, collapse and
climb it. `Table.Row.Context.use ()` and `Table.Cell.Context.use ()` are a
row's and a cell's state, for a part inside one and for a style's attribute
on one, which Solid reads inside it. A column `pinned` to the table's start
or end stays in view as the others scroll beneath it, and with
`sticky_header` the columns stay at the top of what scrolls the table. Given
`on_reorder`, a `Table.Drag_handle` drags its row, by Enter and the arrows or
a pointer, telling a reader each step as React Aria does, and `on_reorder` is
told where the rows landed.

```ocaml title="headless_table.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Table = Solidtype_headless.Table

type member = { id : string; name : string; role : string }

let members =
  [|
    { id = "1"; name = "Kate Moore"; role = "CEO" };
    { id = "2"; name = "John Smith"; role = "CTO" };
    { id = "3"; name = "Sara Johnson"; role = "CMO" };
  |]

(* The table's state, dressed by its attributes: a selected row is
   [data-selected], a focused row or cell takes the browser's focus. *)
let row_class =
  "cursor-default border-t border-gray-200 outline-none \
   data-[selected]:bg-blue-500/20 focus-visible:ring-2 \
   focus-visible:ring-blue-500"

let cell_class =
  "px-3 py-2 outline-none focus-visible:ring-2 focus-visible:ring-blue-500"

let make () =
  let selected, set_selected = S.create_signal [||] in
  <div class_="flex flex-col gap-3">
    <Table.Root
      aria_label="Team members"
      class_="w-full max-w-md border-collapse text-left text-sm"
      selection_mode=`multiple
      selected_keys=(S.get selected)
      on_selection_change=(S.set set_selected)>
      <Table.Header class_="text-gray-500">
        <Table.Column is_row_header=true class_=cell_class>"Name"</Table.Column>
        <Table.Column class_=cell_class>"Role"</Table.Column>
      </Table.Header>
      <Table.Body>
        <For each=members>
          (fun m _ ->
            <Table.Row id=m.id class_=row_class>
              <Table.Cell class_=cell_class>(Jsx.string m.name)</Table.Cell>
              <Table.Cell class_=cell_class>(Jsx.string m.role)</Table.Cell>
            </Table.Row>)
        </For>
      </Table.Body>
    </Table.Root>
    <p class_="text-sm">
      "Selected: "
      (Jsx.string
         (match S.get selected with
         | [||] -> "none"
         | keys -> String.concat ", " (Array.to_list keys)))
    </p>
  </div>
```

| Part | Element | What it adds |
|---|---|---|
| `Table.Resizable_container` | `<div>` | the width the columns share; `on_resize_start`, `on_resize`, `on_resize_end` |
| `Table.Root` | `<table role="grid">` | the list of rows, their selection: `selection_mode`, `selection_behavior`, `selected_keys`, `default_selected_keys`, `on_selection_change`, `disabled_keys`, `disallow_empty_selection`; its sort: `sort_descriptor`, `on_sort_change`; `on_row_action`; `sticky_header`, `data-sticky-header`; `data-pinned-start-detached`, `data-pinned-end-detached`; `on_reorder`, `reorder_messages` |
| `Table.Header` | `<thead>` and its `<tr>` | |
| `Table.Column` | `<th role="columnheader">` | `aria-colindex`; `id`, the column a sort names; `allows_sorting`, `aria-sort`; `is_row_header`, whose cells name their rows; `width`, `default_width`, `min_width`, `max_width`, `data-resizing`; `pinned`, `data-pinned`, `data-pinned-edge` |
| `Table.Column_resizer` | `<div role="presentation">` and a range `<input>` | `data-resizing`, `data-resizable-direction`; the input named `aria_label` and by its column |
| `Table.Body` | `<tbody>` | `empty_state`, a row across every column while it has none |
| `Table.Row` | `<tr role="row">` | `id`, its key; `on_action`, and its link, `href`, `target`, `rel`, `download`, `href_lang`, `ping`, `referrer_policy`; `aria-selected`, `data-selected`, `aria-disabled`, `data-disabled`; in a tree `aria-level`, `aria-posinset`, `aria-setsize`, `aria-expanded`, `data-expanded`, and the rows written inside it; `data-dragging`, `data-drop-target`, `data-drop-position` |
| `Table.Drag_handle` | `<button>` | drags its row; named `Drag` and its row's name; `data-dragging` |
| `Table.Cell` | `<td>`, `gridcell` or `rowheader` | `data-column-index`, `data-tree-column`, `data-pinned`, `data-pinned-edge` |
| `Table.Load_more` | an inert `<tr>` of no height holding the sentinel, and while loading a `<tr role="row">` across every column | `is_loading`, `on_load_more`, `scroll_offset`; its attributes are the loading row's |

## Data_grid

`Solidtype_headless.Data_grid` is a data grid's model, whoever dresses it:
`Data_grid.column` defines a column, its header, how a cell draws from its
row and, given one, how it sorts; `Data_grid.sorted` puts rows in the order
a sort asks for, and `Data_grid.reordered` puts the rows a drop moved where
they landed. HeroUI's [Data Grid](../heroui/data-grid.md) draws them on
its Table.

## Color_picker

`Solidtype_headless.Color_picker` is one colour its parts share, as React Aria's
`ColorPicker` is. It draws nothing. A `Color_area.Root`, `Color_slider.Root`,
`Color_field.Root`, `Color_channel_field.Root`, `Color_swatch` or
`Color_swatch_picker.Root` inside it, given no `value`, shows its colour and moves
it. A part's own `value` wins, and its own `on_change` is called too.

```ocaml title="headless_color_picker.mlx"
module S = Solidtype.Solid
module Picker = Solidtype_headless.Color_picker
module Swatch = Solidtype_headless.Color_swatch
module Field = Solidtype_headless.Color_field
module Colors = Solidtype_kobalte.Colors

let make () =
  <Picker default_value=(Colors.parse_color "#0485F7")>
    <div class_="flex items-center gap-2">
      <Swatch class_="size-8 rounded-sm" />
      <Field.Root class_="flex">
        <Field.Input
          aria_label="Hex" class_="w-24 rounded-sm border border-border px-2"
        />
      </Field.Root>
    </div>
  </Picker>
```

## Color_swatch_picker

`Solidtype_headless.Color_swatch_picker` is a `<div role="listbox">` of
colours, a list of Kobalte's, each `<div role="option">` named by the
`Color_swatch_picker.Swatch` inside it, a swatch as `Color_swatch` paints one.
Tab reaches the chosen option, or the first. In a `` `grid ``, its
`layout` by default, Left and Right move to the option before and after, as
the page's direction reads them, and Up and Down to the one above and below in
its column, found by where each is on the page; in a `` `stack ``, Up and
Down move in order. Home and End reach the ends, Page Up and Page Down too
unless the list scrolls, then a page at a time, and typing the start of a
colour's name reaches the option of that name. A disabled option is passed
over. A press, Space or Enter chooses an option, and `on_change` is told its
colour. Its value is an option's when the two are one colour, compared as a
hex with its alpha. `Color_swatch_picker.Item.Context.use ()` is an option's
colour and state, for a part inside one and for a style's attribute on one.

```ocaml title="headless_color_swatch_picker.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Picker = Solidtype_headless.Color_swatch_picker
module Colors = Solidtype_kobalte.Colors
module Color = Solidtype_kobalte.Types.Color

let colors = [| "#F43F5E"; "#8B5CF6"; "#3B82F6"; "#10B981"; "#F59E0B" |]

(* The picker's state, dressed by its attributes: a chosen option is
   [data-selected], a focused one takes the browser's focus. *)
let option_class =
  "size-8 rounded-full p-1 outline-none data-[selected]:ring-2 \
   data-[selected]:ring-gray-400 focus-visible:ring-2 \
   focus-visible:ring-blue-500"

let make () =
  let chosen, set_chosen = S.create_signal (Colors.parse_color "#8B5CF6") in
  <div class_="flex flex-col gap-3">
    <Picker.Root
      class_="flex gap-2" value=(S.get chosen) on_change=(S.set set_chosen)>
      <For each=colors>
        (fun c _ ->
          <Picker.Item class_=option_class color=(Colors.parse_color c)>
            <Picker.Swatch class_="size-full rounded-full" />
          </Picker.Item>)
      </For>
    </Picker.Root>
    <p class_="text-sm">
      "Chosen: " (Jsx.string (Color.to_string (S.get chosen) ~format:`hex ()))
    </p>
  </div>
```

| Part | Element | What it adds |
|---|---|---|
| `Color_swatch_picker.Root` | `<div role="listbox">` | `value`, `default_value`, `on_change`; `layout`, `data-layout`; named "Color swatches" unless given `aria_label` or `aria_labelledby` |
| `Color_swatch_picker.Item` | `<div role="option">` | `color`; `is_disabled`; `aria-selected`, `data-selected`, `aria-disabled`, `data-disabled` |
| `Color_swatch_picker.Swatch` | `<div role="img">` | its item's colour and name; `color_name` |

## Tag_group

`Solidtype_headless.Tag_group` is a `<div role="grid">` of tags, a list of
Kobalte's, each a `<div role="row">` named by its `text_value`, or the first
text among its children. Tab reaches the tag last focused, or the first
chosen, or the first, then the `Tag_group.Remove_button` inside it. The arrows
move from tag to tag, as the page's direction reads them, wrapping at either
end, a disabled tag passed over; Home and End reach the ends. A press, Space or
Enter chooses a tag as `selection_mode` says, and Escape clears the choice.
Delete and Backspace, or a tag's remove button, call `on_remove` with the keys
to remove, every chosen one where the tag is chosen; once they are off the
page the focus moves to the tag after, or before, or to the list.
`Tag_group.Context.use ()` reads the group by a tag's key, and
`Tag_group.Tag.Context.use ()` a tag, for a part inside one.

```ocaml title="headless_tag_group.mlx"
module S = Solidtype.Solid
module For = Solidtype.For
module Tag_group = Solidtype_headless.Tag_group

let make () =
  let tags, set_tags = S.create_signal [| "News"; "Travel"; "Gaming" |] in
  <Tag_group.Root
    class_="flex flex-col gap-2"
    selection_mode=`multiple
    on_remove=(fun keys ->
                S.update set_tags
                  (Js.Array.filter ~f:(fun t ->
                       not (Array.exists (String.equal t) keys))))>
    <Tag_group.Label class_="text-sm font-medium">"Categories"</Tag_group.Label>
    <Tag_group.List class_="flex flex-wrap gap-2">
      <For each=(S.get tags)>
        (fun t _ ->
          <Tag_group.Tag
            id=t
            class_="flex items-center gap-1 rounded-full border px-3 py-1 \
                    data-[selected]:bg-black data-[selected]:text-white">
            (Solidtype.Jsx.string t)
            <Tag_group.Remove_button>"×"</Tag_group.Remove_button>
          </Tag_group.Tag>)
      </For>
    </Tag_group.List>
    <Tag_group.Description class_="text-xs">
      "Delete or Backspace removes the focused tag"
    </Tag_group.Description>
  </Tag_group.Root>
```

| Part | Element | What it adds |
|---|---|---|
| `Tag_group.Root` | `<div>` | `selection_mode`, `selected_keys`, `default_selected_keys`, `on_selection_change`, `disabled_keys`, `is_disabled`, `on_remove`; names its list by `aria_label` or `aria_labelledby` |
| `Tag_group.Label` | `<span>` | names the list |
| `Tag_group.List` | `<div role="grid">`, or `role="group"` while empty | `aria-multiselectable`, `aria-live` while focused, `data-empty`; `render_empty_state` |
| `Tag_group.Tag` | `<div role="row">` around a `<div role="gridcell">` | `id`, `text_value`, `is_disabled`; `aria-selected`, `data-selected`, `aria-disabled`, `data-disabled` |
| `Tag_group.Remove_button` | `<button>` | named "Remove" and by its tag; disabled with its tag |
| `Tag_group.Description`, `Tag_group.Error_message` | `<span>` | describe the list |

## Virtualizer

`Solidtype_headless.Virtualizer` is React Aria's Virtualizer: around a
collection that reads it, it has the collection draw only the entries in view
of what scrolls them, in a block the size of them all, each placed by its
layout, `Virtualizer.list_layout`, React Aria's `ListLayout`, or, around a
`Table.Root`, `Virtualizer.table_layout`, its `TableLayout`: the table's parts
are then `<div>`s placed as React Aria places them, the header kept over the
rows, only the rows in view drawn. A collection
reads it by `Virtualizer.Context.use ()` and places its entries by
`Virtualizer.window`. HeroUI's list box, select, combo box and autocomplete
read it, as `Solidtype_heroui.Virtualizer`.

## Load_more_sentinel

`Solidtype_headless.Load_more_sentinel` is what asks a list for more as its end
comes into view, as React Aria's `useLoadMoreSentinel` does: a `<div>` placed
after the list's last entry, which calls `on_load_more` as it comes within
`scroll_offset` heights of the view of what scrolls it, and again as loading
ends with it still in view, never while `is_loading`. `Table.Load_more` and
HeroUI's `List_box.Load_more_item` place one each.

`Table.Context.use ()` is the table a part is in: how it is sorted and its
rows are selected, each row's state by its key, and selecting all or none.
`Table.Column.Context.use ()` is the column a part is in: which way it is
sorted.

## Top_layer

`Solidtype_headless.Top_layer` draws an overlay in the browser's top layer,
above the whole page: above anything the page stacks by `z-index` -- a
virtualized table's sticky header among them -- and above every overlay
opened before it, so what opened last is on top. React Aria writes a
`z-index` on each overlay it places, and HeroUI's styles rely on it; Kobalte
copies the one its content's style gives, which HeroUI's styles leave out of
a popover's. The top layer leaves no number to agree on.

An overlay is placed by giving its portal's element to `Top_layer.place`, as
a `ref`; it leaves the top layer as its portal leaves the page, when it
closes. The portal's element is drawn as a box of no size at the viewport's
corner, so what it holds is placed as before. `Top_layer.keep_on_top` keeps
an element above every one placed after it: a toast's region, above a modal
opened while it shows.

```ocaml
<Kobalte.Portal ref=(fun e -> Top_layer.place e)> ... </Kobalte.Portal>
```

Every overlay of [HeroUI's ports](../heroui.md) is placed so -- a
popover, a dropdown, a select, a combo box, an autocomplete, a tooltip, a
colour picker, a modal, an alert dialog, a drawer -- and the toasts' region is
kept on top.

## Kobalte's own, fixed

Where one of Kobalte's components has a bug, `solidtype-headless` holds it
fixed, under a module of its own name: each part it fixes wraps Kobalte's and
takes Kobalte's props, and its other parts are Kobalte's own, so a style names
one module. HeroUI's ports dress these, never Kobalte's.

| Module | Kobalte's bug | Fixed |
|---|---|---|
| `Color_swatch` | a colour less than opaque is written for CSS as `rgb(4, 133, 247 / 0.5)`, which no browser reads, so it paints nothing | the background is written as `rgba` |
| `Color_area` | the root takes `disabled` for itself, so its state never learns it: the thumb stays in the page's order and its inputs enabled | `Root` keeps `disabled` for its parts: `Thumb` is out of the page's order, `HiddenInputX` and `HiddenInputY` disabled, and the root, `Background` and `Thumb` `data-disabled` |
| `Color_area` | the thumb's `--kb-color-current` is written as the swatch's is | written as `rgba` |
| `Color_slider` | Page Up and Page Down step by a tenth of the channel's range, the colour's own page left out | they step by the colour's page, 15 degrees of a hue |
| `Color_slider` | its thumb's value capitalizes the colour's name mid-phrase, `0°, Red` | in lower case, `0°, red`, as React Aria tells it |
| `Color_slider` | `on_change` is told at a channel's end, where nothing moved | told only a colour other than the slider's |
| `Slider`, `Color_slider` | a track given a `ref` no longer knows it is the slider's: a press on it or a drag of its thumb throws | it knows, and the `ref` is called |
| `Color_slider` | its element has a `pagesize` attribute, from the channel's range spread on the slider | none |
| `Color_field` | its value is the text typed, told at every key | a colour, as its channel field's is, told once committed and only where it changed |
| `Color_field` | Enter commits nothing: what is typed is committed only as focus leaves | Enter commits it, as leaving does |
| `Color_field` | no key steps the hex, the field a text box | the arrows and Page Up and Page Down step it by one, Home and End take it to `#000000` and `#FFFFFF`, as React Aria's do |
| `Color_field` | the wheel does nothing | it steps the hex while the input has the focus, unless `change_on_wheel` is `false` |
| `Color_channel_field` | its input's `aria-valuenow` is the text it shows once the value changes, `301°` | the channel's number, `301` |
| `Color_channel_field` | `on_change` is told the field's own colour as it mounts | told only a colour other than its own |
| `Color_channel_field` | `on_change` is told at every key, a field emptied told a colour with no number | told once committed, by Enter or as the focus leaves; emptied, `None` |
| `Number_field`, `Color_channel_field` | the wheel turned down steps the number down, the other way from React Aria's | turned down it steps up, as React Aria's |
| `Number_field`, `Color_channel_field` | the wheel steps a field read-only, a turn mostly sideways, and one with Control held, which zooms the page | it steps none of them |
