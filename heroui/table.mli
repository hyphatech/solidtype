(** HeroUI's Table: a [<div>] with HeroUI's classes from {!Styles.Table} around
    a [<table role="grid">], {!Content}, its rows and cells moved through by the
    keys as React Aria's grid is. Kobalte has no table: its rows are a list of
    Kobalte's, made of {!Solidtype_kobalte.Selection}'s hooks, which focus a row
    and move between rows by the arrow keys, Home and End, Page Up and Page Down
    and typing; the port moves between a row's cells, and between a cell and the
    cell above or below it.

    {[
      <Table>
        <Table.Scroll_container>
          <Table.Content aria_label="Team members">
            <Table.Header>
              <Table.Column is_row_header=true>"Name"</Table.Column>
              <Table.Column>"Role"</Table.Column>
            </Table.Header>
            <Table.Body>
              <For each=(fun () -> members)>
                (fun m _ ->
                  <Table.Row id=m.id>
                    <Table.Cell>(fun () -> Jsx.string m.name)</Table.Cell>
                    <Table.Cell>(fun () -> Jsx.string m.role)</Table.Cell>
                  </Table.Row>)
              </For>
            </Table.Body>
          </Table.Content>
        </Table.Scroll_container>
      </Table>
    ]}

    Rows given by data are Solid's [For] inside {!Body}, as HeroUI's are its
    body's [items] and a render function. A part is used inside a [Table], and a
    row's or a cell's inside a {!Content}: elsewhere it raises
    [Invalid_argument] as it is made. *)

