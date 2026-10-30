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

(** The [<table role="grid">], named by [aria_label] or [aria_labelledby]: a
    page's Tab reaches its focused row, the first at first, and leaves it.

    Its rows are selected as [selection_mode] says, by Kobalte's list: none, one
    at a time, or many. Pressing a row, or Space or Enter on it, toggles it, or
    with [selection_behavior] [`replace] chooses it alone, Shift and the
    platform's key extending and adding, as Kobalte's list does. Its keys are
    [selected_keys] while it is given them, else those it keeps,
    [default_selected_keys] at first; each change calls [on_selection_change]
    with them. A row whose key [disabled_keys] holds is disabled, and
    [disallow_empty_selection] keeps one selected. A {!Checkbox} of
    [slot=`selection] in a row stands for its row, and in the {!Header} for
    every row. *)
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

(** A column's header, a [<th role="columnheader">]. The column whose
    [is_row_header] names each row, its cells [rowheader]s. *)
module Column : sig
  module Props : sig
    type t

    val check :
      ?is_row_header:bool Solidtype.Check.value ->
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
