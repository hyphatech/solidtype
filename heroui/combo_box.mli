(** HeroUI's ComboBox: Kobalte's [Combobox], a text input that filters a
    {!List_box} of options as it is typed into, to choose one or many of, with
    HeroUI's classes from {!Styles.ComboBox}.

    {[
      <Combo_box>
        <Label>"Favorite Animal"</Label>
        <Combo_box.Input_group>
          <Input placeholder="Search animals..." />
          <Combo_box.Trigger />
        </Combo_box.Input_group>
        <Combo_box.Popover>
          <List_box>
            <List_box.Item id="cat" text_value="Cat">
              "Cat" <List_box.Item_indicator />
            </List_box.Item>
          </List_box>
        </Combo_box.Popover>
      </Combo_box>
    ]}

    An [Input] inside it is its input, Kobalte's, which its [Label] names and
    its [Description] describes; a [Field_error] shows while it is invalid, or a
    [Form]'s error for its [name] stands. The [List_box] inside its {!Popover}
    is its list, whose options join it while it is closed too, so the input
    shows the option chosen by its [text_value].

    Typing opens the list, of the options whose text holds what is typed, and so
    does focus, as [menu_trigger] says; a press on the {!Trigger} opens it with
    every option. The arrows move through the options while the focus stays in
    the input, and Enter or a press chooses one: in a choice of one, the list
    closes and the input shows its text; in a choice of many, it stays open and
    the input is emptied, and a {!Value} shows the options chosen. Escape closes
    the list; leaving the input puts back the text of the option chosen, unless
    [allows_custom_value].

    A part is used inside a [Combo_box]: elsewhere it raises [Invalid_argument]
    as it is made. *)

type placement = [ `top | `bottom | `left | `right ]
(** A side of the input group. *)

type field = {
  variant : unit -> [ `primary | `secondary ];
  disabled : unit -> bool;
  invalid : unit -> bool;
  name : unit -> string option;
      (** The name a form is sent its text under, where it is sent the text. *)
  returned : unit -> bool;
      (** Whether the focus has come back to the input from the list by keys,
          which shows its ring, as React Aria's virtual focus does. *)
}
(** What an [Input] inside a combo box reads of it: the variant it takes where
    it sets none, and the combo box's state. *)

module Field : sig
  module Provider : sig
    module Props : sig
      val check :
        value:field Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Solidtype.Jsx.component
  end

  val use : unit -> field option
end

(** Its input and trigger: Kobalte's control, a [<div role="group">]. *)
module Input_group : sig
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

(** The button that opens the list with every option: Kobalte's trigger, which
    no Tab reaches, with HeroUI's chevron, turned while the list is open, or the
    [children] it is given. *)
module Trigger : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The options chosen, their texts listed as the reader's language lists them,
    "Cat, Dog, and Panda", else [placeholder]; or, while one is chosen, what
    [children] draws, given a read of the ids chosen. *)
module Value : sig
  module Props : sig
    type t

    val check :
      ?placeholder:string Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?children:
        ( string array Solidtype.Solid.accessor -> Solidtype.Jsx.element,
          [ `render ] )
        Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The list's popover: drawn in a portal at the end of the page while it is
    open, and while HeroUI's exit animation plays after, [placement] beside the
    input group, [bottom] by default, at least as wide. *)
module Popover : sig
  module Props : sig
    type t

    val check :
      ?placement:placement Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The combo box. [selection_mode] is read as it is made. Its [value] is the
    ids of the options chosen, one at most in a choice of one, while it is
    given, else those it keeps, [default_value] at first; a change calls
    [on_change] with them. Its [input_value] is the input's text while it is
    given, else the text it keeps, [default_input_value] at first, and a change
    calls [on_input_change].

    The list opens as the input takes the focus, by [menu_trigger=`focus], the
    default; as it is typed into, by [`input]; or only by the trigger and the
    arrows, by [`manual]. It shows the options whose text holds the input's,
    whatever their case or accents, or those [default_filter] keeps, given an
    option's text and the input's; and it stays closed while none does, unless
    [allows_empty_collection]. The arrows wrap from the last option to the first
    by [should_focus_wrap].

    With [allows_custom_value], the text typed stays as it is left and is the
    value a form is sent, as it is by [form_value=`text]; else a form is sent
    the ids chosen, under [name]. An option whose id [disabled_keys] holds is
    disabled. *)
module Props : sig
  type t

  val check :
    ?selection_mode:[ `single | `multiple ] Solidtype.Check.value ->
    ?value:string array Solidtype.Check.value ->
    ?default_value:string array Solidtype.Check.value ->
    ?on_change:(string array -> unit) ->
    ?input_value:string Solidtype.Check.value ->
    ?default_input_value:string Solidtype.Check.value ->
    ?on_input_change:(string -> unit) ->
    ?on_open_change:(bool -> unit) ->
    ?disabled_keys:string array Solidtype.Check.value ->
    ?default_filter:(string -> string -> bool) ->
    ?menu_trigger:[ `focus | `input | `manual ] Solidtype.Check.value ->
    ?allows_custom_value:bool Solidtype.Check.value ->
    ?allows_empty_collection:bool Solidtype.Check.value ->
    ?should_focus_wrap:bool Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?is_read_only:bool Solidtype.Check.value ->
    ?is_required:bool Solidtype.Check.value ->
    ?is_invalid:bool Solidtype.Check.value ->
    ?name:string Solidtype.Check.value ->
    ?form_value:[ `key | `text ] Solidtype.Check.value ->
    ?on_blur:(Dom.focusEvent -> unit) ->
    ?full_width:bool Solidtype.Check.value ->
    ?variant:[ `primary | `secondary ] Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
