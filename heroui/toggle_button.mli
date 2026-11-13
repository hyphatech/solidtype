(** HeroUI's ToggleButton: a button pressed on or off, Kobalte's toggle button,
    with HeroUI's classes from {!Styles.ToggleButton}.
    {[
      <Toggle_button variant=`ghost>"Like"</Toggle_button>
    ]}
    Alone, it is selected while [is_selected] says so where it is given, else as
    it is kept, [default_selected] at first, and a press calls [on_change] with
    its new state. Inside a {!Toggle_button_group} it is the group's button of
    its [id], selected as the group holds it; its own [is_selected],
    [default_selected] and [on_change] are not read there. It shows the state
    HeroUI's styles read, [data-selected] and the hover, press and focus React
    Aria shows, and draws its children of that state where they are a function
    of it. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

type state = {
  is_hovered : bool S.accessor;
  is_pressed : bool S.accessor;
  is_focused : bool S.accessor;
  is_focus_visible : bool S.accessor;
  is_disabled : bool S.accessor;
  is_selected : bool S.accessor;
}
(** What a toggle button's children are drawn of, given as a function, as
    HeroUI's render props are, each read where Solid tracks it. *)

module Props : sig
  type t

  val check :
    ?variant:[ `default | `ghost ] Solidtype.Check.value ->
    ?size:Toggle_button_group.size Solidtype.Check.value ->
    ?is_icon_only:bool Solidtype.Check.value ->
    ?id:string Solidtype.Check.value ->
    ?is_selected:bool Solidtype.Check.value ->
    ?default_selected:bool Solidtype.Check.value ->
    ?on_change:(bool -> unit) ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?on_click:(Dom.mouseEvent -> unit) ->
    ?ref:(Dom.htmlButtonElement -> unit) ->
    ?aria_label:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:
      (state -> Jsx.element, [ `nodes | `render ]) Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Button.props -> state -> Jsx.element) ->
    ?props:t S.rest ->
    (unit -> unit) Solidtype.Html.Button.check
end

val make : Props.t -> Jsx.element
(** Raises [Invalid_argument] as it is made inside a {!Toggle_button_group} with
    no [id]. *)

val component : Props.t Jsx.component
