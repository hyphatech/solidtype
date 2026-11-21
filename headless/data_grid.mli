(** What a data grid is made of, whoever dresses it: its columns, each how its
    cells draw and how it sorts, and the rows a sort or a drop gives back. A
    grid of a design system draws them on its {!Table}'s parts; these are plain
    functions, so its rows are sorted and reordered here, once.

    {[
    let columns =
      [|
        Data_grid.column ~id:"name" ~header:(Text "Name") ~is_row_header:true
          ~sort:(By_text (fun c -> c.name))
          (fun c -> Jsx.string (S.get c).name);
        Data_grid.column ~id:"amount" ~header:(Text "Amount") ~align:`end_
          ~sort:(By (fun a b -> Float.compare a.amount b.amount))
          (fun c -> Jsx.string (money (S.get c).amount));
      |]
    ]} *)

module Jsx := Solidtype.Jsx

(** How a column's rows are put in order: by the text it reads of each, in the
    order of the page's language, or by a comparison of two rows. *)
type 'row sort = By_text of ('row -> string) | By of ('row -> 'row -> int)

(** What a column's header shows: text, or an element drawn where the header is,
    of nothing or of which way the column is sorted, if it is. *)
type header =
  | Text of string
  | Element of (unit -> Jsx.element)
  | Sorted of ([ `ascending | `descending ] option -> Jsx.element)

type 'row column = private {
  id : string;  (** What a sort names it by. *)
  header : header;
  cell : 'row Solidtype.Solid.accessor -> Jsx.element;
      (** Draws a cell of a row, which it reads as it changes. *)
  sort : 'row sort option;  (** Sortable exactly when it is given one. *)
  is_row_header : bool;
  width : Table.column_size option;
  default_width : Table.column_size option;
  min_width : float option;
  max_width : float option;
  allows_resizing : bool;
  align : [ `start | `center | `end_ ];
  pinned : [ `start | `end_ ] option;
  header_class : string option;
  cell_class : string option;
}
(** A column of a grid of ['row]s, made by {!val-column}. *)

val column :
  id:string ->
  header:header ->
  ?sort:'row sort ->
  ?is_row_header:bool ->
  ?width:Table.column_size ->
  ?default_width:Table.column_size ->
  ?min_width:float ->
  ?max_width:float ->
  ?allows_resizing:bool ->
  ?align:[ `start | `center | `end_ ] ->
  ?pinned:[ `start | `end_ ] ->
  ?header_class:string ->
  ?cell_class:string ->
  ('row Solidtype.Solid.accessor -> Jsx.element) ->
  'row column
(** A column whose cells [cell] draws from each row, given as an accessor: a row
    given again by its key is read anew, its cell, and a control in it, kept:
    not a row header, not resizable and aligned to the start unless it says so.
*)

val sorted :
  compare_text:(string -> string -> int) ->
  'row column array ->
  Table.sort_descriptor option ->
  'row array ->
  'row array
(** The rows in the order a sort asks for: by the column it names, ascending or
    turned, rows that compare equal in the order given; text compared by
    [compare_text], the page language's order. The rows as given where there is
    no sort, or it names no column with a [sort]. *)

val reordered :
  row_id:('row -> string) -> 'row array -> Table.reorder -> 'row array
(** Every row, those a drop moved taken out and put back, in their order, beside
    the row they landed by. The rows as given where that row is one of those
    moved, or none. *)
