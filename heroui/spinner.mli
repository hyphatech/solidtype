(** HeroUI's Spinner: a [<span role="status">] named "Loading", with HeroUI's
    classes from {!Styles.Spinner}, that draws HeroUI's spinning icon, its
    gradients given ids of their own by {!Solidtype.Solid.create_unique_id}, the
    same on the server and in the browser.

    {[
      <Spinner color=`current size=`sm />
    ]}

    Inside a part that gives it one, {!Progress}, it takes its id, which names
    the part: a pending {!Button} is named by its spinner too.

    A spinner has no behaviour, so no Kobalte component underlies it. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

(** The id a part above gives the spinners inside it, as React Aria's
    ProgressBarContext gives a pending button's. *)
module Progress : sig
  module Provider : sig
    module Props : sig
      val check :
        value:string Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Jsx.component
  end

  val use : unit -> string option
end

module Props : sig
  type t

  val check :
    ?color:
      [ `accent | `current | `danger | `success | `warning ]
      Solidtype.Check.value ->
    ?size:[ `sm | `md | `lg | `xl ] Solidtype.Check.value ->
    ?aria_label:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?as_:(Solidtype.Html.Span.props -> Jsx.element) ->
    ?props:t S.rest ->
    (unit -> unit) Solidtype.Html.Span.check
end

val make : Props.t -> Jsx.element
val component : Props.t Jsx.component
