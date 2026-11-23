(** Solid's [Index]: a list, each index rendered once, the item at it tracked:
    [<Index each=(items ())>(fun item i -> ...)</Index>]. *)

module Props : sig
  type 'a t

  val check :
    each:'a array Check.value ->
    ?fallback:Jsx.element Check.value ->
    children:
      ('a Solid.accessor -> int -> Jsx.element, [ `render ]) Check.children ->
    ?props:'a t Solid.rest ->
    unit ->
    unit
end

val make : 'a Props.t -> Jsx.element
val component : 'a Props.t Jsx.component
