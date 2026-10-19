(** Solid's [HydrationScript]: the script that holds events until the page has
    hydrated, for a page rendered on the server. *)

module Props : sig
  val check :
    ?nonce:string Check.value ->
    ?event_names:string array Check.value ->
    unit ->
    unit
end

val component : unit Jsx.component
