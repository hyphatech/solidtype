(** A group of tags, as Kobalte would make one: a list of Kobalte's made of
    {!Solidtype_kobalte.Selection}'s hooks, a [<div role="grid">] of tags, each
    a [<div role="row">] around one [<div role="gridcell">], chosen as the
    group's [selection_mode] says and removed by their {!Remove_button} or the
    keys. It draws no style: each part is the element it names, its roles and
    state as attributes, and takes every attribute its element does -- a class,
    a style, a [ref], a handler -- which it passes on, a [ref] and a handler
    called beside its own.

    {[
      <Tag_group.Root
        selection_mode=`multiple
        on_remove=(fun keys -> remove keys)>
        <Tag_group.Label>"Categories"</Tag_group.Label>
        <Tag_group.List>
          <Tag_group.Tag id="news">
            "News" <Tag_group.Remove_button>"x"</Tag_group.Remove_button>
          </Tag_group.Tag>
        </Tag_group.List>
        <Tag_group.Description>"Pick any"</Tag_group.Description>
      </Tag_group.Root>
    ]}

    Tab reaches the tag last focused, or the first chosen, or the first, and
    then the remove button inside it, and leaves the group after it. The arrows
    move from tag to tag, a disabled one passed over, wrapping at either end:
    Right and Down to the next, Left and Up to the one before, Left and Right as
    the page's direction reads them; Home and End reach the first and the last,
    and typing the start of a tag's name the next tag of that name. A press,
    Space or Enter chooses a tag; Escape clears what is chosen. Delete and
    Backspace remove the focused tag, or every chosen tag where it is chosen,
    and focus moves to the tag after it, or before it at the end, or to the list
    once none is left. A chosen tag is [aria-selected] and [data-selected], and
    a disabled one [aria-disabled] and [data-disabled], present and empty as
    Kobalte's state is.

    A part is used inside the part above it: elsewhere it raises
    [Invalid_argument] as it is made. *)

type tag = {
  key : unit -> string;
  is_selected : unit -> bool;
  is_disabled : unit -> bool;
  allows_removing : unit -> bool;
}
(** What a part inside a {!Tag} reads of it, and a style's attribute on it. *)

val use_tag_context : unit -> tag
(** The tag above, read by a part inside it, or by a style's attribute on it,
    which Solid reads inside the tag; outside a {!Tag} it raises
    [Invalid_argument]. *)

type group_state = {
  selection_mode : unit -> [ `none | `single | `multiple ];
  is_selected : string -> bool;
  is_disabled : string -> bool;
  allows_removing : unit -> bool;
  is_empty : unit -> bool;
}
(** What a part inside a {!Root} reads of the group, by a tag's key: whether the
    tag is chosen, or disabled by the group, whether its tags can be removed,
    and whether its list holds none. *)

val use_context : unit -> group_state
(** The group above; outside a {!Root} it raises [Invalid_argument]. *)

(** The group. Its tags are chosen as [selection_mode] says, [`none] by default:
    the keys chosen are [selected_keys] while it is given them, else those it
    keeps, [default_selected_keys] at first, and each change calls
    [on_selection_change] with them. A tag whose key [disabled_keys] holds is
    disabled, and every tag while [is_disabled]. Given [on_remove], its tags can
    be removed: it is called with the keys to remove, which the caller then
    takes off the page. Its list is named by [aria_label] or [aria_labelledby],
    else by its {!Label}, and described by its {!Description} and
    {!Error_message}. *)
module Root : sig
  module Props : sig
    type t

    val check :
      ?selection_mode:[ `none | `single | `multiple ] Solidtype.Check.value ->
      ?selected_keys:string array Solidtype.Check.value ->
      ?default_selected_keys:string array Solidtype.Check.value ->
      ?on_selection_change:(string array -> unit) ->
      ?disabled_keys:string array Solidtype.Check.value ->
      ?is_disabled:bool Solidtype.Check.value ->
      ?on_remove:(string array -> unit) ->
      ?aria_label:string Solidtype.Check.value ->
      ?aria_labelledby:string Solidtype.Check.value ->
      ?aria_describedby:string Solidtype.Check.value ->
      ?as_:(Solidtype.Html.Div.props -> Solidtype.Jsx.element) ->
      ?props:'spread Solidtype.Solid.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Div.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The group's name, a [<span>] its list is labelled by. *)
module Label : sig
  module Props : sig
    type t

    val check :
      ?as_:(Solidtype.Html.Span.props -> Solidtype.Jsx.element) ->
      ?props:'spread Solidtype.Solid.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Span.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The tags: a [<div role="grid">], [aria-multiselectable] while many can be
    chosen, or a [<div role="group">] while it holds none, then [data-empty] and
    drawing [render_empty_state] in their place. While the focus is inside it,
    it tells a reader each tag added, [aria-live]. *)
module List : sig
  module Props : sig
    type t

    val check :
      ?render_empty_state:(unit -> Solidtype.Jsx.element) ->
      ?as_:(Solidtype.Html.Div.props -> Solidtype.Jsx.element) ->
      ?props:'spread Solidtype.Solid.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Div.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** A tag, of its key [id], unique to the render where it is not given; disabled
    while [is_disabled]. A reader is told its [text_value], else the first text
    among its children, and, where it can be removed, how to remove it. It joins
    the group once it is on the page, ordered as the page has it. Its [ref] is
    its row's. *)
module Tag : sig
  module Props : sig
    type t

    val check :
      ?id:string Solidtype.Check.value ->
      ?text_value:string Solidtype.Check.value ->
      ?is_disabled:bool Solidtype.Check.value ->
      ?as_:(Solidtype.Html.Div.props -> Solidtype.Jsx.element) ->
      ?props:'spread Solidtype.Solid.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Div.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** What removes its tag: a [<button>] named "Remove" and by its tag, which
    calls the group's [on_remove] with its tag's key, disabled with its tag. *)
module Remove_button : sig
  module Props : sig
    type t

    val check :
      ?as_:(Solidtype.Html.Button.props -> Solidtype.Jsx.element) ->
      ?props:'spread Solidtype.Solid.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Button.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The group's description, a [<span>] its list is described by. *)
module Description : sig
  module Props : sig
    type t

    val check :
      ?as_:(Solidtype.Html.Span.props -> Solidtype.Jsx.element) ->
      ?props:'spread Solidtype.Solid.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Span.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The group's error, a [<span>] its list is described by after its
    {!Description}. *)
module Error_message : sig
  module Props : sig
    type t

    val check :
      ?as_:(Solidtype.Html.Span.props -> Solidtype.Jsx.element) ->
      ?props:'spread Solidtype.Solid.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Span.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end
