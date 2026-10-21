(** HeroUI's Link: Kobalte's [Link.Root], an anchor, with HeroUI's classes from
    {!Styles.Link} and the state its styles read, kept by {!Interaction} as
    React Aria keeps it. It is disabled as [is_disabled] says, else as the
    {!Fieldset} it is in is.

    {[
      <Link href="https://heroui.com">"HeroUI" <Link.Icon /></Link>
    ]} *)

(** The icon after a link's text: HeroUI's arrow, or the children it is given.
*)
module Icon : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

module Props : sig
  type t

  val check :
    href:string Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
