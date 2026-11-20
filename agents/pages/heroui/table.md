# Table

Tables display structured data in rows and columns with support for sorting, selection, column resizing, and infinite scrolling.

Rows, columns and cells given by data are Solid's `For`, where HeroUI's take
`items`, `columns` and `Table.Collection`.
The arrow keys, Home, End, Page Up, Page Down and typing move between rows,
and the arrows along a row's cells.

Original HeroUI documentation: [Table](https://heroui.com/en/docs/react/components/table).

## Usage

HeroUI's examples.

```ocaml title="table_usage.mlx"
module Table = Solidtype_heroui.Table

let make () =
  <Table>
    <Table.Scroll_container>
      <Table.Content aria_label="Team members" class_="min-w-[600px]">
        <Table.Header>
          <Table.Column is_row_header=true>"Name"</Table.Column>
          <Table.Column>"Role"</Table.Column>
          <Table.Column>"Status"</Table.Column>
          <Table.Column>"Email"</Table.Column>
        </Table.Header>
        <Table.Body>
          <Table.Row>
            <Table.Cell>"Kate Moore"</Table.Cell>
            <Table.Cell>"CEO"</Table.Cell>
            <Table.Cell>"Active"</Table.Cell>
            <Table.Cell>"kate@acme.com"</Table.Cell>
          </Table.Row>
          <Table.Row>
            <Table.Cell>"John Smith"</Table.Cell>
            <Table.Cell>"CTO"</Table.Cell>
            <Table.Cell>"Active"</Table.Cell>
            <Table.Cell>"john@acme.com"</Table.Cell>
          </Table.Row>
          <Table.Row>
            <Table.Cell>"Sara Johnson"</Table.Cell>
            <Table.Cell>"CMO"</Table.Cell>
            <Table.Cell>"On Leave"</Table.Cell>
            <Table.Cell>"sara@acme.com"</Table.Cell>
          </Table.Row>
          <Table.Row>
            <Table.Cell>"Michael Brown"</Table.Cell>
            <Table.Cell>"CFO"</Table.Cell>
            <Table.Cell>"Active"</Table.Cell>
            <Table.Cell>"michael@acme.com"</Table.Cell>
          </Table.Row>
        </Table.Body>
      </Table.Content>
    </Table.Scroll_container>
  </Table>
```

## Parity

The same HeroUI Table twice, under the same props: in solidtype on the left,
in React on the right. Below them, every attribute of the two tables: a marked
row is one they disagree on.

## Anatomy

```ocaml
<Table>
  <Table.Scroll_container>
    <Table.Content aria_label="Example table">
      <Table.Header>
        <Table.Column>"Name"</Table.Column>
        <Table.Column>"Role"</Table.Column>
      </Table.Header>
      <Table.Body>
        <Table.Row>
          <Table.Cell>"Kate Moore"</Table.Cell>
          <Table.Cell>"CEO"</Table.Cell>
        </Table.Row>
      </Table.Body>
    </Table.Content>
  </Table.Scroll_container>
  <Table.Footer />
</Table>
```

## Examples

### Secondary Variant

```ocaml title="table_secondary.mlx"
module Table = Solidtype_heroui.Table

let make () =
  <Table variant=`secondary>
    <Table.Scroll_container>
      <Table.Content aria_label="Team members" class_="min-w-[600px]">
        <Table.Header>
          <Table.Column is_row_header=true>"Name"</Table.Column>
          <Table.Column>"Role"</Table.Column>
          <Table.Column>"Status"</Table.Column>
          <Table.Column>"Email"</Table.Column>
        </Table.Header>
        <Table.Body>
          <Table.Row>
            <Table.Cell>"Kate Moore"</Table.Cell>
            <Table.Cell>"CEO"</Table.Cell>
            <Table.Cell>"Active"</Table.Cell>
            <Table.Cell>"kate@acme.com"</Table.Cell>
          </Table.Row>
          <Table.Row>
            <Table.Cell>"John Smith"</Table.Cell>
            <Table.Cell>"CTO"</Table.Cell>
            <Table.Cell>"Active"</Table.Cell>
            <Table.Cell>"john@acme.com"</Table.Cell>
          </Table.Row>
          <Table.Row>
            <Table.Cell>"Sara Johnson"</Table.Cell>
            <Table.Cell>"CMO"</Table.Cell>
            <Table.Cell>"On Leave"</Table.Cell>
            <Table.Cell>"sara@acme.com"</Table.Cell>
          </Table.Row>
          <Table.Row>
            <Table.Cell>"Michael Brown"</Table.Cell>
            <Table.Cell>"CFO"</Table.Cell>
            <Table.Cell>"Active"</Table.Cell>
            <Table.Cell>"michael@acme.com"</Table.Cell>
          </Table.Row>
        </Table.Body>
      </Table.Content>
    </Table.Scroll_container>
  </Table>
```

### Async Loading

Use `Table.Load_more` at the end of `Table.Body` for infinite scrolling. It
renders a sentinel row that triggers `on_load_more` when scrolled into view,
and again as loading ends with it still in view. While `is_loading`, it draws
a row across every column holding its `Table.Load_more_content`. It never asks
while loading, so the application keeps no guard of its own.

```ocaml title="table_async_loading.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Show = Solidtype.Show
module Chip = Solidtype_heroui.Chip
module Spinner = Solidtype_heroui.Spinner
module Table = Solidtype_heroui.Table

type user = {
  id : int;
  name : string;
  role : string;
  status : string;
  email : string;
}

let status_color = function
  | "Active" -> `success
  | "Inactive" -> `danger
  | _ -> `warning

let all_users =
  [|
    {
      email = "kate@acme.com";
      id = 1;
      name = "Kate Moore";
      role = "CEO";
      status = "Active";
    };
    {
      email = "john@acme.com";
      id = 2;
      name = "John Smith";
      role = "CTO";
      status = "Active";
    };
    {
      email = "sara@acme.com";
      id = 3;
      name = "Sara Johnson";
      role = "CMO";
      status = "On Leave";
    };
    {
      email = "michael@acme.com";
      id = 4;
      name = "Michael Brown";
      role = "CFO";
      status = "Active";
    };
    {
      email = "emily@acme.com";
      id = 5;
      name = "Emily Davis";
      role = "Product Manager";
      status = "Inactive";
    };
    {
      email = "davis@acme.com";
      id = 6;
      name = "Davis Wilson";
      role = "Lead Designer";
      status = "Active";
    };
    {
      email = "olivia@acme.com";
      id = 7;
      name = "Olivia Martinez";
      role = "Frontend Engineer";
      status = "Active";
    };
    {
      email = "james@acme.com";
      id = 8;
      name = "James Taylor";
      role = "Backend Engineer";
      status = "Active";
    };
    {
      email = "sophia@acme.com";
      id = 9;
      name = "Sophia Anderson";
      role = "QA Engineer";
      status = "On Leave";
    };
    {
      email = "liam@acme.com";
      id = 10;
      name = "Liam Thomas";
      role = "DevOps Engineer";
      status = "Active";
    };
    {
      email = "lucas@acme.com";
      id = 11;
      name = "Lucas Martinez";
      role = "Product Manager";
      status = "Active";
    };
    {
      email = "emma@acme.com";
      id = 12;
      name = "Emma Johnson";
      role = "Frontend Engineer";
      status = "Active";
    };
    {
      email = "noah@acme.com";
      id = 13;
      name = "Noah Davis";
      role = "Backend Engineer";
      status = "Active";
    };
    {
      email = "ava@acme.com";
      id = 14;
      name = "Ava Wilson";
      role = "Lead Designer";
      status = "Active";
    };
    {
      email = "oliver@acme.com";
      id = 15;
      name = "Oliver Martinez";
      role = "Frontend Engineer";
      status = "Active";
    };
    {
      email = "isabella@acme.com";
      id = 16;
      name = "Isabella Johnson";
      role = "Backend Engineer";
      status = "Active";
    };
    {
      email = "mia@acme.com";
      id = 17;
      name = "Mia Davis";
      role = "Lead Designer";
      status = "Active";
    };
    {
      email = "william@acme.com";
      id = 18;
      name = "William Wilson";
      role = "Frontend Engineer";
      status = "Active";
    };
  |]

let items_per_page = 6

(* How long the fetch it stands in for takes. *)
let load_ms = 1500

let columns =
  [|
    ("name", "Name"); ("role", "Role"); ("status", "Status"); ("email", "Email");
  |]

let make () =
  let count, set_count = S.create_signal items_per_page in
  let loading, set_loading = S.create_signal false in
  let has_more () = S.get count < Array.length all_users in
  let timer = ref None in
  S.on_cleanup (fun () -> Option.iter Js.Global.clearTimeout !timer);
  (* The table asks for more only while it is not loading. *)
  let load_more () =
    if has_more () then begin
      S.set set_loading true;
      timer :=
        Some
          (Js.Global.setTimeout
             ~f:(fun () ->
               S.batch (fun () ->
                   S.set set_count
                     (min (Array.length all_users)
                        (S.get count + items_per_page));
                   S.set set_loading false))
             load_ms)
    end
  in
  <Table>
    <Table.Scroll_container class_="h-[280px] overflow-y-auto">
      <Table.Content aria_label="Async loading table" class_="min-w-[600px]">
        <Table.Header class_="sticky top-0 z-10 bg-surface-secondary">
          <For each=columns>
            (fun (id, name) _ ->
              <Table.Column id is_row_header=(String.equal id "name")>
                (Jsx.string name)
              </Table.Column>)
          </For>
        </Table.Header>
        <Table.Body>
          <For each=(Array.sub all_users 0 (S.get count))>
            (fun user _ ->
              <Table.Row id=(string_of_int user.id)>
                <Table.Cell>(Jsx.string user.name)</Table.Cell>
                <Table.Cell>(Jsx.string user.role)</Table.Cell>
                <Table.Cell>
                  <Chip color=(status_color user.status) size=`sm variant=`soft>
                    (Jsx.string user.status)
                  </Chip>
                </Table.Cell>
                <Table.Cell>(Jsx.string user.email)</Table.Cell>
              </Table.Row>)
          </For>
          <Show when_=(has_more ())>
            <Table.Load_more
              is_loading=(S.get loading) scroll_offset=0. on_load_more=load_more>
              <Table.Load_more_content>
                <Spinner size=`md />
              </Table.Load_more_content>
            </Table.Load_more>
          </Show>
        </Table.Body>
      </Table.Content>
    </Table.Scroll_container>
  </Table>
```

### Sorting

Columns can be made sortable using the `allows_sorting` and `id` props on
`Table.Column`. Use `sort_descriptor` and `on_sort_change` on `Table.Content`
to manage sort state; the rows' order is the application's. Wrap the label in
`Table.Sortable_column_header` to render the default ascending/descending
indicator: it reads its column's direction itself.
A sortable column is sorted by a press, Enter or Space.

```ocaml title="table_sorting.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Table = Solidtype_heroui.Table

type user = {
  id : int;
  name : string;
  role : string;
  status : string;
  email : string;
}

let users =
  [|
    {
      email = "kate@acme.com";
      id = 1;
      name = "Kate Moore";
      role = "CEO";
      status = "Active";
    };
    {
      email = "john@acme.com";
      id = 2;
      name = "John Smith";
      role = "CTO";
      status = "Active";
    };
    {
      email = "sara@acme.com";
      id = 3;
      name = "Sara Johnson";
      role = "CMO";
      status = "On Leave";
    };
    {
      email = "michael@acme.com";
      id = 4;
      name = "Michael Brown";
      role = "CFO";
      status = "Active";
    };
    {
      email = "emily@acme.com";
      id = 5;
      name = "Emily Davis";
      role = "Product Manager";
      status = "Inactive";
    };
  |]

let field column (u : user) =
  match column with
  | "role" -> u.role
  | "status" -> u.status
  | "email" -> u.email
  | _ -> u.name

external locale_compare : string -> string -> int = "localeCompare" [@@mel.send]

let make () =
  let sort, set_sort =
    S.create_signal { Table.column = "name"; direction = `ascending }
  in
  let sorted_users () =
    let { Table.column; direction } = S.get sort in
    let order =
      List.sort
        (fun a b -> locale_compare (field column a) (field column b))
        (Array.to_list users)
    in
    Array.of_list
      (match direction with
      | `ascending -> order
      | `descending -> List.rev order)
  in
  <Table>
    <Table.Scroll_container>
      <Table.Content
        aria_label="Sortable table"
        class_="min-w-[600px]"
        sort_descriptor=(S.get sort)
        on_sort_change=(S.set set_sort)>
        <Table.Header>
          <Table.Column allows_sorting=true is_row_header=true id="name">
            <Table.Sortable_column_header>"Name"</Table.Sortable_column_header>
          </Table.Column>
          <Table.Column allows_sorting=true id="role">
            <Table.Sortable_column_header>"Role"</Table.Sortable_column_header>
          </Table.Column>
          <Table.Column allows_sorting=true id="status">
            <Table.Sortable_column_header>
              "Status"
            </Table.Sortable_column_header>
          </Table.Column>
          <Table.Column allows_sorting=true id="email">
            <Table.Sortable_column_header>"Email"</Table.Sortable_column_header>
          </Table.Column>
        </Table.Header>
        <Table.Body>
          <For each=(sorted_users ())>
            (fun user _ ->
              <Table.Row id=(string_of_int user.id)>
                <Table.Cell>(Jsx.string user.name)</Table.Cell>
                <Table.Cell>(Jsx.string user.role)</Table.Cell>
                <Table.Cell>(Jsx.string user.status)</Table.Cell>
                <Table.Cell>(Jsx.string user.email)</Table.Cell>
              </Table.Row>)
          </For>
        </Table.Body>
      </Table.Content>
    </Table.Scroll_container>
  </Table>
```

### Selection

Enable row selection with `selection_mode` on `Table.Content`. Use `Checkbox`
with `` slot=`selection `` for select-all and per-row checkboxes. A row is
selected by a press, Space or Enter.

```ocaml title="table_selection.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Checkbox = Solidtype_heroui.Checkbox
module Table = Solidtype_heroui.Table

type user = {
  id : int;
  name : string;
  role : string;
  status : string;
  email : string;
}

let users =
  [|
    {
      email = "kate@acme.com";
      id = 1;
      name = "Kate Moore";
      role = "CEO";
      status = "Active";
    };
    {
      email = "john@acme.com";
      id = 2;
      name = "John Smith";
      role = "CTO";
      status = "Active";
    };
    {
      email = "sara@acme.com";
      id = 3;
      name = "Sara Johnson";
      role = "CMO";
      status = "On Leave";
    };
    {
      email = "michael@acme.com";
      id = 4;
      name = "Michael Brown";
      role = "CFO";
      status = "Active";
    };
  |]

let make () =
  let selected_keys, set_selected_keys = S.create_signal [||] in
  <div class_="flex flex-col gap-3">
    <Table>
      <Table.Scroll_container>
        <Table.Content
          aria_label="Table with selection"
          class_="min-w-[600px]"
          selected_keys=(S.get selected_keys)
          selection_mode=`multiple
          on_selection_change=(S.set set_selected_keys)>
          <Table.Header>
            <Table.Column class_="pe-0">
              <Checkbox aria_label="Select all" slot=`selection>
                <Checkbox.Content>
                  <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control>
                </Checkbox.Content>
              </Checkbox>
            </Table.Column>
            <Table.Column is_row_header=true>"Name"</Table.Column>
            <Table.Column>"Role"</Table.Column>
            <Table.Column>"Status"</Table.Column>
            <Table.Column>"Email"</Table.Column>
          </Table.Header>
          <Table.Body>
            <For each=users>
              (fun user _ ->
                <Table.Row id=(string_of_int user.id)>
                  <Table.Cell class_="pe-0">
                    <Checkbox
                      aria_label=("Select " ^ user.name)
                      slot=`selection
                      variant=`secondary>
                      <Checkbox.Content>
                        <Checkbox.Control>
                          <Checkbox.Indicator />
                        </Checkbox.Control>
                      </Checkbox.Content>
                    </Checkbox>
                  </Table.Cell>
                  <Table.Cell>(Jsx.string user.name)</Table.Cell>
                  <Table.Cell>(Jsx.string user.role)</Table.Cell>
                  <Table.Cell>(Jsx.string user.status)</Table.Cell>
                  <Table.Cell>(Jsx.string user.email)</Table.Cell>
                </Table.Row>)
            </For>
          </Table.Body>
        </Table.Content>
      </Table.Scroll_container>
    </Table>
    <p class_="text-sm text-muted">
      "Selected: "
      <span class_="font-medium">
        (Jsx.string
           (match S.get selected_keys with
           | [||] -> "None"
           | keys -> String.concat ", " (Array.to_list keys)))
      </span>
    </p>
  </div>
```

### Expandable Rows

Rows can be nested to display hierarchical data: write a `Table.Row` inside
another, among its cells. Use the `tree_column` prop, the `id` of a column, to
designate a column, and render a `Button` with `` slot=`chevron `` in that
column's cells so users can expand and collapse the row. Use the
`expanded_keys` prop, or `default_expanded_keys`, and `on_expanded_change` to
control which rows are expanded. The arrow forward on a row expands it, and
the arrow back collapses it, then reaches the row it is in.

`Table.Row.Context.use` and `Table.Cell.Context.use`, read in a cell, tell
whether its row holds rows and is expanded, and whether the cell is in the
tree column; a handler reads the row the cell was drawn in.

```ocaml title="table_expandable_rows.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Show = Solidtype.Show
module Button = Solidtype_heroui.Button
module Table = Solidtype_heroui.Table
module Gravity = Solidtype_gravity_icons

type file = {
  id : string;
  title : string;
  kind : string;
  date : string;
  children : file array;
}

let data =
  [|
    {
      id = "1";
      title = "Documents";
      kind = "Directory";
      date = "10/20/2025";
      children =
        [|
          {
            id = "2";
            title = "Project";
            kind = "Directory";
            date = "8/2/2025";
            children =
              [|
                {
                  id = "3";
                  title = "Weekly Report";
                  kind = "File";
                  date = "7/10/2025";
                  children = [||];
                };
                {
                  id = "4";
                  title = "Budget";
                  kind = "File";
                  date = "8/20/2025";
                  children = [||];
                };
              |];
          };
        |];
    };
    {
      id = "5";
      title = "Photos";
      kind = "Directory";
      date = "2/3/2026";
      children =
        [|
          {
            id = "6";
            title = "Image 1";
            kind = "File";
            date = "1/23/2026";
            children = [||];
          };
          {
            id = "7";
            title = "Image 2";
            kind = "File";
            date = "2/3/2026";
            children = [||];
          };
        |];
    };
  |]

(* A row, and the rows it holds written inside it; its chevron in the tree
   column while it holds rows, turned while it is expanded, as HeroUI's
   example draws it from its cell's render function. *)
let rec expandable_row item =
  <Table.Row id=item.id>
    <Table.Cell>
      (let row = Table.Row.Context.use () in
       let cell = Table.Cell.Context.use () in
       <span class_="flex items-center gap-1">
         <Show when_=(S.get row.has_child_items && S.get cell.is_tree_column)>
           <Button
             is_icon_only=true
             aria_label="Toggle row"
             is_disabled=(S.get row.is_disabled)
             size=`sm
             slot=`chevron
             variant=`ghost>
             <Gravity.Chevron_right
               class_=("size-4 text-muted transition-transform duration-150 "
                      ^
                      if S.get row.is_expanded then "rotate-90"
                      else "rtl:rotate-180")
             />
           </Button>
         </Show>
         <span>(Jsx.string item.title)</span>
       </span>)
    </Table.Cell>
    <Table.Cell>(Jsx.string item.kind)</Table.Cell>
    <Table.Cell>(Jsx.string item.date)</Table.Cell>
    <For each=item.children>(fun child _ -> expandable_row child)</For>
  </Table.Row>

let make () =
  let expanded, set_expanded = S.create_signal [| "1" |] in
  <Table>
    <Table.Scroll_container>
      <Table.Content
        aria_label="Files"
        class_="min-w-[520px]"
        expanded_keys=(S.get expanded)
        tree_column="name"
        on_expanded_change=(fun keys -> S.set set_expanded keys)>
        <Table.Header>
          <Table.Column is_row_header=true id="name">"Name"</Table.Column>
          <Table.Column id="type">"Type"</Table.Column>
          <Table.Column id="date">"Date Modified"</Table.Column>
        </Table.Header>
        <Table.Body>
          <For each=data>(fun item _ -> expandable_row item)</For>
        </Table.Body>
      </Table.Content>
    </Table.Scroll_container>
  </Table>
```

### Drag and Drop

Give `Table.Content` an `on_reorder` and each row a `Button` with
`` slot=`drag ``. Enter on it grabs the row, the arrows move it, Enter drops
it and Escape lets it go; a pointer drags it. `on_reorder` is told the rows
moved, `keys`, and the row they land beside, `target`, `` `before `` or
`` `after `` it, as its `position`. A selected row is dragged with the others
selected. HeroUI's React Table does this with React Aria's `useDragAndDrop`,
whose keyboard drag moves by Tab.

```ocaml title="table_drag_and_drop.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Button = Solidtype_heroui.Button
module Data_grid = Solidtype_heroui.Data_grid
module Table = Solidtype_heroui.Table
module Gravity = Solidtype_gravity_icons

type task = { id : string; title : string; status : string }

let tasks =
  [|
    { id = "1"; title = "Design the landing page"; status = "In progress" };
    { id = "2"; title = "Write the launch post"; status = "To do" };
    { id = "3"; title = "Fix the sign-up form"; status = "In review" };
    { id = "4"; title = "Plan the next sprint"; status = "To do" };
  |]

let make () =
  let rows, set_rows = S.create_signal tasks in
  <Table>
    <Table.Scroll_container>
      <Table.Content
        aria_label="Tasks to reorder"
        class_="min-w-[480px]"
        on_reorder=(fun r ->
                     S.set set_rows
                       (Data_grid.reordered
                          ~row_id:(fun t -> t.id)
                          (S.get rows) r))>
        <Table.Header>
          <Table.Column class_="w-12 pe-0">""</Table.Column>
          <Table.Column is_row_header=true>"Task"</Table.Column>
          <Table.Column>"Status"</Table.Column>
        </Table.Header>
        <Table.Body>
          <For each=(S.get rows)>
            (fun t _ ->
              <Table.Row id=t.id>
                <Table.Cell class_="pe-0">
                  <Button slot=`drag is_icon_only=true size=`sm variant=`ghost>
                    <Gravity.Grip class_="size-4 text-muted" />
                  </Button>
                </Table.Cell>
                <Table.Cell>(Jsx.string t.title)</Table.Cell>
                <Table.Cell>(Jsx.string t.status)</Table.Cell>
              </Table.Row>)
          </For>
        </Table.Body>
      </Table.Content>
    </Table.Scroll_container>
  </Table>
