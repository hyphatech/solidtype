(** HeroUI's ListBox: Kobalte's [Listbox], a list of options to select one or
    many of, or to act on, with HeroUI's classes from {!Styles.Listbox},
    {!Styles.ListboxItem} and {!Styles.ListboxSection}.

    {[
      <List_box aria_label="Users" selection_mode=`single>
        <List_box.Item id="bob" text_value="Bob">
          <Label>"Bob"</Label>
          <Description>"bob@heroui.com"</Description>
          <List_box.Item_indicator />
        </List_box.Item>
      </List_box>
    ]}

    Tab gives the focus to the selected option, else the first, and the arrows
    move it between the options, as typing an option's text does. Space, Enter
    or a press selects the option: in a selection of one it replaces the
    selection, in a selection of many it is added or taken away. With
    [selection_mode=`none], Enter or a press calls [on_action] with the option's
    [id].

    Its options, {!Section}s and [Separator]s join the list as they are made, in
    their order, and the list draws them: a [Header] inside a section names it,
    a [Description] inside an option describes it, and a separator is a [<div>],
    as React Aria's is.

    A part is used inside a [List_box], an indicator inside an {!Item}:
    elsewhere it raises [Invalid_argument] as it is made. *)

type selection_mode = [ `none | `single | `multiple ]
(** How a list selects its options: not at all, one at most, or many. *)

type option_
(** An option as it joined its list. *)

val key : option_ -> string
(** Its [id]. *)

val text : option_ -> string
(** Its [text_value], else its [id]. *)

val content : option_ -> Solidtype.Jsx.element
(** Its children, drawn again outside the list, as a select's value shows the
    option chosen; an indicator inside them is drawn as not selected, as React
    Aria draws it. *)

type node =
  (option_, unit) Solidtype_kobalte.Types.Either.t
  Solidtype_kobalte.Types.CollectionNode.t
(** Kobalte's node of an option, in a list of options alone. *)

(** How an option is focused. *)
type focus =
  | Real  (** An option takes the focus itself. *)
  | Virtual of (unit -> string option)
      (** The focus stays elsewhere, a combo box's input, and the option whose
          key this reads is focused. *)

type listing = {
  mode : unit -> selection_mode;
  is_selected : string -> bool;
  is_disabled : string -> bool;
  act : string -> unit;
  focus : focus;
}
(** What a list's options read of what holds them: how it selects, which keys
    are selected and disabled, what an option pressed does, and how an option is
    focused. *)

(** The {!listing} a part gives the options it draws. *)
module Listing : sig
  module Provider : sig
    module Props : sig
      val check :
        value:listing Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Solidtype.Jsx.component
  end
end

type hosted = {
  options : unit -> option_ list;
      (** Its options, in order, whatever holds them. *)
  draw :
    node Solidtype_kobalte.Types.Collection.t Solidtype.Solid.accessor ->
    Solidtype.Jsx.element;
      (** Its options, sections and separators, given Kobalte's collection, as
          the children of Kobalte's list: inside a {!Listing}; or, while it
          draws no option, its empty state. *)
  empty : unit -> bool;  (** Whether it draws no option. *)
  classes : unit -> string;  (** Its classes. *)
  aria_label : unit -> string option;  (** Its name. *)
  others : unit Solidtype.Solid.rest;  (** The rest of its props. *)
}
(** What a part that holds a list box takes of it, to draw it as its own, in
    Kobalte's list of its own. *)

(** Where a list box inside a part is taken: a {!Select} takes its list box,
    which then draws nothing where it is, and draws it in its popover. *)
module Host : sig
  module Provider : sig
    module Props : sig
      val check :
        value:((hosted -> Solidtype.Jsx.element)[@u]) Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Solidtype.Jsx.component
  end
end

(** An option, known by its [id], typed to by its [text_value]: Kobalte's item,
    a [<div>] with the role [option], selected while its id is. *)
module Item : sig
  module Props : sig
    type t

    val check :
      id:string Solidtype.Check.value ->
      ?text_value:string Solidtype.Check.value ->
      ?is_disabled:bool Solidtype.Check.value ->
      ?variant:[ `default | `danger ] Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** What shows its option selected: HeroUI's check, drawn in as it is selected;
    or what [children] draws, given a read of whether its option is selected, as
    HeroUI's render function is given [isSelected]. *)
module Item_indicator : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?children:
        ( bool Solidtype.Solid.accessor -> Solidtype.Jsx.element,
          [ `render ] )
        Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** What loads more options, as React Aria's [ListBoxLoadMoreItem] does: a
    sentinel in its place that calls [on_load_more] as it comes within
    [scroll_offset] heights of the list's view, 1 by default, and again as
    loading ends with it still in view; and its children, an option no key
    reaches, while [is_loading]. *)
module Load_more_item : sig
  module Props : sig
    type t

    val check :
      ?is_loading:bool Solidtype.Check.value ->
      ?on_load_more:(unit -> unit) ->
      ?scroll_offset:float Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** A group of options: a [<section>] with the role [group], named by its
    [Header]. *)
module Section : sig
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

(** The list, named by its [aria_label]. [selection_mode] is a selection of one
    by default. Its [selected_keys] are the selected options' ids while it is
    given, else those it keeps, [default_selected_keys] at first; a change calls
    [on_selection_change] with them. An option whose id [disabled_keys] holds is
    disabled. While it draws no option, what [render_empty_state] draws shows in
    it. *)
module Props : sig
  type t

  val check :
    ?aria_label:string Solidtype.Check.value ->
    ?selection_mode:selection_mode Solidtype.Check.value ->
    ?selected_keys:string array Solidtype.Check.value ->
    ?default_selected_keys:string array Solidtype.Check.value ->
    ?on_selection_change:(string array -> unit) ->
    ?disabled_keys:string array Solidtype.Check.value ->
    ?on_action:(string -> unit) ->
    ?render_empty_state:(unit -> Solidtype.Jsx.element) ->
    ?variant:[ `default | `danger ] Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
