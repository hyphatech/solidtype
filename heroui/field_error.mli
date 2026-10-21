(** HeroUI's FieldError: a field's error, with HeroUI's class from
    {!Styles.FieldError}, which the field it is in -- a {!Text_field}, a
    {!Number_field} -- shows while it is invalid, as Kobalte's error message,
    and its input is described by.

    {[
      <Field_error>"Enter a valid email."</Field_error>
    ]}

    @raise Invalid_argument as it is made, outside a field. *)

type slot =
  ((unit -> string) -> (unit -> Solidtype.Jsx.content) -> Solidtype.Jsx.element
  [@u])
(** How an error renders in a field: given its classes and its children, the
    element it is, which declares [data-slot="field-error"]. *)

(** The {!slot} a field gives the errors inside it. *)
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
