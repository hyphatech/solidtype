(** HeroUI's Dropdown: Kobalte's [DropdownMenu], a menu of actions or of options
    that opens from a trigger, with HeroUI's classes from {!Styles.Dropdown},
    {!Styles.MenuItem} and {!Styles.MenuSection}.

    {[
      <Dropdown>
        <Button aria_label="Menu" variant=`secondary>"Actions"</Button>
        <Dropdown.Popover>
          <Dropdown.Menu on_action=(fun key -> act key)>
            <Dropdown.Item id="new-file" text_value="New file">
              <Label>"New file"</Label>
            </Dropdown.Item>
            <Dropdown.Item id="delete-file" text_value="Delete file"
              variant=`danger>
              <Label>"Delete file"</Label>
            </Dropdown.Item>
          </Dropdown.Menu>
        </Dropdown.Popover>
      </Dropdown>
    ]}

    A {!Button} inside a dropdown is its trigger, as in HeroUI, and shows
    pressed while the menu is open; so is a {!Trigger}, around anything else. A
    press on the trigger opens the menu, as do Enter, Space and the arrows; with
    [trigger=`long_press] only a press held half a second does, or Alt and an
    arrow, and the trigger is described so to a reader, as React Aria's is.

    The menu gives the focus to its selected item as it opens, else to itself,
    and the arrows move it between the items, as typing an item's text does. An
    item chosen -- pressed, or Enter or Space on it -- calls the menu's
    [on_action] with its [id] and closes the menu, but in a selection of many,
    which a press or Space keeps open, as React Aria's does. Escape or a press
    outside closes it, and the focus goes back to its trigger.

    The menu is Kobalte's menu, which is its {!Popover} itself, where React
    Aria's popover is a dialog around its menu: a reader is told the same menu
    and items, and HeroUI's styles read the same classes and attributes.

    A part is used inside a [Dropdown], an indicator inside a {!Item}: elsewhere
    it raises [Invalid_argument] as it is made. *)

type selection_mode = [ `none | `single | `multiple ]
(** How a menu or a section selects its items: not at all, one at most, or many.
*)

(** A trigger of anything that is not a {!Button}: Kobalte's trigger, a
    [<button>]. *)
module Trigger : sig
  module Props : sig
    type t

    val check :
      ?aria_label:string Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The menu's popover: drawn in a portal at the end of the page while it is
    open, and while HeroUI's exit animation plays after, [placement] beside its
    trigger, [bottom] by default. Inside a {!Submenu_trigger}, the submenu's,
    beside its item. *)
module Popover : sig
  module Props : sig
    type t

    val check :
      ?placement:[ `top | `bottom | `left | `right ] Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The menu's items. [selection_mode] is read as it is made. Its
    [selected_keys] are the selected items' ids while it is given, else those it
    keeps, [default_selected_keys] at first; a change calls
    [on_selection_change] with them. An item whose id [disabled_keys] holds is
    disabled. Choosing an item calls [on_action] with its id. Its separators are
    [<div>]s, as React Aria's menu's are. *)
module Menu : sig
  module Props : sig
    type t

    val check :
      ?selection_mode:selection_mode Solidtype.Check.value ->
      ?selected_keys:string array Solidtype.Check.value ->
      ?default_selected_keys:string array Solidtype.Check.value ->
      ?on_selection_change:(string array -> unit) ->
      ?disabled_keys:string array Solidtype.Check.value ->
      ?on_action:(string -> unit) ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** A group of items: Kobalte's group, a [<section>] its {!Header} names. With a
    [selection_mode], its items are a selection of their own, as the {!Menu}'s
    props say, else they are the menu's. *)
module Section : sig
  module Props : sig
    type t

    val check :
      ?selection_mode:[ `single | `multiple ] Solidtype.Check.value ->
      ?selected_keys:string array Solidtype.Check.value ->
      ?default_selected_keys:string array Solidtype.Check.value ->
      ?on_selection_change:(string array -> unit) ->
      ?disabled_keys:string array Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** An item, known by its [id], typed to by its [text_value]: Kobalte's item, a
    [menuitem]; in a selection of one a [menuitemradio], of many a
    [menuitemcheckbox], checked while it is selected; and the trigger of its
    submenu inside a {!Submenu_trigger}. A {!Description} inside it describes
    it. *)
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

(** What shows its item selected: HeroUI's check, drawn in as it is selected, or
    its dot; or what [children] draws, given a read of whether its item is
    selected, as HeroUI's render function is given [isSelected]. *)
module Item_indicator : sig
  module Props : sig
    type t

    val check :
      ?type_:[ `checkmark | `dot ] Solidtype.Check.value ->
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

(** HeroUI's chevron, or the [children] it is given, on an item that opens a
    submenu, and nothing on any other. *)
module Submenu_indicator : sig
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

(** An {!Item} and the {!Popover} of the submenu it opens: Kobalte's submenu,
    opened by a hover, a press, or the arrow toward it, and closed by the arrow
    back. *)
module Submenu_trigger : sig
  module Props : sig
    type t

    val check :
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

module Props : sig
  type t

  val check :
    ?is_open:bool Solidtype.Check.value ->
    ?default_open:bool Solidtype.Check.value ->
    ?on_open_change:(bool -> unit) ->
    ?trigger:[ `press | `long_press ] Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
