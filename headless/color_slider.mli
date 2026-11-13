(** Kobalte's colour slider, fixed: a slider of one channel of a colour, as
    {!Solidtype_kobalte.ColorSlider} is, its parts taking Kobalte's props and
    every attribute their element does. Four of Kobalte's bugs are fixed:

    - Page Up and Page Down step the channel by its page, as the colour gives it
      -- 15 degrees of a hue, 10 of a saturation, 17 of a red -- where Kobalte's
      step by a tenth of the channel's range;
    - its thumb's value tells the colour's name in the lower case of the phrase
      it ends, [0°, red], where Kobalte's capitalizes it, [0°, Red];
    - [on_change] is told only a colour other than the slider's, where Kobalte's
      tells one at the channel's end that has not moved;
    - its element has no [pagesize] attribute, which Kobalte's writes from the
      channel's range it spreads on its slider.

    {[
      <Color_slider.Root
        channel=(fun () -> `hue)
        default_value=(fun () -> Colors.parse_color "hsl(0, 100%, 50%)")>
        <Color_slider.Track>
          <Color_slider.Thumb><Color_slider.Input /></Color_slider.Thumb>
        </Color_slider.Track>
      </Color_slider.Root>
    ]}

    A part reads its slider's, and raises as Kobalte's does elsewhere. *)

module Jsx := Solidtype.Jsx

module Root : sig
  module Props : sig
    include module type of Solidtype_kobalte.ColorSlider.Root.Props

    type t
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

module Thumb : sig
  module Props : sig
    include module type of Solidtype_kobalte.ColorSlider.Thumb.Props

    type t
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** A track given a [ref] still knows it is the slider's, as {!Slider.Track}
    does. *)
module Track : sig
  module Props : sig
    include module type of Solidtype_kobalte.ColorSlider.Track.Props

    type t
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

module Input = Solidtype_kobalte.ColorSlider.Input
module Label = Solidtype_kobalte.ColorSlider.Label
module ValueLabel = Solidtype_kobalte.ColorSlider.ValueLabel
module Description = Solidtype_kobalte.ColorSlider.Description
module ErrorMessage = Solidtype_kobalte.ColorSlider.ErrorMessage

val use_color_slider_context :
  unit -> Solidtype_kobalte.Types.ColorSliderContextValue.t
(** The slider's state, Kobalte's. *)
