(** HeroUI's Autocomplete: a select whose popover filters its {!List_box} by a
    [Search_field], on Kobalte's [Combobox], with HeroUI's classes from
    {!Styles.Autocomplete}.

    {[
      <Autocomplete placeholder="Select one">
        <Label>"State"</Label>
        <Autocomplete.Trigger>
          <Autocomplete.Value /> <Autocomplete.Indicator />
        </Autocomplete.Trigger>
        <Autocomplete.Popover>
          <Autocomplete.Filter>
            <Search_field aria_label="Search options">
              <Search_field.Group>
                <Search_field.Search_icon />
                <Search_field.Input placeholder="Search..." />
              </Search_field.Group>
            </Search_field>
            <List_box>
              <List_box.Item id="florida" text_value="Florida">
                "Florida" <List_box.Item_indicator />
              </List_box.Item>
            </List_box>
          </Autocomplete.Filter>
        </Autocomplete.Popover>
      </Autocomplete>
    ]}

    A [Label] inside it names its trigger, a [Description] describes it, and a
    [Field_error] shows while it is invalid, or a [Form]'s error for its [name]
    stands. The [List_box] inside its {!Filter} is its list, whose options join
    it while it is closed too, so its {!Value} shows the option chosen, else the
    [placeholder]; the [Search_field] inside the filter is its search, whose
    input is Kobalte's combo box input.

    A press on the trigger, or Enter, Space or an arrow on its {!Indicator},
    opens the list and gives the search the focus; typing shows the options
    whose text holds what is typed, and the arrows move through them while the
    focus stays in the search. Enter or a press chooses one: in a choice of one,
    the list closes and the focus goes back to the indicator; in a choice of
    many, it stays open. Escape or a press outside closes it, and the search is
    emptied as it closes.

    A part is used inside an [Autocomplete]: elsewhere it raises
    [Invalid_argument] as it is made. *)

type placement = [ `top | `bottom | `left | `right ]
(** A side of the trigger. *)

(** What a [Search_field] inside a {!Filter} reads of it: the search's text,
    which Kobalte's combo box keeps, and how it is set; whether an option holds
    the focus, which stays in the search; and whether the focus has come back to
    the search from the list by keys, which shows its ring. *)
module Search : sig
  type t = {
    text : unit -> string;
    set : string -> unit;
    elsewhere : unit -> bool;
    returned : unit -> bool;
  }

  module Provider : sig
    module Props : sig
      val check :
        value:t Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Solidtype.Jsx.component
  end

  val use : unit -> t option
end

(** Its trigger: a [<div role="group">] that opens the list as it is pressed,
    and anchors the popover. *)
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
    another, else the autocomplete's placeholder; or, while one is chosen, what
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

(** The button that opens the list: HeroUI's chevron, or the [children] it is
    given, turned while the list is open. Tab reaches it. *)
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

(** A button that clears the choice as it is pressed, calling [on_click] after,
    and is hidden while nothing is chosen; no Tab reaches it. *)
module Clear_button : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
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
    trigger, [bottom] by default, as wide. *)
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

(** What filters the list by the search: it shows the options whose text holds
    the search's, whatever their case or accents, or those [filter] keeps, given
    an option's text and the search's. The search's text is [input_value] while
    it is given, else the text it keeps, emptied as the list closes; a change
    calls [on_input_change]. *)
module Filter : sig
  module Props : sig
    type t

    val check :
      ?filter:(string -> string -> bool) ->
      ?input_value:string Solidtype.Check.value ->
      ?on_input_change:(string -> unit) ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The autocomplete. [selection_mode] is read as it is made. Its [value] is the
    ids of the options chosen, one at most in a choice of one, while it is
    given, else those it keeps, [default_value] at first; a change calls
    [on_change] with them, and clearing calls [on_clear] too. An option whose id
    [disabled_keys] holds is disabled. The list opens while the search shows no
    option only by [allows_empty_collection]. *)
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
    ?allows_empty_collection:bool Solidtype.Check.value ->
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
