(** HeroUI's ColorPicker: one colour shared by the colour components inside it,
    {!Solidtype_headless.Color_picker}, a trigger, and Kobalte's popover, with
    HeroUI's classes from {!Styles.ColorPicker}. Kobalte has no colour picker.

    {[
      <Color_picker default_value=(fun () -> Colors.parse_color "#0485F7")>
        <Color_picker.Trigger>
          <Color_swatch size=`lg /> <Label>"Pick a color"</Label>
        </Color_picker.Trigger>
        <Color_picker.Popover>
          <Color_area
            aria_label="Color area"
            class_="max-w-full"
            color_space=`hsb
            x_channel=`saturation
            y_channel=`brightness>
            <Color_area.Thumb />
          </Color_area>
          <Color_slider channel=`hue class_="gap-1 px-1" color_space=`hsb>
            <Label>"Hue"</Label>
            <Color_slider.Output class_="text-muted" />
            <Color_slider.Track><Color_slider.Thumb /></Color_slider.Track>
          </Color_slider>
        </Color_picker.Popover>
      </Color_picker>
    ]}

    A {!Color_area}, a {!Color_slider}, a {!Color_field}, a {!Color_swatch} and
    a {!Color_swatch_picker} inside it, in its trigger or its popover, given no
    value of their own, show its colour, and each change one of them makes moves
    it. A part's own value wins, and its own [on_change] is called too.

    The popover opens as its trigger is pressed, and takes the focus; Tab keeps
    the focus inside it, and the page outside is hidden from a reader while it
    is open, as React Aria's is. Escape, a press outside, or a reader's dismiss
    button closes it, and the focus goes back to its trigger. A {!Button} inside
    a picker is its trigger too, as in HeroUI; a button inside the popover is a
    button.

    It is drawn in a portal at the end of the page while it is open, and while
    HeroUI's exit animation plays after.

    A part is used inside a [Color_picker]: elsewhere it raises
    [Invalid_argument] as it is made. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

(** The button that opens the popover, Kobalte's trigger, pressed while it is
    open, and named by what is inside it. *)
module Trigger : sig
  type state = {
    is_hovered : bool S.accessor;
    is_pressed : bool S.accessor;
    is_focused : bool S.accessor;
    is_focus_visible : bool S.accessor;
    is_disabled : bool S.accessor;
  }
  (** What its children and [as_] are drawn of: React Aria's render props for
      it. *)

  module Props : sig
    type t

    val check :
      ?is_disabled:bool Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?ref:(Dom.htmlButtonElement -> unit) ->
      children:
        (state -> Jsx.element, [ `nodes | `render ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Button.props -> state -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Button.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

type placement = Overlay.placement
(** Where the popover sits beside its trigger, as React Aria names it. *)

(** The popover: Kobalte's content, a dialog its trigger names, [placement]
    beside its trigger, [`bottom_left] by default, [offset] pixels from it, 8 by
    default; on the other side where there is no room, unless [should_flip] is
    false. It is open while [is_open], else as it keeps, [default_open] at first
    and told to [on_open_change]. It gives what is inside it the [`default]
    variant of a {!Surface}. *)
module Popover : sig
  module Props : sig
    type t

    val check :
      ?is_open:bool Solidtype.Check.value ->
      ?default_open:bool Solidtype.Check.value ->
      ?on_open_change:(bool -> unit) ->
      ?placement:placement Solidtype.Check.value ->
      ?offset:float Solidtype.Check.value ->
      ?should_flip:bool Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?style:string Solidtype.Check.value ->
      ?ref:(Dom.htmlDivElement -> unit) ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The picker, a [<div>], its colour [value] while it is given one, else the
    one it keeps, [default_value] at first, else black; each change is told to
    [on_change]. *)
module Props : sig
  type t

  val check :
    ?value:Solidtype_kobalte.Types.Color.t Solidtype.Check.value ->
    ?default_value:Solidtype_kobalte.Types.Color.t Solidtype.Check.value ->
    ?on_change:(Solidtype_kobalte.Types.Color.t -> unit) ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
    ?props:t S.rest ->
    (unit -> unit) Solidtype.Html.Div.check
end

val make : Props.t -> Jsx.element
val component : Props.t Jsx.component
