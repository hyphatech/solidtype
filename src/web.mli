(** Solid's renderer in the browser, [solid-js/web]: mounting and hydration.
    Rendering on the server is {!Server}. Its components are [Portal],
    [Dynamic], [NoHydration], [Hydration], [HydrationScript] and [Assets]. *)

val render : (unit -> Jsx.element) -> Dom.element -> unit -> unit
(** [render app root] mounts [app] in [root], and gives what unmounts it. *)

val hydrate :
  ?render_id:string -> (unit -> Jsx.element) -> Dom.element -> unit -> unit
(** As {!render}, over the HTML the server rendered for [app]. *)

val is_server : bool
val is_dev : bool
