(** One colour its parts share, as React Aria's [ColorPicker] shares one, which
    Kobalte lacks. It draws nothing: inside it, a {!Color_area.Root}, a
    {!Color_slider.Root}, a {!Color_field.Root}, a {!Color_channel_field.Root},
    a {!Color_swatch} and a {!Color_swatch_picker.Root} given no [value] of
    their own show its colour, and each change one of them makes moves it, so
    each of the others follows. A part's own [value] wins over it, and a part's
    own [on_change] is called after the picker is told.

    {[
      <Color_picker default_value=(fun () -> Colors.parse_color "#0485F7")>
        <Color_swatch />
        <Color_area.Root>
          <Color_area.Background>
            <Color_area.Thumb>
              <Color_area.HiddenInputX /> <Color_area.HiddenInputY />
            </Color_area.Thumb>
          </Color_area.Background>
        </Color_area.Root>
      </Color_picker>
    ]}

    Its colour is [value] while it is given one, else the one it keeps,
    [default_value] at first, else black. A hex field emptied changes nothing,
    and shows the colour again as it is committed. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

type t = {
  color : Solidtype_kobalte.Types.Color.t S.accessor;
  set_color : Solidtype_kobalte.Types.Color.t -> unit;
}
(** The picker a part is inside: its colour, read as it changes, and what moves
    it. *)

val use_context : unit -> t option
(** The picker above, if any, read as a component is made. *)

val value :
  t option ->
  Solidtype_kobalte.Types.Color.t option ->
  Solidtype_kobalte.Types.Color.t option
(** A part's colour, given its picker and its own [value]: its own, else its
    picker's. *)

val changed : t option -> Solidtype_kobalte.Types.Color.t -> unit
(** Tells a part's picker, if it has one, of the colour the part changed to. *)

module Props : sig
  type t

  val check :
    ?value:Solidtype_kobalte.Types.Color.t Solidtype.Check.value ->
    ?default_value:Solidtype_kobalte.Types.Color.t Solidtype.Check.value ->
    ?on_change:(Solidtype_kobalte.Types.Color.t -> unit) ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t S.rest ->
    unit ->
    unit
end

val make : Props.t -> Jsx.element
val component : Props.t Jsx.component
