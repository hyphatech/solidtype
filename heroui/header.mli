(** HeroUI's Header: a [<header>], with HeroUI's classes from {!Styles.Header},
    that titles what follows it. Inside a {!Dropdown.Section} it is the
    section's label, which names it to a reader.

    {[
      <Dropdown.Section>
        <Header>"Actions"</Header>
        ...
      </Dropdown.Section>
    ]} *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

type slot =
  (unit -> string) -> unit S.rest -> (unit -> Jsx.content) -> Jsx.element
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

    val component : unit Jsx.component
  end

  val use : unit -> slot option
end

module Props : sig
  type t

  val check :
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Header.props -> Jsx.element) ->
    ?props:t S.rest ->
    (unit -> unit) Solidtype.Html.Header.check
end

val make : Props.t -> Jsx.element
val component : Props.t Jsx.component
