(** HeroUI's Input: an [<input>], with HeroUI's classes from {!Styles.Input} and
    the state its styles read -- hovered, focused, focus-visible, disabled,
    invalid -- kept by {!Interaction} as React Aria keeps it. It takes every
    attribute an [<input>] takes, and passes them on to it. Inside a
    {!Text_field} it is Kobalte's [TextField.Input], which the field's value,
    state, label and description reach, and takes the field's variant where it
    sets none.

    {[
      <Input placeholder="Name" aria_label="Name" />
    ]} *)

module Props : sig
  type t

  val check :
    ?variant:[ `primary | `secondary ] Solidtype.Check.value ->
    ?full_width:bool Solidtype.Check.value ->
    (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
    Solidtype.Html.Input.check
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
