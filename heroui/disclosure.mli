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

    A part is used inside a [Disclosure]: elsewhere it raises [Invalid_argument]
    as it is made. *)

(** The heading the trigger is in, an [<h3>]. *)
module Heading : sig
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

(** The button that expands and collapses the content: Kobalte's trigger, a
    [<button>]. *)
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

(** HeroUI's chevron, which turns over while the disclosure is expanded. *)
module Indicator : sig
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

(** What the disclosure shows and hides: Kobalte's content, a [<div>]. *)
module Content : sig
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

(** The content's padding, a [<div>] around a [<div>] that takes [class_]. *)
module Body : sig
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

module Props : sig
  type t

  val check :
    ?is_expanded:bool Solidtype.Check.value ->
    ?default_expanded:bool Solidtype.Check.value ->
    ?on_expanded_change:(bool -> unit) ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
