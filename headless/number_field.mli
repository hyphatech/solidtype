(** Kobalte's number field, fixed: a field of a number stepped by its buttons,
    the keys and the wheel, as {!Solidtype_kobalte.NumberField} is, its parts
    taking Kobalte's props and every attribute their element does. A caller's
    key, focus and blur handlers are called beside its input's own, which
    Kobalte's replace. Its wheel is fixed: turned down it steps the number up
    and turned up steps it down, as React Aria's does, where Kobalte's goes the
    other way; and it leaves alone a field that is read-only, a turn mostly
    sideways, and one with Control held, which zooms the page, where Kobalte's
    steps on each.

    {[
      <Number_field.Root default_value="4">
        <Number_field.Label>"Width"</Number_field.Label>
        <Number_field.Input />
      </Number_field.Root>
    ]}

    A part reads its field's, and raises as Kobalte's does elsewhere. *)

module Jsx := Solidtype.Jsx

(** The field, Kobalte's, its wheel its {!Input}'s: [change_on_wheel], [true] by
    default, says whether the wheel steps it. *)
module Root : sig
  module Props : sig
    include module type of Solidtype_kobalte.NumberField.Root.Props

    type t
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The field's input, Kobalte's, stepped by the wheel as {!wheel} steps it. Its
    [on_wheel] is called after its own, and its [on_key_down], [on_focus] and
    [on_blur] before its own, where Kobalte's replace those that step the value
    by the keys and format it as the focus leaves. *)
module Input : sig
  module Props : sig
    include module type of Solidtype_kobalte.NumberField.Input.Props

    type t
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

val drawn : 'props -> Solidtype.Html.Input.props -> Jsx.element
(** [drawn props] is the [as_] of an input of Kobalte's number field that is
    given [props] less {!composed}: what [props] draw it as, its [on_key_down],
    [on_focus] and [on_blur] called before Kobalte's own. *)

val composed : string array
(** The props {!drawn} composes, which the input is given without. *)

val wheel :
  change_on_wheel:bool ->
  Solidtype_kobalte.Types.NumberFieldContextValue.t ->
  Dom.wheelEvent ->
  unit
(** [wheel ~change_on_wheel field e] steps [field] by its step as React Aria's
    number field does for [e], a turn of the wheel over its input: up for a turn
    down, down for a turn up, and nothing for a turn mostly sideways, with
    Control held, while the input has no focus or is read-only or disabled, or
    unless [change_on_wheel]. The turn it takes from the page is not passed on.
    A field of Kobalte's number field that is not this one -- a colour
    channel's, {!Color_channel_field} -- steps so too, given [change_on_wheel]
    [false] on Kobalte's root. *)

module DecrementTrigger = Solidtype_kobalte.NumberField.DecrementTrigger
module Description = Solidtype_kobalte.NumberField.Description
module ErrorMessage = Solidtype_kobalte.NumberField.ErrorMessage
module HiddenInput = Solidtype_kobalte.NumberField.HiddenInput
module IncrementTrigger = Solidtype_kobalte.NumberField.IncrementTrigger
module Label = Solidtype_kobalte.NumberField.Label

val use_number_field_context :
  unit -> Solidtype_kobalte.Types.NumberFieldContextValue.t
(** The field's state, Kobalte's. *)
