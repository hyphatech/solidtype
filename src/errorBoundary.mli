(** Solid's [ErrorBoundary]: its children, or, once one of them raised, its
    fallback, given the exception -- an OCaml one as it was raised, a value
    JavaScript threw as [Js.Exn.Error] -- and what renders the children again.
*)

module Props : sig
  type t

  val check :
    fallback:(exn -> (unit -> unit) -> Jsx.element) ->
    children:('f, [ `nodes ]) Check.children ->
    ?props:t ->
    unit ->
    unit
end

val make : Props.t -> Jsx.element
val component : Props.t Jsx.component
