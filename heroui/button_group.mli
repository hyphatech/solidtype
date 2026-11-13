(** HeroUI's ButtonGroup: a [<div role="group">] of {!Button}s, with HeroUI's
    classes from {!Styles.ButtonGroup}, which round the first and the last and
    none between. It gives the buttons inside it its [variant], [size],
    [is_disabled] and [full_width], each where the button sets none itself. A
    {!Separator} inside a button, but the first, draws a line before it.

    {[
      <Button_group variant=`tertiary>
        <Button>"Copy"</Button>
        <Button><Button_group.Separator /> "Paste"</Button>
      </Button_group>
    ]}

    Kobalte has no group, and a group has no behaviour: it is an element and the
    context its buttons read. Every button inside it reads that context, not
    only its own children as in React, until a component that holds buttons of
    its own -- a dialog, a dropdown -- gives them a context of their own. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

type group = {
  variant :
    [ `primary
    | `secondary
    | `tertiary
    | `outline
    | `ghost
    | `danger
    | `danger_soft ]
    option
    S.accessor;
  size : [ `sm | `md | `lg ] option S.accessor;
  is_disabled : bool option S.accessor;
  full_width : bool option S.accessor;
}
(** What a group gives its buttons: each prop it was given, or [None]. *)

module Context : sig
  module Provider : sig
    module Props : sig
      val check :
        value:group Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Jsx.component
  end

  val use : unit -> group option
end

(** The line before a button in a group, which HeroUI's styles draw at its start
    edge. *)
module Separator : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
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
    ?variant:
      [ `primary
      | `secondary
      | `tertiary
      | `outline
      | `ghost
      | `danger
      | `danger_soft ]
      Solidtype.Check.value ->
    ?size:[ `sm | `md | `lg ] Solidtype.Check.value ->
    ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
    ?full_width:bool Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
    ?props:t S.rest ->
    (unit -> unit) Solidtype.Html.Div.check
end

val make : Props.t -> Jsx.element
val component : Props.t Jsx.component
