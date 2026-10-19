(** Solid's [Hydration]: hydration resumed inside a [NoHydration]. *)

module Props : sig
  val check : ?children:('f, [ `nodes ]) Check.children -> unit -> unit
end

val component : unit Jsx.component
