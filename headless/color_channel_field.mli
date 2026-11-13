(** Kobalte's colour channel field, fixed: a field of one channel of a colour,
    its number stepped by the keys and shown as the colour formats it, as
    {!Solidtype_kobalte.ColorChannelField} is, its parts taking Kobalte's props
    and every attribute their element does. Its value is the same as
    {!Color_field}'s, a colour or none. Five of Kobalte's bugs are fixed: its
    input's [aria-valuenow] is the channel's number, [301], where Kobalte's is
    the text it shows once the value changes, [301°], which no reader reads as a
    number; its [on_change] is told only a colour other than its own, where
    Kobalte's tells its own as it mounts; what is typed is told once it is
    committed, by Enter or as the focus leaves, as React Aria's is, where
    Kobalte's tells each key; a field emptied is told [None], where Kobalte's
    tells a colour with no number; and its wheel is {!Number_field}'s, which
    turns as React Aria's does. Emptied in a {!Color_picker}, whose colour
    stays, it shows the colour again as it is committed.

    {[
      <Color_channel_field.Root
        channel=(fun () -> `hue)
        default_value=(fun () -> Colors.parse_color "hsl(300, 100%, 25%)")>
        <Color_channel_field.Label>"Hue"</Color_channel_field.Label>
        <Color_channel_field.Input />
      </Color_channel_field.Root>
    ]}

    A part reads its field's, and raises as Kobalte's does elsewhere. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

module Input : sig
  module Props : sig
    include module type of Solidtype_kobalte.ColorChannelField.Input.Props

    type t
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

module Root : sig
  module Props : sig
    type t

    val check :
      ?value:Solidtype_kobalte.Types.Color.t Js.Nullable.t Solidtype.Check.value ->
      ?default_value:Solidtype_kobalte.Types.Color.t Solidtype.Check.value ->
      ?on_change:(Solidtype_kobalte.Types.Color.t option -> unit) ->
      channel:
        [ `hue
        | `saturation
        | `brightness
        | `lightness
        | `red
        | `green
        | `blue
        | `alpha ]
        Solidtype.Check.value ->
      ?color_space:[ `rgb | `hsl | `hsb ] Solidtype.Check.value ->
      ?id:string Solidtype.Check.value ->
      ?disabled:bool Solidtype.Check.value ->
      ?text_value:string Solidtype.Check.value ->
      ?translations:
        Solidtype_kobalte.Types.ColorChannelField_Root_Translations.t
        Solidtype.Check.value ->
      ?min_value:float Solidtype.Check.value ->
      ?max_value:float Solidtype.Check.value ->
      ?step:float Solidtype.Check.value ->
      ?large_step:float Solidtype.Check.value ->
      ?change_on_wheel:bool Solidtype.Check.value ->
      ?format:bool Solidtype.Check.value ->
      ?name:string Solidtype.Check.value ->
      ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
      ?required:bool Solidtype.Check.value ->
      ?read_only:bool Solidtype.Check.value ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

module Label = Solidtype_kobalte.ColorChannelField.Label
module Description = Solidtype_kobalte.ColorChannelField.Description
module ErrorMessage = Solidtype_kobalte.ColorChannelField.ErrorMessage
module HiddenInput = Solidtype_kobalte.ColorChannelField.HiddenInput
module IncrementTrigger = Solidtype_kobalte.ColorChannelField.IncrementTrigger
module DecrementTrigger = Solidtype_kobalte.ColorChannelField.DecrementTrigger
