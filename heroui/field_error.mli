(** HeroUI's FieldError: Kobalte's [TextField.ErrorMessage], with HeroUI's class
    from {!Styles.FieldError}, which a {!Text_field} shows while it is invalid
    and its input is described by.

    {[
      <Field_error>"Enter a valid email."</Field_error>
    ]}

    @raise Invalid_argument as it is made, outside a {!Text_field}. *)

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
