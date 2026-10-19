(** Solid's [Switch]: the first of its [Match]es whose condition holds, else its
    fallback. Its only child may be a thunk whose body is a [match], which
    [ppx_solidtype] lowers to a [Match] per case, so a missing case is the
    compiler's warning. *)

module Props : sig
  val check :
    ?fallback:Jsx.element Check.value ->
    ?children:('f, [ `nodes ]) Check.children ->
    unit ->
    unit
end

val component : unit Jsx.component
