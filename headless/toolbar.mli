(** A toolbar, as React Aria's: a [<div role="toolbar">] around controls, which
    the arrow keys of its [orientation] move between, the page's direction read
    for the horizontal ones, never past either end. Tab takes the focus out of
    it, and coming back gives it to the control that had it. Inside another
    toolbar it is a [group], whose keys are the outer one's, as a toggle group
    in a toolbar is.

    {[
      <Toolbar aria_label="Text formatting">
        <button>"Bold"</button> <button>"Italic"</button>
      </Toolbar>
    ]} *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

type state = { orientation : [ `horizontal | `vertical ] S.accessor }
(** What its children are drawn of, given as a function. *)

module Props : sig
  type t

  val check :
    ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
    ?aria_label:string Solidtype.Check.value ->
    ?aria_labelledby:string Solidtype.Check.value ->
    ?ref:(Dom.htmlDivElement -> unit) ->
    ?on_key_down:(Dom.keyboardEvent -> unit) ->
    children:
      (state -> Jsx.element, [ `elements | `render ]) Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Div.props -> state -> Jsx.element) ->
    ?props:t S.rest ->
    (unit -> unit) Solidtype.Html.Div.check
end

val make : Props.t -> Jsx.element
val component : Props.t Jsx.component
