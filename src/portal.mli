(** Solid's [Portal]: its children mounted elsewhere, in [document.body] by
    default, while they stay this component's in the reactive graph. *)

module Props : sig
  val check :
    ?mount:Dom.element Check.value ->
    ?use_shadow:bool Check.value ->
    ?is_svg:bool Check.value ->
    ?ref:(Dom.element -> unit) ->
    ?children:('f, [ `nodes ]) Check.children ->
    unit ->
    unit
end

val component : unit Jsx.component
