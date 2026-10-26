(** HeroUI's Pagination: a [<nav>] of the pages an application lays out, each a
    button on Kobalte's [Button], with HeroUI's classes from
    {!Styles.Pagination}.

    {[
      <Pagination>
        <Pagination.Content>
          <Pagination.Item>
            <Pagination.Previous on_press=back>
              <Pagination.Previous_icon /> <span>"Previous"</span>
            </Pagination.Previous>
          </Pagination.Item>
          <Pagination.Item>
            <Pagination.Link is_active=true on_press=first>"1"</Pagination.Link>
          </Pagination.Item>
          <Pagination.Item>
            <Pagination.Next on_press=forward>
              <span>"Next"</span> <Pagination.Next_icon />
            </Pagination.Next>
          </Pagination.Item>
        </Pagination.Content>
      </Pagination>
    ]}

    It keeps no page of its own, as HeroUI's keeps none: which pages show, which
    is active and what a press does are the application's. Kobalte's
    [Pagination] keeps the page and draws its own items, which is not HeroUI's
    usage, so the parts are HeroUI's elements and its buttons Kobalte's.

    A part is used inside a [Pagination]: elsewhere it raises [Invalid_argument]
    as it is made. *)

(** What the pages are of, "Showing 1-10 of 120": a [<div>] whose direction
    follows its own text. *)
module Summary : sig
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

(** The list of items: a [<ul>]. *)
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

(** One item: an [<li>] holding a link, Previous, Next or an ellipsis. *)
module Item : sig
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

(** A page: Kobalte's button, [aria-current="page"] while [is_active].
    [on_press] is called as it is pressed, by a pointer, Enter or Space. *)
module Link : sig
  module Props : sig
    type t

    val check :
      ?is_active:bool Solidtype.Check.value ->
      ?is_disabled:bool Solidtype.Check.value ->
      ?on_press:(unit -> unit) ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The button to the page before: Kobalte's button, its children an icon and a
    label. *)
module Previous : sig
  module Props : sig
    type t

    val check :
      ?is_disabled:bool Solidtype.Check.value ->
      ?on_press:(unit -> unit) ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The button to the page after, as {!Previous}. *)
module Next : sig
  module Props : sig
    type t

    val check :
      ?is_disabled:bool Solidtype.Check.value ->
      ?on_press:(unit -> unit) ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** HeroUI's chevron to the left, or the icon it is given, in a [<span>] hidden
    from a reader. *)
module Previous_icon : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** HeroUI's chevron to the right, or the icon it is given, as {!Previous_icon}.
*)
module Next_icon : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** Pages left out: "…", hidden from a reader. *)
module Ellipsis : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
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
    ?size:[ `sm | `md | `lg ] Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
