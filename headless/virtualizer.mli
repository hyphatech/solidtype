(** React Aria's Virtualizer: around a collection that reads it -- HeroUI's list
    box, alone or inside a select, a combo box or an autocomplete -- it has the
    collection draw only the entries in view of what scrolls them, the
    collection's own element where it scrolls, else the nearest above that does,
    in a block the size of them all, each entry placed in it by its [layout]. It
    draws no style, and is no element: a collection reads it by {!use} and
    places its entries by {!val-window}.

    {[
      <Virtualizer layout=(fun () -> Virtualizer.list_layout ~row_size:50. ())>
        <List_box aria_label="Users" class_="h-[400px] overflow-y-auto">
          ...
        </List_box>
      </Virtualizer>
    ]}

    A collection keeps the entry with the focus drawn wherever it is, so the
    focus stays, and scrolls one the keys move to into view. Until it knows the
    size of what scrolls it -- on the server, and in the browser until it has
    hydrated -- it draws the entries in its first 400 pixels, so a page is
    prerendered with them. *)

type list_layout = {
  orientation : [ `vertical | `horizontal ];
  row_size : float option;
  estimated_row_size : float option;
  heading_size : float option;
  estimated_heading_size : float option;
  loader_size : float;
  gap : float;
  padding : float;
}
(** React Aria's ListLayout's options, in pixels. *)

type layout = List of list_layout  (** React Aria's [ListLayout]. *)

val list_layout :
  ?orientation:[ `vertical | `horizontal ] ->
  ?row_size:float ->
  ?estimated_row_size:float ->
  ?heading_size:float ->
  ?estimated_heading_size:float ->
  ?loader_size:float ->
  ?gap:float ->
  ?padding:float ->
  unit ->
  layout
(** React Aria's ListLayout: entries one after another along [orientation],
    [`vertical] by default, [gap] between them and [padding] around them, 0 by
    default. An option is [row_size] long, 48 by default; given
    [estimated_row_size] and no [row_size], it is as long as it is drawn, taken
    as the estimate until it is. A section is as long as it is drawn, taken as
    its header, [heading_size] or [estimated_heading_size], 48 by default, and
    its options until it is; a separator likewise, taken as 1; what loads more
    [loader_size], 48 by default. A section is drawn whole while any of it is in
    view. *)

val use : unit -> layout option
(** The layout of the virtualizer around, [None] with none. *)

(** {1 A window on rows}

    What a collection draws through, given its rows, each an object of its own
    while it is a row: which rows to draw, and how each is placed. *)

type 'row window = {
  drawn : unit -> 'row array;
      (** The rows in view of what scrolls the list, and those kept wherever
          they are, in order; a read Solid tracks. *)
  place : 'row -> string;
      (** A row's style: where it is in the block, and its length where the
          layout fixes it. *)
  block : unit -> string;
      (** The block's style: as long as the rows all are. *)
  frame : 'row -> Dom.element -> unit;
      (** A row's element as it is made, measured where its length is not fixed.
      *)
  watch : Dom.element -> unit;
      (** The block's element as it is made: what scrolls it is found once it is
          on the page, and followed as it scrolls and is resized. *)
  scroll_to : 'row -> unit;
      (** Scrolls a row into view, by as little as it takes. *)
}

val window :
  list_layout ->
  rows:(unit -> 'row array) ->
  fixed:('row -> float option) ->
  estimate:('row -> float) ->
  keep:('row -> bool) ->
  'row window
(** [window layout ~rows ~fixed ~estimate ~keep] places [rows] one after another
    as [layout] says: a row is [fixed] long, or as long as it is drawn,
    [estimate] until it is; one that [keep]s is drawn wherever it is. *)

val reveal_in : [ `vertical | `horizontal ] -> Dom.element -> unit
(** Brings an element into view of what scrolls it along the orientation, by as
    little as it takes. *)

module Props : sig
  type t

  val check :
    layout:layout Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
