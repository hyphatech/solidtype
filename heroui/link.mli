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
      ?props:t Solidtype.Solid.rest ->
      (unit -> unit) Solidtype.Html.Span.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

type state = {
  is_current : bool Solidtype.Solid.accessor;
      (** Whether it is the page's current link, as its [aria_current] says. *)
  is_hovered : bool Solidtype.Solid.accessor;
  is_pressed : bool Solidtype.Solid.accessor;
  is_focused : bool Solidtype.Solid.accessor;
  is_focus_visible : bool Solidtype.Solid.accessor;
  is_disabled : bool Solidtype.Solid.accessor;
}
(** What a link's children are drawn of, given as a function, as HeroUI's render
    props are, each read where Solid tracks it. *)

module Props : sig
  type t

  val check :
    href:string Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?ref:(Dom.htmlAnchorElement -> unit) ->
    ?aria_current:string Solidtype.Check.value ->
    children:
      ( state -> Solidtype.Jsx.element,
        [ `nodes | `render ] )
      Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    (unit -> unit) Solidtype.Html.A.check
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
