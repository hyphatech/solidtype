(** HeroUI's Separator: Kobalte's [Separator.Root], a line between content, with
    HeroUI's classes from {!Styles.Separator.classes}.

    {[
      <Separator orientation=`vertical variant=`secondary />
    ]}

    It is an [<hr>] where it is horizontal, else a [<div>], as React Aria's is,
    and a [<div>] wherever a part above asks for one by {!Element}. *)

(** The element a part above draws its separators as: an [<hr>] where none says,
    and a [<div>] in a {!Dropdown.Menu} or a {!List_box}, as React Aria's menu
    and list box ask. *)
module Element : sig
  module Provider : sig
    module Props : sig
      val check :
        value:[ `hr | `div ] Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Solidtype.Jsx.component
  end

  val use : unit -> [ `hr | `div ]
end

(** Where a part above draws the separators inside it, given each as it would be
    drawn: a {!List_box} draws them among its options. *)
module Slot : sig
  module Provider : sig
    module Props : sig
      val check :
        value:
          (((unit -> Solidtype.Jsx.element) -> Solidtype.Jsx.element)[@u])
          Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Solidtype.Jsx.component
  end

  val use :
    unit ->
    (((unit -> Solidtype.Jsx.element) -> Solidtype.Jsx.element)[@u]) option
end

module Props : sig
  type t

  val check :
    ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
    ?variant:[ `default | `secondary | `tertiary ] Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
