(** HeroUI's Description: a field's helper text, with HeroUI's classes from
    {!Styles.Description}. It is a [<span>], unless a part above it gives it its
    element, as React Aria's do: inside a {!Radio_group}, a {!Radio} or a
    {!Text_field}, Kobalte's description, which the group, the radio's input or
    the field's input is described by.

    {[
      <Description>"Includes 100 messages per month"</Description>
    ]} *)

type slot =
  ((unit -> string) -> (unit -> Solidtype.Jsx.content) -> Solidtype.Jsx.element
  [@u])
(** How a description renders below a part: given its classes and its children,
    the element it is, which declares [data-slot="description"]. *)

(** The {!slot} a part gives the descriptions below it. *)
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
    ?props:t ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
