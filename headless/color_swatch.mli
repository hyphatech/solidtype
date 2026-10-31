(** Kobalte's colour swatch, fixed: an element painted its colour, its role
    [img] and its name the colour's, as {!Solidtype_kobalte.ColorSwatch.Root}
    is, and a colour less than opaque painted too, where Kobalte writes it for
    CSS as [rgb(4, 133, 247 / 0.5)], which no browser reads. It takes Kobalte's
    props and every attribute its [<div>] does, a [style] after its own.

    {[
      <Color_swatch value=(fun () -> Colors.parse_color "#0485F7") />
    ]} *)

module Props : sig
  include module type of Solidtype_kobalte.ColorSwatch.Root.Props

  type t
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
