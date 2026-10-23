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
    ?props:'spread Solidtype.Solid.rest ->
    (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
    Solidtype.Html.Textarea.check

  val class_ : t -> string option
  (** The class it is given, which a part that renders it adds after its own. *)
end

val text_area :
  classes:(variant:[ `primary | `secondary ] option -> string) ->
  slot:string ->
  Props.t ->
  Solidtype.Jsx.element
(** [text_area ~classes ~slot props], this part as another part renders it with
    its own classes, given the variant it takes, and its own [data-slot]: an
    input group's. *)

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
