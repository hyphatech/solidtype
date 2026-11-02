(** Kobalte's colour channel field, fixed: a field of one channel of a colour,
    its number stepped by the keys and shown as the colour formats it, as
    {!Solidtype_kobalte.ColorChannelField} is, its parts taking Kobalte's props
    and every attribute their element does. Two of Kobalte's bugs are fixed: its
    input's [aria-valuenow] is the channel's number, [301], where Kobalte's is
    the text it shows once the value changes, [301°], which no reader reads as a
    number; and its [on_change] is told only a colour other than its own, where
    Kobalte's tells its own as it mounts.

    {[
      <Color_channel_field.Root
        channel=(fun () -> `hue)
        default_value=(fun () -> Colors.parse_color "hsl(300, 100%, 25%)")>
        <Color_channel_field.Label>"Hue"</Color_channel_field.Label>
        <Color_channel_field.Input />
      </Color_channel_field.Root>
    ]}

    A part reads its field's, and raises as Kobalte's does elsewhere. *)

module Input : sig
  module Props : sig
    include module type of Solidtype_kobalte.ColorChannelField.Input.Props

    type t
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

module Root : sig
  module Props : sig
    include module type of Solidtype_kobalte.ColorChannelField.Root.Props

    type t
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

module Label = Solidtype_kobalte.ColorChannelField.Label
module Description = Solidtype_kobalte.ColorChannelField.Description
module ErrorMessage = Solidtype_kobalte.ColorChannelField.ErrorMessage
module HiddenInput = Solidtype_kobalte.ColorChannelField.HiddenInput
module IncrementTrigger = Solidtype_kobalte.ColorChannelField.IncrementTrigger
module DecrementTrigger = Solidtype_kobalte.ColorChannelField.DecrementTrigger
