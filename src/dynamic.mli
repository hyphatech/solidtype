(** Solid's [Dynamic]: a component chosen while the page runs, given its props
    as one value, [<Dynamic component=(fun () -> pick ()) props />]. The props
    are required, typed by the component, so a prop the component needs is not
    left out unseen, as TSX's types refuse it too; a component that takes none
    is given [Props.make ()]. *)

module Props : sig
  val check :
    component:'props Jsx.component Check.value -> props:'props -> unit -> unit
end

val component : unit Jsx.component

(** An element whose tag is chosen while the page runs,
    [<Dynamic.Element component=(fun () -> tag ())
     class_="box">...</Dynamic.Element>]: its attributes are the ones every HTML
    element takes, {!Html.Element}'s, as TSX types a tag that is a string. *)
module Element : sig
  module Props : sig
    val check :
      component:string Check.value ->
      (?children:('f, [ `nodes ]) Check.children -> unit -> unit)
      Html.Element.check
  end

  val component : unit Jsx.component
end

val create_dynamic : (unit -> 'props Jsx.component) -> 'props -> Jsx.element
(** [create_dynamic pick props], the function [Dynamic] is made of. *)
