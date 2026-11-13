(** A table, as Kobalte would make one: a [<table role="grid">] whose rows are a
    list of Kobalte's, made of {!Solidtype_kobalte.Selection}'s hooks as
    Kobalte's own lists are, and whose cells the keys move through as an
    accessible grid's do. It draws no style: each part is the element it names,
    its roles and state as attributes, and takes every attribute its element
    does -- a class, a style, a [ref], a handler -- which it passes on, a [ref]
    and a handler called beside its own, as Kobalte's parts do.

    {[
      <Table.Root aria_label="Team members">
        <Table.Header>
          <Table.Column is_row_header=true>"Name"</Table.Column>
          <Table.Column>"Role"</Table.Column>
        </Table.Header>
        <Table.Body>
          <For each=(fun () -> members)>
            (fun m _ ->
              <Table.Row id=(fun () -> m.id)>
                <Table.Cell>(fun () -> Jsx.string m.name)</Table.Cell>
                <Table.Cell>(fun () -> Jsx.string m.role)</Table.Cell>
              </Table.Row>)
          </For>
        </Table.Body>
      </Table.Root>
    ]}

    Kobalte's list focuses a row, Tab reaching the focused one, the first at
    first, and moves between rows by the arrow keys, Home and End, Page Up and
    Page Down and typing. Right enters a row's first cell and moves along it,
    and from its last back to the row; Left the other way, from a row to its
    last cell; Up and Down from a cell reach the cell of its column in the row
    above or below, the header's included. A cell given focus, by a press or by
    code, keeps it, and from a cell an arrow, Home and End move among cells
    alone, where they reach none moving nothing.

    Rows are selected as the root's [selection_mode] says, by Kobalte's list:
    pressing a row, Space or Enter toggles it, where it runs no action, or with
    [selection_behavior] [`replace] chooses it alone, Shift and the platform's
    key extending and adding. A press that begins in a control inside a row --
    an input, a button, a link, a label, a checkbox -- is the control's, never
    the row's. A selected row is [aria-selected], and [data-selected], and a
    disabled one [aria-disabled] and [data-disabled], present and empty as
    Kobalte's state is.

    Inside a {!Virtualizer} given {!Virtualizer.val-table_layout}, it is laid
    out as React Aria's TableLayout lays one out: each part a [<div>] of its
    role in place of its table element, in a [<div>] that places it, the header
    kept over the rows as they scroll, the columns as wide as they ask within
    the table's width, and only the rows in view drawn, and a third more beyond,
    with the focused one wherever it is; the keys reach every row, the one they
    move to drawn and scrolled into view below the header. The table is what
    scrolls, so a style gives it its height and its overflow. A [ref] is given
    the [<div>]. Its rows are drawn as a list, not yet as a tree.

    A part is used inside a {!Root}, a cell inside a {!Row}: elsewhere it raises
    [Invalid_argument] as it is made. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

type sort_descriptor = {
  column : string;
  direction : [ `ascending | `descending ];
}
(** How a table is sorted: by the column whose [id] is [column], one way or the
    other. *)

(** How wide a column is, in a {!Resizable_container}. *)
type column_size =
  | Pixels of float
  | Percent of float  (** Of the width the table is given. *)
  | Fraction of float
      (** A share of what the other columns leave, as CSS's [fr] is. *)

type context = {
  selection_mode : [ `none | `single | `multiple ] S.accessor;
  sort : sort_descriptor option S.accessor;
  sort_by : string -> unit;
      (** Asks for a column's sort: ascending, or turned if it was so. *)
  is_selected : string -> bool;
  is_disabled : string -> bool;
  toggle : string -> unit;  (** Toggles a row's selection. *)
  is_select_all : bool S.accessor;  (** Whether every row is selected. *)
  is_empty : bool S.accessor;  (** Whether no row is selected. *)
  select_all : unit -> unit;
  clear_selection : unit -> unit;
  resizing_column : string option S.accessor;
      (** The [id] of the column being resized, in a {!Resizable_container}. *)
  tree_column : string option S.accessor;
      (** The [id] of the column whose cells hold a tree's chevrons. *)
  is_expanded : string -> bool;  (** Whether a row's rows are shown. *)
  toggle_expanded : string -> unit;
}
(** What a table's parts, and a style over them, read of it: how it is sorted
    and its rows are selected, and each row's state by its key. *)

module Context : sig
  val use : unit -> context
  (** The table above; outside a {!Root} it raises [Invalid_argument]. *)
end

type row = {
  key : string;
  level : int;  (** 1 in the body, and one more in each row it is inside. *)
  has_child_items : bool S.accessor;  (** Whether it holds rows. *)
  is_expanded : bool S.accessor;
  is_selected : bool S.accessor;
  is_disabled : bool S.accessor;
  toggle_expanded : unit -> unit;
  focus : unit -> unit;  (** Gives it the focus, as a press of it does. *)
  header_id : string;  (** The id of the cell that names it. *)
}
(** What a part inside a {!Row} reads of it, and a style's attribute on it. *)

type cell = {
  is_tree_column : bool S.accessor;
      (** Whether it is in the table's tree column. *)
  column_index : int S.accessor;
}
(** What a part inside a {!Cell} reads of it, and a style's attribute on it. *)

type column = {
  direction : [ `ascending | `descending ] option S.accessor;
  resizing : bool S.accessor;  (** Whether it is being resized. *)
}
(** What a part inside a {!Column} reads of it: which way it is sorted, if it
    is, and whether it is being resized. *)

(** A [<div>] whose width the columns of the table inside it share, and which
    lets a {!Column_resizer} resize them, as React Aria's
    [ResizableTableContainer] does: the table is laid out at a fixed width, each
    column as its [width], or [default_width] until it is resized, says, by
    CSS's flex algorithm, never narrower than its [min_width], 75 pixels by
    default, nor wider than its [max_width]. A resize calls [on_resize_start],
    then [on_resize] at each step and [on_resize_end], each with every column's
    size by its [id]: those before it in pixels as they are, it its new width,
    and those after it as their own. *)
module Resizable_container : sig
  module Props : sig
    type t

    val check :
      ?on_resize_start:((string * column_size) array -> unit) ->
      ?on_resize:((string * column_size) array -> unit) ->
      ?on_resize_end:((string * column_size) array -> unit) ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The [<table role="grid">], [aria-multiselectable] while many rows may be
    selected. It is sorted as [sort_descriptor] says, its rows' order the
    application's to follow: pressing a column that [allows_sorting] calls
    [on_sort_change] with it ascending, or turned if it was so sorted. Its rows'
    keys selected are [selected_keys] while it is given them, else those it
    keeps, [default_selected_keys] at first; each change calls
    [on_selection_change] with them, all of them for every row but a disabled
    one. A row whose key [disabled_keys] holds is disabled, and
    [disallow_empty_selection] keeps one selected.

    Given [tree_column], it is a [treegrid] whose rows hold rows: a {!Row}
    inside another is drawn after it while it is expanded, its [aria-level] one
    more, each row [aria-posinset] and [aria-setsize] among those beside it, and
    one that holds rows [aria-expanded]. Its keys expanded are [expanded_keys]
    while it is given them, else those it keeps, [default_expanded_keys] at
    first; each change calls [on_expanded_change] with them. The arrow forward
    on a row that holds rows expands it, the arrow back collapses it, and on a
    collapsed one reaches the row it is inside, as an accessible tree grid's
    keys do.

    A row's action, [on_row_action] given its key, runs after the row's own, as
    React Aria runs one. *)
module Root : sig
  module Props : sig
    type t

    val check :
      ?selection_mode:[ `none | `single | `multiple ] Solidtype.Check.value ->
      ?selection_behavior:[ `toggle | `replace ] Solidtype.Check.value ->
      ?selected_keys:string array Solidtype.Check.value ->
      ?default_selected_keys:string array Solidtype.Check.value ->
      ?on_selection_change:(string array -> unit) ->
      ?disabled_keys:string array Solidtype.Check.value ->
      ?disallow_empty_selection:bool Solidtype.Check.value ->
      ?sort_descriptor:sort_descriptor Solidtype.Check.value ->
      ?on_sort_change:(sort_descriptor -> unit) ->
      ?tree_column:string Solidtype.Check.value ->
      ?expanded_keys:string array Solidtype.Check.value ->
      ?default_expanded_keys:string array Solidtype.Check.value ->
      ?on_expanded_change:(string array -> unit) ->
      ?on_row_action:(string -> unit) ->
      ?as_:(Solidtype.Html.Table.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Table.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The [<thead role="rowgroup">] and its one [<tr role="row">], where its
    {!Column}s are. *)
module Header : sig
  module Props : sig
    type t

    val check :
      ?as_:(Solidtype.Html.Thead.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Thead.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** A column's header, a [<th role="columnheader">], [aria-colindex] its place,
    focused by the keys, its [id] the column a sort names. The column whose
    [is_row_header] names each row, its cells [rowheader]s. One that
    [allows_sorting] is [aria-sort], and pressed by a pointer, Enter or Space to
    be sorted by. In a {!Resizable_container} it is as wide as [width] says,
    controlled, else [default_width] until it is resized, and [data-resizing]
    while it is. *)
module Column : sig
  module Context : sig
    val use : unit -> column
    (** The column above; outside a {!Column} it raises [Invalid_argument]. *)
  end

  module Props : sig
    type t

    val check :
      ?id:string Solidtype.Check.value ->
      ?allows_sorting:bool Solidtype.Check.value ->
      ?is_row_header:bool Solidtype.Check.value ->
      ?width:column_size Solidtype.Check.value ->
      ?default_width:column_size Solidtype.Check.value ->
      ?min_width:float Solidtype.Check.value ->
      ?max_width:float Solidtype.Check.value ->
      ?as_:(Solidtype.Html.Th.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Th.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The [<tbody role="rowgroup">], its {!Row}s, or, while it has none, a row of
    one cell across every column, [empty_state], read only then. *)
module Body : sig
  module Props : sig
    type t

    val check :
      ?empty_state:Jsx.element Solidtype.Check.value ->
      ?as_:(Solidtype.Html.Tbody.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Tbody.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** A row, a [<tr role="row">] of Kobalte's list, [data-key] its [id], which is
    its key in a selection, named by its row header's cell. A row joins the list
    once it is on the page, in the order its body holds it, so rows sorted by
    the [For] that draws them are walked in their new order. Its children are
    its cells, and in a tree the rows it holds, drawn after it while it is
    expanded, and [data-expanded] while it is.

    Its action, [on_action], then the table's [on_row_action], and its link,
    [href], opened as a link is with the press's modifiers and [target], [rel],
    [download], [href_lang], [ping] and [referrer_policy], run as React Aria
    runs them: Enter runs one, and never selects a row that has one, which Space
    selects. With selection off, or a row that cannot be selected, a press runs
    it too; with [`toggle], a press runs it while no row is selected, and
    selects once one is; with [`replace], a press selects and a double press
    runs it, and a touch held half a second selects and turns the table to
    [`toggle], so a tap then selects. A disabled row runs none. *)
module Row : sig
  module Context : sig
    val use : unit -> row
    (** The row above, read by a part inside it, or by a style's attribute on
        it, which Solid reads inside the row; outside a {!Row} it raises
        [Invalid_argument]. *)
  end

  module Props : sig
    type t

    val check :
      id:string Solidtype.Check.value ->
      ?on_action:(unit -> unit) ->
      ?href:string Solidtype.Check.value ->
      ?target:string Solidtype.Check.value ->
      ?rel:string Solidtype.Check.value ->
      ?download:string Solidtype.Check.value ->
      ?href_lang:string Solidtype.Check.value ->
      ?ping:string Solidtype.Check.value ->
      ?referrer_policy:string Solidtype.Check.value ->
      ?as_:(Solidtype.Html.Tr.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Tr.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** A cell, a [<td>], a [gridcell], or a [rowheader] in the row header's column,
    focused by the keys, [data-column-index] its column, [data-tree-column] in a
    tree's. *)
module Cell : sig
  module Context : sig
    val use : unit -> cell
    (** The cell above, read as a row's is; outside a {!Cell} it raises
        [Invalid_argument]. *)
  end

  module Props : sig
    type t

    val check :
      ?as_:(Solidtype.Html.Td.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Td.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** What loads more rows, after a {!Body}'s last, as React Aria's
    [TableLoadMoreItem] does: a row of no height, out of the page's reach,
    holding a {!Load_more_sentinel}, which calls [on_load_more] as it comes
    within [scroll_offset] heights of the view of what scrolls the table, 1 by
    default, and again as loading ends with it still in view; and while
    [is_loading], a row of one cell across every column, its children, which no
    key reaches. The attributes it is given are the loading row's. *)
module Load_more : sig
  module Props : sig
    type t

    val check :
      ?is_loading:bool Solidtype.Check.value ->
      ?on_load_more:(unit -> unit) ->
      ?scroll_offset:float Solidtype.Check.value ->
      ?as_:(Solidtype.Html.Tr.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Tr.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** What resizes the {!Column} it is in, as React Aria's [ColumnResizer] does: a
    [<div role="presentation">] a pointer drags, and inside it a range
    [<input>], named by [aria_label], "Resizer" by default, and by its column,
    which Tab reaches from the column's header. Its arrows, Home, End, Page Up
    and Page Down resize the column by 10 pixels; Enter begins a resize the
    arrows go on with, and Enter, Escape, Space, Tab or leaving it ends it.
    While it resizes, it and its column are [data-resizing] and no other key
    moves focus in the table; [data-resizable-direction] is [left] while the
    column is as narrow as it may be, [right] while as wide, else [both]. A drag
    by a mouse holds the resizer's cursor over the whole page until it ends. It
    is used inside a {!Column} of a table in a {!Resizable_container}: elsewhere
    it raises [Invalid_argument] as it is made. *)
module Column_resizer : sig
  module Props : sig
    type t

    val check :
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end
