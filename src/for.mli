(** Solid's [For]: a list, each item rendered once, by identity, its index
    tracked. Its only child is the function that renders an item:
    [<For each=(fun () -> items ())>(fun item _ -> ...)</For>]. *)

module Props : sig
  val check :
    each:'a array Check.value ->
    ?fallback:Jsx.element Check.value ->
    children:
      ('a -> int Solid.accessor -> Jsx.element, [ `render ]) Check.children ->
    unit ->
    unit
end

val component : unit Jsx.component
