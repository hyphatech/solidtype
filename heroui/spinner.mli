(** HeroUI's Spinner: a [<span role="status">] named "Loading", with HeroUI's
    classes from {!Styles.Spinner}, that draws HeroUI's spinning icon, its
    gradients given ids of their own by {!Solidtype.Solid.create_unique_id}, the
    same on the server and in the browser.

    {[
      <Spinner color=`current size=`sm />
    ]}

    A spinner has no behaviour, so no Kobalte component underlies it. *)

module Props : sig
  type t

  val check :
    ?color:
      [ `accent | `current | `danger | `success | `warning ]
      Solidtype.Check.value ->
    ?size:[ `sm | `md | `lg | `xl ] Solidtype.Check.value ->
    ?aria_label:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
