(** A list of rows, as Kobalte would make one: a [<div role="grid">] of items,
    each a [<div role="row">] around one [<div role="gridcell">], made of
    {!Solidtype_kobalte.Selection}'s hooks, chosen as the list's
    [selection_mode] and [selection_behavior] say, and acted on by [on_action]
    or an item's [href]. It draws no style: each part is the element it names,
    its roles and state as attributes, and takes every attribute its element
    does, which it passes on, a [ref] and a handler called beside its own.

    {[
      <Grid_list aria_label="Files" selection_mode=`multiple>
        <Grid_list.Item id="readme">"README.md"</Grid_list.Item>
      </Grid_list>
    ]}

    Tab reaches the item last focused, or the first chosen, or the first, and
    leaves the list after it. Up and Down move from item to item, a disabled one
    passed over, never past either end; Home and End, Page Up and Page Down
    reach the first and the last; typing the start of an item's name the next
    item of that name. Right moves into the controls of the focused item, and
    Left back out, each arrow a control's own once it holds the focus.

    A press, Space or Enter chooses an item, as Kobalte's selection does; where
    the list has an action, a press or Enter runs it instead while nothing is
    chosen, or while the item cannot be chosen, and a double press runs it where
    a press replaces the choice. A press on a control inside an item is the
    control's. A chosen item is [aria-selected] and [data-selected], and a
    disabled one [aria-disabled] and [data-disabled], present and empty as
    Kobalte's state is. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

type list_state = {
  selection_mode : [ `none | `single | `multiple ] S.accessor;
  is_empty : bool S.accessor;
  is_selected : string -> bool;
  is_disabled : string -> bool;
  toggle_selection : string -> unit;
      (** Chooses an item, or lets it go, where the list chooses. *)
}
(** What a part inside a list reads of it. *)

(** The list's state.

    Raises [Invalid_argument] outside a [Grid_list]. *)
module Context : sig
  val use : unit -> list_state
end

type item_state = {
  key : string S.accessor;
  is_selected : bool S.accessor;
  is_disabled : bool S.accessor;
  allows_selection : bool S.accessor;
  selection_mode : [ `none | `single | `multiple ] S.accessor;
  toggle_selection : unit -> unit;
}
(** What a part inside an item reads of it. *)

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
    ?on_action:(string -> unit) ->
    ?render_empty_state:(unit -> Jsx.element) ->
    ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
    ?props:'spread S.rest ->
    (?children:('f, [ `elements ]) Solidtype.Check.children -> unit -> unit)
    Solidtype.Html.Div.check
end

val make : Props.t -> Jsx.element
(** The list: [aria-multiselectable] where it chooses many, [data-empty] while
    it holds no item, when it draws [render_empty_state] in a row of its own.
    Inside a [Virtualizer] of a list's layout it draws only the rows in view of
    what scrolls it, and the focused one wherever it is. *)

val component : Props.t Jsx.component

(** An item: [text_value], or the first text among its children once its row is
    drawn, names it and is what typing finds, so an item a virtualized list may
    not draw is given [text_value]; [href] is the page its action opens. Its
    children are made as its row is drawn. *)
module Item : sig
  module Context : sig
    val use : unit -> item_state
    (** Raises [Invalid_argument] outside a [Grid_list.Item]. *)
  end

  module Props : sig
    type t

    val check :
      ?id:string Solidtype.Check.value ->
      ?text_value:string Solidtype.Check.value ->
      ?is_disabled:bool Solidtype.Check.value ->
      ?href:string Solidtype.Check.value ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `elements ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end
