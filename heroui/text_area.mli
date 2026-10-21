(** HeroUI's TextArea: a [<textarea>], with HeroUI's classes from
    {!Styles.TextArea} and the state its styles read -- hovered, focused,
    focus-visible, disabled, invalid -- kept by {!Interaction} as React Aria
    keeps it. It takes every attribute a [<textarea>] takes, and passes them on
    to it. Inside a {!Text_field} it is Kobalte's [TextField.TextArea], which
    the field's value, state, label and description reach, and takes the field's
    variant where it sets none.

    {[
      <Text_area placeholder="Your message" aria_label="Message" />
    ]} *)

module Props : sig
  type t

  val check :
    ?variant:[ `primary | `secondary ] Solidtype.Check.value ->
    ?full_width:bool Solidtype.Check.value ->
    (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
    Solidtype.Html.Textarea.check
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
