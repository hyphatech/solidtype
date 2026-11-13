(** HeroUI's ColorSlider on Kobalte's: a slider of one channel of a colour, its
    track drawn as the channel's range, over a checkerboard where the colour is
    less than opaque, and its thumb painted the colour. Kobalte's slider's role
    and keys: the arrows step the channel, Page Up and Page Down by more, Home
    and End to its ends.

    {[
      <Color_slider
        channel=`hue
        default_value=(fun () -> Colors.parse_color "hsl(0, 100%, 50%)")>
        <Label>"Hue"</Label>
        <Color_slider.Output />
        <Color_slider.Track><Color_slider.Thumb /></Color_slider.Track>
      </Color_slider>
    ]}

    A {!Label} inside it is Kobalte's, which names it and its thumb. A part is
    used inside a [Color_slider]: elsewhere it raises [Invalid_argument] as it
    is made. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

type channel =
  [ `hue
  | `saturation
  | `brightness
  | `lightness
  | `red
  | `green
  | `blue
  | `alpha ]

(** The channel's value, an [<output>] for the thumb, as the colour formats it:
    [0°] for a hue, [50%] for a saturation; its [children] in its place. *)
module Output : sig
  type state = {
    orientation : [ `horizontal | `vertical ] S.accessor;
    is_disabled : bool S.accessor;
  }
  (** What its children are drawn of, given as a function, as HeroUI's render
      props are, each read where Solid tracks it. *)

  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?children:
        (state -> Jsx.element, [ `nodes | `render ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Output.props -> state -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Output.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The track, drawn as the channel's range from its least to its most, over a
    checkerboard; [--track-start-color] and [--track-end-color] the two ends,
    which HeroUI's styles cap it with. [style] after its own. *)
module Track : sig
  type state = {
    orientation : [ `horizontal | `vertical ] S.accessor;
    is_disabled : bool S.accessor;
    is_hovered : bool S.accessor;
  }
  (** What its children are drawn of, given as a function, as HeroUI's render
      props are, each read where Solid tracks it. *)

  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?style:string Solidtype.Check.value ->
      ?ref:(Dom.htmlDivElement -> unit) ->
      children:
        (state -> Jsx.element, [ `nodes | `render ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> state -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The thumb, Kobalte's, painted the colour, but for a disabled slider's; its
    input inside it. It declares [data-hovered], [data-focus-visible],
    [data-dragging] and [data-disabled]. [style] after its own. *)
module Thumb : sig
  type state = {
    color : Solidtype_kobalte.Types.Color.t S.accessor;
    is_dragging : bool S.accessor;
    is_hovered : bool S.accessor;
    is_focused : bool S.accessor;
    is_focus_visible : bool S.accessor;
    is_disabled : bool S.accessor;
  }
  (** What its children are drawn of, given as a function, as HeroUI's render
      props are, each read where Solid tracks it. *)

  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?style:string Solidtype.Check.value ->
      ?ref:(Dom.htmlSpanElement -> unit) ->
      ?children:
        (state -> Jsx.element, [ `nodes | `render ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Span.props -> state -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Span.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The slider, Kobalte's root, of the colour's [channel] in its [color_space],
    the colour's own by default; where the channel is not in the space asked --
    red in HSL, hue in RGB -- in the space it is in, as HeroUI corrects it. Its
    colour is [value] while it is given one, else the one it keeps,
    [default_value] at first; each change calls [on_change], and the end of a
    drag or a key [on_change_end]. [is_disabled], or its fieldset, disables it;
    [name] sends the channel's value with a form; [on_blur] is called as focus
    leaves it. It declares [data-orientation] and [data-disabled]. *)

type state = {
  orientation : [ `horizontal | `vertical ] S.accessor;
  is_disabled : bool S.accessor;
}
(** What its children are drawn of, given as a function, as HeroUI's render
    props are, each read where Solid tracks it. *)

module Props : sig
  type t

  val check :
    channel:channel Solidtype.Check.value ->
    ?color_space:[ `rgb | `hsl | `hsb ] Solidtype.Check.value ->
    ?value:Solidtype_kobalte.Types.Color.t Solidtype.Check.value ->
    ?default_value:Solidtype_kobalte.Types.Color.t Solidtype.Check.value ->
    ?on_change:(Solidtype_kobalte.Types.Color.t -> unit) ->
    ?on_change_end:(Solidtype_kobalte.Types.Color.t -> unit) ->
    ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?name:string Solidtype.Check.value ->
    ?aria_label:string Solidtype.Check.value ->
    ?on_blur:(Dom.focusEvent -> unit) ->
    ?on_focus_out:(Dom.focusEvent -> unit) ->
    ?ref:(Dom.htmlDivElement -> unit) ->
    ?class_:string Solidtype.Check.value ->
    children:
      (state -> Jsx.element, [ `nodes | `render ]) Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Div.props -> state -> Jsx.element) ->
    ?props:t S.rest ->
    (unit -> unit) Solidtype.Html.Div.check
end

val make : Props.t -> Jsx.element
val component : Props.t Jsx.component
