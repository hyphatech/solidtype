(** Kobalte's colour swatch, fixed: an element painted its colour, its role
    [img] and its name the colour's, as {!Solidtype_kobalte.ColorSwatch.Root}
    is, and a colour less than opaque painted too, where Kobalte writes it for
    CSS as [rgb(4, 133, 247 / 0.5)], which no browser reads. It takes Kobalte's
    props and every attribute its [<div>] does, a [style] after its own.

    {[
      <Color_swatch value=(fun () -> Colors.parse_color "#0485F7") />
    ]}

    Given no [value], it is its {!Color_picker}'s colour, as React Aria's is,
    else transparent. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

val shown :
  Color_picker.t option ->
  Solidtype_kobalte.Types.Color.t option ->
  Solidtype_kobalte.Types.Color.t
(** The colour a swatch paints, given its picker and its own [value]. *)

module Props : sig
  type t

  val check :
    ?value:Solidtype_kobalte.Types.Color.t Solidtype.Check.value ->
    ?color_name:string Solidtype.Check.value ->
    ?translations:
      Solidtype_kobalte.Types.ColorSwatch_Root_Translations.t
      Solidtype.Check.value ->
    ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
    ?props:'spread S.rest ->
    (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
    Solidtype.Html.Div.check
end

val make : Props.t -> Jsx.element
val component : Props.t Jsx.component
