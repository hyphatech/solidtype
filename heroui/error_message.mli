(** HeroUI's ErrorMessage: an error shown below a component that is not a form
    field, a {!Tag_group}'s, which the component is described by. It draws
    nothing outside one; a field's error is a {!Field_error}.

    {[
      <Error_message>
        (fun () -> if invalid () then "Pick at least one" else "")
      </Error_message>
    ]} *)

type slot =
  ((unit -> string) ->
   unit Solidtype.Solid.rest ->
   (unit -> Solidtype.Jsx.content) ->
   Solidtype.Jsx.element
  [@u])
(** How an error renders below a component: given its classes, the rest of its
    props -- its [data-] attributes -- and its children, the element it is,
    which declares [data-slot="error-message"]. *)

(** The {!slot} a component gives the errors below it. *)
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
    ?children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Span.props -> Solidtype.Jsx.element) ->
    ?props:t Solidtype.Solid.rest ->
    (unit -> unit) Solidtype.Html.Span.check
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
