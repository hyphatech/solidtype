(** HeroUI's Radio: Kobalte's [RadioGroup.Item], its [ItemLabel] and its
    [ItemInput], in HeroUI's anatomy, with HeroUI's classes from {!Styles.Radio}
    and the state its styles read -- selected, disabled, invalid, hovered,
    pressed, focus-visible -- declared as React Aria writes it. A {!Description}
    inside it, but outside its content, is the radio's, which its input is
    described by.

    {[
      <Radio value="pro">
        <Radio.Content>
          <Radio.Control><Radio.Indicator /></Radio.Control>
          "Pro"
        </Radio.Content>
        <Description>"Advanced reporting"</Description>
      </Radio>
    ]}

    A radio is used inside a {!Radio_group}, and a part inside a [Radio]:
    elsewhere each raises [Invalid_argument] as it is made. *)

type radio
(** What a radio's parts read of it. *)

module Context : sig
  module Provider : sig
    module Props : sig
      val check :
        value:radio Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Solidtype.Jsx.component
  end

  val use : unit -> radio option
end

(** The clickable label that holds the control and its text: Kobalte's
    [RadioGroup.ItemLabel], the radio's input inside it.

    Raises [Invalid_argument] outside a [Radio]. *)
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

(** The circle the indicator is drawn in.

    Raises [Invalid_argument] outside a [Radio]. *)
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

(** The dot, which HeroUI's styles draw as the radio is selected, or the
    children it is given, which may be a function of {!Content.state}.

    Raises [Invalid_argument] outside a [Radio]. *)
module Indicator : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?children:
        ( Content.state -> Solidtype.Jsx.element,
          [ `nodes | `render ] )
        Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Span.props -> Content.state -> Solidtype.Jsx.element) ->
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
(** What a radio's children are drawn of, given as a function, as HeroUI's
    render props are, each read where Solid tracks it. *)

module Props : sig
  type t

  val check :
    value:string Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?aria_label:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
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
