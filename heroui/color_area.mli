(** HeroUI's ColorArea: Kobalte's [ColorArea.Root], a [<div role="group">] with
    HeroUI's classes from {!Styles.ColorArea}, a square whose gradient is two
    channels of a colour, [x_channel] across and [y_channel] up, which its
    {!Thumb} is pressed and dragged over, or stepped by the arrow keys, Page Up
    and Page Down, Home and End.

    {[
      <Color_area default_value=(Colors.parse_color "rgb(116, 52, 255)")>
        <Color_area.Thumb />
      </Color_area>
    ]}

    Its value is Kobalte's {!Solidtype_kobalte.Types.Color}, in its own space
    unless [color_space] names another; [on_change] is told each colour as it is
    dragged or stepped, and [on_change_end] the last. Its gradient is drawn by
    Kobalte's [ColorArea.Background], which fills it from inside. A part is used
    inside a [Color_area]: elsewhere it raises [Invalid_argument] as it is made.
*)

type channel =
  [ `hue
  | `saturation
  | `brightness
  | `lightness
  | `red
  | `green
  | `blue
  | `alpha ]

(** The point on the area that is its value, Kobalte's thumb, a [<span>] that
    takes focus, with its colour and the two inputs a reader and a form read:
    one per channel. It declares [data-focus-visible], [data-dragging] while it
    is dragged, and [data-disabled]. *)
module Thumb : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?style:string Solidtype.Check.value ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

module Props : sig
  type t

  val check :
    ?value:Solidtype_kobalte.Types.Color.t Solidtype.Check.value ->
    ?default_value:Solidtype_kobalte.Types.Color.t Solidtype.Check.value ->
    ?on_change:(Solidtype_kobalte.Types.Color.t -> unit) ->
    ?on_change_end:(Solidtype_kobalte.Types.Color.t -> unit) ->
    ?x_channel:channel Solidtype.Check.value ->
    ?y_channel:channel Solidtype.Check.value ->
    ?color_space:[ `rgb | `hsl | `hsb ] Solidtype.Check.value ->
    ?x_name:string Solidtype.Check.value ->
    ?y_name:string Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?show_dots:bool Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
