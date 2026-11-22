(** Command: a command palette in HeroUI's look, a search that filters a menu of
    commands in a dialog, on {!Solidtype_headless.Command} and Kobalte's
    [Dialog]; its look is [command.css]'s, in the components layer.

    Its page, with its examples:
    [$(opam var solidtype:doc)/pages/heroui/command.md].

    {[
      <Command>
        <Button variant=`outline>"Open Command Palette"</Button>
        <Command.Backdrop>
          <Command.Container>
            <Command.Dialog>
              <Command.Input_group>
                <Command.Input_group.Prefix>
                  <Magnifier />
                </Command.Input_group.Prefix>
                <Command.Input_group.Input
                  placeholder="Type a command or search..." />
                <Command.Input_group.Clear_button />
              </Command.Input_group>
              <Command.List on_action=(fun key -> run key)>
                <Command.Group heading="Actions">
                  <Command.Item id="new-file">"Create new file..."</Command.Item>
                </Command.Group>
              </Command.List>
            </Command.Dialog>
          </Command.Container>
        </Command.Backdrop>
      </Command>
    ]}

    A {!Button} inside a palette is its trigger, and shows pressed while the
    palette is open. The search takes the focus as the palette opens and keeps
    it: Down and Up move through the items shown, wrapping at either end, Home
    and End reach the first and the last, and Enter runs the item focused, as a
    press does; the pointer focuses the item it is over. Typing shows the items
    whose text holds the search's and focuses the first. Escape empties the
    search, and once it is empty closes the palette, as a press on the backdrop
    does, unless the backdrop says otherwise; the focus goes back to what had
    it. A palette stays open as an item runs: its [on_action] closes it where it
    should.

    A {!Backdrop} with no palette around it is a palette of its own, open as its
    [is_open] says. It is drawn in a portal at the end of the page while it is
    open, and while its exit animation plays after.

    A part but the backdrop is used inside a [Command.Backdrop], and a part of
    the search or the list inside a {!Dialog}: elsewhere it raises
    [Invalid_argument] as it is made. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

(** What a part inside a {!Dialog} reads of the palette: the search's text and
    how to set it, the item focused, whether the list shows none. *)
module Context : sig
  val use : unit -> Solidtype_headless.Command.state
  (** The palette above; outside a {!Dialog} it raises [Invalid_argument]. *)
end

(** What covers the page while the palette is open: a [<div>], [opaque] by
    default. A press on it closes the palette while [is_dismissable], and Escape
    in an empty search while not [is_keyboard_dismiss_disabled]. With no palette
    around it, [is_open], [default_open] and [on_open_change] are its own. It is
    drawn at the end of the page's body, or inside [portal_container] while that
    is given. *)
module Backdrop : sig
  module Props : sig
    type t

    val check :
      ?variant:[ `opaque | `blur | `transparent ] Solidtype.Check.value ->
      ?is_dismissable:bool Solidtype.Check.value ->
      ?is_keyboard_dismiss_disabled:bool Solidtype.Check.value ->
      ?is_open:bool Solidtype.Check.value ->
      ?default_open:bool Solidtype.Check.value ->
      ?on_open_change:(bool -> unit) ->
      ?portal_container:_ Dom.element_like Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?style:string Solidtype.Check.value ->
      ?ref:(Dom.htmlDivElement -> unit) ->
      children:
        ( Dialog_frame.overlay_state -> Jsx.element,
          [ `elements | `render ] )
        Solidtype.Check.children ->
      ?as_:
        (Solidtype.Html.Div.props -> Dialog_frame.overlay_state -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** Where the palette is placed: a [<div>] that holds it near the top of the
    page, its [size] [`md] by default. *)
module Container : sig
  module Props : sig
    type t

    val check :
      ?size:[ `sm | `md | `lg ] Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?ref:(Dom.htmlDivElement -> unit) ->
      children:
        ( Dialog_frame.overlay_state -> Jsx.element,
          [ `elements | `render ] )
        Solidtype.Check.children ->
      ?as_:
        (Solidtype.Html.Div.props -> Dialog_frame.overlay_state -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The palette: a dialog, a [<section>] named [Command palette] unless it is
    given a name, which grows and shrinks with what it shows. Its search's text
    is [input_value] while it is given, else the text it keeps,
    [default_input_value] at first; a change calls [on_input_change]. An item is
    shown while [filter] keeps it, given its text and the search's, else while
    its text holds the search's, whatever their case or accents. *)
module Dialog : sig
  module Props : sig
    type t

    val check :
      ?aria_label:string Solidtype.Check.value ->
      ?input_value:string Solidtype.Check.value ->
      ?default_input_value:string Solidtype.Check.value ->
      ?on_input_change:(string -> unit) ->
      ?filter:(string -> string -> bool) ->
      ?class_:string Solidtype.Check.value ->
      ?ref:(Dom.htmlElement -> unit) ->
      ?on_focus_out:(Dom.focusEvent -> unit) ->
      children:
        ( Dialog_frame.dialog_state -> Jsx.element,
          [ `elements | `render ] )
        Solidtype.Check.children ->
      ?as_:
        (Solidtype.Html.Section.props ->
        Dialog_frame.dialog_state ->
        Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Section.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** What sits above the search, a breadcrumb or tabs: a [<div>]. *)
module Header : sig
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

(** The search's row: a [<div>] of its {!Input_group.Prefix},
    {!Input_group.Input}, {!Input_group.Clear_button} and {!Input_group.Suffix},
    [data-empty] while the search is. Its input takes the focus as the palette
    opens, while [auto_focus], the default. *)
module Input_group : sig
  (** What leads the search, its icon: a [<div>]. *)
  module Prefix : sig
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

  (** The search: an [<input type="search">] named [Search commands] unless it
      is given a name, its [placeholder] [Search commands...] unless it is given
      one. *)
  module Input : sig
    module Props : sig
      type t

      val check :
        ?placeholder:string Solidtype.Check.value ->
        ?aria_label:string Solidtype.Check.value ->
        ?class_:string Solidtype.Check.value ->
        ?ref:(Dom.htmlInputElement -> unit) ->
        ?as_:(Solidtype.Html.Input.props -> Jsx.element) ->
        ?props:t S.rest ->
        (unit -> unit) Solidtype.Html.Input.check
    end

    val make : Props.t -> Jsx.element
    val component : Props.t Jsx.component
  end

  (** HeroUI's close button, named [Clear search] in the reader's language,
      which empties the search and gives it the focus back; hidden while the
      search is empty, and passed by Tab. *)
  module Clear_button : sig
    module Props : sig
      type t

      val check :
        ?class_:string Solidtype.Check.value ->
        ?on_click:(Dom.mouseEvent -> unit) ->
        ?as_:(Solidtype.Html.Button.props -> Jsx.element) ->
        ?props:t S.rest ->
        (unit -> unit) Solidtype.Html.Button.check
    end

    val make : Props.t -> Jsx.element
    val component : Props.t Jsx.component
  end

  (** What ends the search, a key's hint: a [<div>]. *)
  module Suffix : sig
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

  module Props : sig
    type t

    val check :
      ?auto_focus:bool Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `elements ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The commands: a [<div role="menu">] that scrolls. A press on an item, or
    Enter while it is focused, calls the item's [on_action] and then this
    [on_action] with its key. An item whose key [disabled_keys] holds is
    disabled. While it shows no item it draws [render_empty_state], centred. *)
module List : sig
  module Props : sig
    type t

    val check :
      ?on_action:(string -> unit) ->
      ?disabled_keys:string array Solidtype.Check.value ->
      ?render_empty_state:(unit -> Jsx.element) ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `elements ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** Commands that belong together under a [heading]: a [<section>], shown while
    one of its items is. *)
module Group : sig
  module Props : sig
    type t

    val check :
      ?heading:Jsx.element Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `elements ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Section.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Section.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** A command: a [<div role="menuitem">] of an icon, a label and a shortcut's
    hint, its key [id], else one it makes. It is shown while the palette's
    filter keeps its [text_value], else the text it draws; a press, or Enter
    while it is focused, calls [on_action]. It is disabled while [is_disabled].
*)
module Item : sig
  module Props : sig
    type t

    val check :
      ?id:string Solidtype.Check.value ->
      ?text_value:string Solidtype.Check.value ->
      ?is_disabled:bool Solidtype.Check.value ->
      ?on_action:(unit -> unit) ->
      ?class_:string Solidtype.Check.value ->
      ?ref:(Dom.htmlDivElement -> unit) ->
      children:(_, [ `elements ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** A line between groups: a [<div role="separator">], hidden while it parts
    nothing shown. *)
module Separator : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** What sits below the list, the keys' hints: a [<div>]. *)
module Footer : sig
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

(** The palette's root, open while [is_open] while it is given, else as its
    trigger and its parts open and close it, [default_open] at first; a change
    calls [on_open_change]. *)
module Props : sig
  type t

  val check :
    ?is_open:bool Solidtype.Check.value ->
    ?default_open:bool Solidtype.Check.value ->
    ?on_open_change:(bool -> unit) ->
    children:(_, [ `elements ]) Solidtype.Check.children ->
    ?props:t S.rest ->
    unit ->
    unit
end

val make : Props.t -> Jsx.element
val component : Props.t Jsx.component
