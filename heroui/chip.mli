(** HeroUI's Chip: a short label for a status, a category or a choice, with
    HeroUI's classes from {!Styles.Chip}. Text it is given is its label's, as
    HeroUI's own wraps a string or a number.

    {[
      <Chip color=`success variant=`soft>"Shipped"</Chip>
    ]} *)

(** A chip's text, which a chip given text makes itself. *)
module Label : sig
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

module Props : sig
  type t

  val check :
    ?color:
      [ `accent | `danger | `default | `success | `warning ]
      Solidtype.Check.value ->
    ?size:[ `lg | `md | `sm ] Solidtype.Check.value ->
    ?variant:[ `primary | `secondary | `soft | `tertiary ] Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
