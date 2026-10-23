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
    ?props:'spread Solidtype.Solid.rest ->
    (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
    Solidtype.Html.Input.check

  val class_ : t -> string option
  (** The class it is given, which a part that renders it adds after its own. *)
end

val input :
  classes:(variant:[ `primary | `secondary ] option -> string) ->
  slot:string ->
  Props.t ->
  Solidtype.Jsx.element
(** [input ~classes ~slot props], this part as another part renders it with its
    own classes, given the variant it takes, and its own [data-slot]: an input
    group's. *)

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
