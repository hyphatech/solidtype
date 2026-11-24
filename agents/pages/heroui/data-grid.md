# Data Grid

A grid of records given as data, with sorting, selection, column resizing, pinned columns, drag and drop, virtualization and loading more, on HeroUI's Table.

A grid takes its rows as data, each known by its `row_id`, and its columns as
definitions, and draws HeroUI's [Table](table.md) from them:
its keys, selection, resizing and virtualization are the Table's. Its look is
a stylesheet the library ships, imported as
[Theming](theming.md#setup) shows.

## Usage

```ocaml title="data_grid_usage.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Button = Solidtype_heroui.Button
module Chip = Solidtype_heroui.Chip
module Data_grid = Solidtype_heroui.Data_grid
module Dropdown = Solidtype_heroui.Dropdown
module Label = Solidtype_heroui.Label
module Gravity = Solidtype_gravity_icons
module I18n = Solidtype_kobalte.I18n
module Types = Solidtype_kobalte.Types

type status = Succeeded | Processing | Refunded | Failed

type payment = {
  id : string;
  customer : string;
  email : string;
  status : status;
  amount : float;
  fee : float;
  method_ : string;
  region : string;
  description : string;
  date : string;
}

let payments =
  [|
    {
      id = "pay_1N3xDR";
      customer = "Emma Wilson";
      email = "emma@example.com";
      status = Succeeded;
      amount = 2450.;
      fee = 73.5;
      method_ = {js|Visa •••• 4242|js};
      region = "North America";
      description = {js|Annual subscription — Enterprise plan|js};
      date = "2025-12-07";
    };
    {
      id = "pay_1N3x9M";
      customer = "Isabella Nguyen";
      email = "isabella@example.com";
      status = Succeeded;
      amount = 299.;
      fee = 8.97;
      method_ = {js|Visa •••• 1234|js};
      region = "Asia Pacific";
      description = {js|Quarterly subscription — Team plan|js};
      date = "2025-12-03";
    };
    {
      id = "pay_1N3x8L";
      customer = "Jackson Lee";
      email = "jackson@example.com";
      status = Processing;
      amount = 39.;
      fee = 1.43;
      method_ = {js|Mastercard •••• 5555|js};
      region = "North America";
      description = {js|Monthly add-on — Extra seats|js};
      date = "2025-12-02";
    };
    {
      id = "pay_1N3xCQ";
      customer = "Liam Johnson";
      email = "liam@example.com";
      status = Refunded;
      amount = 150.;
      fee = 4.5;
      method_ = {js|Mastercard •••• 6789|js};
      region = "Europe";
      description = {js|Monthly subscription — Pro plan|js};
      date = "2025-12-06";
    };
    {
      id = "pay_1N3x7K";
      customer = "Olivia Martin";
      email = "olivia@example.com";
      status = Succeeded;
      amount = 1999.;
      fee = 59.97;
      method_ = {js|Visa •••• 4242|js};
      region = "North America";
      description = {js|Annual subscription — Pro plan|js};
      date = "2025-12-01";
    };
    {
      id = "pay_1N3xBP";
      customer = "Sofia Davis";
      email = "sofia@example.com";
      status = Succeeded;
      amount = 450.;
      fee = 13.5;
      method_ = {js|Visa •••• 9012|js};
      region = "Europe";
      description = {js|One-time purchase — Enterprise setup|js};
      date = "2025-12-05";
    };
    {
      id = "pay_1N3xAN";
      customer = "William Kim";
      email = "will@example.com";
      status = Failed;
      amount = 99.;
      fee = 3.17;
      method_ = {js|Amex •••• 3782|js};
      region = "Asia Pacific";
      description = {js|Monthly subscription — Starter plan|js};
      date = "2025-12-04";
    };
  |]

let status_name = function
  | Succeeded -> "Succeeded"
  | Processing -> "Processing"
  | Refunded -> "Refunded"
  | Failed -> "Failed"

let status_color = function
  | Succeeded -> `success
  | Processing -> `warning
  | Refunded -> `default
  | Failed -> `danger

let actions p =
  <Dropdown>
    <Button
      is_icon_only=true
      aria_label=("Actions for " ^ (S.get p).customer)
      size=`sm
      variant=`tertiary>
      <Gravity.Ellipsis_vertical class_="size-4" />
    </Button>
    <Dropdown.Popover>
      <Dropdown.Menu on_action=(fun (_ : string) -> ())>
        <Dropdown.Item id="copy" text_value="Copy payment ID">
          <Gravity.Copy class_="size-4 shrink-0 text-muted" />
          <Label>"Copy payment ID"</Label>
        </Dropdown.Item>
        <Dropdown.Item id="view" text_value="View details">
          <Gravity.Eye class_="size-4 shrink-0 text-muted" />
          <Label>"View details"</Label>
        </Dropdown.Item>
        <Dropdown.Item id="edit" text_value="Edit payment">
          <Gravity.Pencil class_="size-4 shrink-0 text-muted" />
          <Label>"Edit payment"</Label>
        </Dropdown.Item>
        <Dropdown.Item id="delete" text_value="Delete" variant=`danger>
          <Gravity.Trash_bin class_="size-4 shrink-0 text-danger" />
          <Label>"Delete"</Label>
        </Dropdown.Item>
      </Dropdown.Menu>
    </Dropdown.Popover>
  </Dropdown>

let columns ~money ~day =
  let amount ~class_ value =
    <span class_>
      (Jsx.string (Types.NumberFormat.format (S.get money) value))
    </span>
  in
  [|
    Data_grid.column ~id:"customer" ~header:(Text "Customer")
      ~is_row_header:true ~default_width:(Pixels 240.) ~allows_resizing:true
      ~sort:(By_text (fun p -> p.customer))
      (fun p ->
        <div class_="flex flex-col">
          <span class_="text-sm font-medium">
            (Jsx.string (S.get p).customer)
          </span>
          <span class_="text-xs text-muted">(Jsx.string (S.get p).email)</span>
        </div>);
    Data_grid.column ~id:"id" ~header:(Text "Transaction ID")
      ~default_width:(Pixels 130.) ~allows_resizing:true
      ~cell_class:"font-mono text-xs text-muted" (fun p ->
        Jsx.string (S.get p).id);
    Data_grid.column ~id:"status" ~header:(Text "Status")
      ~default_width:(Pixels 120.) ~allows_resizing:true
      ~sort:(By_text (fun p -> status_name p.status))
      (fun p ->
        <Chip
          color=(status_color (S.get p).status)
          size=`sm
          variant=`soft
          class_="gap-1">
          <span class_="size-1.5 rounded-full bg-current" />
          (Jsx.string (status_name (S.get p).status))
        </Chip>);
    Data_grid.column ~id:"amount" ~header:(Text "Amount") ~align:`end_
      ~default_width:(Pixels 110.) ~allows_resizing:true
      ~sort:(By (fun a b -> Float.compare a.amount b.amount))
      (fun p -> amount ~class_:"font-medium tabular-nums" (S.get p).amount);
    Data_grid.column ~id:"fee" ~header:(Text "Fee") ~align:`end_
      ~default_width:(Pixels 90.) ~allows_resizing:true
      ~sort:(By (fun a b -> Float.compare a.fee b.fee))
      (fun p -> amount ~class_:"text-muted tabular-nums" (S.get p).fee);
    Data_grid.column ~id:"net" ~header:(Text "Net") ~align:`end_
      ~default_width:(Pixels 110.) ~allows_resizing:true
      ~sort:
        (By (fun a b -> Float.compare (a.amount -. a.fee) (b.amount -. b.fee)))
      (fun p ->
        amount ~class_:"font-medium tabular-nums"
          ((S.get p).amount -. (S.get p).fee));
    Data_grid.column ~id:"method" ~header:(Text "Payment Method")
      ~default_width:(Pixels 170.) ~allows_resizing:true (fun p ->
        Jsx.string (S.get p).method_);
    Data_grid.column ~id:"region" ~header:(Text "Region")
      ~default_width:(Pixels 130.) ~allows_resizing:true
      ~sort:(By_text (fun p -> p.region))
      (fun p -> Jsx.string (S.get p).region);
    Data_grid.column ~id:"description" ~header:(Text "Description")
      ~default_width:(Pixels 240.) ~allows_resizing:true
      ~cell_class:"text-muted" (fun p -> Jsx.string (S.get p).description);
    Data_grid.column ~id:"date" ~header:(Text "Date")
      ~default_width:(Pixels 120.) ~allows_resizing:true
      ~sort:(By (fun a b -> String.compare a.date b.date))
      (fun p ->
        <span class_="text-muted tabular-nums">
          (Jsx.string
             (Types.DateTimeFormat.format (S.get day)
                ~date:(Types.Either.right (Js.Date.fromString (S.get p).date))
                ()))
        </span>);
    Data_grid.column ~id:"actions"
      ~header:(Element (fun () -> <span class_="sr-only">"Actions"</span>))
      ~align:`end_ ~pinned:`end_ ~width:(Pixels 72.) actions;
  |]

let make () =
  let money =
    I18n.create_number_formatter
      (Types.Either.left
         (Types.NumberFormatOptions.make ~style:`currency ~currency:"USD" ()))
  in
  let day =
    I18n.create_date_formatter
      (Types.Either.left
         (Types.DateTimeFormatOptions.make ~year:"numeric" ~month:"short"
            ~day:"numeric" ~time_zone:"UTC" ()))
  in
  <Data_grid
    aria_label="Payments"
    rows=payments
    row_id=(fun p -> p.id)
    columns=(columns ~money ~day)
    selection_mode=`multiple
    show_selection_checkboxes=true
    default_sort_descriptor={ column = "customer"; direction = `ascending }
    allows_column_resize=true
    content_class="min-w-[1400px]"
  />
