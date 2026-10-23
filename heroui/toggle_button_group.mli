(** HeroUI's ToggleButtonGroup: {!Toggle_button}s of which one or several are
    selected, on Kobalte's toggle group, with HeroUI's classes from
    {!Styles.ToggleButtonGroup}, which round the first and the last and none
    between, or set them apart where it [is_detached]. Each button is named by
    its [id], the key [selected_keys] holds. It gives the buttons inside it its
    [size] and [is_disabled], each where the button sets none itself. A
    {!Separator} inside a button, but the first, draws a line before it.
    {[
      <Toggle_button_group selection_mode=`multiple>
        <Toggle_button id="bold">"Bold"</Toggle_button>
        <Toggle_button id="italic">
          <Toggle_button_group.Separator /> "Italic"
        </Toggle_button>
      </Toggle_button_group>
    ]}
    The group is Kobalte's: a [group] whose buttons Tab reaches as one and the
    arrow keys move between, each pressed or not. A button sets its own
    [is_disabled] over the group's, [false] in a disabled group too, as HeroUI
    documents. Every button inside it reads the group, not only its own children
    as in React. *)

type size = [ `sm | `md | `lg ]

type group = {
  size : unit -> size option;
  is_disabled : unit -> bool option;
  is_selected : string -> bool;
      (** Whether the button of a key is selected, read where it is shown. *)
  join : (unit -> bool) -> unit;
      (** [join disabled], as a button is made, adds it to the group by its read
          of whether it is disabled, until it is gone. *)
}
(** What a group gives its buttons. *)

module Context : sig
  module Provider : sig
    module Props : sig
      val check :
        value:group Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Solidtype.Jsx.component
  end

  val use : unit -> group option
end

(** The line before a button in a group, which HeroUI's styles draw at its start
    edge, or its top in a vertical group. *)
module Separator : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The group. [selection_mode] is [`single] by default, one button selected at
    most, or [`multiple]. [selected_keys] are the selected buttons' ids while it
    is given, else those kept, [default_selected_keys] at first; a change calls
    [on_selection_change] with them all. [disallow_empty_selection] keeps the
    last selected button from being unselected. It is named by [aria_label] or
    [aria_labelledby]. *)
module Props : sig
  type t

  val check :
    ?selection_mode:[ `single | `multiple ] Solidtype.Check.value ->
    ?selected_keys:string array Solidtype.Check.value ->
    ?default_selected_keys:string array Solidtype.Check.value ->
    ?on_selection_change:(string array -> unit) ->
    ?disallow_empty_selection:bool Solidtype.Check.value ->
    ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
    ?size:size Solidtype.Check.value ->
    ?is_detached:bool Solidtype.Check.value ->
    ?full_width:bool Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?aria_label:string Solidtype.Check.value ->
    ?aria_labelledby:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
