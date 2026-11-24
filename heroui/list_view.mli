(** A list of rows, in HeroUI's look, which ships no stylesheet for it: a
    {!Solidtype_headless.Grid_list} of items, each its content and an action,
    chosen by a checkbox where the list chooses, acted on by [on_action] or an
    item's [href]. Its look is a stylesheet, [list-view.css], in the
    [components] layer, rules for its classes.

    Its page, with its examples:
    [$(opam var solidtype:doc)/pages/heroui/list-view.md].

    {[
      <List_view aria_label="Files" selection_mode=`multiple>
        <List_view.Item id="readme" text_value="README.md">
          <List_view.Item_content>
            <List_view.Title>"README.md"</List_view.Title>
            <List_view.Description>"Updated 3 hours ago"</List_view.Description>
          </List_view.Item_content>
        </List_view.Item>
      </List_view>
    ]}

    Its keys, selection and actions are {!Solidtype_headless.Grid_list}'s. A
    part is used inside a [List_view]: elsewhere it raises [Invalid_argument] as
    it is made. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

type variant = [ `primary | `secondary ]

(** The content of an item, its icon and its text: a
    [<div class="list-view__item-content">]. *)
module Item_content : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `elements ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** An item's name, cut short to its width: a [<span class="list-view__title">].
*)
module Title : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `elements ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Span.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Span.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** A line under an item's name, muted: a
    [<span class="list-view__description">]. *)
module Description : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `elements ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Span.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Span.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** What an item ends with, its buttons or its menu, at its far side: a
    [<div class="list-view__item-action">]. *)
module Item_action : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `elements ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** An item: a [<div role="row" class="list-view__item">], React Aria's state on
    it as ["true"] -- [data-selected], [data-hovered], [data-pressed],
    [data-focus-visible], [data-disabled] -- and [data-selection-mode]; where
    the list chooses, a checkbox first that stands for its selection. *)
module Item : sig
  type state = {
    is_selected : bool S.accessor;
    is_disabled : bool S.accessor;
    is_hovered : bool S.accessor;
    is_pressed : bool S.accessor;
    is_focused : bool S.accessor;
    is_focus_visible : bool S.accessor;
    selection_mode : [ `none | `single | `multiple ] S.accessor;
  }
  (** What its children are drawn of, given as a function. *)

  module Props : sig
    type t

    val check :
      ?id:string Solidtype.Check.value ->
      ?text_value:string Solidtype.Check.value ->
      ?is_disabled:bool Solidtype.Check.value ->
      ?href:string Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?ref:(Dom.htmlDivElement -> unit) ->
      children:
        (state -> Jsx.element, [ `elements | `render ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> state -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

module Props : sig
  type t

  val check :
    ?variant:variant Solidtype.Check.value ->
    ?selection_mode:[ `none | `single | `multiple ] Solidtype.Check.value ->
    ?selection_behavior:[ `toggle | `replace ] Solidtype.Check.value ->
    ?selected_keys:string array Solidtype.Check.value ->
    ?default_selected_keys:string array Solidtype.Check.value ->
    ?on_selection_change:(string array -> unit) ->
    ?disabled_keys:string array Solidtype.Check.value ->
    ?disallow_empty_selection:bool Solidtype.Check.value ->
    ?on_action:(string -> unit) ->
    ?render_empty_state:(unit -> Jsx.element) ->
    ?virtualized:bool Solidtype.Check.value ->
    ?row_height:float Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?ref:(Dom.htmlDivElement -> unit) ->
    children:(_, [ `elements ]) Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
    ?props:t S.rest ->
    (unit -> unit) Solidtype.Html.Div.check
end

val make : Props.t -> Jsx.element
(** The list: a [<div role="grid" class="list-view list-view--primary">], or
    [--secondary], [`primary] by default: a grey card of white rows, or rows on
    the page's own background with a line between each. With [virtualized],
    [data-virtualized], it draws only the rows in view, each [row_height] high,
    48 by default, and scrolls them: give it a height. *)

val component : Props.t Jsx.component
