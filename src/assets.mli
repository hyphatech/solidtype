(** Solid's [Assets]: its children written into the document's head when
    rendered on the server. *)

module Props : sig
  val check : ?children:('f, [ `nodes ]) Check.children -> unit -> unit
end

val component : unit Jsx.component
