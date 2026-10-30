(** HeroUI's ColorSwatch: Kobalte's [ColorSwatch.Root], a [<div role="img">]
    that shows a colour, with HeroUI's classes from {!Styles.ColorSwatch}, a
    colour less than opaque drawn over a checkerboard. A reader is told the
    colour's name, Kobalte's for it or [color_name], then [aria_label].

    {[
      <Color_swatch aria_label="Blue" color=(Colors.parse_color "#0485F7") />
    ]}

    Its colour is Kobalte's {!Solidtype_kobalte.Types.Color}, read from a CSS
    string by {!Solidtype_kobalte.Colors.parse_color}. A [style] of its own is
    added after the swatch's colour, which it is written from: HeroUI's style
    given as a function of the colour is the caller's colour, already in hand.
*)

module Props : sig
  type t

  val check :
    color:Solidtype_kobalte.Types.Color.t Solidtype.Check.value ->
    ?color_name:string Solidtype.Check.value ->
    ?aria_label:string Solidtype.Check.value ->
    ?shape:[ `circle | `square ] Solidtype.Check.value ->
    ?size:[ `xs | `sm | `md | `lg | `xl ] Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?style:string Solidtype.Check.value ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
