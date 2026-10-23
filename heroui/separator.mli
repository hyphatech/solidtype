(** HeroUI's Separator: Kobalte's [Separator.Root], a line between content, with
    HeroUI's classes from {!Styles.Separator.classes}.

    {[
      <Separator orientation=`vertical variant=`secondary />
    ]} *)

module Props : sig
  type t

  val check :
    ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
    ?variant:[ `default | `secondary | `tertiary ] Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
