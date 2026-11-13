(** HeroUI's Disclosure: a section that shows and hides its content, Kobalte's
    [Collapsible], with HeroUI's classes from {!Styles.Disclosure}. Its heading
    holds the button that expands and collapses it, and its content follows.

    {[
      <Disclosure default_expanded=true>
        <Disclosure.Heading>
          <Disclosure.Trigger>
            "Shipping"
            <Disclosure.Indicator />
          </Disclosure.Trigger>
        </Disclosure.Heading>
        <Disclosure.Content>
          <Disclosure.Body>"Orders ship within 2 business days."</Disclosure.Body>
        </Disclosure.Content>
      </Disclosure>
    ]}

    It is expanded while [is_expanded] says so where it is given, else as it is
    kept, [default_expanded] at first, and its trigger calls
    [on_expanded_change] with its new state. A {!Button} given [slot=`trigger]
    inside its heading is its trigger too, a button in HeroUI's look.

    Its content stays on the page while collapsed, hidden until the browser's
    find in page reaches a word in it, which expands it; it grows and shrinks by
    the height HeroUI's styles animate, [--disclosure-panel-height].

    Inside a {!Disclosure_group} it is expanded as the group holds its [id], and
    disabled while it or the group is.

    A part is used inside a [Disclosure]: elsewhere it raises [Invalid_argument]
    as it is made. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

(** The heading the trigger is in, an [<h3>]. *)
module Heading : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.H3.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.H3.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The button that expands and collapses the content: Kobalte's trigger, a
    [<button>]. *)
module Trigger : sig
  type state = {
    is_hovered : bool S.accessor;
    is_pressed : bool S.accessor;
    is_focused : bool S.accessor;
    is_focus_visible : bool S.accessor;
    is_disabled : bool S.accessor;
  }
  (** What the trigger's children are drawn of, given as a function, as HeroUI's
      render props are, each read where Solid tracks it. *)

  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?ref:(Dom.htmlButtonElement -> unit) ->
      children:
        (state -> Jsx.element, [ `nodes | `render ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Button.props -> state -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Button.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** HeroUI's chevron, which turns over while the disclosure is expanded. *)
module Indicator : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?as_:(Solidtype.Html.Svg.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Svg.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** What the disclosure shows and hides: Kobalte's content, a [<div>]. *)
module Content : sig
  type state = {
    is_focus_visible_within : bool S.accessor;
        (** Whether an element inside it has the focus, shown by a key. *)
  }
  (** What the content's children are drawn of, given as a function, as HeroUI's
      render props are, read where Solid tracks it. *)

  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?style:string Solidtype.Check.value ->
      ?ref:(Dom.htmlDivElement -> unit) ->
      children:
        (state -> Jsx.element, [ `nodes | `render ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> state -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The content's padding, a [<div>] around a [<div>] that takes [class_]. *)
module Body : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

type state = {
  is_expanded : bool S.accessor;
  is_focus_visible_within : bool S.accessor;
      (** Whether an element inside it has the focus, shown by a key. *)
  is_disabled : bool S.accessor;
}
(** What a disclosure's children are drawn of, given as a function, as HeroUI's
    render props are, each read where Solid tracks it. *)

module Props : sig
  type t

  val check :
    ?id:string Solidtype.Check.value ->
    ?is_expanded:bool Solidtype.Check.value ->
    ?default_expanded:bool Solidtype.Check.value ->
    ?on_expanded_change:(bool -> unit) ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?ref:(Dom.htmlDivElement -> unit) ->
    children:
      (state -> Jsx.element, [ `nodes | `render ]) Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Div.props -> state -> Jsx.element) ->
    ?props:t S.rest ->
    (unit -> unit) Solidtype.Html.Div.check
end

val make : Props.t -> Jsx.element
val component : Props.t Jsx.component
