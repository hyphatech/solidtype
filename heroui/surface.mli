(** HeroUI's Surface: a [<div>] with HeroUI's classes from {!Styles.Surface},
    the background a part of a page stands on. It gives what is inside it its
    variant, by {!Context}, which HeroUI's Card, Alert, Accordion and overlays
    give too, so a part can choose the colours that stand out on it.

    {[
      <Surface variant=`secondary class_="rounded-3xl p-6">
        <p>"On a secondary surface"</p>
      </Surface>
    ]}

    Kobalte has no surface, and a surface has no behaviour. *)

type variant = [ `default | `secondary | `tertiary | `transparent ]

(** The variant of the surface a part is inside, if any, read as it changes. *)
module Context : sig
  module Provider : sig
    module Props : sig
      val check :
        value:(unit -> variant) Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Solidtype.Jsx.component
  end

  val use : unit -> (unit -> variant) option
end

module Props : sig
  type t

  val check :
    ?variant:variant Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
