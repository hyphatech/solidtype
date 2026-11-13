(** HeroUI's FieldError: a field's error, with HeroUI's class from
    {!Styles.FieldError}, which the field it is in -- a {!Text_field}, a
    {!Number_field} -- shows while it is invalid, as Kobalte's error message,
    and its input is described by.

    {[
      <Field_error>"Enter a valid email."</Field_error>
    ]}

    Raises [Invalid_argument] as it is made, outside a field. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

type slot =
  (unit -> string) -> unit S.rest -> (unit -> Jsx.content) -> Jsx.element
(** How an error renders in a field: given its classes, the rest of its props --
    its [data-] attributes -- and its children, the element it is, which
    declares [data-slot="field-error"]. *)

(** A server's error for the field, which the field gives the errors inside it:
    while it is [Some], an error shows it in place of its own children. *)
module Message : sig
  module Provider : sig
    module Props : sig
      val check :
        value:string option S.accessor Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Jsx.component
  end

  val use : unit -> string option S.accessor option
end

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

    val component : unit Jsx.component
  end

  val use : unit -> slot option
end

type state = {
  is_invalid : bool S.accessor;
      (** Whether its field is invalid, which it is wherever it shows. *)
  validation_errors : string array S.accessor;
      (** The errors a form gives the field, its server's. *)
}
(** What its children are drawn of, given as a function, as HeroUI's render
    props are: a function is called with the form's error where elements give
    way to it. *)

module Props : sig
  type t

  val check :
    ?class_:string Solidtype.Check.value ->
    ?children:
      (state -> Jsx.element, [ `nodes | `render ]) Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Span.props -> state -> Jsx.element) ->
    ?props:t S.rest ->
    (unit -> unit) Solidtype.Html.Span.check
end

val make : Props.t -> Jsx.element
val component : Props.t Jsx.component