```

### Pagination

Use `Table.Footer` to add a pagination component below the table.

```ocaml title="table_pagination.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Pagination = Solidtype_heroui.Pagination
module Table = Solidtype_heroui.Table

type user = {
  id : int;
  name : string;
  role : string;
  status : string;
  email : string;
}

type column = { field : user -> string; name : string; row_header : bool }

let columns =
  [|
    { field = (fun u -> u.name); name = "Name"; row_header = true };
    { field = (fun u -> u.role); name = "Role"; row_header = false };
    { field = (fun u -> u.status); name = "Status"; row_header = false };
    { field = (fun u -> u.email); name = "Email"; row_header = false };
  |]

let users =
  [|
    {
      email = "kate@acme.com";
      id = 1;
      name = "Kate Moore";
      role = "CEO";
      status = "Active";
    };
    {
      email = "john@acme.com";
      id = 2;
      name = "John Smith";
      role = "CTO";
      status = "Active";
    };
    {
      email = "sara@acme.com";
      id = 3;
      name = "Sara Johnson";
      role = "CMO";
      status = "On Leave";
    };
    {
      email = "michael@acme.com";
      id = 4;
      name = "Michael Brown";
      role = "CFO";
      status = "Active";
    };
    {
      email = "emily@acme.com";
      id = 5;
      name = "Emily Davis";
      role = "Product Manager";
      status = "Inactive";
    };
    {
      email = "davis@acme.com";
      id = 6;
      name = "Davis Wilson";
      role = "Lead Designer";
      status = "Active";
    };
    {
      email = "olivia@acme.com";
      id = 7;
      name = "Olivia Martinez";
      role = "Frontend Engineer";
      status = "Active";
    };
    {
      email = "james@acme.com";
      id = 8;
      name = "James Taylor";
      role = "Backend Engineer";
      status = "Active";
    };
  |]