type sort_descriptor = Solidtype_headless.Table.sort_descriptor = {
  column : string;
  direction : [ `ascending | `descending ];
}
(** How a table is sorted: by the column whose [id] is [column], one way or the
    other; the headless table's. *)

(** How wide a column is, in a {!Resizable_container}; the headless table's. *)
type column_size = Solidtype_headless.Table.column_size =
  | Pixels of float
  | Percent of float  (** Of the width the table is given. *)
  | Fraction of float
      (** A share of what the other columns leave, as CSS's [fr] is. *)

(** The [<div>] the table scrolls in, sideways, while the table and its footer
    stay as wide as their container. *)
module Scroll_container : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The [<div>] a table whose columns resize scrolls in, in place of a
    {!Scroll_container}: the table is laid out at a fixed width, each column as
    its [width], or [default_width] until it is resized, says, never narrower
    than its [min_width], 75 pixels by default, nor wider than its [max_width].
    A resize by a {!Column_resizer} calls [on_resize_start], then [on_resize] at
    each step and [on_resize_end], each with every column's size by its [id]. *)
module Resizable_container : sig
  module Props : sig
    type t

    val check :
      ?on_resize_start:((string * column_size) array -> unit) ->
      ?on_resize:((string * column_size) array -> unit) ->
      ?on_resize_end:((string * column_size) array -> unit) ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The [<table role="grid">], named by [aria_label] or [aria_labelledby]: a
    page's Tab reaches its focused row, the first at first, and leaves it.

    Its rows are selected as [selection_mode] says, by Kobalte's list: none, one
    at a time, or many. Pressing a row, or Space or Enter on it, toggles it, or
    with [selection_behavior] [`replace] chooses it alone, Shift and the
    platform's key extending and adding, as Kobalte's list does. Its keys are
    [selected_keys] while it is given them, else those it keeps,
    [default_selected_keys] at first; each change calls [on_selection_change]
    with them. A row whose key [disabled_keys] holds is disabled, and
    [disallow_empty_selection] keeps one selected. It is sorted as
    [sort_descriptor] says, its rows' order the application's to follow:
    pressing a column that [allows_sorting], or Enter or Space on it, calls
    [on_sort_change] with it ascending, or turned if it was so sorted. A
    {!Checkbox} of [slot=`selection] in a row stands for its row, and in the
    {!Header} for every row. *)
module Content : sig
  module Props : sig
    type t

    val check :
      ?aria_label:string Solidtype.Check.value ->
      ?aria_labelledby:string Solidtype.Check.value ->
      ?selection_mode:[ `none | `single | `multiple ] Solidtype.Check.value ->
      ?selection_behavior:[ `toggle | `replace ] Solidtype.Check.value ->
      ?selected_keys:string array Solidtype.Check.value ->
      ?default_selected_keys:string array Solidtype.Check.value ->
      ?on_selection_change:(string array -> unit) ->
      ?disabled_keys:string array Solidtype.Check.value ->
      ?disallow_empty_selection:bool Solidtype.Check.value ->
      ?sort_descriptor:sort_descriptor Solidtype.Check.value ->
      ?on_sort_change:(sort_descriptor -> unit) ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The [<thead>], its one row of {!Column}s. *)
module Header : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** A column's header, a [<th role="columnheader">], its [id] the column a sort
    names. The column whose [is_row_header] names each row, its cells
    [rowheader]s. In a {!Resizable_container} it is as wide as [width] says,
    else [default_width] until resized, within [min_width] and [max_width]. It
    declares [data-allows-sorting], [data-hovered] and [data-focus-visible]. *)
module Column : sig
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
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** What resizes the {!Column} it is in, HeroUI's handle on the column's edge: a
    pointer drags it, and Tab reaches it from the column's header, where its
    arrows resize the column by 10 pixels and Enter begins a resize they go on
    with, which Enter, Escape, Space, Tab or leaving it ends. Its input is named
    [aria_label], "Resizer" by default. It declares [data-hovered],
    [data-focused], [data-focus-visible], [data-resizing] and
    [data-resizable-direction]. It is used in a column of a table in a
    {!Resizable_container}. *)
module Column_resizer : sig
  module Props : sig
    type t

    val check :
      ?aria_label:string Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** A sortable column's label, a [<span>], and HeroUI's chevron after it while
    the column is sorted, up for ascending and turned for descending, unless
    [show_indicator] is [false]; [indicator] in its place, in a [<span>]
    HeroUI's styles turn. Its direction is its {!Column}'s, unless
    [sort_direction] says another: HeroUI's is given its column's by a render
    function. *)
module Sortable_column_header : sig
  module Props : sig
    type t

    val check :
      ?sort_direction:[ `ascending | `descending ] Solidtype.Check.value ->
      ?show_indicator:bool Solidtype.Check.value ->
      ?indicator:Solidtype.Jsx.element Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The [<tbody>], its {!Row}s, or [render_empty_state] while it has none. *)
module Body : sig
  module Props : sig
    type t

    val check :
      ?render_empty_state:(unit -> Solidtype.Jsx.element) ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** A row, a [<tr role="row">] Kobalte's list focuses, named by its row header's
    cell, its [id] its key, else one of its own. It declares [data-hovered] and
    [data-focus-visible]. *)
module Row : sig
  module Props : sig
    type t

    val check :
      ?id:string Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** A cell, a [<td>], a [gridcell], or a [rowheader] in the row header's column.
    It declares [data-focus-visible]. *)
module Cell : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** What loads more rows, at the end of a {!Body}, as HeroUI's [Table.LoadMore]
    does: a sentinel that calls [on_load_more] as it comes within
    [scroll_offset] heights of the view of what scrolls the table, 1 by default,
    and again as loading ends with it still in view, never while [is_loading];
    and while [is_loading], a row across every column holding its children, a
    {!Load_more_content}, which no key reaches. *)
module Load_more : sig
  module Props : sig
    type t

    val check :
      ?is_loading:bool Solidtype.Check.value ->
      ?on_load_more:(unit -> unit) ->
      ?scroll_offset:float Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** What a loading row shows, a [<div>] centred in it: a {!Spinner}, say. *)
module Load_more_content : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** What follows the table, inside its frame: a [<div>]. *)
module Footer : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

module Props : sig
  type t

  val check :
    ?variant:[ `primary | `secondary ] Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
