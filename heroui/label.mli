(** HeroUI's Label: a field's name, with HeroUI's classes from {!Styles.Label},
    marked required, disabled or invalid as it is told. It is a [<label>],
    unless a part above it gives it its element, as React Aria's do: a [<span>]
    inside a control's own clickable label, {!Switch.Content} and the others,
    the group's label, which names the group, inside a {!Radio_group}, and the
    field's, which names its input, inside a {!Text_field}.

    {[
      <Label>"Wi-Fi"</Label>
    ]} *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

type slot =
  (unit -> string) -> unit S.rest -> (unit -> Jsx.content) -> Jsx.element
(** How a label renders below a part: given its classes, the rest of its props
    -- its [data-] attributes -- and its children, the element it is, which
    declares [data-slot="label"]. *)

(** The {!slot} a part gives the labels below it. *)
module Slot : sig
  module Provider : sig
    module Props : sig
      val check :
        value:slot Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Jsx.component
  end

  val use : unit -> slot option
end

module Props : sig
  type t

  val check :
    ?is_required:bool Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?is_invalid:bool Solidtype.Check.value ->
    ?for_:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Label.props -> Jsx.element) ->
    ?props:t S.rest ->
    (unit -> unit) Solidtype.Html.Label.check
end

val make : Props.t -> Jsx.element
val component : Props.t Jsx.component
