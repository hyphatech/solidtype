(** HeroUI's CloseButton: Kobalte's [Button.Root], a native [<button>] named
    "Close", with HeroUI's classes from {!Styles.CloseButton} and the state its
    styles read -- hovered, pressed, focused, focus-visible, disabled -- kept by
    {!Interaction} as React Aria keeps it. It draws HeroUI's cross, or the
    children it is given. Its props are named as HeroUI's documentation names
    them, but for [on_click], a click as Kobalte gives it, where HeroUI's is
    [onPress].

    {[
      <Close_button on_click=(fun _ -> close ()) />
    ]} *)

(** HeroUI's cross: the [<svg>] a close button draws where it is given no
    children, for a part that is a close button of its own. *)
module Icon : sig
  module Props : sig
    type t

    val check :
      ?as_:(Solidtype.Html.Svg.props -> Solidtype.Jsx.element) ->
      ?props:t Solidtype.Solid.rest ->
      (unit -> unit) Solidtype.Html.Svg.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

type state = {
  is_hovered : bool Solidtype.Solid.accessor;
  is_pressed : bool Solidtype.Solid.accessor;
  is_focused : bool Solidtype.Solid.accessor;
  is_focus_visible : bool Solidtype.Solid.accessor;
  is_disabled : bool Solidtype.Solid.accessor;
}
(** What a close button's children are drawn of, given as a function, as
    HeroUI's render props are, each read where Solid tracks it. A function draws
    the cross itself where it wants it, {!Icon}. *)

module Props : sig
  type t

  val check :
    ?variant:[ `default ] Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?aria_label:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?on_click:(Dom.mouseEvent -> unit) ->
    ?ref:(Dom.htmlButtonElement -> unit) ->
    ?children:
      ( state -> Solidtype.Jsx.element,
        [ `nodes | `render ] )
      Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Button.props -> state -> Solidtype.Jsx.element) ->
    ?props:t Solidtype.Solid.rest ->
    (unit -> unit) Solidtype.Html.Button.check
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