let rows_per_page = 4
let total_pages = (Array.length users + rows_per_page - 1) / rows_per_page
let pages = Array.init total_pages (fun i -> i + 1)

let make () =
  let page, set_page = S.create_signal 1 in
  let shown () =
    let start = (S.get page - 1) * rows_per_page in
    Array.sub users start (Int.min rows_per_page (Array.length users - start))
  in
  let first () = ((S.get page - 1) * rows_per_page) + 1 in
  let last () = Int.min (S.get page * rows_per_page) (Array.length users) in
  <Table>
    <Table.Scroll_container>
      <Table.Content aria_label="Table with pagination" class_="min-w-[600px]">
        <Table.Header>
          <For each=columns>
            (fun column _ ->
              <Table.Column is_row_header=column.row_header>
                (Jsx.string column.name)
              </Table.Column>)
          </For>
        </Table.Header>
        <Table.Body>
          <For each=(shown ())>
            (fun user _ ->
              <Table.Row>
                <For each=columns>
                  (fun column _ ->
                    <Table.Cell>(Jsx.string (column.field user))</Table.Cell>)
                </For>
              </Table.Row>)
          </For>
        </Table.Body>
      </Table.Content>
    </Table.Scroll_container>
    <Table.Footer>
      <Pagination size=`sm>
        <Pagination.Summary>
          (Jsx.int (first ()))
          " to "
          (Jsx.int (last ()))
          " of "
          (Jsx.int (Array.length users))
          " results"
        </Pagination.Summary>
        <Pagination.Content>
          <Pagination.Item>
            <Pagination.Previous
              is_disabled=(S.get page = 1)
              on_press=(fun () ->
                         S.update set_page (fun p -> Int.max 1 (p - 1)))>
              <Pagination.Previous_icon /> "Prev"
            </Pagination.Previous>
          </Pagination.Item>
          <For each=pages>
            (fun p _ ->
              <Pagination.Item>
                <Pagination.Link
                  is_active=(p = S.get page)
                  on_press=(fun () -> S.set set_page p)>
                  (Jsx.int p)
                </Pagination.Link>
              </Pagination.Item>)
          </For>
          <Pagination.Item>
            <Pagination.Next
              is_disabled=(S.get page = total_pages)
              on_press=(fun () ->
                         S.update set_page (fun p ->
                             Int.min total_pages (p + 1)))>
              "Next" <Pagination.Next_icon />
            </Pagination.Next>
          </Pagination.Item>
        </Pagination.Content>
      </Pagination>
    </Table.Footer>
  </Table>
```

