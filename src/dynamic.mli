(** Solid's [Dynamic]: a component chosen while the page runs, given its props
    as one value, [<Dynamic component=(fun () -> pick ()) props />]. *)

module Props : sig
  val check :
    component:'props Jsx.component Check.value -> ?props:'props -> unit -> unit
end

val component : unit Jsx.component

(** An element whose tag is chosen while the page runs. *)
module Element : sig
  module Props : sig
    val check :
      component:string Check.value ->
      ?props:'a ->
      ?children:('f, [ `nodes ]) Check.children ->
      unit ->
      unit
  end

  val component : unit Jsx.component
end

val create_dynamic : (unit -> 'props Jsx.component) -> 'props -> Jsx.element
(** [create_dynamic pick props], the function [Dynamic] is made of. *)
