(** Solid's [Index]: a list, each index rendered once, the item at it tracked:
    [<Index each=(fun () -> items ())>(fun item i -> ...)</Index>]. *)

module Props : sig
  val check :
    each:'a array Check.value ->
    ?fallback:Jsx.element Check.value ->
    children:
      ('a Solid.accessor -> int -> Jsx.element, [ `render ]) Check.children ->
    unit ->
    unit
end

val component : unit Jsx.component
