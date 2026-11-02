(** HeroUI's ColorField: a field of a colour, its classes from
    {!Styles.ColorField} and its group's from {!Styles.ColorInputGroup}, on
    Kobalte's. Without a [channel] it is Kobalte's [ColorField], a hex text:
    what is typed is read as a colour as it is committed, by leaving the input
    or Enter, and shown back as its hex, or put back where it is none; with one,
    Kobalte's [ColorChannelField], the channel's number, stepped by the arrow
    keys, as the colour formats it. The parts inside it are Kobalte's: its
    {!Label} names its input, its {!Description} describes it, and its
    {!Field_error} shows while it is invalid.

    {[
      <Color_field name="color" default_value=(fun () -> Colors.parse_color "#0485F7")>
        <Label>"Color"</Label>
        <Color_field.Group>
          <Color_field.Prefix>
            <Color_swatch color=(fun () -> c) size=`xs />
          </Color_field.Prefix>
          <Color_field.Input />
        </Color_field.Group>
      </Color_field>
    ]}

    A part is used inside a [Color_field]: elsewhere it raises
    [Invalid_argument] as it is made. *)

type channel =
  [ `hue
  | `saturation
  | `brightness
  | `lightness
  | `red
  | `green
  | `blue
  | `alpha ]

(** The input and what is beside it, laid out together, in HeroUI's [variant],
    [`primary] by default, or [`secondary] on a surface. It declares
    [data-hovered], [data-focus-within], [data-focus-visible], [data-disabled]
    and [data-invalid]. *)
module Group : sig
  module Props : sig
    type t

    val check :
      ?variant:[ `primary | `secondary ] Solidtype.Check.value ->
      ?full_width:bool Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The field's input, Kobalte's, its [placeholder] shown while it is empty. It
    declares [data-hovered], [data-focused], [data-focus-visible],
    [data-disabled] and [data-invalid]. *)
module Input : sig
  module Props : sig
    type t

    val check :
      ?placeholder:string Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** What is before the input, a [<div>]: a swatch of the colour, say. *)
module Prefix : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** What is after the input, a [<div>]: a unit, say. *)
module Suffix : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The field, Kobalte's root. Its colour is [value] while it is given one --
    null for none -- else the one it keeps, [default_value] at first; each
    colour committed, or none, calls [on_change]. [channel], fixed as it is
    made, makes it a field of the channel of the colour in [color_space], the
    colour's own by default. It is [is_required], [is_invalid], [is_disabled] or
    [is_read_only] as it says, and invalid too while a form's error names it;
    [name] sends it with a form, the hex or the channel's value; [on_blur] is
    called as focus leaves it. It declares [data-channel], its channel's name or
    [hex], [data-required], [data-invalid], [data-disabled] and [data-readonly].
*)

module Props : sig
  type t

  val check :
    ?value:Solidtype_kobalte.Types.Color.t Js.Nullable.t Solidtype.Check.value ->
    ?default_value:Solidtype_kobalte.Types.Color.t Solidtype.Check.value ->
    ?on_change:(Solidtype_kobalte.Types.Color.t option -> unit) ->
    ?channel:channel Solidtype.Check.value ->
    ?color_space:[ `rgb | `hsl | `hsb ] Solidtype.Check.value ->
    ?full_width:bool Solidtype.Check.value ->
    ?is_required:bool Solidtype.Check.value ->
    ?is_invalid:bool Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?is_read_only:bool Solidtype.Check.value ->
    ?is_wheel_disabled:bool Solidtype.Check.value ->
    ?name:string Solidtype.Check.value ->
    ?aria_label:string Solidtype.Check.value ->
    ?on_blur:(Dom.focusEvent -> unit) ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
