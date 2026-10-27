(** HeroUI's Header: a [<header>], with HeroUI's classes from {!Styles.Header},
    that titles what follows it. Inside a {!Dropdown.Section} it is the
    section's label, which names it to a reader.

    {[
      <Dropdown.Section>
        <Header>"Actions"</Header>
        ...
      </Dropdown.Section>
    ]} *)

type slot =
  ((unit -> string) ->
   unit Solidtype.Solid.rest ->
   (unit -> Solidtype.Jsx.content) ->
   Solidtype.Jsx.element
  [@u])
(** How a part renders a header inside it: given the header's classes, the props
    it passes on, and its children. *)

(** The {!slot} a part gives the headers below it, as React Aria's HeaderContext
    does: a menu section's label. *)
module Slot : sig
  module Provider : sig
    module Props : sig
      val check :
        value:slot Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Solidtype.Jsx.component
  end

  val use : unit -> slot option
end

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
