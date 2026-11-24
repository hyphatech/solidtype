(** HeroUI's Toolbar: the headless {!Solidtype_headless.Toolbar}, with HeroUI's
    classes from {!Styles.Toolbar}. Its arrow keys move between its controls; a
    {!Separator} inside it runs across it, and a {!Toggle_button_group} along
    it, where either gives no orientation of its own.

    Its page, with its examples:
    [$(opam var solidtype:doc)/pages/heroui/toolbar.md].

    {[
      <Toolbar aria_label="Text formatting">
        <Toggle_button_group aria_label="Text style" selection_mode=`multiple>
          ...
        </Toggle_button_group>
        <Separator />
        <Button_group variant=`tertiary>...</Button_group>
      </Toolbar>
    ]} *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

type state = Solidtype_headless.Toolbar.state = {
  orientation : [ `horizontal | `vertical ] S.accessor;
}
(** What its children are drawn of, given as a function, as HeroUI's render
    props are. *)

module Props : sig
  type t

  val check :
    ?is_attached:bool Solidtype.Check.value ->
    ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
    ?aria_label:string Solidtype.Check.value ->
    ?aria_labelledby:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?ref:(Dom.htmlDivElement -> unit) ->
    children:
      (state -> Jsx.element, [ `elements | `render ]) Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Div.props -> state -> Jsx.element) ->
    ?props:t S.rest ->
    (unit -> unit) Solidtype.Html.Div.check
end

val make : Props.t -> Jsx.element
(** The toolbar, its [is_attached] look a surface fully rounded. *)

val component : Props.t Jsx.component
