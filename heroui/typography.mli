(** HeroUI's Typography: text in HeroUI's type scale, with HeroUI's classes from
    {!Styles.Typography}, each type the element it means -- a heading's [<h1>]
    to [<h6>], body text a [<p>], code a [<code>] -- unless it is given another,
    by [element_type], as React Aria's [Text] is.

    {[
      <Typography type_=`h2>"Pricing on your terms"</Typography>
    ]}

    Text has no behaviour, so no Kobalte component underlies it. *)

type type_ =
  [ `body | `body_sm | `body_xs | `code | `h1 | `h2 | `h3 | `h4 | `h5 | `h6 ]

type align = [ `start | `center | `end_ | `justify ]
type color = [ `default | `muted ]
type weight = [ `normal | `medium | `semibold | `bold ]

(** A heading of a [level] from 1 to 6, as [type_] [`h1] to [`h6] is.

    Raises [Invalid_argument] as it is made, for a level outside 1 to 6. *)
module Heading : sig
  module Props : sig
    type t

    val check :
      ?level:int Solidtype.Check.value ->
      ?align:align Solidtype.Check.value ->
      ?color:color Solidtype.Check.value ->
      ?weight:weight Solidtype.Check.value ->
      ?truncate:bool Solidtype.Check.value ->
      ?element_type:string Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** Body text of a [size], as [type_] [`body], [`body_sm] and [`body_xs] are. *)
module Paragraph : sig
  module Props : sig
    type t

    val check :
      ?size:[ `base | `sm | `xs ] Solidtype.Check.value ->
      ?align:align Solidtype.Check.value ->
      ?color:color Solidtype.Check.value ->
      ?weight:weight Solidtype.Check.value ->
      ?truncate:bool Solidtype.Check.value ->
      ?element_type:string Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** Inline code, as [type_] [`code] is. *)
module Code : sig
  module Props : sig
    type t

    val check :
      ?align:align Solidtype.Check.value ->
      ?color:color Solidtype.Check.value ->
      ?weight:weight Solidtype.Check.value ->
      ?truncate:bool Solidtype.Check.value ->
      ?element_type:string Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** A [<div>] that styles the markup it holds -- headings, paragraphs, code --
    in HeroUI's type scale, for content written as HTML. *)
module Prose : sig
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
    ?type_:type_ Solidtype.Check.value ->
    ?align:align Solidtype.Check.value ->
    ?color:color Solidtype.Check.value ->
    ?weight:weight Solidtype.Check.value ->
    ?truncate:bool Solidtype.Check.value ->
    ?element_type:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
