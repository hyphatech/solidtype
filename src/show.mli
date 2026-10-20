(** Solid's [Show]: its children while a condition holds, else its fallback.

    [<Show when_=(fun () -> ready ())>...</Show>] takes a [bool], never a value
    Solid reads for truth, since Melange writes [Some 0] and a first constant
    constructor as [0]. An [option] is shown by {!Some} or {!Keyed}. *)

module Props : sig
  val check :
    when_:bool Check.value ->
    ?fallback:Jsx.element Check.value ->
    ?children:('f, [ `nodes ]) Check.children ->
    unit ->
    unit
end

val component : unit Jsx.component

exception Stale_read
(** A value read after it is gone, which Solid itself refuses first. *)

(** [<Show.Some some=(fun () -> user ())>(fun u -> ...)</Show.Some>]: its child
    while [some] is [Some _], rendered once and given a read of the value. *)
module Some : sig
  module Props : sig
    type 'a t

    val check :
      some:'a option Check.value ->
      ?fallback:Jsx.element Check.value ->
      children:('a Solid.accessor -> Jsx.element, [ `render ]) Check.children ->
      ?props:'a t ->
      unit ->
      unit
  end

  val make : 'a Props.t -> Jsx.element
  val component : 'a Props.t Jsx.component
end

(** As {!Some}, given the value itself, and rendered again whenever it changes.
*)
module Keyed : sig
  module Props : sig
    type 'a t

    val check :
      some:'a option Check.value ->
      ?fallback:Jsx.element Check.value ->
      children:('a -> Jsx.element, [ `render ]) Check.children ->
      ?props:'a t ->
      unit ->
      unit
  end

  val make : 'a Props.t -> Jsx.element
  val component : 'a Props.t Jsx.component
end
