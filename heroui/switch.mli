(** HeroUI's Switch: Kobalte's [Switch.Root], its [Label] and its [Input], in
    HeroUI's anatomy, with HeroUI's classes from {!Styles.Switch} and the state
    its styles read -- selected, disabled, hovered, pressed, focus-visible --
    declared as React Aria writes it. Its props are named as HeroUI's
    documentation names them.

    {[
      <Switch default_selected=true>
        <Switch.Content>
          <Switch.Control><Switch.Thumb /></Switch.Control>
          <Label>"Wi-Fi"</Label>
        </Switch.Content>
      </Switch>
    ]}

    A part is used inside a [Switch]: elsewhere it raises [Invalid_argument] as
    it is made. *)

type switch
(** What a switch's parts read of it, which its parts are given. *)

module Context : sig
  module Provider : sig
    module Props : sig
      val check :
        value:switch Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Solidtype.Jsx.component
  end

  val use : unit -> switch option
end

(** The clickable label that holds the control and its {!Label}: Kobalte's
    [Switch.Label], the switch's input inside it.

    Raises [Invalid_argument] outside a [Switch]. *)
module Content : sig
  type state = {
    is_selected : bool Solidtype.Solid.accessor;
    is_hovered : bool Solidtype.Solid.accessor;
    is_pressed : bool Solidtype.Solid.accessor;
    is_focused : bool Solidtype.Solid.accessor;
    is_focus_visible : bool Solidtype.Solid.accessor;
    is_disabled : bool Solidtype.Solid.accessor;
    is_read_only : bool Solidtype.Solid.accessor;
    is_invalid : bool Solidtype.Solid.accessor;
    is_required : bool Solidtype.Solid.accessor;
  }
  (** What its children are drawn of, given as a function, as HeroUI's render
      props are, each read where Solid tracks it. *)

  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:
        ( state -> Solidtype.Jsx.element,
          [ `nodes | `render ] )
        Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Label.props -> state -> Solidtype.Jsx.element) ->
      ?props:t Solidtype.Solid.rest ->
      (unit -> unit) Solidtype.Html.Label.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The track the thumb moves along.

    Raises [Invalid_argument] outside a [Switch]. *)
module Control : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Span.props -> Solidtype.Jsx.element) ->
      ?props:t Solidtype.Solid.rest ->
      (unit -> unit) Solidtype.Html.Span.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The thumb.

    Raises [Invalid_argument] outside a [Switch]. *)
module Thumb : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?as_:(Solidtype.Html.Span.props -> Solidtype.Jsx.element) ->
      ?props:t Solidtype.Solid.rest ->
      (unit -> unit) Solidtype.Html.Span.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

type state = {
  is_selected : bool Solidtype.Solid.accessor;
  is_disabled : bool Solidtype.Solid.accessor;
  is_read_only : bool Solidtype.Solid.accessor;
  is_invalid : bool Solidtype.Solid.accessor;
  is_required : bool Solidtype.Solid.accessor;
}
(** What a switch's children are drawn of, given as a function, as HeroUI's
    render props are, each read where Solid tracks it. *)

module Props : sig
  type t

  val check :
    ?size:[ `lg | `md | `sm ] Solidtype.Check.value ->
    ?is_selected:bool Solidtype.Check.value ->
    ?default_selected:bool Solidtype.Check.value ->
    ?on_change:(bool -> unit) ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?is_invalid:bool Solidtype.Check.value ->
    ?is_read_only:bool Solidtype.Check.value ->
    ?is_required:bool Solidtype.Check.value ->
    ?name:string Solidtype.Check.value ->
    ?value:string Solidtype.Check.value ->
    ?aria_label:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?on_blur:(Dom.focusEvent -> unit) ->
    ?ref:(Dom.htmlDivElement -> unit) ->
    ?on_focus_out:(Dom.focusEvent -> unit) ->
    children:
      ( state -> Solidtype.Jsx.element,
        [ `nodes | `render ] )
      Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Div.props -> state -> Solidtype.Jsx.element) ->
    ?props:t Solidtype.Solid.rest ->
    (unit -> unit) Solidtype.Html.Div.check
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
