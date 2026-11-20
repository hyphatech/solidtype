(** A number stepper, in HeroUI's look, which ships no stylesheet for it: a
    {!Number_field} drawn as a pill of two round buttons around its value, which
    rolls to each new number. Its value, range, step, format, form and keys are
    the field's.

    Its page, with its examples:
    [$(opam var solidtype:doc)/pages/heroui/number-stepper.md].

    {[
      <Number_stepper aria_label="Quantity" default_value=1. min_value=0.>
        <Number_stepper.Group>
          <Number_stepper.Decrement_button />
          <Number_stepper.Value />
          <Number_stepper.Increment_button />
        </Number_stepper.Group>
      </Number_stepper>
    ]}

    Its {!Group} draws the field's input after its children, out of sight, in
    the page's order: the keys step the value from it, and while text is typed
    in it, it is shown in the value's place. Its buttons are the field's, out of
    the page's order. Its look is a stylesheet, [number-stepper.css], in the
    [components] layer, rules for its classes.

    A part is used inside a [Number_stepper]: elsewhere it raises
    [Invalid_argument] as it is made. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

type size = [ `sm | `md | `lg ]

(** The buttons and the value, laid out together: the field's
    {!Number_field.Group}, its input drawn after its children. *)
module Group : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:
        ( Number_field.Group.state -> Jsx.element,
          [ `elements | `render ] )
        Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> Number_field.Group.state -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

module Increment_button = Number_field.Increment_button
(** The button that steps the value up, the field's: a plus, or the children it
    is given. *)

module Decrement_button = Number_field.Decrement_button
(** The button that steps the value down, the field's: a minus, or the children
    it is given. *)

(** The value as it is formatted, a reel per digit that rolls to each new one
    the way the number moved, up as it rises and down as it falls, a digit that
    appears coming in so, hidden from a reader, who reads the field's input.
    [value] and [format] show another number or format than the field's;
    children draw it themselves, given what it would show. *)
module Value : sig
  type shown = {
    value : float;
    format_options : Solidtype_kobalte.Types.NumberFormatOptions.t option;
  }

  module Props : sig
    type t

    val check :
      ?value:float Solidtype.Check.value ->
      ?format:
        Solidtype_kobalte.Types.NumberFormatOptions.t Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?children:
        (shown -> Jsx.element, [ `elements | `render ]) Solidtype.Check.children ->
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
    ?size:size Solidtype.Check.value ->
    ?value:float Solidtype.Check.value ->
    ?default_value:float Solidtype.Check.value ->
    ?on_change:(float -> unit) ->
    ?min_value:float Solidtype.Check.value ->
    ?max_value:float Solidtype.Check.value ->
    ?step:float Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?is_invalid:bool Solidtype.Check.value ->
    ?is_read_only:bool Solidtype.Check.value ->
    ?is_wheel_disabled:bool Solidtype.Check.value ->
    ?is_required:bool Solidtype.Check.value ->
    ?name:string Solidtype.Check.value ->
    ?aria_label:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?format_options:
      Solidtype_kobalte.Types.NumberFormatOptions.t Solidtype.Check.value ->
    ?on_blur:(Dom.focusEvent -> unit) ->
    ?on_focus_out:(Dom.focusEvent -> unit) ->
    ?ref:(Dom.htmlDivElement -> unit) ->
    children:
      ( Number_field.state -> Jsx.element,
        [ `elements | `render ] )
      Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Div.props -> Number_field.state -> Jsx.element) ->
    ?props:t S.rest ->
    (unit -> unit) Solidtype.Html.Div.check
end

val make : Props.t -> Jsx.element
val component : Props.t Jsx.component
