(** A rating, in HeroUI's look, which ships no stylesheet for it: Kobalte's
    [Rating], a radio group of items, each a star or the icon given, chosen by a
    press or the arrow keys, the items under the pointer previewed as it moves.
    Read only, its value may be a fraction, 3.7, the next item filled as far as
    the fraction goes. Its look is a stylesheet, [rating.css], in the
    [components] layer, rules for its classes.

    Its page, with its examples:
    [$(opam var solidtype:doc)/pages/heroui/rating.md].

    {[
      <Rating aria_label="Rating" default_value=3.>
        <Rating.Item value=1. /> <Rating.Item value=2. />
        <Rating.Item value=3. /> <Rating.Item value=4. />
        <Rating.Item value=5. />
      </Rating>
    ]}

    A part is used inside a [Rating]: elsewhere it raises [Invalid_argument] as
    it is made. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

type size = [ `sm | `md | `lg ]

(** An item: Kobalte's [Rating.Item], a
    [<div role="radio" class="rating__item">], [data-readonly], [data-pressed],
    [data-hovered] and [data-focus-visible] as its state is, around a
    [<span class="rating__icon">], [data-active] while it is at or under the
    value, or the value under the pointer. Its [value] is its place, from 1. *)
module Item : sig
  type state = {
    is_active : bool S.accessor;
    is_partial : bool S.accessor;
        (** Whether a fractional value fills it in part. *)
    partial_percent : float S.accessor;  (** How far, from 0 to 100. *)
  }
  (** What its children are drawn of. *)

  module Props : sig
    type t

    val check :
      value:float Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?children:
        (state -> Jsx.element, [ `elements | `render ]) Solidtype.Check.children ->
      ?ref:(Dom.htmlDivElement -> unit) ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  (** Elements given are its icon, in place of the rating's; a function draws
      the whole item of its state. *)

  val component : Props.t Jsx.component
end

module Props : sig
  type t

  val check :
    ?size:size Solidtype.Check.value ->
    ?value:float Solidtype.Check.value ->
    ?default_value:float Solidtype.Check.value ->
    ?on_value_change:(float -> unit) ->
    ?icon:Jsx.element Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?is_read_only:bool Solidtype.Check.value ->
    ?is_required:bool Solidtype.Check.value ->
    ?name:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?ref:(Dom.htmlDivElement -> unit) ->
    children:(_, [ `elements ]) Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
    ?props:t S.rest ->
    (unit -> unit) Solidtype.Html.Div.check
end

val make : Props.t -> Jsx.element
(** The rating: a [<div role="radiogroup" class="rating rating--md">], of
    [size], [`md] by default. Its value is [value] while it is given, else the
    one kept, [default_value] at first, [0.] for none; [on_value_change] is told
    each one chosen. [icon] is every item's icon, a star by default;
    [--rating-active-color] and [--rating-inactive-color] colour them. *)

val component : Props.t Jsx.component
