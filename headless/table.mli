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
    above or below, the header's included.

    Rows are selected as the root's [selection_mode] says, by Kobalte's list:
    pressing a row, Space or Enter toggles it, or with [selection_behavior]
    [`replace] chooses it alone, Shift and the platform's key extending and
    adding. A press that begins in a control inside a row -- an input, a button,
    a link, a label, a checkbox -- is the control's, never the row's. A selected
    row is [aria-selected], and [data-selected], and a disabled one
    [aria-disabled] and [data-disabled], present and empty as Kobalte's state
    is.

    A part is used inside a {!Root}, a cell inside a {!Row}: elsewhere it raises
    [Invalid_argument] as it is made. *)

type sort_descriptor = {
  column : string;
  direction : [ `ascending | `descending ];
}
(** How a table is sorted: by the column whose [id] is [column], one way or the
    other. *)

type context = {
  selection_mode : unit -> [ `none | `single | `multiple ];
  sort : unit -> sort_descriptor option;
  sort_by : string -> unit;
      (** Asks for a column's sort: ascending, or turned if it was so. *)
  is_selected : string -> bool;
  is_disabled : string -> bool;
  toggle : string -> unit;  (** Toggles a row's selection. *)
  is_select_all : unit -> bool;  (** Whether every row is selected. *)
  is_empty : unit -> bool;  (** Whether no row is selected. *)
  select_all : unit -> unit;
  clear_selection : unit -> unit;
}
(** What a table's parts, and a style over them, read of it: how it is sorted
    and its rows are selected, and each row's state by its key. *)

val use_context : unit -> context
(** The table above; outside a {!Root} it raises [Invalid_argument]. *)

type column = { direction : unit -> [ `ascending | `descending ] option }
(** What a part inside a {!Column} reads of it: which way it is sorted, if it
    is. *)

val use_column_context : unit -> column
(** The column above; outside a {!Column} it raises [Invalid_argument]. *)

(** The [<table role="grid">], [aria-multiselectable] while many rows may be
    selected. It is sorted as [sort_descriptor] says, its rows' order the
    application's to follow: pressing a column that [allows_sorting] calls
    [on_sort_change] with it ascending, or turned if it was so sorted. Its rows'
    keys selected are [selected_keys] while it is given them, else those it
    keeps, [default_selected_keys] at first; each change calls
    [on_selection_change] with them, all of them for every row but a disabled
    one. A row whose key [disabled_keys] holds is disabled, and
    [disallow_empty_selection] keeps one selected. *)
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
      ?props:'spread Solidtype.Solid.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Table.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The [<thead role="rowgroup">] and its one [<tr role="row">], where its
    {!Column}s are. *)
module Header : sig
  module Props : sig
    type t

    val check :
      ?props:'spread Solidtype.Solid.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Thead.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** A column's header, a [<th role="columnheader">], [aria-colindex] its place,
    focused by the keys, its [id] the column a sort names. The column whose
    [is_row_header] names each row, its cells [rowheader]s. One that
    [allows_sorting] is [aria-sort], and pressed by a pointer, Enter or Space to
    be sorted by. *)
module Column : sig
  module Props : sig
    type t

    val check :
      ?id:string Solidtype.Check.value ->
      ?allows_sorting:bool Solidtype.Check.value ->
      ?is_row_header:bool Solidtype.Check.value ->
      ?props:'spread Solidtype.Solid.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Th.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The [<tbody role="rowgroup">], its {!Row}s, or, while it has none, a row of
    one cell across every column, [empty_state], read only then. *)
module Body : sig
  module Props : sig
    type t

    val check :
      ?empty_state:Solidtype.Jsx.element Solidtype.Check.value ->
      ?props:'spread Solidtype.Solid.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Tbody.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** A row, a [<tr role="row">] of Kobalte's list, [data-key] its [id], which is
    its key in a selection, named by its row header's cell. A row joins the list
    once it is on the page, ordered as the page has it. *)
module Row : sig
  module Props : sig
    type t

    val check :
      id:string Solidtype.Check.value ->
      ?props:'spread Solidtype.Solid.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Tr.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** A cell, a [<td>], a [gridcell], or a [rowheader] in the row header's column,
    focused by the keys, [data-column-index] its column. *)
module Cell : sig
  module Props : sig
    type t

    val check :
      ?props:'spread Solidtype.Solid.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Td.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end
