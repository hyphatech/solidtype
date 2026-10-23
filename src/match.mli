(** Solid's [Match]: a case of a [Switch], shown while its condition holds and
    no case before it does. A [match] in a [Switch]'s thunk is lowered to these
    by [ppx_solidtype]. *)

module Props : sig
  val check :
    when_:bool Check.value ->
    ?children:('f, [ `nodes ]) Check.children ->
    unit ->
    unit
end

val component : unit Jsx.component

(** As [Show.Some], a case while [some] is [Some _]. *)
module Some : sig
  module Props : sig
    type 'a t

    val check :
      some:'a option Check.value ->
      children:('a Solid.accessor -> Jsx.element, [ `render ]) Check.children ->
      ?props:'a t Solid.rest ->
      unit ->
      unit
  end

  val make : 'a Props.t -> Jsx.element
  val component : 'a Props.t Jsx.component
end

(** As [Show.Keyed], a case given the value, rendered again when it changes. *)
module Keyed : sig
  module Props : sig
    type 'a t

    val check :
      some:'a option Check.value ->
      children:('a -> Jsx.element, [ `render ]) Check.children ->
      ?props:'a t Solid.rest ->
      unit ->
      unit
  end

  val make : 'a Props.t -> Jsx.element
  val component : 'a Props.t Jsx.component
end