### Column Resizing

Wrap the table in `Table.Resizable_container`, in place of
`Table.Scroll_container`, and add `Table.Column_resizer` inside each resizable
column. A column's `width`, or `default_width` until it is resized, is
`Pixels`, a `Percent` of the table's width, or a `Fraction` of what the others
leave, between `min_width`, 75 pixels by default, and `max_width`.

A resizer is dragged, or reached by Tab from its column's header: its arrows
resize the column by 10 pixels, and Enter begins a resize that Enter, Escape,
Space, Tab or leaving it ends. `on_resize_start`, `on_resize` and
`on_resize_end` on the container are told every column's size by its `id`.

```ocaml title="table_column_resizing.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Chip = Solidtype_heroui.Chip
module Table = Solidtype_heroui.Table

type user = {
  id : string;
  name : string;
  role : string;
  status : string;
  color : [ `accent | `danger | `default | `success | `warning ];
  email : string;
}

let users =
  [|
    {
      id = "1";
      name = "Kate Moore";
      role = "CEO";
      status = "Active";
      color = `success;
      email = "kate@acme.com";
    };
    {
      id = "2";
      name = "John Smith";
      role = "CTO";
      status = "Active";
      color = `success;
      email = "john@acme.com";
    };
    {
      id = "3";
      name = "Sara Johnson";
      role = "CMO";
      status = "On Leave";
      color = `warning;
      email = "sara@acme.com";
    };
    {
      id = "4";
      name = "Michael Brown";
      role = "CFO";
      status = "Active";
      color = `success;
      email = "michael@acme.com";
    };
    {
      id = "5";
      name = "Emily Davis";
      role = "Product Manager";
      status = "Inactive";
      color = `danger;
      email = "emily@acme.com";
    };
  |]

let make () =
  <Table>
    <Table.Resizable_container>
      <Table.Content
        aria_label="Table with resizable columns" class_="min-w-[700px]">
        <Table.Header>
          <Table.Column
            is_row_header=true
            default_width=(Table.Fraction 1.)
            id="name"
            min_width=160.>
            "Name" <Table.Column_resizer />
          </Table.Column>
          <Table.Column
            default_width=(Table.Fraction 1.) id="role" min_width=220.>
            "Role" <Table.Column_resizer />
          </Table.Column>
          <Table.Column
            default_width=(Table.Fraction 1.) id="status" min_width=100.>
            "Status" <Table.Column_resizer />
          </Table.Column>
          <Table.Column
            default_width=(Table.Fraction 1.) id="email" min_width=200.>
            "Email"
          </Table.Column>
        </Table.Header>
        <Table.Body>
          <For each=users>
            (fun user _ ->
              <Table.Row id=user.id>
                <Table.Cell>(Jsx.string user.name)</Table.Cell>
                <Table.Cell>(Jsx.string user.role)</Table.Cell>
                <Table.Cell>
                  <Chip color=user.color size=`sm variant=`soft>
                    (Jsx.string user.status)
                  </Chip>
                </Table.Cell>
                <Table.Cell>(Jsx.string user.email)</Table.Cell>
              </Table.Row>)
          </For>
        </Table.Body>
      </Table.Content>
    </Table.Resizable_container>
  </Table>
```

### Empty State

Use `render_empty_state` on `Table.Body` to display a custom message when the
table has no data.

```ocaml title="table_empty_state.mlx"
module Empty_state = Solidtype_heroui.Empty_state
module Table = Solidtype_heroui.Table
module Gravity = Solidtype_gravity_icons

let make () =
  <Table class_="min-h-[200px]">
    <Table.Scroll_container>
      <Table.Content aria_label="Empty table" class_="h-full min-w-[600px]">
        <Table.Header>
          <Table.Column is_row_header=true>"Name"</Table.Column>
          <Table.Column>"Role"</Table.Column>
          <Table.Column>"Status"</Table.Column>
          <Table.Column>"Email"</Table.Column>
        </Table.Header>
        <Table.Body
          render_empty_state=(fun _ ->
                                 <Empty_state
                                   class_="flex h-full w-full flex-col \
                                           items-center justify-center gap-4 \
                                           text-center">
                                   <Gravity.Tray class_="size-6 text-muted" />
                                   <span class_="text-sm text-muted">
                                     "No results found"
                                   </span>
                                 </Empty_state>)>
          ""
        </Table.Body>
      </Table.Content>
    </Table.Scroll_container>
  </Table>
```

### Custom Cells

Any element in a cell: here a selection, sorting, `Avatar`, `Chip` and
`Button`, together.

```ocaml title="table_custom_cells.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Avatar = Solidtype_heroui.Avatar
module Button = Solidtype_heroui.Button
module Checkbox = Solidtype_heroui.Checkbox
module Chip = Solidtype_heroui.Chip
module Table = Solidtype_heroui.Table
module Gravity = Solidtype_gravity_icons

type status = Active | Inactive | On_leave

type user = {
  id : int;
  name : string;
  image_url : string;
  role : string;
  status : status;
  email : string;
}

let status_name = function
  | Active -> "Active"
  | Inactive -> "Inactive"
  | On_leave -> "On Leave"

let status_color = function
  | Active -> `success
  | Inactive -> `danger
  | On_leave -> `warning

let avatar color =
  "https://heroui-assets.nyc3.cdn.digitaloceanspaces.com/avatars/" ^ color
  ^ ".jpg"

let users =
  [|
    {
      email = "kate@acme.com";
      id = 4586932;
      image_url = avatar "red";
      name = "Kate Moore";
      role = "Chief Executive Officer";
      status = Active;
    };
    {
      email = "john@acme.com";
      id = 5273849;
      image_url = avatar "green";
      name = "John Smith";
      role = "Chief Technology Officer";
      status = Active;
    };
    {
      email = "sara@acme.com";
      id = 7492836;
      image_url = avatar "blue";
      name = "Sara Johnson";
      role = "Chief Marketing Officer";
      status = On_leave;
    };
    {
      email = "michael@acme.com";
      id = 8293746;
      image_url = avatar "purple";
      name = "Michael Brown";
      role = "Chief Financial Officer";
      status = Active;
    };
    {
      email = "emily@acme.com";
      id = 1234567;
      image_url = avatar "orange";
      name = "Emily Davis";
      role = "Product Manager";
      status = Inactive;
    };
  |]

let field column (u : user) =
  match column with
  | "id" -> string_of_int u.id
  | "role" -> u.role
  | "status" -> status_name u.status
  | _ -> u.name

external locale_compare : string -> string -> int = "localeCompare" [@@mel.send]

let initials name =
  String.split_on_char ' ' name
  |> List.filter_map (fun w ->
      if String.length w > 0 then Some (String.sub w 0 1) else None)
  |> String.concat ""

let make () =
  let selected_keys, set_selected_keys = S.create_signal [||] in
  let sort, set_sort =
    S.create_signal { Table.column = "name"; direction = `ascending }
  in
  let sorted_users () =
    let { Table.column; direction } = S.get sort in
    let order =
      List.sort
        (fun a b -> locale_compare (field column a) (field column b))
        (Array.to_list users)
    in
    Array.of_list
      (match direction with
      | `ascending -> order
      | `descending -> List.rev order)
  in
  <Table>
    <Table.Scroll_container>
      <Table.Content
        aria_label="Table with custom cells"
        class_="min-w-[800px]"
        selected_keys=(S.get selected_keys)
        selection_mode=`multiple
        sort_descriptor=(S.get sort)
        on_selection_change=(S.set set_selected_keys)
        on_sort_change=(S.set set_sort)>
        <Table.Header>
          <Table.Column class_="pe-0">
            <Checkbox aria_label="Select all" slot=`selection>
              <Checkbox.Content>
                <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control>
              </Checkbox.Content>
            </Checkbox>
          </Table.Column>
          <Table.Column
            allows_sorting=true is_row_header=true class_="after:hidden" id="id">
            <Table.Sortable_column_header>
              "Worker ID"
            </Table.Sortable_column_header>
          </Table.Column>
          <Table.Column allows_sorting=true id="name">
            <Table.Sortable_column_header>
              "Member"
            </Table.Sortable_column_header>
          </Table.Column>
          <Table.Column allows_sorting=true id="role">
            <Table.Sortable_column_header>"Role"</Table.Sortable_column_header>
          </Table.Column>
          <Table.Column allows_sorting=true id="status">
            <Table.Sortable_column_header>
              "Status"
            </Table.Sortable_column_header>
          </Table.Column>
          <Table.Column class_="text-end">"Actions"</Table.Column>
        </Table.Header>
        <Table.Body>
          <For each=(sorted_users ())>
            (fun user _ ->
              <Table.Row id=(string_of_int user.id)>
                <Table.Cell class_="pe-0">
                  <Checkbox
                    aria_label=("Select " ^ user.name)
                    slot=`selection
                    variant=`secondary>
                    <Checkbox.Content>
                      <Checkbox.Control>
                        <Checkbox.Indicator />
                      </Checkbox.Control>
                    </Checkbox.Content>
                  </Checkbox>
                </Table.Cell>
                <Table.Cell class_="font-medium">
                  <div class_="flex items-center gap-2">
                    (Jsx.string ("#" ^ string_of_int user.id))
                    " "
                    <Button
                      is_icon_only=true
                      aria_label=("Copy ID #" ^ string_of_int user.id)
                      size=`sm
                      variant=`ghost>
                      <Gravity.Copy class_="size-4 text-muted" />
                    </Button>
                  </div>
                </Table.Cell>
                <Table.Cell>
                  <div class_="flex items-center gap-3">
                    <Avatar size=`sm>
                      <Avatar.Image src=user.image_url />
                      <Avatar.Fallback>
                        (Jsx.string (initials user.name))
                      </Avatar.Fallback>
                    </Avatar>
                    <div class_="flex flex-col">
                      <span class_="text-xs">(Jsx.string user.name)</span>
                      <span class_="text-xs text-muted">
                        (Jsx.string user.email)
                      </span>
                    </div>
                  </div>
                </Table.Cell>
                <Table.Cell class_="min-w-52">
                  (Jsx.string user.role)
                </Table.Cell>
                <Table.Cell class_="min-w-25">
                  <Chip color=(status_color user.status) size=`sm variant=`soft>
                    (Jsx.string (status_name user.status))
                  </Chip>
                </Table.Cell>
                <Table.Cell>
                  <div class_="flex items-center gap-1">
                    <Button
                      is_icon_only=true
                      aria_label=("View " ^ user.name)
                      size=`sm
                      variant=`tertiary>
                      <Gravity.Eye class_="size-4" />
                    </Button>
                    <Button
                      is_icon_only=true
                      aria_label=("Edit " ^ user.name)
                      size=`sm
                      variant=`tertiary>
                      <Gravity.Pencil class_="size-4" />
                    </Button>
                    <Button
                      is_icon_only=true
                      aria_label=("Delete " ^ user.name)
                      size=`sm
                      variant=`danger_soft>
                      <Gravity.Trash_bin class_="size-4" />
                    </Button>
                  </div>
                </Table.Cell>
              </Table.Row>)
          </For>
        </Table.Body>
      </Table.Content>
    </Table.Scroll_container>
  </Table>
```

### Virtualization

Table supports virtualization through `Virtualizer`, given
`Virtualizer.table_layout`, enabling efficient rendering of large datasets by
displaying only the rows visible within the viewport. The table is what
scrolls: give it a height and an overflow by its class. The keys reach every
row, drawn or not. A table whose rows hold rows is not virtualized yet.

```ocaml title="table_virtualization.mlx"
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Table = Solidtype_heroui.Table
module Virtualizer = Solidtype_heroui.Virtualizer

type user = { id : int; name : string; role : string; email : string }

let roles =
  [|
    "Software Engineer";
    "Senior Engineer";
    "Staff Engineer";
    "Product Manager";
    "Designer";
    "Data Analyst";
    "QA Engineer";
    "DevOps Engineer";
    "Marketing Manager";
    "Sales Representative";
  |]

let first_names =
  [|
    "Emma";
    "Liam";
    "Olivia";
    "Noah";
    "Ava";
    "James";
    "Sophia";
    "Oliver";
    "Isabella";
    "Lucas";
    "Mia";
    "Ethan";
    "Charlotte";
    "Mason";
    "Amelia";
    "Logan";
    "Harper";
    "Alexander";
    "Ella";
    "Benjamin";
  |]

let last_names =
  [|
    "Smith";
    "Johnson";
    "Williams";
    "Brown";
    "Jones";
    "Garcia";
    "Miller";
    "Davis";
    "Rodriguez";
    "Martinez";
    "Anderson";
    "Taylor";
    "Thomas";
    "Jackson";
    "White";
    "Harris";
    "Clark";
    "Lewis";
    "Robinson";
    "Walker";
  |]

(* HeroUI's example's thousand users, made as its generateUsers makes them. *)
let users =
  Array.init 1000 (fun i ->
      let first = first_names.(i mod Array.length first_names) in
      let last =
        last_names.(i / Array.length first_names mod Array.length last_names)
      in
      {
        id = i + 1;
        name = first ^ " " ^ last;
        role = roles.(i mod Array.length roles);
        email =
          String.lowercase_ascii first
          ^ "."
          ^ String.lowercase_ascii last
          ^ "@acme.com";
      })

let make () =
  <Virtualizer
    layout=(Virtualizer.table_layout ~heading_size:42. ~row_size:42. ())>
    <Table>
      <Table.Scroll_container>
        <Table.Content
          aria_label="Virtualized table with 1000 rows"
          class_="h-[300px] min-w-[700px] overflow-auto">
          <Table.Header class_="h-full w-full">
            <Table.Column is_row_header=true id="name" min_width=160.>
              "Name"
            </Table.Column>
            <Table.Column id="role" min_width=220.>"Role"</Table.Column>
            <Table.Column id="email" min_width=240.>"Email"</Table.Column>
          </Table.Header>
          <Table.Body>
            <For each=users>
              (fun user _ ->
                <Table.Row id=(string_of_int user.id)>
                  <Table.Cell>(Jsx.string user.name)</Table.Cell>
                  <Table.Cell>(Jsx.string user.role)</Table.Cell>
                  <Table.Cell>(Jsx.string user.email)</Table.Cell>
                </Table.Row>)
            </For>
          </Table.Body>
        </Table.Content>
      </Table.Scroll_container>
    </Table>
  </Virtualizer>
```

### TanStack Table

HeroUI's Table works as a rendering layer on top of headless table libraries.
HeroUI's example uses `@tanstack/react-table`; a Solid application uses
[TanStack Table](https://tanstack.com/table)'s `@tanstack/solid-table`, whose
rows and columns a table of `For`s draws.

## Customization

### Tailwind CSS

`class_` is added after HeroUI's classes, on each part.

```ocaml title="table_tailwind.mlx"
module Table = Solidtype_heroui.Table

let header_cell =
  "text-xs font-semibold uppercase tracking-wide text-neutral-500 \
   dark:text-neutral-400"

let row_class =
  "border-t border-border/60 transition-colors hover:bg-neutral-100/60 \
   even:bg-neutral-50/50 dark:hover:bg-neutral-800/50 \
   dark:even:bg-neutral-900/30"

let name_cell = "font-medium text-neutral-900 dark:text-neutral-100"

let make () =
  <Table
    class_="w-full max-w-2xl overflow-hidden rounded-xl border \
            border-border/80 shadow-sm ring-1 ring-black/5 dark:ring-white/10">
    <Table.Scroll_container>
      <Table.Content aria_label="Team members" class_="min-w-[600px]">
        <Table.Header class_="bg-neutral-100/80 dark:bg-neutral-800/80">
          <Table.Column is_row_header=true class_=header_cell>
            "Name"
          </Table.Column>
          <Table.Column class_=header_cell>"Role"</Table.Column>
          <Table.Column class_=header_cell>"Status"</Table.Column>
        </Table.Header>
        <Table.Body>
          <Table.Row class_=row_class>
            <Table.Cell class_=name_cell>"Kate Moore"</Table.Cell>
            <Table.Cell>"CEO"</Table.Cell>
            <Table.Cell>"Active"</Table.Cell>
          </Table.Row>
          <Table.Row class_=row_class>
            <Table.Cell class_=name_cell>"John Smith"</Table.Cell>
            <Table.Cell>"CTO"</Table.Cell>
            <Table.Cell>"Active"</Table.Cell>
          </Table.Row>
          <Table.Row class_=row_class>
            <Table.Cell class_=name_cell>"Sara Johnson"</Table.Cell>
            <Table.Cell>"CMO"</Table.Cell>
            <Table.Cell>"On leave"</Table.Cell>
          </Table.Row>
        </Table.Body>
      </Table.Content>
    </Table.Scroll_container>
  </Table>
```

## Styling Reference

HeroUI follows the [BEM](https://bem.info/en/methodology/) methodology to
ensure component variants and states are reusable and easy to customize.

### CSS Classes

#### Base Classes

- `.table-root` - Root container (named `table-root` instead of `table`
  because `table` is a built-in Tailwind CSS utility class for
  `display: table`)
- `.table__scroll-container` - Horizontal scroll wrapper with custom scrollbar
- `.table__content` - The `<table>` element
- `.table__header` - Header row (`<thead>`)
- `.table__column` - Column header cell (`<th>`)
- `.table__body` - Body section (`<tbody>`)
- `.table__row` - Row element (`<tr>`)
- `.table__cell` - Data cell (`<td>`)
- `.table__footer` - Footer container (outside table)

#### Advanced Classes

- `.table__column-resizer` - Drag handle for column resizing
- `.table__resizable-container` - Wrapper enabling column resizing
- `.table__load-more` - Sentinel row for infinite scrolling
- `.table__load-more-content` - Styled container for the loading indicator
- `.table__sortable-column-header` - A sortable column's label
- `.table__sortable-column-indicator` - Its sort indicator

#### Variant Classes

- `.table-root--primary` - Gray background container with card-style body
  (default)
- `.table-root--secondary` - No background, standalone rounded headers

### Interactive States

The Table supports both CSS pseudo-classes and data attributes for
flexibility:

- **Hover**: `:hover` or `[data-hovered="true"]` (row background change), on
  rows, columns and column resizers
- **Selected**: `[data-selected="true"]` (row highlight)
- **Focus**: `:focus-visible` or `[data-focus-visible="true"]` (inset focus
  ring on rows, columns, cells and column resizers)
- **Disabled**: `[aria-disabled="true"]` (reduced opacity)
- **Sortable**: `[data-allows-sorting="true"]` (interactive cursor on columns)
- **Sort direction**: `[data-direction]` on a sortable header and its
  indicator
- **Resizing**: `[data-resizing="true"]` and `[data-resizable-direction]` on a
  column resizer
- **Dragging**: `[data-dragging="true"]` on a row dragged (reduced opacity)
- **Drop position**: `[data-drop-position="before"]` or `"after"` on the row
  a drop would land beside (a line in the accent on that side)
- **Tree**: `[data-level]`, `[data-expanded="true"]`,
  `[data-has-child-items="true"]` on a row and its cells,
  `[data-tree-column="true"]` on a cell, and the row's `--table-row-level`

## API Reference

Each prop beside the name HeroUI's React component gives it.

### Table

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `variant` | `variant` | `` [ `primary \| `secondary ] `` | `` `primary `` | Visual variant. Primary has a gray background container; secondary is flat with transparent rows |
| `className` | `class_` | `string` | | Added after HeroUI's classes |

### Table.ScrollContainer, Table.Footer

Each takes `class_`, added after HeroUI's class, and its `children`.

### Table.Content

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `aria-label` | `aria_label` | `string` | | Accessible label for the table |
| `aria-labelledby` | `aria_labelledby` | `string` | | What names it |
| `selectionMode` | `selection_mode` | `` [ `none \| `single \| `multiple ] `` | `` `none `` | Selection behavior: how many rows may be selected |
| `selectionBehavior` | `selection_behavior` | `` [ `toggle \| `replace ] `` | `` `toggle `` | Whether a press toggles a row or chooses it alone |
| `selectedKeys` | `selected_keys` | `string array` | | Controlled selected keys |
| `defaultSelectedKeys` | `default_selected_keys` | `string array` | | Its rows' keys selected at first, kept by itself |
| `onSelectionChange` | `on_selection_change` | `string array -> unit` | | Selection change handler; all is every row's key but a disabled one |
| `disabledKeys` | `disabled_keys` | `string array` | | Its rows' keys disabled |
| `disallowEmptySelection` | `disallow_empty_selection` | `bool` | `false` | Whether one row stays selected |
| `sortDescriptor` | `sort_descriptor` | `Table.sort_descriptor` | | Current sort state |
| `onSortChange` | `on_sort_change` | `Table.sort_descriptor -> unit` | | Sort change handler |
| `treeColumn` | `tree_column` | `string` | | The `id` of the column whose cells hold a tree's chevrons |
| `expandedKeys` | `expanded_keys` | `string array` | | Its rows' keys expanded, controlled |
| `defaultExpandedKeys` | `default_expanded_keys` | `string array` | | Its rows' keys expanded at first, kept by itself |
| `onExpandedChange` | `on_expanded_change` | `string array -> unit` | | Called with the keys expanded |
| `onRowAction` | `on_row_action` | `string -> unit` | | Called with a row's key as its action runs, after the row's own |
| `dragAndDropHooks` | `on_reorder` | `Table.reorder -> unit` | | Its rows dragged by a `` slot=`drag `` button, and told where they were dropped |
| — | `reorder_messages` | `Table.reorder_messages` | React Aria's | What a drag tells a reader |
| `className` | `class_` | `string` | | Added after HeroUI's class |

### Table.Header

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `columns` | — | | | Its columns given by data are a `For` |
| `className` | `class_` | `string` | | Added after HeroUI's class |

### Table.Column

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `id` | `id` | `string` | one of its own | Column identifier, which a sort names |
| `allowsSorting` | `allows_sorting` | `bool` | `false` | Whether the column is sortable |
| `isRowHeader` | `is_row_header` | `bool` | `false` | Whether this column is a row header |
| `width` | `width` | `Table.column_size` | | Its width, controlled, in a resizable table |
| `defaultWidth` | `default_width` | `Table.column_size` | `Fraction 1.` | Default width for resizable columns |
| `minWidth` | `min_width` | `float` | `75.` | Minimum width for resizable columns, in pixels |
| `maxWidth` | `max_width` | `float` | | How wide it may be, in pixels |
| `children` | `children` | | | Its label; HeroUI's render function of its sort direction is `Table.Sortable_column_header`'s reading of it |
| `className` | `class_` | `string` | | Added after HeroUI's class |

### Table.SortableColumnHeader

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `sortDirection` | `sort_direction` | `` [ `ascending \| `descending ] `` | its column's | Current sort direction |
| `showIndicator` | `show_indicator` | `bool` | `true` | Whether to render the sort indicator icon when a direction is set |
| `indicator` | `indicator` | `Jsx.element` | HeroUI's chevron | Custom indicator element. Overrides the default chevron, in a span that receives a `data-direction` attribute |
| `className` | `class_` | `string` | | Added after HeroUI's class |

### Table.Body

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `items` | — | | | Its rows given by data are a `For` |
| `renderEmptyState` | `render_empty_state` | `unit -> Jsx.element` | | Content to display when the table is empty |
| `className` | `class_` | `string` | | Added after HeroUI's class |

### Table.Row

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `id` | `id` | `string` | one of its own | Row identifier |
| `onAction` | `on_action` | `unit -> unit` | | Run by Enter, and by a press as the selection lets it |
| `href` | `href` | `string` | | Opened as its action, as a link is |
| `target`, `rel`, `download`, `hrefLang`, `ping`, `referrerPolicy` | `target`, `rel`, `download`, `href_lang`, `ping`, `referrer_policy` | `string` | | Its link's |
| `routerOptions` | — | | | A link opens as the browser opens one |
| `className` | `class_` | `string` | | Added after HeroUI's class |

### Table.Cell

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `className` | `class_` | `string` | | Added after HeroUI's class |

### Table.ResizableContainer

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `onResizeStart` | `on_resize_start` | `(string * Table.column_size) array -> unit` | | Called as a resize begins, with every column's size |
| `onResize` | `on_resize` | `(string * Table.column_size) array -> unit` | | Called at each step of a resize |
| `onResizeEnd` | `on_resize_end` | `(string * Table.column_size) array -> unit` | | Called as a resize ends |
| `className` | `class_` | `string` | | Added after HeroUI's class |

### Table.ColumnResizer

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `aria-label` | `aria_label` | `string` | `"Resizer"` | Its input's name, beside its column's |
| `className` | `class_` | `string` | | Added after HeroUI's class |

### Table.LoadMore

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `isLoading` | `is_loading` | `bool` | `false` | Whether data is currently loading, its row drawn while it is |
| `onLoadMore` | `on_load_more` | `unit -> unit` | | Handler called when the sentinel row is visible, never while loading |
| `scrollOffset` | `scroll_offset` | `float` | `1.` | How many heights of the view before the end it asks |
| `className` | `class_` | `string` | | Added after HeroUI's class, on the loading row |

### TableLayout

`Virtualizer.table_layout`, each option in pixels.

| React | solidtype | Type | Default | Description |
|---|---|---|---|---|
| `rowHeight` | `row_size` | `float` | `48.` | The fixed height of a row in px |
| `headingHeight` | `heading_size` | `float` | its row's | The fixed height of the header in px |
| `loaderHeight` | `loader_size` | `float` | its row's | The fixed height of a loader element in px |
| `gap` | `gap` | `float` | `0.` | The gap between items |
| `padding` | `padding` | `float` | `0.` | The padding around the list |
| `estimatedRowHeight`, `estimatedHeadingHeight` | — | | | A virtualized table's rows are as high as `row_size` |

### Table.LoadMoreContent

It takes `class_`, added after HeroUI's class, and its `children`.
