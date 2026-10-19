(** Solid's [Suspense]: its fallback while a resource read inside it is loading.
*)

module Props : sig
  val check :
    ?fallback:Jsx.element Check.value ->
    ?children:('f, [ `nodes ]) Check.children ->
    unit ->
    unit
end

val component : unit Jsx.component
