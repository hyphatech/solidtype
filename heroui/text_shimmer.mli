(** Text with a highlight sweeping across it, for a label of work under way:
    ["Thinking..."]. A clean reimplementation of HeroUI Pro's TextShimmer.

    {[
      <Text_shimmer>"Thinking..."</Text_shimmer>
    ]}

    The text is drawn at 45% of its colour, and the highlight in its colour, so
    a colour given by [class_] shimmers too. A reader reads the text once. Under
    reduced motion the text is still and solid. *)

module Props : sig
  type t

  val check :
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
