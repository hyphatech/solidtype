(** Solid's [SuspenseList]: the order in which the [Suspense]s inside it reveal.
*)

module Props : sig
  val check :
    revealOrder:[ `forwards | `backwards | `together ] Check.value ->
    ?tail:[ `collapsed | `hidden ] Check.value ->
    ?children:('f, [ `nodes ]) Check.children ->
    unit ->
    unit
end

val component : unit Jsx.component
