(** Kobalte's slider, fixed: a thumb or several along a track, as
    {!Solidtype_kobalte.Slider} is, its parts taking Kobalte's props and every
    attribute their element does. A {!Track} given a [ref] still knows it is the
    slider's track, where Kobalte's spreads that [ref] over its own, so a press
    on it or a drag of a thumb throws. *)

module Jsx := Solidtype.Jsx

module Track : sig
  module Props : sig
    include module type of Solidtype_kobalte.Slider.Track.Props

    type t
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

module Root = Solidtype_kobalte.Slider.Root
module Fill = Solidtype_kobalte.Slider.Fill
module Thumb = Solidtype_kobalte.Slider.Thumb
module Input = Solidtype_kobalte.Slider.Input
module Label = Solidtype_kobalte.Slider.Label
module ValueLabel = Solidtype_kobalte.Slider.ValueLabel
module Description = Solidtype_kobalte.Slider.Description
module ErrorMessage = Solidtype_kobalte.Slider.ErrorMessage

val use_slider_context : unit -> Solidtype_kobalte.Types.SliderContextValue.t

external as_html : _ Dom.element_like -> Dom.htmlElement = "%identity"
(** An element as the type Kobalte's slider registers. *)
