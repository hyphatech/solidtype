(** Solid's [For]: a list, each item rendered once, by identity, its index
    tracked. Its only child is the function that renders an item:
    [<For each=(items ())>(fun item _ -> ...)</For>]. *)

module Props : sig
  type 'a t

  val check :
    each:'a array Check.value ->
    ?fallback:Jsx.element Check.value ->
    children:
      ('a -> int Solid.accessor -> Jsx.element, [ `render ]) Check.children ->
    ?props:'a t Solid.rest ->
    unit ->
    unit
end

val make : 'a Props.t -> Jsx.element
val component : 'a Props.t Jsx.component
