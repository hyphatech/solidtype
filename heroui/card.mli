(** HeroUI's Card: a [<div>] and its parts, with HeroUI's classes from
    {!Styles.Card}. A card but a transparent one is a surface, which it gives
    what is inside it by {!Surface.Context}, as HeroUI's does.

    {[
      <Card class_="w-[400px]">
        <Card.Header>
          <Card.Title>"Become an Acme Creator!"</Card.Title>
          <Card.Description>"Sign up today."</Card.Description>
        </Card.Header>
        <Card.Footer>"Footer"</Card.Footer>
      </Card>
    ]}

    Kobalte has no card, and a card has no behaviour. A part's classes are the
    same in any card, so a part outside one has them too. *)

(** The title and description at a card's top: a [<div>]. *)
module Header : sig
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

(** A card's title: an [<h3>], given an [id] where the card is labelled by it.
*)
module Title : sig
  module Props : sig
    type t

    val check :
      ?id:string Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The text under a card's title: a [<p>]. *)
module Description : sig
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

(** A card's main content: a [<div>]. *)
module Content : sig
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

(** The actions at a card's foot: a [<div>]. *)
module Footer : sig
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
    ?variant:Surface.variant Solidtype.Check.value ->
    ?role:Solidtype.Html.Div.role Solidtype.Check.value ->
    ?aria_labelledby:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
