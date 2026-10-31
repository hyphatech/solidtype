(** Kobalte's colour area, fixed: a square of two channels of a colour and a
    thumb that moves across it, by pointer and by the arrow keys, as
    {!Solidtype_kobalte.ColorArea} is, its parts taking Kobalte's props and
    every attribute their element does. Two of Kobalte's bugs are fixed:

    - a disabled area is disabled, where Kobalte's root takes [disabled] for
      itself and its state never learns it: its thumb is out of the page's
      order, its inputs are disabled, and its root, background and thumb are
      [data-disabled], present and empty as Kobalte's state is;
    - its thumb's colour, [--kb-color-current], is one a browser reads where it
      is less than opaque, which Kobalte writes for CSS as
      [rgb(4, 133, 247 / 0.5)].

    {[
      <Color_area.Root default_value=(fun () -> Colors.parse_color "#0485F7")>
        <Color_area.Background>
          <Color_area.Thumb>
            <Color_area.HiddenInputX /> <Color_area.HiddenInputY />
          </Color_area.Thumb>
        </Color_area.Background>
      </Color_area.Root>
    ]}

    A part reads its area's, and raises as Kobalte's does elsewhere. *)

module Root : sig
  module Props : sig
    include module type of Solidtype_kobalte.ColorArea.Root.Props

    type t
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

module Background : sig
  module Props : sig
    include module type of Solidtype_kobalte.ColorArea.Background.Props

    type t
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

module Thumb : sig
  module Props : sig
    include module type of Solidtype_kobalte.ColorArea.Thumb.Props

    type t
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

module HiddenInputX : sig
  module Props : sig
    include module type of Solidtype_kobalte.ColorArea.HiddenInputX.Props

    type t
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

module HiddenInputY : sig
  module Props : sig
    include module type of Solidtype_kobalte.ColorArea.HiddenInputY.Props

    type t
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

module Label = Solidtype_kobalte.ColorArea.Label
module Description = Solidtype_kobalte.ColorArea.Description
module ErrorMessage = Solidtype_kobalte.ColorArea.ErrorMessage

val use_color_area_context :
  unit -> Solidtype_kobalte.Types.ColorAreaContextValue.t
(** The area's state, Kobalte's. *)
