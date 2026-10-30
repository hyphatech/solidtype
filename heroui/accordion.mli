(** HeroUI's Accordion: a stack of sections, each a heading whose trigger
    expands and collapses its panel, Kobalte's [Accordion], with HeroUI's
    classes from {!Styles.Accordion}.

    {[
      <Accordion>
        <Accordion.Item id="shipping">
          <Accordion.Heading>
            <Accordion.Trigger>
              "Shipping"
              <Accordion.Indicator />
            </Accordion.Trigger>
          </Accordion.Heading>
          <Accordion.Panel>
            <Accordion.Body>"Orders ship within 2 business days."</Accordion.Body>
          </Accordion.Panel>
        </Accordion.Item>
      </Accordion>
    ]}

    The items expanded are those whose ids [expanded_keys] holds where it is
    given, else those it keeps, [default_expanded_keys] at first: one at a time,
    or several where [allows_multiple_expanded]. A trigger pressed calls
    [on_expanded_change] with the ids expanded after it, then its item's
    [on_expanded_change] with the item's new state. An item without an [id] is
    given one. A {!Button} given [slot=`trigger] inside a heading is its item's
    trigger too, a button in HeroUI's look.

    The up and down arrows move focus from one trigger to the next, round from
    the last to the first, and Home and End to the first and the last, as
    Kobalte's accordion does; Tab moves on as it does elsewhere.

    A panel stays on the page while collapsed, hidden until the browser's find
    in page reaches a word in it, which expands its item; it grows and shrinks
    by the height HeroUI's styles animate, as a {!Disclosure}'s content does.

    [variant=`surface] lays the accordion on a surface, which the components
    inside read as a {!Surface}'s; [hide_separator] leaves out the line between
    items. An item is disabled while it or the accordion is.

    A part is used inside an [Accordion], and a part of an item inside an
    [Accordion.Item]: elsewhere it raises [Invalid_argument] as it is made. *)

(** One section: Kobalte's item, a [<div>]. *)
module Item : sig
  module Props : sig
    type t

    val check :
      ?id:string Solidtype.Check.value ->
      ?is_disabled:bool Solidtype.Check.value ->
      ?on_expanded_change:(bool -> unit) ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The heading an item's trigger is in: Kobalte's header, an [<h3>]. *)
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

(** The button that expands and collapses its item's panel: Kobalte's trigger, a
    [<button>]. It is disabled while its item is, or while [is_disabled] holds,
    and the arrows then pass it by. [on_press] is called as it is pressed, by a
    pointer, Enter or Space, after its item's state has changed. *)
module Trigger : sig
  module Props : sig
    type t

    val check :
      ?on_press:(unit -> unit) ->
      ?is_disabled:bool Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** HeroUI's chevron, which turns over while its item is expanded; or the icon
    it is given, in a [<span>] that takes HeroUI's classes and turns over in its
    place. *)
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

(** What an item shows and hides: Kobalte's content, a [<div>]. *)
module Panel : sig
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

(** The panel's padding, a [<div>] around a [<div>] that takes [class_]. *)
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
    ?expanded_keys:string array Solidtype.Check.value ->
    ?default_expanded_keys:string array Solidtype.Check.value ->
    ?on_expanded_change:(string array -> unit) ->
    ?allows_multiple_expanded:bool Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?variant:[ `default | `surface ] Solidtype.Check.value ->
    ?hide_separator:bool Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
