(** A command palette, as Kobalte would make one: a search whose text filters a
    menu of commands, made of {!Solidtype_kobalte.Selection}'s hooks, as React
    Aria's autocomplete filters its menu. Its {!Input} is an
    [<input type="search">], its {!List} a [<div role="menu">] of {!Item}s, each
    a [<div role="menuitem">], gathered in {!Group}s named by their {!Heading}
    and parted by {!Separator}s. It draws no style: each part is the element it
    names, its roles and state as attributes, and takes every attribute its
    element does -- a class, a style, a [ref], a handler -- which it passes on,
    a [ref] and a handler called beside its own.

    {[
      <Command.Root>
        <Command.Input aria_label="Search commands" />
        <Command.List on_action=(fun key -> run key)>
          <Command.Group>
            <Command.Heading>"Files"</Command.Heading>
            <Command.Item id="new-file">"Create new file..."</Command.Item>
          </Command.Group>
          <Command.Separator />
          <Command.Item id="theme">"Change theme"</Command.Item>
        </Command.List>
      </Command.Root>
    ]}

    The focus stays in the input. Down and Up move through the items shown, a
    disabled one passed over, wrapping at either end; Home and End reach the
    first and the last, Page Down and Page Up a list's height on. Typing shows
    the items whose text holds the search's and gives the first of them the
    focus; deleting leaves none focused. Enter or a press runs the item focused,
    and the pointer focuses the item it is over. Escape empties the search, and
    once it is empty is left to what is around the palette, a dialog that
    closes. An item focused is [data-highlighted], and a disabled one
    [aria-disabled] and [data-disabled], present and empty as Kobalte's state
    is; a group whose items are all hidden is hidden with them, and a separator
    that parts nothing is hidden. A list showing no item is [data-empty].

    A part is used inside a {!Root}, a {!Heading} inside a {!Group}: elsewhere
    it raises [Invalid_argument] as it is made. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

type translations = { suggestions : string; clear_search : string }
(** What the palette tells a reader, in its locale's words, React Aria's, else
    English: its list's name, and a clear button's. *)

val english : translations
(** React Aria's English: [Suggestions], [Clear search]. *)

val translations_for : string -> translations
(** React Aria's words for a locale, ["fr-FR"] or ["fr"], else English. *)

type state = {
  input_value : string S.accessor;  (** The search's text. *)
  set_input_value : string -> unit;
      (** Sets the search's text, as typing does. *)
  is_empty : bool S.accessor;  (** Whether the list shows no item. *)
  focused_key : string option S.accessor;
      (** The item focused, by its key, as the keys and the pointer move it. *)
  is_disabled : string -> bool;
      (** Whether the list disables an item, by its key. *)
  focus_input : unit -> unit;  (** Gives the search the focus. *)
  translations : translations S.accessor;
}
(** What a part inside a {!Root} reads of the palette, and a style's attribute
    on it. *)

module Context : sig
  val use : unit -> state
  (** The palette above; outside a {!Root} it raises [Invalid_argument]. *)
end

(** The palette, which draws no element. The search's text is [input_value]
    while it is given, else the text it keeps, [default_input_value] at first; a
    change calls [on_input_change]. An item is shown while [filter] keeps it,
    given its text and the search's, else while its text holds the search's,
    whatever their case or accents. Its words are [translations] where given,
    else its locale's. *)
module Root : sig
  module Props : sig
    type t

    val check :
      ?input_value:string Solidtype.Check.value ->
      ?default_input_value:string Solidtype.Check.value ->
      ?on_input_change:(string -> unit) ->
      ?filter:(string -> string -> bool) ->
      ?translations:translations Solidtype.Check.value ->
      children:(_, [ `elements ]) Solidtype.Check.children ->
      ?props:t S.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The search: an [<input type="search">] whose text is the palette's, which
    controls its list and names the item focused as its active descendant. *)
module Input : sig
  module Props : sig
    type t

    val check :
      ?as_:(Solidtype.Html.Input.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (unit -> unit) Solidtype.Html.Input.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The items: a [<div role="menu">] named by the palette's words,
    [Suggestions], unless it is given a name. A press on an item, or Enter while
    it is focused, calls the item's [on_action] and then this [on_action] with
    its key. An item whose key [disabled_keys] holds is disabled. While it shows
    no item it draws [render_empty_state]. *)
module List : sig
  module Props : sig
    type t

    val check :
      ?on_action:(string -> unit) ->
      ?disabled_keys:string array Solidtype.Check.value ->
      ?render_empty_state:(unit -> Jsx.element) ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `elements ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

type item = {
  key : string S.accessor;
  is_focused : bool S.accessor;
  is_disabled : bool S.accessor;
}
(** What a part inside an {!Item} reads of it, and a style's attribute on it. *)

(** A command: a [<div role="menuitem">], its key [id], else one it makes. It is
    shown while the palette's filter keeps its [text_value], else the text it
    draws; a press, or Enter while it is focused, calls [on_action]. It is
    disabled while [is_disabled]. *)
module Item : sig
  module Context : sig
    val use : unit -> item
    (** The item above; outside an {!Item} it raises [Invalid_argument]. *)
  end

  module Props : sig
    type t

    val check :
      ?id:string Solidtype.Check.value ->
      ?text_value:string Solidtype.Check.value ->
      ?is_disabled:bool Solidtype.Check.value ->
      ?on_action:(unit -> unit) ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `elements ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** Items that belong together: a [<section role="group">] named by its
    {!Heading}, shown while one of its items is. *)
module Group : sig
  module Props : sig
    type t

    val check :
      ?as_:(Solidtype.Html.Section.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `elements ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Section.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** A group's name: a [<header role="presentation">] the group is labelled by.
*)
module Heading : sig
  module Props : sig
    type t

    val check :
      ?as_:(Solidtype.Html.Header.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `elements ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Header.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** A line between items or groups: a [<div role="separator">], hidden while no
    item is shown before it, or none after it, or it follows another. *)
module Separator : sig
  module Props : sig
    type t

    val check :
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end
