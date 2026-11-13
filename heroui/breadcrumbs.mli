(** HeroUI's Breadcrumbs: the trail of pages to the one shown, each a link but
    the last, which is the page itself, on Kobalte's [Breadcrumbs], with
    HeroUI's classes from {!Styles.Breadcrumbs}.

    {[
      <Breadcrumbs>
        <Breadcrumbs.Item href="/">"Home"</Breadcrumbs.Item>
        <Breadcrumbs.Item href="/docs">"Docs"</Breadcrumbs.Item>
        <Breadcrumbs.Item>"Breadcrumbs"</Breadcrumbs.Item>
      </Breadcrumbs>
    ]}

    The last item is the current page: its link is marked [aria-current="page"],
    is disabled, and has no separator after it. A link pressed calls [on_action]
    with its item's [id]; an item without one tells nothing. A link is also
    disabled while its item or the trail is, and then has no [href], as
    Kobalte's has none.

    It is Kobalte's [<nav>], named "Breadcrumbs" for a reader, as the pattern
    for breadcrumbs asks, around HeroUI's [<ol>]. Each item joins the trail as
    it is made, and the trail draws them in the order they joined, as React
    Aria's collection does, so the last is known on the server too and a
    prerendered page marks it. An item added later, by a [For], is drawn after
    those already there, and the page moves to it if it is last.

    An item is drawn by its trail, so a context given between the trail and an
    item does not reach the item's children.

    An item is used inside a [Breadcrumbs]: elsewhere it raises
    [Invalid_argument] as it is made. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

(** One page of the trail: an [<li>] holding its link, Kobalte's, and HeroUI's
    chevron after it, or the trail's [separator]. *)
module Item : sig
  type state = { is_current : bool S.accessor; is_disabled : bool S.accessor }
  (** What its children are drawn of, given as a function, as HeroUI's render
      props are, each read where Solid tracks it. *)

  module Props : sig
    type t

    val check :
      ?id:string Solidtype.Check.value ->
      ?href:string Solidtype.Check.value ->
      ?is_disabled:bool Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:
        (state -> Jsx.element, [ `nodes | `render ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Li.props -> state -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Li.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The trail. [separator] is drawn between items in place of HeroUI's chevron,
    inside a [<span>] that takes HeroUI's separator class and is hidden from a
    reader: HeroUI gives an element of the user's its class, which a Solid
    component cannot do to an element already made. *)
module Props : sig
  type t

  val check :
    ?separator:Jsx.element Solidtype.Check.value ->
    ?on_action:(string -> unit) ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Ol.props -> Jsx.element) ->
    ?props:t S.rest ->
    (unit -> unit) Solidtype.Html.Ol.check
end

val make : Props.t -> Jsx.element
val component : Props.t Jsx.component