```

## Anatomy

```ocaml
<Data_grid aria_label="Payments" rows row_id=(fun p -> p.id) columns />
```

## Column Definitions

`Data_grid.column ~id ~header cell` makes a column: `cell` draws a cell from
its row, and `header` is `Text`, `Element` of a function drawn where the
header is, or `Sorted`, drawn from the column's sort direction. A column is
sortable exactly when it has a `sort`, `By_text` of a row's text, in the
order of the page's language, or `By` a comparison of two rows. `align`,
`width`, `min_width`, `max_width`, `pinned`, `header_class` and `cell_class`
lay it out.

## Sorting

A grid given no `sort_descriptor` keeps its own sort, `default_sort_descriptor`
at first, and orders its rows as a header is pressed. Given one, the sort is
the application's: the grid draws its rows as given and tells
`on_sort_change`, as a server sorts them. A `By` comparison orders rows by
anything, here priorities by their rank.

```ocaml title="data_grid_sorting.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Chip = Solidtype_heroui.Chip
module Data_grid = Solidtype_heroui.Data_grid

type priority = Low | Medium | High | Urgent
type task = { id : string; title : string; priority : priority; due : string }

let tasks =
  [|
    {
      id = "1";
      title = "Renew the SSL certificate";
      priority = Urgent;
      due = "2026-11-21";
    };
    { id = "2"; title = "Plan the offsite"; priority = Low; due = "2026-12-10" };
    {
      id = "3";
      title = "Review the Q4 budget";
      priority = High;
      due = "2026-11-28";
    };
    {
      id = "4";
      title = "Update the onboarding guide";
      priority = Medium;
      due = "2026-12-02";
    };
    {
      id = "5";
      title = "Fix the export timeout";
      priority = High;
      due = "2026-11-24";
    };
  |]

let rank = function Low -> 0 | Medium -> 1 | High -> 2 | Urgent -> 3

let priority_name = function
  | Low -> "Low"
  | Medium -> "Medium"
  | High -> "High"
  | Urgent -> "Urgent"

let priority_color = function
  | Low -> `default
  | Medium -> `accent
  | High -> `warning
  | Urgent -> `danger

