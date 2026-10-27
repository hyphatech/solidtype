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
    disabled. *)
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
    ?variant:[ `default | `danger ] Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
