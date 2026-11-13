(** HeroUI's Tag, one of a {!Tag_group}'s, with HeroUI's classes from
    {!Styles.Tag} in its group's size and variant, and the state its styles read
    -- selected, disabled, hovered, pressed, focused, focus-visible.

    {[
      <Tag id="news">"News"</Tag>
    ]}

    Its key is [id], unique to the render where it is not given. A reader is
    told its [text_value], else the first text among its children. While its
    group is given [on_remove], it draws a {!Remove_button} after its children,
    unless they draw one of their own or are a function. It is hovered and
    pressed only while it can be chosen. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

(** What removes its tag: HeroUI's close button, named "Remove tag", drawing
    HeroUI's cross or its children. *)
module Remove_button : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?ref:(Dom.htmlButtonElement -> unit) ->
      ?children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Button.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Button.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

type state = {
  is_hovered : bool S.accessor;
  is_pressed : bool S.accessor;
  is_selected : bool S.accessor;
  is_focused : bool S.accessor;
  is_focus_visible : bool S.accessor;
  is_disabled : bool S.accessor;
  allows_removing : bool S.accessor;
}
(** What a tag's children are drawn of, given as a function, as HeroUI's render
    props are, each read where Solid tracks it: [allows_removing] while its
    group is given [on_remove]. *)

module Props : sig
  type t

  val check :
    ?id:string Solidtype.Check.value ->
    ?text_value:string Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?ref:(Dom.htmlDivElement -> unit) ->
    children:
      (state -> Jsx.element, [ `nodes | `render ]) Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Div.props -> state -> Jsx.element) ->
    ?props:t S.rest ->
    (unit -> unit) Solidtype.Html.Div.check
end

val make : Props.t -> Jsx.element
val component : Props.t Jsx.component
