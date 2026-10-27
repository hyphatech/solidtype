(** HeroUI's Select: Kobalte's [Select], a button that shows the option chosen
    and opens a {!List_box} of options to choose one or many of, with HeroUI's
    classes from {!Styles.Select}.

    {[
      <Select placeholder="Select one">
        <Label>"State"</Label>
        <Select.Trigger>
          <Select.Value /> <Select.Indicator />
        </Select.Trigger>
        <Select.Popover>
          <List_box>
            <List_box.Item id="florida" text_value="Florida">
              "Florida" <List_box.Item_indicator />
            </List_box.Item>
          </List_box>
        </Select.Popover>
      </Select>
    ]}

    A [Label] inside it names its trigger, a [Description] describes it, and a
    [Field_error] shows while it is invalid, or a [Form]'s error for its [name]
    stands. The [List_box] inside its {!Popover} is its list, whose options join
    it while it is closed too, so its {!Value} shows the option chosen as the
    list draws it, else the [placeholder].

    A press on the trigger, or Enter, Space or an arrow, opens the list, which
    takes the focus, given to the option chosen as a key opens it; the arrows
    and typing move it. Enter, Space or a press chooses an option: in a choice
    of one, the list closes and the focus goes back to the trigger; in a choice
    of many, it stays open. Escape or a press outside closes it, and the page
    outside is hidden from a reader while it is open, as React Aria's is. With a
    {!Clear_button}, Backspace or Delete on the trigger clears the choice, as a
    press on the button does.

    A part is used inside a [Select]: elsewhere it raises [Invalid_argument] as
    it is made. *)

type placement = [ `top | `bottom | `left | `right ]
(** A side of the trigger. *)

(** Its button: Kobalte's trigger, which opens the list. *)
module Trigger : sig
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

(** The option chosen, as its list draws it, or the options chosen one after
    another, else the select's placeholder; or, while one is chosen, what
    [children] draws, given a read of the ids chosen. *)
module Value : sig
  module Props : sig
    type t

    val check :
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

(** HeroUI's chevron, or the [children] it is given, turned while the list is
    open. *)
module Indicator : sig
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

(** A [<span>] in the trigger, since a button in a button is not HTML, that
    clears the choice as it is pressed, calling [on_click] after, and is hidden
    while nothing is chosen. *)
module Clear_button : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?on_click:(Dom.mouseEvent -> unit) ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The list's popover: drawn in a portal at the end of the page while it is
    open, and while HeroUI's exit animation plays after, [placement] beside the
    trigger, [bottom] by default, at least as wide. *)
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

(** The select. [selection_mode] is read as it is made. Its [value] is the ids
    of the options chosen, one at most in a choice of one, while it is given,
    else those it keeps, [default_value] at first; a change calls [on_change]
    with them, and clearing calls [on_clear] too. An option whose id
    [disabled_keys] holds is disabled. *)
module Props : sig
  type t

  val check :
    ?placeholder:string Solidtype.Check.value ->
    ?selection_mode:[ `single | `multiple ] Solidtype.Check.value ->
    ?value:string array Solidtype.Check.value ->
    ?default_value:string array Solidtype.Check.value ->
    ?on_change:(string array -> unit) ->
    ?on_clear:(unit -> unit) ->
    ?disabled_keys:string array Solidtype.Check.value ->
    ?is_open:bool Solidtype.Check.value ->
    ?default_open:bool Solidtype.Check.value ->
    ?on_open_change:(bool -> unit) ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?is_required:bool Solidtype.Check.value ->
    ?is_invalid:bool Solidtype.Check.value ->
    ?name:string Solidtype.Check.value ->
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
