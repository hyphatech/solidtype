(** Solid's [NoHydration]: its children rendered on the server and never
    hydrated. *)

module Props : sig
  val check : ?children:('f, [ `nodes ]) Check.children -> unit -> unit
end

val component : unit Jsx.component
