# Action Bar

A floating toolbar for what can be done with what is chosen.

A [Toolbar](toolbar.md) that floats at the foot of the page
while `is_open`, sliding in and out. Its look is a stylesheet the library
ships, imported as [Theming](theming.md#setup) shows.

## Usage

Choose rows to see it.

```ocaml title="action_bar_usage.mlx"
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
    ("proposal", "Project proposal.pdf");
    ("report", "Q4 financial report.xlsx");
    ("brand", "Brand guidelines.fig");
    ("photo", "Team photo.jpg");
    ("notes", "Meeting notes.md");
    ("api", "API documentation.pdf");
  |]

let make () =
  let chosen, set_chosen = S.create_signal [||] in
  <div class_="w-full max-w-lg p-4">
    <List_view
      aria_label="Files"
      selection_mode=`multiple
      selected_keys=(S.get chosen)
      on_selection_change=(fun keys -> S.set set_chosen keys)>
      <For each=files>
        (fun (id, name) _ ->
          <List_view.Item id text_value=name>
            <List_view.Item_content>
              <List_view.Title>(Jsx.string name)</List_view.Title>
            </List_view.Item_content>
          </List_view.Item>)
      </For>
    </List_view>
    <Action_bar is_open=(Array.length (S.get chosen) > 0)>
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

## With Data Grid

```ocaml title="data_grid_bulk_actions.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Action_bar = Solidtype_heroui.Action_bar
module Avatar = Solidtype_heroui.Avatar
module Button = Solidtype_heroui.Button
module Chip = Solidtype_heroui.Chip
module Data_grid = Solidtype_heroui.Data_grid
module Separator = Solidtype_heroui.Separator
module Gravity = Solidtype_gravity_icons
module I18n = Solidtype_kobalte.I18n
module Types = Solidtype_kobalte.Types

type status = Active | Pending | Inactive

type employee = {
  id : string;
  name : string;
  email : string;
  department : string;
  status : status;
  joined : string;
  avatar : int;
}

let employee id name email department status joined avatar =
  { id; name; email; department; status; joined; avatar }

let employees =
  [|
    employee "1" "Amara Okafor" "amara.okafor@company.com" "Support" Pending
      "2024-06-27" 25;
    employee "2" "Elena Rodriguez" "elena.rodriguez@company.com" "HR" Active
      "2024-01-28" 20;
    employee "3" "James O'Brien" "james.o.brien@company.com" "Finance" Active
      "2024-04-14" 23;
    employee "4" "Luca Bianchi" "luca.bianchi@company.com" "Engineering" Active
      "2024-07-25" 21;
    employee "5" "Marcus Chen" "marcus.chen@company.com" "Design" Pending
      "2024-02-03" 22;
    employee "6" "Priya Patel" "priya.patel@company.com" "HR" Active
      "2024-03-04" 24;
    employee "7" "Yuki Tanaka" "yuki.tanaka@company.com" "Product" Inactive
      "2024-05-08" 26;
  |]

let status_name = function
  | Active -> "Active"
  | Pending -> "Pending"
  | Inactive -> "Inactive"

let status_color = function
  | Active -> `success
  | Pending -> `warning
  | Inactive -> `danger

let columns day =
  [|
    Data_grid.column ~id:"name" ~header:(Text "Employee") ~is_row_header:true
      ~sort:(By_text (fun e -> e.name))
      (fun e ->
        <div class_="flex items-center gap-3">
          <Avatar size=`sm>
            <Avatar.Image
              src=("https://img.heroui.chat/image/avatar?w=200&h=200&u="
                  ^ string_of_int (S.get e).avatar)
            />
          </Avatar>
          <div class_="flex flex-col">
            <span class_="text-sm font-medium">
              (Jsx.string (S.get e).name)
            </span>
            <span class_="text-xs text-muted">
              (Jsx.string (S.get e).email)
            </span>
          </div>
        </div>);
    Data_grid.column ~id:"department" ~header:(Text "Department")
      ~sort:(By_text (fun e -> e.department))
      (fun e -> Jsx.string (S.get e).department);
    Data_grid.column ~id:"status" ~header:(Text "Status")
      ~sort:(By_text (fun e -> status_name e.status))
      (fun e ->
        <Chip
          color=(status_color (S.get e).status)
          size=`sm
          variant=`soft
          class_="gap-1">
          <span class_="size-1.5 rounded-full bg-current" />
          (Jsx.string (status_name (S.get e).status))
        </Chip>);
    Data_grid.column ~id:"joined" ~header:(Text "Joined")
      ~sort:(By (fun a b -> String.compare a.joined b.joined))
      (fun e ->
        <span class_="text-sm text-muted tabular-nums">
          (Jsx.string
             (Types.DateTimeFormat.format (S.get day)
                ~date:(Types.Either.right (Js.Date.fromString (S.get e).joined))
                ()))
        </span>);
  |]

let make () =
  let chosen, set_chosen = S.create_signal [||] in
  let day =
    I18n.create_date_formatter
      (Types.Either.left
         (Types.DateTimeFormatOptions.make ~year:"numeric" ~month:"short"
            ~day:"numeric" ~time_zone:"UTC" ()))
  in
  <div class_="w-full">
    <Data_grid
      aria_label="Employees"
      rows=employees
      row_id=(fun e -> e.id)
      columns=(columns day)
      selection_mode=`multiple
      show_selection_checkboxes=true
      selected_keys=(S.get chosen)
      on_selection_change=(fun keys -> S.set set_chosen keys)
      default_sort_descriptor={ column = "name"; direction = `ascending }
      content_class="min-w-[640px]"
    />
    <Action_bar
      is_open=(Array.length (S.get chosen) > 0) aria_label="Bulk actions">
      <Action_bar.Prefix>
        <Chip size=`sm class_="size-5 shrink-0 tabular-nums">
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

## Anatomy

```ocaml
<Action_bar is_open>
  <Action_bar.Prefix>...</Action_bar.Prefix>
  <Separator />
  <Action_bar.Content>...</Action_bar.Content>
  <Separator />
  <Action_bar.Suffix>...</Action_bar.Suffix>
</Action_bar>
```

Each section is optional; a `Separator` between them runs across the bar.

## Responsive Labels

Text of the class `action-bar__label` is read but not shown below 640 pixels,
so a button there shows its icon alone.

## Styling Reference

### CSS Classes

- `.action-bar` - Fixed at the foot of the page, centred; `[data-entering]`
  and `[data-exiting]` while it slides
- `.action-bar__wrapper` - The bar itself, its toolbar
- `.action-bar__prefix` - Its leading section
- `.action-bar__content` - Its actions
- `.action-bar__suffix` - Its trailing section
- `.action-bar__label` - Text hidden below 640 pixels

## API Reference

### Action_bar

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `isOpen` | `is_open` | `bool` | | Whether it is shown |
| `aria-label` | `aria_label` | `string` | `"Actions"` | Its name |
| `isAttached` | `is_attached` | `bool` | `true` | Whether its toolbar has a surface, fully rounded |
| `orientation` | `orientation` | `` [ `horizontal \| `vertical ] `` | `` `horizontal `` | Its toolbar's orientation |
| `className` | `class_` | `string` | | Added after its toolbar's classes |

### Action_bar.Prefix, Content, Suffix

| React | solidtype | Type | Description |
|---|---|---|---|
| `className` | `class_` | `string` | Added after its own class |
| `children` | `children` | elements | What it holds |