let columns =
  [|
    Data_grid.column ~id:"title" ~header:(Text "Task") ~is_row_header:true
      ~sort:(By_text (fun t -> t.title))
      (fun t -> Jsx.string (S.get t).title);
    (* Priorities in their own order, never their names'. *)
    Data_grid.column ~id:"priority" ~header:(Text "Priority")
      ~sort:(By (fun a b -> Int.compare (rank a.priority) (rank b.priority)))
      (fun t ->
        <Chip color=(priority_color (S.get t).priority) size=`sm variant=`soft>
          (Jsx.string (priority_name (S.get t).priority))
        </Chip>);
    Data_grid.column ~id:"due" ~header:(Text "Due") ~align:`end_
      ~sort:(By_text (fun t -> t.due))
      ~cell_class:"tabular-nums text-muted"
      (fun t -> Jsx.string (S.get t).due);
  |]

let make () =
  <Data_grid
    aria_label="Tasks by priority"
    rows=tasks
    row_id=(fun t -> t.id)
    columns
    default_sort_descriptor={ column = "priority"; direction = `descending }
  />
```

## Row Selection

`selection_mode` with `show_selection_checkboxes` adds a column of
checkboxes, the header's choosing every row. The selection is
`selected_keys`, or `default_selected_keys`, and `on_selection_change`.

## Column Resizing

`allows_column_resize` on the grid, and `allows_resizing` on a column, let a
column be resized by a drag or the keys, within its `min_width` and
`max_width`; `on_column_resize` is told each step and `on_column_resize_end`
the last. A column needs no width of its own to be resized.

```ocaml title="data_grid_column_resizing.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Data_grid = Solidtype_heroui.Data_grid
module Table = Solidtype_heroui.Table

type member = { id : string; name : string; role : string; email : string }

let members =
  [|
    {
      id = "1";
      name = "Kate Moore";
      role = "Chief Executive Officer";
      email = "kate@acme.com";
    };
    {
      id = "2";
      name = "John Smith";
      role = "Chief Technology Officer";
      email = "john@acme.com";
    };
    {
      id = "3";
      name = "Sara Johnson";
      role = "Chief Marketing Officer";
      email = "sara@acme.com";
    };
    {
      id = "4";
      name = "Michael Brown";
      role = "Chief Financial Officer";
      email = "michael@acme.com";
    };
  |]

let columns =
  [|
    Data_grid.column ~id:"name" ~header:(Text "Name") ~is_row_header:true
      ~allows_resizing:true ~default_width:(Pixels 180.) ~min_width:120.
      (fun m -> Jsx.string (S.get m).name);
    Data_grid.column ~id:"role" ~header:(Text "Role") ~allows_resizing:true
      ~default_width:(Fraction 1.) ~min_width:160. (fun m ->
        Jsx.string (S.get m).role);
    Data_grid.column ~id:"email" ~header:(Text "Email") ~allows_resizing:true
      ~default_width:(Fraction 1.) ~min_width:160. (fun m ->
        Jsx.string (S.get m).email);
  |]

let size_name : Table.column_size -> string = function
  | Pixels p -> Js.Float.toString p ^ "px"
  | Percent p -> Js.Float.toString p ^ "%"
  | Fraction f -> Js.Float.toString f ^ "fr"

let make () =
  let widths, set_widths = S.create_signal "" in
  <div class_="flex flex-col gap-3">
    <Data_grid
      aria_label="Resizable columns"
      rows=members
      row_id=(fun m -> m.id)
      columns
      allows_column_resize=true
      on_column_resize_end=(fun sizes ->
                             S.set set_widths
                               (String.concat ", "
                                  (Array.to_list
                                     (Array.map
                                        (fun (id, size) ->
                                          id ^ " " ^ size_name size)
                                        sizes))))
    />
    <p class_="text-sm text-muted">
      "Widths: "
      (Jsx.string (match S.get widths with "" -> "as given" | w -> w))
    </p>
  </div>
```

## Pinned Columns

A column `pinned` to `` `start `` or `` `end_ `` stays in view as the others
scroll sideways, a line at its edge while content passes beneath it. It needs
no width of its own: its place is measured. The checkbox and handle columns
stay with the columns pinned to the start.

```ocaml title="data_grid_pinned_columns.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Chip = Solidtype_heroui.Chip
module Data_grid = Solidtype_heroui.Data_grid
module Gravity = Solidtype_gravity_icons

type strength = Very_strong | Strong | Weak | Very_weak | No_communication

type company = {
  id : string;
  name : string;
  dot : string;
  industries : string array;
  linkedin : string;
  last_interaction : string;
  strength : strength;
}

let companies =
  [|
    {
      id = "1";
      name = "LVMH";
      dot = "bg-warning";
      industries = [| "Luxury"; "E-commerce" |];
      linkedin = "lvmh";
      last_interaction = "No contact";
      strength = No_communication;
    };
    {
      id = "2";
      name = "Disney";
      dot = "bg-success";
      industries = [| "Media" |];
      linkedin = "disney-music-group";
      last_interaction = "No contact";
      strength = No_communication;
    };
    {
      id = "3";
      name = "PayPal";
      dot = "bg-accent";
      industries = [| "Financial Services"; "Payments" |];
      linkedin = "paypal";
      last_interaction = "No contact";
      strength = No_communication;
    };
    {
      id = "4";
      name = "sweetgreen";
      dot = "bg-success";
      industries = [| "Food"; "Retail" |];
      linkedin = "sweetgreen";
      last_interaction = "about 2 hours ago";
      strength = Very_strong;
    };
    {
      id = "5";
      name = "OpenPhone";
      dot = "bg-accent";
      industries = [| "Telecom" |];
      linkedin = "openphone";
      last_interaction = "2 days ago";
      strength = Weak;
    };
    {
      id = "6";
      name = "Attio";
      dot = "bg-accent";
      industries = [| "Enterprise"; "CRM" |];
      linkedin = "attio";
      last_interaction = "about 3 hours ago";
      strength = Very_weak;
    };
    {
      id = "7";
      name = "Opera";
      dot = "bg-danger";
      industries = [| "Software"; "Browsers"; "AI" |];
      linkedin = "opera-software";
      last_interaction = "14 days ago";
      strength = Very_weak;
    };
    {
      id = "8";
      name = "Google";
      dot = "bg-accent";
      industries = [| "Hosting"; "Search" |];
      linkedin = "google";
      last_interaction = "9 days ago";
      strength = Weak;
    };
  |]

let strength_name = function
  | Very_strong -> "Very strong"
  | Strong -> "Strong"
  | Weak -> "Weak"
  | Very_weak -> "Very weak"
  | No_communication -> "No communication"

let strength_class = function
  | Very_strong | Strong -> "text-success"
  | Weak -> "text-warning"
  | Very_weak -> "text-danger"
  | No_communication -> "text-muted"

let columns =
  [|
    Data_grid.column ~id:"company" ~header:(Text "Company") ~is_row_header:true
      ~pinned:`start ~width:(Pixels 160.)
      ~sort:(By_text (fun c -> c.name))
      (fun c ->
        <span class_="flex items-center gap-2 font-medium">
          <span class_=("size-2 shrink-0 rounded-full " ^ (S.get c).dot) />
          (Jsx.string (S.get c).name)
        </span>);
    Data_grid.column ~id:"industries" ~header:(Text "Industries")
      ~width:(Pixels 220.) (fun c ->
        <span class_="flex items-center gap-1">
          <Chip size=`sm variant=`soft>
            (Jsx.string (S.get c).industries.(0))
          </Chip>
          (match Array.length (S.get c).industries with
          | 1 -> Jsx.fragment [||]
          | n ->
              <span class_="text-xs text-muted">
                (Jsx.string ("+" ^ string_of_int (n - 1)))
              </span>)
        </span>);
    Data_grid.column ~id:"linkedin" ~header:(Text "LinkedIn")
      ~width:(Pixels 200.) (fun c ->
        <span class_="flex items-center gap-1 text-muted">
          <Gravity.Link class_="size-3.5" /> (Jsx.string (S.get c).linkedin)
        </span>);
    Data_grid.column ~id:"last" ~header:(Text "Last interaction")
      ~width:(Pixels 180.) (fun c -> Jsx.string (S.get c).last_interaction);
    Data_grid.column ~id:"strength" ~header:(Text "Connection strength")
      ~width:(Pixels 200.) (fun c ->
        <span
          class_=("flex items-center gap-1.5 "
                 ^ strength_class (S.get c).strength)>
          <span class_="size-1.5 rounded-full bg-current" />
          (Jsx.string (strength_name (S.get c).strength))
        </span>);
  |]

let make () =
  <Data_grid
    aria_label="Companies"
    rows=companies
    row_id=(fun c -> c.id)
    columns
    selection_mode=`multiple
    show_selection_checkboxes=true
    footer=(<span class_="text-sm text-muted">
              (Jsx.string (string_of_int (Array.length companies) ^ " count"))
            </span>)
  />
```

## Drag and Drop

Given `on_reorder`, each row has a handle: Enter grabs the row, the arrows
move it, Enter drops it and Escape lets it go, and a pointer drags it.
`on_reorder` is told the rows moved, where they landed, and `rows`, every row
in its new order. Selected rows are dragged together.

```ocaml title="data_grid_drag_and_drop.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Chip = Solidtype_heroui.Chip
module Data_grid = Solidtype_heroui.Data_grid

type task = { id : string; title : string; assignee : string; points : int }

let tasks =
  [|
    {
      id = "task-1";
      title = "Design system audit";
      assignee = "Kate Moore";
      points = 5;
    };
    {
      id = "task-2";
      title = "Billing page redesign";
      assignee = "John Smith";
      points = 8;
    };
    {
      id = "task-3";
      title = "Onboarding emails";
      assignee = "Sara Johnson";
      points = 3;
    };
    {
      id = "task-4";
      title = "API rate limits";
      assignee = "Michael Brown";
      points = 5;
    };
    {
      id = "task-5";
      title = "Dark mode polish";
      assignee = "Kate Moore";
      points = 2;
    };
  |]

let columns =
  [|
    Data_grid.column ~id:"title" ~header:(Text "Task") ~is_row_header:true
      (fun t -> Jsx.string (S.get t).title);
    Data_grid.column ~id:"assignee" ~header:(Text "Assignee")
      ~cell_class:"text-muted" (fun t -> Jsx.string (S.get t).assignee);
    Data_grid.column ~id:"points" ~header:(Text "Points") ~align:`end_ (fun t ->
        <Chip size=`sm variant=`soft>(Jsx.int (S.get t).points)</Chip>);
  |]

let make () =
  let rows, set_rows = S.create_signal tasks in
  <Data_grid
    aria_label="Sprint backlog"
    rows=(S.get rows)
    row_id=(fun t -> t.id)
    columns
    on_reorder=(fun r -> S.set set_rows r.rows)
  />
```

## Editable Cells

A cell draws any control: an input, an
[`Inline_select`](inline-select.md), a
[`Number_stepper`](number-stepper.md), a `Switch`. Every key
of a field is its own, and the arrows from a button move between cells.

```ocaml title="data_grid_editable_cells.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Show = Solidtype.Show
module Button = Solidtype_heroui.Button
module Chip = Solidtype_heroui.Chip
module Data_grid = Solidtype_heroui.Data_grid
module Inline_select = Solidtype_heroui.Inline_select
module Input = Solidtype_heroui.Input
module List_box = Solidtype_heroui.List_box
module Number_stepper = Solidtype_heroui.Number_stepper
module Switch = Solidtype_heroui.Switch
module Gravity = Solidtype_gravity_icons

external target : Dom.inputEvent -> Dom.htmlInputElement = "target" [@@mel.get]
external value_of : Dom.htmlInputElement -> string = "value" [@@mel.get]
external key : Dom.keyboardEvent -> string = "key" [@@mel.get]
external focus : Dom.htmlInputElement -> unit = "focus" [@@mel.send]
external focus_button : Dom.htmlButtonElement -> unit = "focus" [@@mel.send]
external select_text : Dom.htmlInputElement -> unit = "select" [@@mel.send]

type priority = High | Medium | Low

type flag = {
  id : string;
  feature : string;
  priority : priority;
  points : float;
  enabled : bool;
}

let flag id feature priority points enabled =
  { id; feature; priority; points; enabled }

let flags =
  [|
    flag "1" "Dark mode" High 8. true;
    flag "2" "CSV export" Medium 3. true;
    flag "3" "Keyboard shortcuts" Low 5. false;
    flag "4" "Two-factor auth" High 13. true;
    flag "5" "Bulk import" Medium 8. false;
    flag "6" "Audit log" High 5. true;
    flag "7" "Webhooks" Low 3. false;
    flag "8" "Custom branding" Medium 8. true;
  |]

let priorities = [| High; Medium; Low |]
let priority_key = function High -> "high" | Medium -> "medium" | Low -> "low"

let priority_name = function
  | High -> "High"
  | Medium -> "Medium"
  | Low -> "Low"

let priority_color = function
  | High -> `danger
  | Medium -> `warning
  | Low -> `default

let priority_chip p =
  <Chip color=(priority_color p) size=`sm variant=`soft>
    (Jsx.string (priority_name p))
  </Chip>

(* The title as an input, its text chosen as it opens: Enter or Save keeps
   it, Escape or Cancel leaves the title as it was. *)
let title_editor ~title ~save ~cancel =
  let draft, set_draft = S.create_signal title in
  let field = ref None in
  S.on_mount (fun () ->
      Option.iter
        (fun e ->
          focus e;
          select_text e)
        !field);
  let keep () =
    match String.trim (S.get draft) with "" -> cancel () | t -> save t
  in
  <div class_="flex items-center gap-1">
    <Input
      aria_label="Edit title"
      class_="h-7 w-[180px] text-sm"
      value=(S.get draft)
      ref=(fun e -> field := Some e)
      on_input=(fun e -> S.set set_draft (value_of (target e)))
      on_key_down=(fun e ->
                    match key e with
                    | "Enter" -> keep ()
                    | "Escape" -> cancel ()
                    | _ -> ())
    />
    <Button
      is_icon_only=true
      size=`sm
      variant=`ghost
      aria_label="Save"
      on_click=(fun _ -> keep ())>
      <Gravity.Check class_="size-3" />
    </Button>
    <Button
      is_icon_only=true
      size=`sm
      variant=`ghost
      aria_label="Cancel"
      on_click=(fun _ -> cancel ())>
      <Gravity.Xmark class_="size-3" />
    </Button>
  </div>

(* Shown while its row is hovered, or reached by the keys. *)
let edit_button ~ref ~on_click =
  <Button
    is_icon_only=true
    size=`sm
    variant=`ghost
    aria_label="Edit title"
    class_="opacity-0 group-hover/edit:opacity-100 focus-visible:opacity-100"
    ref
    on_click=(fun _ -> on_click ())>
    <Gravity.Pencil class_="size-3" />
  </Button>

(* The title, and its button, which takes the focus back as editing ends,
   since the input that had it is gone. *)
let title_cell ~title ~rename =
  let editing, set_editing = S.create_signal false in
  let button = ref None in
  let finish () =
    S.set set_editing false;
    Option.iter focus_button !button
  in
  <Show
    when_=(S.get editing)
    fallback=(<div class_="group/edit flex items-center gap-1.5">
                <span class_="text-sm font-medium">
                  (Jsx.string (S.get title))
                </span>
                (edit_button
                   ~ref:(fun b -> button := Some b)
                   ~on_click:(fun () -> S.set set_editing true))
              </div>)>
    (title_editor ~title:(S.get title)
       ~save:(fun t ->
         rename t;
         finish ())
       ~cancel:finish)
  </Show>

let summary =
  "Edit titles, change priorities, adjust story points, and toggle features \
   inline."

let make () =
  let rows, set_rows = S.create_signal flags in
  let change id f =
    S.set set_rows
      (Array.map
         (fun r -> if String.equal r.id id then f r else r)
         (S.get rows))
  in
  let columns =
    [|
      Data_grid.column ~id:"feature" ~header:(Text "Feature")
        ~is_row_header:true ~width:(Pixels 300.) (fun row ->
          title_cell
            ~title:(S.accessor (fun () -> (S.get row).feature))
            ~rename:(fun feature ->
              change (S.get row).id (fun r -> { r with feature })));
      Data_grid.column ~id:"priority" ~header:(Text "Priority")
        ~width:(Pixels 176.) (fun row ->
          <Inline_select
            value=[| priority_key (S.get row).priority |]
            on_change=(fun keys ->
                        match
                          Array.find_opt
                            (fun p -> Array.mem (priority_key p) keys)
                            priorities
                        with
                        | Some priority ->
                            change (S.get row).id (fun r -> { r with priority })
                        | None -> ())>
            <Inline_select.Trigger aria_label="Priority">
              <Inline_select.Value>
                (priority_chip (S.get row).priority)
              </Inline_select.Value>
              <Inline_select.Indicator />
            </Inline_select.Trigger>
            <Inline_select.Popover>
              <List_box>
                <For each=priorities>
                  (fun p _ ->
                    <List_box.Item
                      id=(priority_key p) text_value=(priority_name p)>
                      (priority_chip p) <List_box.Item_indicator />
                    </List_box.Item>)
                </For>
              </List_box>
            </Inline_select.Popover>
          </Inline_select>);
      Data_grid.column ~id:"points" ~header:(Text "Story Points") ~align:`center
        ~width:(Pixels 167.) (fun row ->
          <Number_stepper
            aria_label="Story points"
            size=`sm
            class_="justify-center"
            value=(S.get row).points
            min_value=0.
            on_change=(fun points ->
                        change (S.get row).id (fun r -> { r with points }))>
            <Number_stepper.Group>
              <Number_stepper.Decrement_button />
              <Number_stepper.Value />
              <Number_stepper.Increment_button />
            </Number_stepper.Group>
          </Number_stepper>);
      Data_grid.column ~id:"enabled" ~header:(Text "Enabled") ~align:`center
        ~width:(Pixels 117.) (fun row ->
          <Switch
            aria_label="Enabled"
            is_selected=(S.get row).enabled
            on_change=(fun enabled ->
                        change (S.get row).id (fun r -> { r with enabled }))>
            <Switch.Content>
              <Switch.Control><Switch.Thumb /></Switch.Control>
            </Switch.Content>
          </Switch>);
    |]
  in
  let enabled () =
    Array.length (Js.Array.filter ~f:(fun r -> r.enabled) (S.get rows))
  in
  let effort () =
    Array.fold_left (fun sum r -> sum +. r.points) 0. (S.get rows)
  in
  <div class_="flex w-full max-w-3xl flex-col gap-3">
    <div class_="flex flex-col gap-1">
      <h3 class_="text-lg font-semibold">"Feature Flags"</h3>
      <p class_="text-sm text-muted">(Jsx.string summary)</p>
    </div>
    <Data_grid
      aria_label="Feature flags"
      rows=(S.get rows)
      row_id=(fun r -> r.id)
      columns
      content_class="min-w-[640px]"
    />
    <div class_="flex items-center gap-4 text-sm text-muted">
      <span>
        (Jsx.string
           (string_of_int (enabled ())
           ^ " of "
           ^ string_of_int (Array.length (S.get rows))
           ^ " enabled"))
      </span>
      <span>
        (Jsx.string ("Total effort: " ^ Js.Float.toString (effort ()) ^ " pts"))
      </span>
    </div>
  </div>
```

## Empty State

`empty_state` is drawn across every column while there are no rows.

```ocaml title="data_grid_empty_state.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Button = Solidtype_heroui.Button
module Data_grid = Solidtype_heroui.Data_grid
module Empty_state = Solidtype_heroui.Empty_state
module Gravity = Solidtype_gravity_icons

type project = { id : string; name : string; owner : string; files : int }

let columns =
  [|
    Data_grid.column ~id:"project" ~header:(Text "Project") ~is_row_header:true
      (fun p -> Jsx.string (S.get p).name);
    Data_grid.column ~id:"owner" ~header:(Text "Owner") (fun p ->
        Jsx.string (S.get p).owner);
    Data_grid.column ~id:"files" ~header:(Text "Files") ~align:`end_ (fun p ->
        Jsx.int (S.get p).files);
  |]

let make () =
  <Data_grid
    aria_label="Projects"
    rows=[||]
    row_id=(fun p -> p.id)
    columns
    empty_state=(<Empty_state class_="flex flex-col items-center gap-2 py-12">
                   <span
                     class_="flex size-10 items-center justify-center \
                             rounded-full bg-default">
                     <Gravity.Folder_open class_="size-5 text-muted" />
                   </span>
                   <span class_="font-medium text-foreground">
                     "No projects yet"
                   </span>
                   <span class_="text-sm text-muted">
                     "Get started by creating your first project."
                   </span>
                   <Button size=`sm variant=`secondary>
                     <Gravity.Plus class_="size-4" /> "Create project"
                   </Button>
                 </Empty_state>)
  />
```

## Async Loading

Given `on_load_more`, the grid asks for more rows as its end comes into view,
`load_more_content` drawn while `is_loading_more`. Give the scroll container
a height by `scroll_container_class`.

```ocaml title="data_grid_async_loading.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Data_grid = Solidtype_heroui.Data_grid
module Spinner = Solidtype_heroui.Spinner

type order = { id : string; customer : string; total : string }

let page n =
  Array.init 20 (fun i ->
      let k = (n * 20) + i + 1 in
      {
        id = string_of_int k;
        customer = "Customer " ^ string_of_int k;
        total = "$" ^ string_of_int ((k * 37 mod 900) + 100) ^ ".00";
      })

let columns =
  [|
    Data_grid.column ~id:"id" ~header:(Text "Order") ~is_row_header:true
      ~cell_class:"tabular-nums" (fun o -> Jsx.string ("#" ^ (S.get o).id));
    Data_grid.column ~id:"customer" ~header:(Text "Customer") (fun o ->
        Jsx.string (S.get o).customer);
    Data_grid.column ~id:"total" ~header:(Text "Total") ~align:`end_
      ~cell_class:"tabular-nums" (fun o -> Jsx.string (S.get o).total);
  |]

let make () =
  let rows, set_rows = S.create_signal (page 0) in
  let loading, set_loading = S.create_signal false in
  let more () = Array.length (S.get rows) < 100 in
  <Data_grid
    aria_label="Orders"
    rows=(S.get rows)
    row_id=(fun o -> o.id)
    columns
    scroll_container_class="max-h-[400px] overflow-y-auto"
    sticky_header=true
    is_loading_more=(S.get loading)
    on_load_more=(fun () ->
                   if more () && not (S.get loading) then begin
                     S.set set_loading true;
                     ignore
                       (Js.Global.setTimeout
                          ~f:(fun () ->
                            S.set set_rows
                              (Array.append (S.get rows)
                                 (page (Array.length (S.get rows) / 20)));
                            S.set set_loading false)
                          800
                         : Js.Global.timeoutId)
                   end)
    load_more_content=(<Spinner size=`md />)
  />
```

## Sticky Header

`sticky_header` keeps the header at the top of the scroll container, which
`scroll_container_class` gives a height or a maximum height. Rows keep their
own heights, and selection, sorting, pinned columns and resizing work as in any
grid.

```ocaml title="data_grid_sticky_header.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Button = Solidtype_heroui.Button
module Chip = Solidtype_heroui.Chip
module Data_grid = Solidtype_heroui.Data_grid
module Dropdown = Solidtype_heroui.Dropdown
module Label = Solidtype_heroui.Label
module Gravity = Solidtype_gravity_icons
module I18n = Solidtype_kobalte.I18n
module Types = Solidtype_kobalte.Types

type status = Succeeded | Processing | Refunded | Failed

type payment = {
  id : string;
  customer : string;
  email : string;
  status : status;
  amount : float;
  fee : float;
  method_ : string;
  region : string;
  description : string;
  date : string;
}

let payments =
  [|
    {
      id = "pay_1N3xDR";
      customer = "Emma Wilson";
      email = "emma@example.com";
      status = Succeeded;
      amount = 2450.;
      fee = 73.5;
      method_ = {js|Visa •••• 4242|js};
      region = "North America";
      description = {js|Annual subscription — Enterprise plan|js};
      date = "2025-12-07";
    };
    {
      id = "pay_1N3x9M";
      customer = "Isabella Nguyen";
      email = "isabella@example.com";
      status = Succeeded;
      amount = 299.;
      fee = 8.97;
      method_ = {js|Visa •••• 1234|js};
      region = "Asia Pacific";
      description = {js|Quarterly subscription — Team plan|js};
      date = "2025-12-03";
    };
    {
      id = "pay_1N3x8L";
      customer = "Jackson Lee";
      email = "jackson@example.com";
      status = Processing;
      amount = 39.;
      fee = 1.43;
      method_ = {js|Mastercard •••• 5555|js};
      region = "North America";
      description = {js|Monthly add-on — Extra seats|js};
      date = "2025-12-02";
    };
    {
      id = "pay_1N3xCQ";
      customer = "Liam Johnson";
      email = "liam@example.com";
      status = Refunded;
      amount = 150.;
      fee = 4.5;
      method_ = {js|Mastercard •••• 6789|js};
      region = "Europe";
      description = {js|Monthly subscription — Pro plan|js};
      date = "2025-12-06";
    };
    {
      id = "pay_1N3x7K";
      customer = "Olivia Martin";
      email = "olivia@example.com";
      status = Succeeded;
      amount = 1999.;
      fee = 59.97;
      method_ = {js|Visa •••• 4242|js};
      region = "North America";
      description = {js|Annual subscription — Pro plan|js};
      date = "2025-12-01";
    };
    {
      id = "pay_1N3xBP";
      customer = "Sofia Davis";
      email = "sofia@example.com";
      status = Succeeded;
      amount = 450.;
      fee = 13.5;
      method_ = {js|Visa •••• 9012|js};
      region = "Europe";
      description = {js|One-time purchase — Enterprise setup|js};
      date = "2025-12-05";
    };
    {
      id = "pay_1N3xAN";
      customer = "William Kim";
      email = "will@example.com";
      status = Failed;
      amount = 99.;
      fee = 3.17;
      method_ = {js|Amex •••• 3782|js};
      region = "Asia Pacific";
      description = {js|Monthly subscription — Starter plan|js};
      date = "2025-12-04";
    };
  |]

let status_name = function
  | Succeeded -> "Succeeded"
  | Processing -> "Processing"
  | Refunded -> "Refunded"
  | Failed -> "Failed"

let status_color = function
  | Succeeded -> `success
  | Processing -> `warning
  | Refunded -> `default
  | Failed -> `danger

let actions p =
  <Dropdown>
    <Button
      is_icon_only=true
      aria_label=("Actions for " ^ (S.get p).customer)
      size=`sm
      variant=`tertiary>
      <Gravity.Ellipsis_vertical class_="size-4" />
    </Button>
    <Dropdown.Popover>
      <Dropdown.Menu on_action=(fun (_ : string) -> ())>
        <Dropdown.Item id="copy" text_value="Copy payment ID">
          <Gravity.Copy class_="size-4 shrink-0 text-muted" />
          <Label>"Copy payment ID"</Label>
        </Dropdown.Item>
        <Dropdown.Item id="view" text_value="View details">
          <Gravity.Eye class_="size-4 shrink-0 text-muted" />
          <Label>"View details"</Label>
        </Dropdown.Item>
        <Dropdown.Item id="edit" text_value="Edit payment">
          <Gravity.Pencil class_="size-4 shrink-0 text-muted" />
          <Label>"Edit payment"</Label>
        </Dropdown.Item>
        <Dropdown.Item id="delete" text_value="Delete" variant=`danger>
          <Gravity.Trash_bin class_="size-4 shrink-0 text-danger" />
          <Label>"Delete"</Label>
        </Dropdown.Item>
      </Dropdown.Menu>
    </Dropdown.Popover>
  </Dropdown>

let columns ~money ~day =
  let amount ~class_ value =
    <span class_>
      (Jsx.string (Types.NumberFormat.format (S.get money) value))
    </span>
  in
  [|
    Data_grid.column ~id:"customer" ~header:(Text "Customer")
      ~is_row_header:true ~default_width:(Pixels 240.) ~allows_resizing:true
      ~sort:(By_text (fun p -> p.customer))
      (fun p ->
        <div class_="flex flex-col">
          <span class_="text-sm font-medium">
            (Jsx.string (S.get p).customer)
          </span>
          <span class_="text-xs text-muted">(Jsx.string (S.get p).email)</span>
        </div>);
    Data_grid.column ~id:"id" ~header:(Text "Transaction ID")
      ~default_width:(Pixels 130.) ~allows_resizing:true
      ~cell_class:"font-mono text-xs text-muted" (fun p ->
        Jsx.string (S.get p).id);
    Data_grid.column ~id:"status" ~header:(Text "Status")
      ~default_width:(Pixels 120.) ~allows_resizing:true
      ~sort:(By_text (fun p -> status_name p.status))
      (fun p ->
        <Chip
          color=(status_color (S.get p).status)
          size=`sm
          variant=`soft
          class_="gap-1">
          <span class_="size-1.5 rounded-full bg-current" />
          (Jsx.string (status_name (S.get p).status))
        </Chip>);
    Data_grid.column ~id:"amount" ~header:(Text "Amount") ~align:`end_
      ~default_width:(Pixels 110.) ~allows_resizing:true
      ~sort:(By (fun a b -> Float.compare a.amount b.amount))
      (fun p -> amount ~class_:"font-medium tabular-nums" (S.get p).amount);
    Data_grid.column ~id:"fee" ~header:(Text "Fee") ~align:`end_
      ~default_width:(Pixels 90.) ~allows_resizing:true
      ~sort:(By (fun a b -> Float.compare a.fee b.fee))
      (fun p -> amount ~class_:"text-muted tabular-nums" (S.get p).fee);
    Data_grid.column ~id:"net" ~header:(Text "Net") ~align:`end_
      ~default_width:(Pixels 110.) ~allows_resizing:true
      ~sort:
        (By (fun a b -> Float.compare (a.amount -. a.fee) (b.amount -. b.fee)))
      (fun p ->
        amount ~class_:"font-medium tabular-nums"
          ((S.get p).amount -. (S.get p).fee));
    Data_grid.column ~id:"method" ~header:(Text "Payment Method")
      ~default_width:(Pixels 170.) ~allows_resizing:true (fun p ->
        Jsx.string (S.get p).method_);
    Data_grid.column ~id:"region" ~header:(Text "Region")
      ~default_width:(Pixels 130.) ~allows_resizing:true
      ~sort:(By_text (fun p -> p.region))
      (fun p -> Jsx.string (S.get p).region);
    Data_grid.column ~id:"description" ~header:(Text "Description")
      ~default_width:(Pixels 240.) ~allows_resizing:true
      ~cell_class:"text-muted" (fun p -> Jsx.string (S.get p).description);
    Data_grid.column ~id:"date" ~header:(Text "Date")
      ~default_width:(Pixels 120.) ~allows_resizing:true
      ~sort:(By (fun a b -> String.compare a.date b.date))
      (fun p ->
        <span class_="text-muted tabular-nums">
          (Jsx.string
             (Types.DateTimeFormat.format (S.get day)
                ~date:(Types.Either.right (Js.Date.fromString (S.get p).date))
                ()))
        </span>);
    Data_grid.column ~id:"actions"
      ~header:(Element (fun () -> <span class_="sr-only">"Actions"</span>))
      ~align:`end_ ~pinned:`end_ ~width:(Pixels 72.) actions;
  |]

let make () =
  let money =
    I18n.create_number_formatter
      (Types.Either.left
         (Types.NumberFormatOptions.make ~style:`currency ~currency:"USD" ()))
  in
  let day =
    I18n.create_date_formatter
      (Types.Either.left
         (Types.DateTimeFormatOptions.make ~year:"numeric" ~month:"short"
            ~day:"numeric" ~time_zone:"UTC" ()))
  in
  <Data_grid
    aria_label="Payments"
    rows=payments
    row_id=(fun p -> p.id)
    columns=(columns ~money ~day)
    selection_mode=`multiple
    show_selection_checkboxes=true
    default_sort_descriptor={ column = "customer"; direction = `ascending }
    allows_column_resize=true
    sticky_header=true
    scroll_container_class="max-h-[320px]"
    content_class="min-w-[1400px]"
  />
```

## Virtualization

`virtualized` draws only the rows in view, each `row_height` high below a
header `heading_height` high, for a thousand rows or more. The table is what
scrolls: give it a height by `content_class`. The keys reach every row.

```ocaml title="data_grid_virtualization.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Chip = Solidtype_heroui.Chip
module Data_grid = Solidtype_heroui.Data_grid
module Search_field = Solidtype_heroui.Search_field
module Rating = Solidtype_heroui.Rating
module Segment = Solidtype_heroui.Segment
module Gravity = Solidtype_gravity_icons
module I18n = Solidtype_kobalte.I18n
module Types = Solidtype_kobalte.Types

type stock = In_stock | Low_stock | Out_of_stock

type product = {
  id : string;
  name : string;
  sku : string;
  units : int;
  price : float;
  cost : float;
  rating : float;
  sales : int;
}

let brands =
  [|
    "ZenCore";
    "EchoLink";
    "TechFlow";
    "PrimeByte";
    "NovaPeak";
    "PixelForge";
    "SwiftEdge";
  |]

let grades =
  [|
    "Turbo";
    "Advanced";
    "Deluxe";
    "Ultra";
    "Slim";
    "Elite";
    "Eco";
    "Compact";
    "Portable";
    "Wireless";
  |]

let kinds =
  [|
    "Sensor";
    "Mouse";
    "Drive";
    "Tablet";
    "Cable";
    "Headphones";
    "Controller";
    "Charger";
    "Speaker";
    "Keyboard";
    "Monitor";
  |]

let lines = [| "LGT"; "AUD"; "KEY"; "SPK"; "MON"; "FRN"; "CAM"; "ACC" |]

(* The same thousand products on every visit: each field a number drawn from
   the product's index, never from a random source. *)
let drawn i salt n = (((i + 1) * 7919) + (salt * 104729)) mod n
let one_of i salt names = names.(drawn i salt (Array.length names))

let products =
  Array.init 1000 (fun i ->
      let price = float_of_int (50 + drawn i 4 1950) in
      {
        id = string_of_int (i + 1);
        name =
          one_of i 1 brands ^ " " ^ one_of i 2 grades ^ " " ^ one_of i 3 kinds;
        sku = one_of i 5 lines ^ "-" ^ string_of_int (1000 + drawn i 6 9000);
        units =
          (match drawn i 7 10 with
          | 0 | 1 -> 0
          | 2 | 3 -> 1 + drawn i 8 5
          | _ -> 6 + drawn i 8 195);
        price;
        cost = Float.round (price *. float_of_int (30 + drawn i 9 40) /. 100.);
        rating = 3. +. (float_of_int (drawn i 10 5) /. 2.);
        sales = drawn i 11 1000;
      })

let stock p =
  if p.units = 0 then Out_of_stock
  else if p.units <= 5 then Low_stock
  else In_stock

let stock_key = function
  | In_stock -> "in-stock"
  | Low_stock -> "low-stock"
  | Out_of_stock -> "out-of-stock"

let stock_chip p =
  match stock p with
  | In_stock ->
      <Chip color=`success size=`sm variant=`soft class_="whitespace-nowrap">
        <Gravity.Circle_check_fill class_="size-3.5" /> "In Stock"
      </Chip>
  | Low_stock ->
      <Chip color=`warning size=`sm variant=`soft class_="whitespace-nowrap">
        <Gravity.Clock class_="size-3.5" /> "Low Stock"
      </Chip>
  | Out_of_stock ->
      <Chip color=`danger size=`sm variant=`soft class_="whitespace-nowrap">
        <Gravity.Circle_xmark_fill class_="size-3.5" /> "Out of Stock"
      </Chip>

let stars rating =
  <Rating
    aria_label=(Js.Float.toString rating ^ " stars")
    size=`sm
    value=rating
    is_read_only=true>
    <Rating.Item value=1. />
    <Rating.Item value=2. />
    <Rating.Item value=3. />
    <Rating.Item value=4. />
    <Rating.Item value=5. />
  </Rating>

let columns money =
  let price ~class_ value =
    <span class_>
      (Jsx.string (Types.NumberFormat.format (S.get money) value))
    </span>
  in
  [|
    Data_grid.column ~id:"name" ~header:(Text "Product") ~is_row_header:true
      ~width:(Pixels 280.) (fun p ->
        <div class_="flex items-center gap-3">
          <img
            alt=(S.get p).name
            class_="size-10 shrink-0 rounded-lg bg-surface-secondary \
                    object-cover"
            loading="lazy"
            src=("https://img.heroui.chat/image/dashboard?w=80&h=80&u="
               ^ (S.get p).id)
          />
          <span class_="text-sm font-medium">(Jsx.string (S.get p).name)</span>
        </div>);
    Data_grid.column ~id:"sku" ~header:(Text "SKU") ~min_width:100.
      ~cell_class:"font-mono text-xs text-muted" (fun p ->
        Jsx.string (S.get p).sku);
    Data_grid.column ~id:"status" ~header:(Text "Status") ~width:(Pixels 140.)
      (fun p -> stock_chip (S.get p));
    Data_grid.column ~id:"stock" ~header:(Text "Stock") ~align:`center (fun p ->
        Jsx.int (S.get p).units);
    Data_grid.column ~id:"price" ~header:(Text "Price") ~align:`end_ (fun p ->
        price ~class_:"tabular-nums" (S.get p).price);
    Data_grid.column ~id:"cost" ~header:(Text "Cost") ~align:`end_
      ~cell_class:"text-muted" (fun p ->
        price ~class_:"tabular-nums" (S.get p).cost);
    Data_grid.column ~id:"rating" ~header:(Text "Rating") (fun p ->
        stars (S.get p).rating);
    Data_grid.column ~id:"sales" ~header:(Text "Sales") ~align:`end_ (fun p ->
        <span class_="tabular-nums">(Jsx.int (S.get p).sales)</span>);
  |]

let make () =
  let money =
    I18n.create_number_formatter
      (Types.Either.left
         (Types.NumberFormatOptions.make ~style:`currency ~currency:"USD"
            ~maximum_fraction_digits:0. ()))
  in
  let shown, set_shown = S.create_signal "all" in
  let query, set_query = S.create_signal "" in
  let rows =
    S.create_memo (fun () ->
        let shown = S.get shown in
        let query = String.lowercase_ascii (String.trim (S.get query)) in
        let matches text =
          Js.String.includes ~search:query (String.lowercase_ascii text)
        in
        Js.Array.filter products ~f:(fun p ->
            (String.equal shown "all"
            || String.equal shown (stock_key (stock p)))
            && (String.equal query "" || matches p.name || matches p.sku)))
  in
  <div class_="flex w-full flex-col gap-4">
    <div class_="flex flex-wrap items-center justify-between gap-3">
      <Segment
        aria_label="Stock"
        selected_key=(S.get shown)
        on_selection_change=(fun key -> S.set set_shown key)>
        <Segment.Item id="all">"All"</Segment.Item>
        <Segment.Item id="in-stock">"In Stock"</Segment.Item>
        <Segment.Item id="out-of-stock">"Out of Stock"</Segment.Item>
        <Segment.Item id="low-stock">"Low Stock"</Segment.Item>
      </Segment>
      <Search_field
        aria_label="Search products"
        class_="w-80"
        value=(S.get query)
        on_change=(fun text -> S.set set_query text)>
        <Search_field.Group>
          <Search_field.Search_icon />
          <Search_field.Input placeholder="Search..." />
          <Search_field.Clear_button />
        </Search_field.Group>
      </Search_field>
    </div>
    <Data_grid
      aria_label="Products"
      rows=(S.get rows)
      row_id=(fun p -> p.id)
      columns=(columns money)
      selection_mode=`multiple
      show_selection_checkboxes=true
      virtualized=true
      row_height=58.
      heading_height=37.
      content_class="h-[600px] min-w-[900px] overflow-auto"
    />
  </div>
```

## Bulk Actions

An [Action Bar](action-bar.md) for the rows chosen.

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

## Users

```ocaml title="data_grid_users.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Button = Solidtype_heroui.Button
module Data_grid = Solidtype_heroui.Data_grid
module Link = Solidtype_heroui.Link

type user = { name : string; title : string; email : string; role : string }

let user name title email role = { name; title; email; role }

let users =
  [|
    user "Lindsay Walton" "Front-end Developer" "lindsay.walton@example.com"
      "Member";
    user "Courtney Henry" "Designer" "courtney.henry@example.com" "Admin";
    user "Tom Cook" "Director of Product" "tom.cook@example.com" "Member";
    user "Whitney Francis" "Copywriter" "whitney.francis@example.com" "Admin";
    user "Leonard Krasner" "Senior Designer" "leonard.krasner@example.com"
      "Owner";
    user "Floyd Miles" "Principal Designer" "floyd.miles@example.com" "Member";
  |]

let columns =
  [|
    Data_grid.column ~id:"name" ~header:(Text "Name") ~is_row_header:true
      ~cell_class:"font-medium" (fun u -> Jsx.string (S.get u).name);
    Data_grid.column ~id:"title" ~header:(Text "Title") (fun u ->
        Jsx.string (S.get u).title);
    Data_grid.column ~id:"email" ~header:(Text "Email") (fun u ->
        Jsx.string (S.get u).email);
    Data_grid.column ~id:"role" ~header:(Text "Role") (fun u ->
        Jsx.string (S.get u).role);
    Data_grid.column ~id:"actions"
      ~header:(Element (fun () -> <span class_="sr-only">"Actions"</span>))
      ~align:`end_
      (fun u ->
        <Link class_="text-sm" href=("#" ^ (S.get u).email)>"Edit"</Link>);
  |]

let make () =
  <div class_="flex w-full flex-col gap-4">
    <div class_="flex items-center justify-between">
      <div class_="flex flex-col gap-1">
        <h2 class_="text-xl font-bold">"Users"</h2>
        <p class_="text-sm text-muted">
          "A list of all the users in your account including their name, \
           title, email and role."
        </p>
      </div>
      <Button size=`sm variant=`secondary>"Add user"</Button>
    </div>
    <Data_grid
      aria_label="Users"
      variant=`secondary
      rows=users
      row_id=(fun u -> u.email)
      columns
      content_class="min-w-[640px]"
    />
  </div>
```

## Team Members

Search, a status filter and the columns shown are the application's: it
filters `rows` and `columns` before giving them. Rows paged in the `footer`,
a header kept in view, a column pinned to each side.

```ocaml title="data_grid_team_members.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Avatar = Solidtype_heroui.Avatar
module Button = Solidtype_heroui.Button
module Chip = Solidtype_heroui.Chip
module Data_grid = Solidtype_heroui.Data_grid
module Dropdown = Solidtype_heroui.Dropdown
module Label = Solidtype_heroui.Label
module Pagination = Solidtype_heroui.Pagination
module Search_field = Solidtype_heroui.Search_field
module Gravity = Solidtype_gravity_icons

type status = Active | Vacation | Inactive

type member = {
  id : string;
  name : string;
  email : string;
  kind : string;
  status : status;
  start : string;
  team : string;
}

let first_names =
  [| "Aaron"; "Alice"; "Bella"; "Bob"; "Carla"; "David"; "Emma"; "Felix" |]

let last_names = [| "Carter"; "Johnson"; "Brown"; "Smith"; "Lopez"; "Kim" |]
let teams = [| "Design"; "Product"; "Engineering"; "Sales"; "Other" |]
let two n = (if n < 10 then "0" else "") ^ string_of_int n

let members =
  Array.init 48 (fun i ->
      let first = first_names.(i mod Array.length first_names) in
      let last = last_names.(i mod Array.length last_names) in
      {
        id = string_of_int (i + 1);
        name = first ^ " " ^ last;
        email =
          String.lowercase_ascii first
          ^ "."
          ^ String.lowercase_ascii last
          ^ "@example.com";
        kind = (if i mod 3 = 0 then "Contractor" else "Employee");
        status =
          (match i mod 4 with 0 -> Inactive | 1 -> Vacation | _ -> Active);
        start = "2025-" ^ two ((i mod 12) + 1) ^ "-" ^ two ((i mod 27) + 1);
        team = teams.(i mod Array.length teams);
      })

let status_name = function
  | Active -> "Active"
  | Vacation -> "Vacation"
  | Inactive -> "Inactive"

let status_key = function
  | Active -> "active"
  | Vacation -> "vacation"
  | Inactive -> "inactive"

let status_color = function
  | Active -> `success
  | Vacation -> `warning
  | Inactive -> `danger

let initials name =
  String.concat ""
    (List.map
       (fun w -> String.sub w 0 1)
       (List.filter
          (fun w -> not (String.equal w ""))
          (String.split_on_char ' ' name)))

let all_columns =
  [|
    Data_grid.column ~id:"member" ~header:(Text "Member") ~is_row_header:true
      ~pinned:`start ~width:(Pixels 260.)
      ~sort:(By_text (fun m -> m.name))
      (fun m ->
        <span class_="flex items-center gap-3">
          <Avatar size=`sm>
            <Avatar.Fallback>
              (Jsx.string (initials (S.get m).name))
            </Avatar.Fallback>
          </Avatar>
          <span class_="flex flex-col">
            <span class_="font-medium">(Jsx.string (S.get m).name)</span>
            <span class_="text-xs text-muted">
              (Jsx.string (S.get m).email)
            </span>
          </span>
        </span>);
    Data_grid.column ~id:"kind" ~header:(Text "Worker type")
      ~width:(Pixels 140.)
      ~sort:(By_text (fun m -> m.kind))
      (fun m -> Jsx.string (S.get m).kind);
    Data_grid.column ~id:"status" ~header:(Text "Status") ~width:(Pixels 130.)
      ~sort:(By_text (fun m -> status_name m.status))
      (fun m ->
        <Chip
          color=(status_color (S.get m).status)
          size=`sm
          variant=`soft
          class_="gap-1">
          <span class_="size-1.5 rounded-full bg-current" />
          (Jsx.string (status_name (S.get m).status))
        </Chip>);
    Data_grid.column ~id:"start" ~header:(Text "Start date")
      ~width:(Pixels 160.)
      ~sort:(By_text (fun m -> m.start))
      (fun m ->
        <span class_="flex items-center gap-2 tabular-nums">
          <Gravity.Calendar class_="size-4 text-muted" />
          (Jsx.string (S.get m).start)
        </span>);
    Data_grid.column ~id:"team" ~header:(Text "Team") ~width:(Pixels 140.)
      (fun m ->
        <Chip size=`sm variant=`secondary>(Jsx.string (S.get m).team)</Chip>);
    Data_grid.column ~id:"actions"
      ~header:(Element (fun () -> <span class_="sr-only">"Actions"</span>))
      ~align:`end_ ~pinned:`end_ ~width:(Pixels 64.)
      (fun m ->
        <Dropdown>
          <Button
            is_icon_only=true
            aria_label=("Actions for " ^ (S.get m).name)
            size=`sm
            variant=`tertiary>
            <Gravity.Ellipsis_vertical class_="size-4" />
          </Button>
          <Dropdown.Popover>
            <Dropdown.Menu on_action=(fun (_ : string) -> ())>
              <Dropdown.Item id="view" text_value="View profile">
                <Label>"View profile"</Label>
              </Dropdown.Item>
              <Dropdown.Item id="remove" text_value="Remove" variant=`danger>
                <Label>"Remove"</Label>
              </Dropdown.Item>
            </Dropdown.Menu>
          </Dropdown.Popover>
        </Dropdown>);
  |]

let per_page = 10

let make () =
  let query, set_query = S.create_signal "" in
  let statuses, set_statuses =
    S.create_signal [| "active"; "vacation"; "inactive" |]
  in
  let shown_columns, set_shown_columns =
    S.create_signal
      (Array.map (fun (c : member Data_grid.column) -> c.id) all_columns)
  in
  let page, set_page = S.create_signal 1 in
  let selected, set_selected = S.create_signal [||] in
  let matching () =
    let q = String.lowercase_ascii (S.get query) in
    Js.Array.filter
      ~f:(fun m ->
        Array.exists (String.equal (status_key m.status)) (S.get statuses)
        && (String.equal q ""
           || Js.String.includes ~search:q (String.lowercase_ascii m.name)
           || Js.String.includes ~search:q m.email))
      members
  in
  let pages () =
    max 1 ((Array.length (matching ()) + per_page - 1) / per_page)
  in
  let shown () =
    let all = matching () in
    let start = (min (S.get page) (pages ()) - 1) * per_page in
    Array.sub all start (min per_page (Array.length all - start))
  in
  let columns () =
    Js.Array.filter
      ~f:(fun (c : member Data_grid.column) ->
        Array.exists (String.equal c.id) (S.get shown_columns))
      all_columns
  in
  <div class_="flex flex-col gap-3">
    <div class_="flex flex-wrap items-center gap-2">
      <Search_field
        aria_label="Search members"
        value=(S.get query)
        on_change=(fun q ->
                    S.set set_query q;
                    S.set set_page 1)>
        <Search_field.Group>
          <Search_field.Search_icon />
          <Search_field.Input class_="w-[220px]" placeholder="Search..." />
          <Search_field.Clear_button />
        </Search_field.Group>
      </Search_field>
      <Dropdown>
        <Button size=`sm variant=`secondary>
          <Gravity.Funnel class_="size-4" /> "Status"
        </Button>
        <Dropdown.Popover>
          <Dropdown.Menu
            aria_label="Status"
            selection_mode=`multiple
            selected_keys=(S.get statuses)
            on_selection_change=(fun keys ->
                                  S.set set_statuses keys;
                                  S.set set_page 1)>
            <Dropdown.Item id="active" text_value="Active">
              <Dropdown.Item_indicator /> <Label>"Active"</Label>
            </Dropdown.Item>
            <Dropdown.Item id="vacation" text_value="Vacation">
              <Dropdown.Item_indicator /> <Label>"Vacation"</Label>
            </Dropdown.Item>
            <Dropdown.Item id="inactive" text_value="Inactive">
              <Dropdown.Item_indicator /> <Label>"Inactive"</Label>
            </Dropdown.Item>
          </Dropdown.Menu>
        </Dropdown.Popover>
      </Dropdown>
      <Dropdown>
        <Button size=`sm variant=`secondary>
          <Gravity.Layout_columns class_="size-4" /> "Columns"
        </Button>
        <Dropdown.Popover>
          <Dropdown.Menu
            aria_label="Columns shown"
            selection_mode=`multiple
            selected_keys=(S.get shown_columns)
            disabled_keys=[| "member"; "actions" |]
            on_selection_change=(S.set set_shown_columns)>
            <For each=all_columns>
              (fun (c : member Data_grid.column) _ ->
                <Dropdown.Item id=c.id text_value=c.id>
                  <Dropdown.Item_indicator />
                  <Label>
                    (Jsx.string
                       (match c.header with
                       | Text t -> t
                       | Element _ | Sorted _ -> "Actions"))
                  </Label>
                </Dropdown.Item>)
            </For>
          </Dropdown.Menu>
        </Dropdown.Popover>
      </Dropdown>
    </div>
    <Data_grid
      aria_label="Team members"
      rows=(shown ())
      row_id=(fun m -> m.id)
      columns=(columns ())
      selection_mode=`multiple
      show_selection_checkboxes=true
      selected_keys=(S.get selected)
      on_selection_change=(S.set set_selected)
      sticky_header=true
      scroll_container_class="max-h-[440px] overflow-auto"
      content_class="min-w-[900px]"
      footer=(<div
                class_="flex w-full flex-wrap items-center justify-between \
                        gap-3">
                <span class_="text-sm text-muted">
                  (Jsx.string
                     (string_of_int (Array.length (S.get selected))
                     ^ " of "
                     ^ string_of_int (Array.length (matching ()))
                     ^ " selected"))
                </span>
                <Pagination size=`sm>
                  <Pagination.Content>
                    <Pagination.Item>
                      <Pagination.Previous
                        is_disabled=(S.get page <= 1)
                        on_press=(fun () ->
                                   S.update set_page (fun p -> max 1 (p - 1)))>
                        <Pagination.Previous_icon /> "Previous"
                      </Pagination.Previous>
                    </Pagination.Item>
                    <For each=(Array.init (pages ()) (fun i -> i + 1))>
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
                        is_disabled=(S.get page >= pages ())
                        on_press=(fun () ->
                                   S.update set_page (fun p ->
                                       min (pages ()) (p + 1)))>
                        "Next" <Pagination.Next_icon />
                      </Pagination.Next>
                    </Pagination.Item>
                  </Pagination.Content>
                </Pagination>
              </div>)
    />
  </div>
```

## Servers

A sparkline in a cell is an [rhp](../rhp/line.md) `Line` in a chart of
one row; a capacity a `Progress_circle`.

```ocaml title="data_grid_servers.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Button = Solidtype_heroui.Button
module Chip = Solidtype_heroui.Chip
module Data_grid = Solidtype_heroui.Data_grid
module Progress_circle = Solidtype_heroui.Progress_circle
module Gravity = Solidtype_gravity_icons
module Chart = Solidtype_rhp.Chart
module Line = Solidtype_rhp.Line
module Plot = Solidtype_rhp.Plot
module Row = Solidtype_rhp.Row
module Slat = Solidtype_rhp.Slat
module Ticks = Solidtype_rhp.Ticks

type server = {
  id : string;
  instances : int;
  active : bool;
  region : string;
  capacity : float;
  cost : float;
  requests : float array;
}

let servers =
  [|
    {
      id = "4586930";
      instances = 25;
      active = true;
      region = "US-West 1";
      capacity = 20.01;
      cost = 830.04;
      requests = [| 4.; 6.; 5.; 3.; 4.; 5.; 6.; 5.; 7.; 8.; 7.; 9. |];
    };
    {
      id = "4586931";
      instances = 13;
      active = true;
      region = "US-East 2";
      capacity = 7.36;
      cost = 752.72;
      requests = [| 6.; 6.; 7.; 7.; 6.; 6.; 5.; 6.; 7.; 6.; 6.; 7. |];
    };
    {
      id = "4586932";
      instances = 27;
      active = false;
      region = "EU-Central 1";
      capacity = 48.25;
      cost = 517.6;
      requests = [| 5.; 5.; 6.; 5.; 5.; 6.; 6.; 7.; 6.; 6.; 5.; 5. |];
    };
    {
      id = "4586934";
      instances = 6;
      active = true;
      region = "US-West 2";
      capacity = 73.12;
      cost = 412.71;
      requests = [| 8.; 9.; 8.; 7.; 8.; 6.; 7.; 6.; 5.; 5.; 4.; 5. |];
    };
    {
      id = "4586935";
      instances = 19;
      active = true;
      region = "EU-West 1";
      capacity = 72.65;
      cost = 354.06;
      requests = [| 6.; 7.; 6.; 7.; 6.; 7.; 6.; 7.; 6.; 7.; 6.; 7. |];
    };
    {
      id = "4586937";
      instances = 27;
      active = true;
      region = "AP-Northeast 1";
      capacity = 11.35;
      cost = 146.05;
      requests = [| 4.; 5.; 6.; 6.; 7.; 6.; 7.; 8.; 7.; 6.; 7.; 6. |];
    };
  |]

(* A point for each hour, its number along the value axis, its requests
   across the band. *)
let points requests =
  Array.mapi (fun i r -> Some (Some (float_of_int i), Some r)) requests

let spark =
  Slat.make ~thickness:(Slat.number 32.)
    ~room:(Slat.room ~start:(Slat.px 0.) ~end_:(Slat.px 0.) ())
    (fun d ->
      <Line points=(points (Row.data d).requests) peak=10. smooth=true fill=true
      />)

let capacity s =
  let warn = (S.get s).capacity >= 70. in
  <span
    class_=("flex items-center gap-2 tabular-nums "
           ^ if warn then "text-warning" else "")>
    <Progress_circle
      aria_label=("Capacity of " ^ (S.get s).id)
      value=(S.get s).capacity
      color=(if warn then `warning else `accent)
      size=`sm>
      <Progress_circle.Track>
        <Progress_circle.Track_circle /> <Progress_circle.Fill_circle />
      </Progress_circle.Track>
    </Progress_circle>
    (Jsx.string (Js.Float.toFixed ~digits:2 (S.get s).capacity ^ "%"))
  </span>

let columns =
  [|
    Data_grid.column ~id:"id" ~header:(Text "Cluster ID") ~is_row_header:true
      ~sort:(By_text (fun s -> s.id))
      (fun s ->
        <span class_="flex items-center gap-1 tabular-nums">
          (Jsx.string (S.get s).id)
          <Button
            is_icon_only=true
            aria_label=("Copy " ^ (S.get s).id)
            size=`sm
            variant=`ghost>
            <Gravity.Copy class_="size-4 text-muted" />
          </Button>
        </span>);
    Data_grid.column ~id:"instances" ~header:(Text "Instances") ~align:`center
      ~sort:(By (fun a b -> Int.compare a.instances b.instances))
      (fun s -> Jsx.int (S.get s).instances);
    Data_grid.column ~id:"status" ~header:(Text "Status") (fun s ->
        <Chip
          color=(if (S.get s).active then `success else `default)
          size=`sm
          variant=`soft>
          (Jsx.string (if (S.get s).active then "Active" else "Inactive"))
        </Chip>);
    Data_grid.column ~id:"region" ~header:(Text "Region") (fun s ->
        Jsx.string (S.get s).region);
    Data_grid.column ~id:"capacity" ~header:(Text "Capacity")
      ~sort:(By (fun a b -> Float.compare a.capacity b.capacity))
      capacity;
    Data_grid.column ~id:"cost" ~header:(Text "Cost") ~align:`end_
      ~sort:(By (fun a b -> Float.compare a.cost b.cost))
      ~cell_class:"tabular-nums"
      (fun s -> Jsx.string ("$" ^ Js.Float.toFixed ~digits:2 (S.get s).cost));
    Data_grid.column ~id:"requests" ~header:(Text "Requests")
      ~width:(Pixels 140.) (fun s ->
        <Chart
          scale=(0., 11.)
          ticks=Ticks.none
          label=("Requests to " ^ (S.get s).id ^ ", hour by hour")>
          <Plot rows=[| S.get s |] render=spark />
        </Chart>);
  |]

let make () =
  <Data_grid
    aria_label="Servers"
    rows=servers
    row_id=(fun s -> s.id)
    columns
    content_class="min-w-[880px]"
  />
```

## Footer

`footer` is drawn below the grid, here a [Pagination](pagination.md).

```ocaml title="data_grid_footer.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Chip = Solidtype_heroui.Chip
module Data_grid = Solidtype_heroui.Data_grid
module Pagination = Solidtype_heroui.Pagination

type status = Paid | Pending | Overdue

type invoice = {
  id : string;
  customer : string;
  date : string;
  status : status;
  amount : string;
}

let invoice id customer date status amount =
  { id; customer; date; status; amount }

let invoices =
  [|
    invoice "INV-001" "Acme Corp" "2024-03-01" Paid "$1,250";
    invoice "INV-002" "Globex" "2024-03-04" Paid "$890";
    invoice "INV-003" "Initech" "2024-03-07" Pending "$2,340";
    invoice "INV-004" "Umbrella Co" "2024-03-09" Overdue "$560";
    invoice "INV-005" "Stark Industries" "2024-03-12" Paid "$1,780";
    invoice "INV-006" "Wayne Enterprises" "2024-03-15" Pending "$430";
    invoice "INV-007" "Cyberdyne" "2024-03-18" Paid "$3,120";
    invoice "INV-008" "Soylent Corp" "2024-03-21" Overdue "$975";
    invoice "INV-009" "Massive Dynamic" "2024-03-24" Paid "$1,640";
    invoice "INV-010" "Hooli" "2024-03-27" Pending "$720";
    invoice "INV-011" "Vehement Capital" "2024-03-29" Paid "$2,050";
    invoice "INV-012" "Bluth Company" "2024-03-31" Overdue "$385";
  |]

let per_page = 4
let pages = (Array.length invoices + per_page - 1) / per_page

let status_name = function
  | Paid -> "paid"
  | Pending -> "pending"
  | Overdue -> "overdue"

let status_color = function
  | Paid -> `success
  | Pending -> `warning
  | Overdue -> `danger

let columns =
  [|
    Data_grid.column ~id:"id" ~header:(Text "Invoice") ~is_row_header:true
      ~cell_class:"font-medium" (fun i -> Jsx.string (S.get i).id);
    Data_grid.column ~id:"customer" ~header:(Text "Customer") (fun i ->
        Jsx.string (S.get i).customer);
    Data_grid.column ~id:"date" ~header:(Text "Date") (fun i ->
        Jsx.string (S.get i).date);
    Data_grid.column ~id:"status" ~header:(Text "Status") (fun i ->
        <Chip color=(status_color (S.get i).status) size=`sm variant=`soft>
          (Jsx.string (status_name (S.get i).status))
        </Chip>);
    Data_grid.column ~id:"amount" ~header:(Text "Amount") ~align:`end_ (fun i ->
        <span class_="tabular-nums">(Jsx.string (S.get i).amount)</span>);
  |]

let make () =
  let page, set_page = S.create_signal 1 in
  let shown () = Array.sub invoices ((S.get page - 1) * per_page) per_page in
  <Data_grid
    aria_label="Invoices"
    rows=(shown ())
    row_id=(fun i -> i.id)
    columns
    content_class="min-w-[640px]"
    footer=(<Pagination size=`sm>
              <Pagination.Summary>
                (Jsx.string
                   (string_of_int (((S.get page - 1) * per_page) + 1)
                   ^ " to "
                   ^ string_of_int
                       (min (S.get page * per_page) (Array.length invoices))
                   ^ " of "
                   ^ string_of_int (Array.length invoices)
                   ^ " invoices"))
              </Pagination.Summary>
              <Pagination.Content>
                <Pagination.Item>
                  <Pagination.Previous
                    is_disabled=(S.get page = 1)
                    on_press=(fun () -> S.update set_page pred)>
                    <Pagination.Previous_icon />
                  </Pagination.Previous>
                </Pagination.Item>
                <For each=(Array.init pages succ)>
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
                    is_disabled=(S.get page = pages)
                    on_press=(fun () -> S.update set_page succ)>
                    <Pagination.Next_icon />
                  </Pagination.Next>
                </Pagination.Item>
              </Pagination.Content>
            </Pagination>)
  />
```

## Styling Reference

### CSS Classes

- `.data-grid` - The root, with HeroUI's `.table-root`
- `.data-grid__selection-column`, `.data-grid__selection-cell` - The
  checkbox column, `--data-grid-selection-column-width` wide, 40px
- `.data-grid__drag-handle-column`, `.data-grid__drag-handle-cell` - The
  handle column, `--data-grid-drag-handle-column-width` wide, 32px
- `.data-grid__drag-handle` - A row's handle
- `.data-grid__sort-icon` - A sorted column's chevron, turned for descending
- `.data-grid__empty-state` - What is drawn with no rows
- `.data-grid__footer` - The footer, with HeroUI's `.table__footer`

A virtualized or resizable grid places its own two columns itself, at 40px
and 32px, whatever the variables say.

### Interactive States

- **Alignment**: `[data-align="start"]`, `"center"` or `"end"` on a column's
  header and cells
- **Vertical alignment**: `[data-vertical-align]` on the root, `top`,
  `middle` or `bottom`
- **Pinned**: `[data-pinned="start"]` or `"end"` on a header and its cells,
  `[data-pinned-edge]` on the last of each side, and
  `[data-pinned-start-detached]`, `[data-pinned-end-detached]` on the table
  while content passes beneath
- **Sticky header**: `[data-sticky-header]` on the table
- **Handle**: `[data-hovered="true"]`, `[data-pressed="true"]`,
  `[data-focus-visible="true"]`, `[data-dragging="true"]`
- **Rows**: HeroUI's Table's, and `[data-dragging="true"]`,
  `[data-drop-position]`

## API Reference

### Data_grid

| Prop | Type | Default | Description |
|---|---|---|---|
| `rows` | `'row array` | | The rows |
| `row_id` | `'row -> string` | | Each row's key |
| `columns` | `'row Data_grid.column array` | | Its columns, from `Data_grid.column` |
| `aria_label` | `string` | | What names it |
| `variant` | `` [ `primary \| `secondary ] `` | `` `primary `` | The Table's variant |
| `class_`, `content_class`, `scroll_container_class` | `string` | | Added to the root, the `<table>` and the scroll container |
| `sticky_header` | `bool` | `false` | The header kept in view |
| `vertical_align` | `` [ `top \| `middle \| `bottom ] `` | `` `middle `` | Where cells' content sits |
| `selection_mode` | `` [ `none \| `single \| `multiple ] `` | `` `none `` | How many rows may be selected |
| `selection_behavior` | `` [ `toggle \| `replace ] `` | `` `toggle `` | Whether a press toggles a row or chooses it alone |
| `selected_keys`, `default_selected_keys` | `string array` | | The rows selected, controlled or at first |
| `on_selection_change` | `string array -> unit` | | Told each change |
| `show_selection_checkboxes` | `bool` | `false` | A checkbox column first |
| `disabled_keys` | `string array` | | Rows never selected |
| `sort_descriptor` | `Table.sort_descriptor` | | The application's sort, rows drawn as given |
| `default_sort_descriptor` | `Table.sort_descriptor` | | The grid's own sort at first |
| `on_sort_change` | `Table.sort_descriptor -> unit` | | Told each sort |
| `allows_column_resize` | `bool` | `false` | Columns that allow it resized |
| `on_column_resize`, `on_column_resize_end` | `(string * Table.column_size) array -> unit` | | Every column's size, at each step and at the end |
| `on_reorder` | `'row Data_grid.reorder -> unit` | | Rows dragged by their handles, told where they landed |
| `reorder_messages` | `Table.reorder_messages` | React Aria's | What a drag tells a reader |
| `on_row_action` | `string -> unit` | | A row's action, given its key |
| `empty_state` | `Jsx.element` | | Drawn with no rows |
| `footer`, `footer_class` | `Jsx.element`, `string` | | Below the table |
| `on_load_more` | `unit -> unit` | | Asked as its end comes into view |
| `is_loading_more` | `bool` | `false` | Whether more are loading |
| `load_more_content` | `Jsx.element` | | Shown while loading more |
| `virtualized` | `bool` | `false` | Only the rows in view drawn |
| `row_height`, `heading_height` | `float` | `42.`, `36.` | A virtualized grid's rows and header, in pixels |

### Data_grid.column

| Argument | Type | Default | Description |
|---|---|---|---|
| `~id` | `string` | | What a sort names it by |
| `~header` | `Data_grid.header` | | `Text`, `Element` or `Sorted` |
| `?sort` | `'row Data_grid.sort` | | `By_text` or `By`; sortable only with one |
| `?is_row_header` | `bool` | `false` | Its cells name their rows |
| `?width`, `?default_width` | `Table.column_size` | | Its width, controlled or at first |
| `?min_width`, `?max_width` | `float` | | Its bounds when resized |
| `?allows_resizing` | `bool` | `false` | Resizable in a grid that `allows_column_resize` |
| `?align` | `` [ `start \| `center \| `end_ ] `` | `` `start `` | Its header's and cells' alignment |
| `?pinned` | `` [ `start \| `end_ ] `` | | The side it stays in view at |
| `?header_class`, `?cell_class` | `string` | | Added to its header and cells |
| cell | `'row -> Jsx.element` | | Draws a cell from its row |
