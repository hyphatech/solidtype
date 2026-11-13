(** HeroUI's Badge: a count or a status over the content it marks, with HeroUI's
    classes from {!Styles.Badge}. Text it is given is its label's, as HeroUI's
    own wraps a string or a number; with nothing, it is a dot.

    {[
      <Badge.Anchor>
        <img src=avatar alt="" />
        <Badge color=`danger size=`sm>"5"</Badge>
      </Badge.Anchor>
    ]} *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

(** What a badge is placed over, its first child the content it marks. *)
module Anchor : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Span.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Span.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** A badge's text, which a badge given text makes itself. *)
module Label : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Span.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Span.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

module Props : sig
  type t

  val check :
    ?color:
      [ `accent | `danger | `default | `success | `warning ]
      Solidtype.Check.value ->
    ?placement:
      [ `bottom_left | `bottom_right | `top_left | `top_right ]
      Solidtype.Check.value ->
    ?size:[ `lg | `md | `sm ] Solidtype.Check.value ->
    ?variant:[ `primary | `secondary | `soft ] Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Span.props -> Jsx.element) ->
    ?props:t S.rest ->
    (unit -> unit) Solidtype.Html.Span.check
end

val make : Props.t -> Jsx.element
val component : Props.t Jsx.component
