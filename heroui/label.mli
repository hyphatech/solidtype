(** HeroUI's Label: a field's name, with HeroUI's classes from {!Styles.Label}.
    It is a [<label>], but a [<span>] inside a control's own clickable label, a
    switch's {!Switch.Content}, as HeroUI's is there.

    {[
      <Label>"Wi-Fi"</Label>
    ]} *)

(** Whether a label is inside a control's clickable label: {!Switch.Content}
    provides it. *)
module Inline : sig
  module Provider : sig
    module Props : sig
      val check :
        value:bool Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Solidtype.Jsx.component
  end

  val use : unit -> bool
end

module Props : sig
  type t

  val check :
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
