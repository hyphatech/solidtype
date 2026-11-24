(** HeroUI's Separator: Kobalte's [Separator.Root], a line between content, with
    HeroUI's classes from {!Styles.Separator.classes}.

    Its page, with its examples:
    [$(opam var solidtype:doc)/pages/heroui/separator.md].

    {[
      <Separator orientation=`vertical variant=`secondary />
    ]}

    It is an [<hr>] where it is horizontal, else a [<div>], as React Aria's is,
    and a [<div>] wherever a part above asks for one by {!Element}. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

(** The element a part above draws its separators as: an [<hr>] where none says,
    and a [<div>] in a {!Dropdown.Menu} or a {!List_box}, as React Aria's menu
    and list box ask. *)
module Element : sig
  module Provider : sig
    module Props : sig
      val check :
        value:[ `hr | `div ] Solidtype.Check.value ->
        ?children:('f, [ `elements ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Jsx.component
  end

  val use : unit -> [ `hr | `div ]
end

(** Where a part above draws the separators inside it, given each as it would be
    drawn: a {!List_box} draws them among its options. *)
module Slot : sig
  module Provider : sig
    module Props : sig
      val check :
        value:((unit -> Jsx.element) -> Jsx.element) Solidtype.Check.value ->
        ?children:('f, [ `elements ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Jsx.component
  end

  val use : unit -> ((unit -> Jsx.element) -> Jsx.element) option
end

(** The orientation a part above gives the separators inside it that give none,
    as a {!Toolbar} gives its own one across it. *)
module Orientation : sig
  module Provider : sig
    module Props : sig
      val check :
        value:[ `horizontal | `vertical ] S.accessor Solidtype.Check.value ->
        ?children:('f, [ `elements ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Jsx.component
  end

  val use : unit -> [ `horizontal | `vertical ] S.accessor option
end

module Props : sig
  type t

  val check :
    ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
    ?variant:[ `default | `secondary | `tertiary ] Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
    ?props:t S.rest ->
    (unit -> unit) Solidtype.Html.Div.check
end

val make : Props.t -> Jsx.element
val component : Props.t Jsx.component
