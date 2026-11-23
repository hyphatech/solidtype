# List View

A one-column list of rows, chosen and acted on by the keys and the pointer.

A list of rows, each its content and an action, chosen by a checkbox where the
list chooses. Its look is a stylesheet the library ships, imported as
[Theming](theming.md#setup) shows.

## Usage

```ocaml title="list_view_usage.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module List_view = Solidtype_heroui.List_view
module Gravity = Solidtype_gravity_icons

let files =
  [|
    ("documents", "Documents", "2 days ago", true);
    ("photos", "Photos", "1 week ago", true);
    ("readme", "README.md", "3 hours ago", false);
    ("package", "package.json", "Yesterday", false);
    ("src", "src", "Just now", true);
    ("gitignore", ".gitignore", "2 weeks ago", false);
  |]

let make () =
  <div class_="w-full max-w-md">
    <List_view aria_label="Files" selection_mode=`multiple>
      <For each=files>
        (fun (id, name, updated, folder) _ ->
          <List_view.Item id text_value=name>
            <List_view.Item_content>
              (if folder then <Gravity.Folder /> else <Gravity.File />)
              <div class_="flex min-w-0 flex-col">
                <List_view.Title>(Jsx.string name)</List_view.Title>
                <List_view.Description>
                  (Jsx.string ("Updated " ^ updated))
                </List_view.Description>
              </div>
            </List_view.Item_content>
          </List_view.Item>)
      </For>
    </List_view>
  </div>
```

## Anatomy

```ocaml
<List_view aria_label="Files" selection_mode=`multiple>
  <List_view.Item id="readme" text_value="README.md">
    <List_view.Item_content>
      <List_view.Title>"README.md"</List_view.Title>
      <List_view.Description>"Updated 3 hours ago"</List_view.Description>
    </List_view.Item_content>
    <List_view.Item_action>...</List_view.Item_action>
  </List_view.Item>
</List_view>
```

## Keys

Up and Down move between rows, never past either end, a disabled row passed
over; Home and End reach the first and the last, and typing the start of a
row's name the next row of that name. Space chooses a row. Right moves into
the controls of a row, and Left back out. Where the list has an `on_action`, a
press or Enter runs it while nothing is chosen.

## Selection Modes

`` `none ``, `` `single `` or `` `multiple ``; a list that chooses draws a
checkbox in each row.

```ocaml title="list_view_selection_modes.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module List_view = Solidtype_heroui.List_view
module Gravity = Solidtype_gravity_icons

let files =
  [|
    ("documents", "Documents", "2 days ago", true);
    ("photos", "Photos", "1 week ago", true);
    ("readme", "README.md", "3 hours ago", false);
    ("package", "package.json", "Yesterday", false);
    ("src", "src", "Just now", true);
  |]

let name_of id =
  match Array.find_opt (fun (k, _, _, _) -> String.equal k id) files with
  | Some (_, name, _, _) -> name
  | None -> id

let chosen_text = function
  | [||] -> "None selected"
  | [| one |] -> name_of one
  | many -> string_of_int (Array.length many) ^ " selected"

let column ~title ~mode =
  let chosen, set_chosen = S.create_signal [||] in
  <div class_="flex min-w-0 flex-1 flex-col gap-2">
    <div class_="flex items-baseline justify-between">
      <span class_="text-sm font-medium">(Jsx.string title)</span>
      (match mode with
      | `none -> Jsx.string ""
      | `single | `multiple ->
          <span class_="text-xs text-muted">
            (Jsx.string (chosen_text (S.get chosen)))
          </span>)
    </div>
    <List_view
      aria_label=title
      selection_mode=mode
      on_selection_change=(fun keys -> S.set set_chosen keys)>
      <For each=files>
        (fun (id, name, updated, folder) _ ->
          <List_view.Item id text_value=name>
            <List_view.Item_content>
              (if folder then <Gravity.Folder /> else <Gravity.File />)
              <div class_="flex min-w-0 flex-col">
                <List_view.Title>(Jsx.string name)</List_view.Title>
                <List_view.Description>
                  (Jsx.string ("Updated " ^ updated))
                </List_view.Description>
              </div>
            </List_view.Item_content>
          </List_view.Item>)
      </For>
    </List_view>
  </div>

let make () =
  <div class_="flex w-full max-w-3xl flex-col gap-8 sm:flex-row">
    (column ~title:"None" ~mode:`none)
    (column ~title:"Single" ~mode:`single)
    (column ~title:"Multiple" ~mode:`multiple)
  </div>
```

## Variants

### Primary

A grey card of white rows, the default.

```ocaml title="list_view_usage.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module List_view = Solidtype_heroui.List_view
module Gravity = Solidtype_gravity_icons

let files =
  [|
    ("documents", "Documents", "2 days ago", true);
    ("photos", "Photos", "1 week ago", true);
    ("readme", "README.md", "3 hours ago", false);
    ("package", "package.json", "Yesterday", false);
    ("src", "src", "Just now", true);
    ("gitignore", ".gitignore", "2 weeks ago", false);
  |]

let make () =
  <div class_="w-full max-w-md">
    <List_view aria_label="Files" selection_mode=`multiple>
      <For each=files>
        (fun (id, name, updated, folder) _ ->
          <List_view.Item id text_value=name>
            <List_view.Item_content>
              (if folder then <Gravity.Folder /> else <Gravity.File />)
              <div class_="flex min-w-0 flex-col">
                <List_view.Title>(Jsx.string name)</List_view.Title>
                <List_view.Description>
                  (Jsx.string ("Updated " ^ updated))
                </List_view.Description>
              </div>
            </List_view.Item_content>
          </List_view.Item>)
      </For>
    </List_view>
  </div>
```

### Secondary

Rows on the page's own background, a line between each.

```ocaml title="list_view_secondary.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module List_view = Solidtype_heroui.List_view
module Gravity = Solidtype_gravity_icons

let files =
  [|
    ("documents", "Documents", "2 days ago", true);
    ("photos", "Photos", "1 week ago", true);
    ("readme", "README.md", "3 hours ago", false);
    ("package", "package.json", "Yesterday", false);
    ("src", "src", "Just now", true);
  |]

let make () =
  <div class_="w-full max-w-md">
    <List_view aria_label="Files" selection_mode=`multiple variant=`secondary>
      <For each=files>
        (fun (id, name, updated, folder) _ ->
          <List_view.Item id text_value=name>
            <List_view.Item_content>
              (if folder then <Gravity.Folder /> else <Gravity.File />)
              <div class_="flex min-w-0 flex-col">
                <List_view.Title>(Jsx.string name)</List_view.Title>
                <List_view.Description>
                  (Jsx.string ("Updated " ^ updated))
                </List_view.Description>
              </div>
            </List_view.Item_content>
          </List_view.Item>)
      </For>
    </List_view>
  </div>
```

## Disabled Items

`disabled_keys` names rows that cannot be chosen, focused or acted on.

```ocaml title="list_view_disabled_items.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module List_view = Solidtype_heroui.List_view
module Gravity = Solidtype_gravity_icons

let files =
  [|
    ("documents", "Documents", true);
    ("budget", "Budget.xlsx", false);
    ("archived", "Archived.zip", false);
    ("photos", "Photos", true);
    ("backup", "Old backup.tar", false);
    ("readme", "README.md", false);
  |]

let locked = [| "archived"; "backup" |]

let make () =
  <div class_="w-full max-w-md">
    <List_view aria_label="Files" selection_mode=`multiple disabled_keys=locked>
      <For each=files>
        (fun (id, name, folder) _ ->
          <List_view.Item id text_value=name>
            <List_view.Item_content>
              (if folder then <Gravity.Folder /> else <Gravity.File />)
              <List_view.Title>(Jsx.string name)</List_view.Title>
            </List_view.Item_content>
            (if Array.exists (String.equal id) locked then
               <List_view.Item_action>
                 <Gravity.Lock class_="size-4 text-muted" />
               </List_view.Item_action>
             else Jsx.string "")
          </List_view.Item>)
      </For>
    </List_view>
  </div>
```

## With Action Bar

An [Action Bar](action-bar.md) for what is chosen.

```ocaml title="list_view_with_action_bar.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Action_bar = Solidtype_heroui.Action_bar
module Button = Solidtype_heroui.Button
module Chip = Solidtype_heroui.Chip
module List_view = Solidtype_heroui.List_view
module Separator = Solidtype_heroui.Separator
module Gravity = Solidtype_gravity_icons

let files =
  [|
    ("design", "Design System", "2 days ago", true);
    ("photos", "Photos", "1 week ago", true);
    ("readme", "README.md", "3 hours ago", false);
    ("package", "package.json", "Yesterday", false);
    ("src", "src", "Just now", true);
    ("gitignore", ".gitignore", "2 weeks ago", false);
    ("tsconfig", "tsconfig.json", "3 days ago", false);
    ("modules", "node_modules", "1 day ago", true);
  |]

let make () =
  let chosen, set_chosen = S.create_signal [||] in
  <div class_="w-full max-w-md">
    <List_view
      aria_label="Project files"
      selection_mode=`multiple
      selected_keys=(S.get chosen)
      on_selection_change=(fun keys -> S.set set_chosen keys)>
      <For each=files>
        (fun (id, name, updated, folder) _ ->
          <List_view.Item id text_value=name>
            <List_view.Item_content>
              (if folder then <Gravity.Folder /> else <Gravity.File />)
              <div class_="flex min-w-0 flex-col">
                <List_view.Title>(Jsx.string name)</List_view.Title>
                <List_view.Description>
                  (Jsx.string ("Updated " ^ updated))
                </List_view.Description>
              </div>
            </List_view.Item_content>
          </List_view.Item>)
      </For>
    </List_view>
    <Action_bar
      is_open=(Array.length (S.get chosen) > 0) aria_label="File actions">
      <Action_bar.Prefix>
        <Chip size=`sm class_="shrink-0 tabular-nums">
          (Jsx.int (Array.length (S.get chosen)))
        </Chip>
      </Action_bar.Prefix>
      <Separator />
      <Action_bar.Content>
        <Button size=`sm variant=`ghost aria_label="Edit">
          <Gravity.Pencil /> <span class_="action-bar__label">"Edit"</span>
        </Button>
        <Button size=`sm variant=`ghost aria_label="Export">
          <Gravity.Arrow_down_to_line />
          <span class_="action-bar__label">"Export"</span>
        </Button>
        <Button size=`sm variant=`ghost aria_label="Archive">
          <Gravity.Archive /> <span class_="action-bar__label">"Archive"</span>
        </Button>
        <Separator />
        <Button
          size=`sm
          variant=`ghost
          aria_label="Delete"
          class_="bg-danger/10 text-danger">
          <Gravity.Trash_bin /> <span class_="action-bar__label">"Delete"</span>
        </Button>
      </Action_bar.Content>
      <Separator />
      <Action_bar.Suffix>
        <Button
          is_icon_only=true
          size=`sm
          variant=`ghost
          aria_label="Clear selection"
          on_click=(fun _ -> S.set set_chosen [||])>
          <Gravity.Xmark />
        </Button>
      </Action_bar.Suffix>
    </Action_bar>
  </div>
```

## Virtualization

`virtualized` draws only the rows in view, each `row_height` high, of a list
given a height, which scrolls them.

```ocaml title="list_view_virtualization.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module List_view = Solidtype_heroui.List_view
module Gravity = Solidtype_gravity_icons

let files =
  Array.init 1000 (fun i ->
      let n = string_of_int (i + 1) in
      (n, "report-" ^ n ^ ".pdf", string_of_int ((i * 37 mod 900) + 12) ^ " KB"))

let make () =
  <div class_="w-full max-w-md">
    <List_view
      aria_label="Reports"
      selection_mode=`multiple
      virtualized=true
      row_height=64.
      class_="h-[400px]">
      <For each=files>
        (fun (id, name, size) _ ->
          <List_view.Item id text_value=name>
            <List_view.Item_content>
              <Gravity.File />
              <div class_="flex min-w-0 flex-col">
                <List_view.Title>(Jsx.string name)</List_view.Title>
                <List_view.Description>(Jsx.string size)</List_view.Description>
              </div>
            </List_view.Item_content>
          </List_view.Item>)
      </For>
    </List_view>
  </div>
```

## Styling Reference

### CSS Classes

- `.list-view` - The list
- `.list-view--primary`, `.list-view--secondary` - Its variants
- `.list-view__item` - A row
- `.list-view__selection-cell` - A row's checkbox
- `.list-view__item-content` - A row's icon and text
- `.list-view__title` - A row's name
- `.list-view__description` - The line under it
- `.list-view__item-action` - What a row ends with
- `.list-view__empty-state` - What a list with no rows draws

### Interactive States

On `.list-view__item`:

- **Selected**: `[data-selected="true"]`
- **Hovered**: `[data-hovered="true"]`
- **Pressed**: `[data-pressed="true"]`
- **Focus visible**: `[data-focus-visible="true"]`
- **Disabled**: `[aria-disabled="true"]`

## API Reference

Each prop beside its name in React's convention.

### List_view

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `aria-label` | `aria_label` | `string` | | Its name |
| `variant` | `variant` | `` [ `primary \| `secondary ] `` | `` `primary `` | Its look |
| `selectionMode` | `selection_mode` | `` [ `none \| `single \| `multiple ] `` | `` `none `` | How many rows it chooses |
| `selectionBehavior` | `selection_behavior` | `` [ `toggle \| `replace ] `` | `` `toggle `` | Whether a press adds to the choice or replaces it |
| `selectedKeys` | `selected_keys` | `string array` | | The rows chosen (controlled) |
| `defaultSelectedKeys` | `default_selected_keys` | `string array` | | The rows chosen at first |
| `onSelectionChange` | `on_selection_change` | `string array -> unit` | | Called with the rows chosen |
| `disabledKeys` | `disabled_keys` | `string array` | | Rows that cannot be chosen or acted on |
| `disallowEmptySelection` | `disallow_empty_selection` | `bool` | | Whether the last row chosen stays chosen |
| `onAction` | `on_action` | `string -> unit` | | Called with a row's key as it is acted on |
| `renderEmptyState` | `render_empty_state` | `unit -> element` | | Drawn while it has no row |
| `virtualized` | `virtualized` | `bool` | `false` | Whether it draws only the rows in view |
| `rowHeight` | `row_height` | `float` | `48.` | Each row's height while virtualized |
| `className` | `class_` | `string` | | Added after its own classes |

### List_view.Item

| React | solidtype | Type | Description |
|---|---|---|---|
| `id` | `id` | `string` | Its key |
| `textValue` | `text_value` | `string` | Its name, which typing finds |
| `isDisabled` | `is_disabled` | `bool` | Whether it is disabled |
| `href` | `href` | `string` | The page its action opens |
| `className` | `class_` | `string` | Added after its own classes |
| `children` | `children` | elements, or a function of its state | Its content and action |

### List_view.Item_content, Title, Description, Item_action

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after its own class |
| `children` | `children` | elements | What it holds |
