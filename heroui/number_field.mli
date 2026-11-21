(** HeroUI's NumberField: Kobalte's [NumberField.Root], a field's [<div>], with
    HeroUI's classes from {!Styles.NumberField}, whose value is a number,
    controlled or its own, stepped by its buttons and by the arrow keys within
    its range, and the parts inside it as Kobalte's: its {!Label} names its
    input, its {!Description} describes it, and its {!Field_error} shows while
    it is invalid. It submits its value with a form by Kobalte's hidden input.

    Its page, with its examples:
    [$(opam var solidtype:doc)/pages/heroui/number-field.md].

    {[
      <Number_field default_value=1024. min_value=0. name="width">
        <Label>"Width"</Label>
        <Number_field.Group>
          <Number_field.Decrement_button />
          <Number_field.Input />
          <Number_field.Increment_button />
        </Number_field.Group>
      </Number_field>
    ]}

    A value is kept on the grid of a [step] it is given, counted from its
    minimum, and else within its range alone, as React Aria keeps it; its
    buttons and arrow keys step it by [step], else by 1, or by a hundredth for a
    percent.

    The wheel steps it so too while its input has the focus, as
    {!Solidtype_headless.Number_field} turns it, unless [is_wheel_disabled].

    Given no {!Label}, [aria_label] names its input, and its buttons
    ["Increase"] and ["Decrease"] followed by it, as React Aria's.

    [format_options], as HeroUI's [formatOptions], is Kobalte's: its input shows
    and reads its value so, a currency, a percent or a unit, and tells a reader
    the value as it shows it.

    A part is used inside a [Number_field]: elsewhere it raises
    [Invalid_argument] as it is made. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

type part = [ `root | `group | `input | `increment | `decrement ]

(** How a component built on a field draws it: each part's classes, in place of
    HeroUI's, and the name its [data-slot]s start with, in place of
    ["number-field"], given to every [Number_field] below. Under a look the
    input is [data-editing] while text is typed in it, until a key steps the
    value or the focus leaves. *)
module Look : sig
  type t = { classes : part -> string; slot : string }

  module Provider : sig
    module Props : sig
      val check :
        value:t Solidtype.Check.value ->
        ?children:('f, [ `elements ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Jsx.component
  end

  val use : unit -> t option
end

(** What a part a component adds reads of the field it is in. *)
module Shown : sig
  type t = {
    value : float S.accessor;
    format_options :
      Solidtype_kobalte.Types.NumberFormatOptions.t option S.accessor;
    disabled : bool S.accessor;
  }

  val use : string -> t
  (** [use part] is the field [part] is in; outside one it raises
      [Invalid_argument], naming [part]. *)
end

(** The input and its buttons, laid out together: a [<div role="group">]. *)
module Group : sig
  type state = {
    is_hovered : bool S.accessor;
    is_focus_within : bool S.accessor;
    is_focus_visible : bool S.accessor;
    is_disabled : bool S.accessor;
    is_invalid : bool S.accessor;
  }
  (** What its children are drawn of, given as a function, as HeroUI's render
      props are, each read where Solid tracks it. *)

  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:
        (state -> Jsx.element, [ `elements | `render ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> state -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The field's input, Kobalte's, which shows its value as it is formatted. *)
module Input : sig
  module Props : sig
    type t

    val check :
      ?placeholder:string Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?on_input:(Dom.inputEvent -> unit) ->
      ?on_key_down:(Dom.keyboardEvent -> unit) ->
      ?on_focus_out:(Dom.focusEvent -> unit) ->
      ?ref:(Dom.htmlInputElement -> unit) ->
      ?as_:(Solidtype.Html.Input.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Input.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The button that steps the value up: Kobalte's, drawing HeroUI's plus, or the
    children it is given. *)
module Increment_button : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?children:(_, [ `elements ]) Solidtype.Check.children ->
      ?ref:(Dom.htmlButtonElement -> unit) ->
      ?as_:(Solidtype.Html.Button.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Button.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The button that steps the value down: Kobalte's, drawing HeroUI's minus, or
    the children it is given. *)
module Decrement_button : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?children:(_, [ `elements ]) Solidtype.Check.children ->
      ?ref:(Dom.htmlButtonElement -> unit) ->
      ?as_:(Solidtype.Html.Button.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Button.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

type state = {
  is_disabled : bool S.accessor;
  is_invalid : bool S.accessor;
  is_read_only : bool S.accessor;
  is_required : bool S.accessor;
}
(** What its children are drawn of, given as a function, as HeroUI's render
    props are, each read where Solid tracks it. *)

module Props : sig
  type t

  val check :
    ?variant:[ `primary | `secondary ] Solidtype.Check.value ->
    ?full_width:bool Solidtype.Check.value ->
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
      (state -> Jsx.element, [ `elements | `render ]) Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Div.props -> state -> Jsx.element) ->
    ?props:t S.rest ->
    (unit -> unit) Solidtype.Html.Div.check
end

val make : Props.t -> Jsx.element
val component : Props.t Jsx.component
