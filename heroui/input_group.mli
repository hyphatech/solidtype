(** HeroUI's InputGroup: an {!Input} or a {!Text_area} with what goes before and
    after it, in a [<div role="group">], with HeroUI's classes from
    {!Styles.InputGroup}. A click on the group but on its input gives the input
    the focus. Inside a {!Text_field}, its input is the field's, which the
    field's label names, and it takes the field's variant where it sets none.

    {[
      <Input_group>
        <Input_group.Prefix>"https://"</Input_group.Prefix>
        <Input_group.Input aria_label="Site" placeholder="heroui" />
        <Input_group.Suffix>".com"</Input_group.Suffix>
      </Input_group>
    ]}

    Kobalte has no group; its input is Kobalte's inside a field, as {!Input}'s
    is. A part is used inside an [Input_group]: elsewhere it raises
    [Invalid_argument] as it is made. *)

(** What goes before the input: a [<div>]. *)
module Prefix : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** What goes after the input: a [<div>]. *)
module Suffix : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The group's input: an {!Input}, which takes every attribute an [<input>]
    takes. *)
module Input : sig
  module Props = Input.Props

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The group's text area: a {!Text_area}, which takes every attribute a
    [<textarea>] takes. *)
module Text_area : sig
  module Props = Text_area.Props

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

module Props : sig
  type t

  val check :
    ?variant:[ `primary | `secondary ] Solidtype.Check.value ->
    ?full_width:bool Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?is_invalid:bool Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
