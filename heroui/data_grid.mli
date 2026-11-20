(** A data grid in HeroUI's look: rows given as data and columns as definitions,
    drawn on HeroUI's {!Table}, with selection checkboxes, sorting in the
    browser or left to the application, columns resized and pinned, a header
    kept in view, rows dragged to a new place, more rows loaded as its end comes
    into view, rows virtualized, an empty state and a footer. Its look is its
    stylesheet's, [heroui/data-grid.css], in the plugin's [heroui-extras.css],
    over HeroUI's table: a rule for a part's class restyles it.

    Its page, with its examples:
    [$(opam var solidtype:doc)/pages/heroui/data-grid.md].

    {[
      let columns =
        [|
          Data_grid.column ~id:"customer" ~header:(Text "Customer")
            ~is_row_header:true
            ~sort:(By_text (fun p -> p.customer))
            (fun p -> Jsx.string (S.get p).customer);
          Data_grid.column ~id:"amount" ~header:(Text "Amount") ~align:`end_
            ~sort:(By (fun a b -> Float.compare a.amount b.amount))
            (fun p -> Jsx.string (money (S.get p).amount));
        |]

      <Data_grid
        aria_label="Payments"
        rows=payments
        row_id=(fun p -> p.id)
        columns
        selection_mode=`multiple
        show_selection_checkboxes=true
      />
    ]} *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

type 'row sort = 'row Solidtype_headless.Data_grid.sort =
  | By_text of ('row -> string)
      (** By the text it reads of each row, in the order of the page's language:
          Kobalte's locale's collation. *)
  | By of ('row -> 'row -> int)  (** By a comparison of two rows. *)

type header = Solidtype_headless.Data_grid.header =
  | Text of string
      (** Text, and beside it, while the column is sorted, a chevron turned for
          descending. *)
  | Element of (unit -> Jsx.element)  (** Drawn where the header is. *)
  | Sorted of ([ `ascending | `descending ] option -> Jsx.element)
      (** Drawn from which way the column is sorted, if it is. *)

type 'row column = 'row Solidtype_headless.Data_grid.column
(** A column of a grid of ['row]s. *)

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
  ('row S.accessor -> Jsx.element) ->
  'row column
(** A column whose cells [cell] draws from each row, given as an accessor, so a
    row given again by its [row_id] is read anew and its cell, and a control in
    it, kept; its header [header]: by [id] a sort names it; sortable exactly
    when given a [sort]; the row header, whose cells name their rows, with
    [is_row_header]; as wide as [width], or [default_width] until resized,
    within [min_width] and [max_width], and resizable with [allows_resizing] in
    a grid that [allows_column_resize]; its header and cells aligned by [align],
    to the start by default, and kept in view at a side with [pinned];
    [header_class] and [cell_class] added after the grid's classes. *)

type 'row reorder = {
  keys : string array;  (** The rows moved, in the order shown. *)
  target : string;  (** The row they land beside. *)
  position : [ `before | `after ];
  rows : 'row array;  (** Every row given, the moved ones where they landed. *)
}
(** Rows dropped where a drag let them go. *)

val reordered :
  row_id:('row -> string) -> 'row array -> Table.reorder -> 'row array
(** Every row, those a drop moved taken out and put back, in their order, beside
    the row they landed by: what {!reorder}'s [rows] are, for a {!Table}
    reordered by hand. *)

(** The grid: a [<div class="table-root data-grid">], HeroUI's {!Table}'s, its
    [data-vertical-align] [vertical_align], [`middle] by default, which its
    cells follow.

    Its [rows], each known by [row_id], are drawn in the order its sort asks
    for: [sort_descriptor], where it is given, is the application's, and its
    rows are drawn as given; else the grid keeps its own,
    [default_sort_ descriptor] at first, and orders the rows by the sorted
    column. Each change calls [on_sort_change].

    With [show_selection_checkboxes] and a [selection_mode], a column of
    checkboxes comes first, the header's choosing every row; the selection is
    [selected_keys], or kept from [default_selected_keys], told by
    [on_selection_change], [disabled_keys] never selected. Given [on_reorder], a
    column of drag handles comes next, and a row dragged, by its handle and the
    keys or a pointer, is told with every row in its new place. Both stay beside
    the columns pinned to the start.

    With [allows_column_resize], the grid lays its columns out at their widths
    and a column that [allows_resizing] is resized by a drag or the keys,
    [on_column_resize] told each step and [on_column_resize_end] the last. With
    [sticky_header], its header stays at the top of its scroll container, which
    [scroll_container_class] gives a height. With [virtualized], only the rows
    in view are drawn, each [row_height] high below a header [heading_height]
    high, 42 and 36 by default; give the table a height by [content_class].

    With no rows it draws [empty_state]; given [on_load_more], it asks for more
    as its end comes into view, [load_more_content] shown while
    [is_loading_more]; [footer] is drawn below it, outside its sideways scroll.
    A row's action, Enter or a press as its selection lets it, calls
    [on_row_action] with its key. *)
module Props : sig
  type 'row t

  val check :
    rows:'row array Solidtype.Check.value ->
    row_id:('row -> string) ->
    columns:'row column array Solidtype.Check.value ->
    ?aria_label:string Solidtype.Check.value ->
    ?aria_labelledby:string Solidtype.Check.value ->
    ?variant:[ `primary | `secondary ] Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?content_class:string Solidtype.Check.value ->
    ?scroll_container_class:string Solidtype.Check.value ->
    ?sticky_header:bool Solidtype.Check.value ->
    ?vertical_align:[ `top | `middle | `bottom ] Solidtype.Check.value ->
    ?selection_mode:[ `none | `single | `multiple ] Solidtype.Check.value ->
    ?selection_behavior:[ `toggle | `replace ] Solidtype.Check.value ->
    ?selected_keys:string array Solidtype.Check.value ->
    ?default_selected_keys:string array Solidtype.Check.value ->
    ?on_selection_change:(string array -> unit) ->
    ?show_selection_checkboxes:bool Solidtype.Check.value ->
    ?disabled_keys:string array Solidtype.Check.value ->
    ?disallow_empty_selection:bool Solidtype.Check.value ->
    ?sort_descriptor:Table.sort_descriptor Solidtype.Check.value ->
    ?default_sort_descriptor:Table.sort_descriptor Solidtype.Check.value ->
    ?on_sort_change:(Table.sort_descriptor -> unit) ->
    ?allows_column_resize:bool Solidtype.Check.value ->
    ?on_column_resize:((string * Table.column_size) array -> unit) ->
    ?on_column_resize_end:((string * Table.column_size) array -> unit) ->
    ?on_reorder:('row reorder -> unit) ->
    ?reorder_messages:Table.reorder_messages Solidtype.Check.value ->
    ?on_row_action:(string -> unit) ->
    ?empty_state:Jsx.element Solidtype.Check.value ->
    ?footer:Jsx.element Solidtype.Check.value ->
    ?footer_class:string Solidtype.Check.value ->
    ?on_load_more:(unit -> unit) ->
    ?is_loading_more:bool Solidtype.Check.value ->
    ?load_more_content:Jsx.element Solidtype.Check.value ->
    ?virtualized:bool Solidtype.Check.value ->
    ?row_height:float Solidtype.Check.value ->
    ?heading_height:float Solidtype.Check.value ->
    ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
    ?props:'row t S.rest ->
    (unit -> unit) Solidtype.Html.Div.check
end

val make : 'row Props.t -> Jsx.element
val component : 'row Props.t Jsx.component
