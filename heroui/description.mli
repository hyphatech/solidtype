(** HeroUI's Description: a field's helper text, with HeroUI's classes from
    {!Styles.Description}. It is a [<span>], unless a part above it gives it its
    element, as React Aria's do: inside a {!Radio_group}, a {!Radio} or a
    {!Text_field}, Kobalte's description, which the group, the radio's input or
    the field's input is described by.

    {[
      <Description>"Includes 100 messages per month"</Description>
    ]} *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

type slot =
  (unit -> string) -> unit S.rest -> (unit -> Jsx.content) -> Jsx.element
(** How a description renders below a part: given its classes, the rest of its
    props -- its [data-] attributes -- and its children, the element it is,
    which declares [data-slot="description"]. *)

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

    val component : unit Jsx.component
  end

  val use : unit -> slot option
end

module Props : sig
  type t

  val check :
    ?id:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Span.props -> Jsx.element) ->
    ?props:t S.rest ->
    (unit -> unit) Solidtype.Html.Span.check
end

val make : Props.t -> Jsx.element
val component : Props.t Jsx.component
