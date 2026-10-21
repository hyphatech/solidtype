external render_js :
  ((unit -> Jsx.element)[@mel.uncurry]) -> Dom.element -> (unit -> unit[@u])
  = "render"
[@@mel.module "solid-js/web"]

let render app root =
  let dispose = render_js app root in
  fun () -> (dispose () [@u])

type hydrate_options

external hydrate_options :
  ?render_id:(string[@mel.as "renderId"]) -> unit -> hydrate_options = ""
[@@mel.obj]

external hydrate_js :
  ((unit -> Jsx.element)[@mel.uncurry]) ->
  Dom.element ->
  hydrate_options ->
  (unit -> unit[@u]) = "hydrate"
[@@mel.module "solid-js/web"]

let hydrate ?render_id app root =
  let dispose = hydrate_js app root (hydrate_options ?render_id ()) in
  fun () -> (dispose () [@u])

external is_server : bool = "isServer" [@@mel.module "solid-js/web"]
external is_dev : bool = "isDev" [@@mel.module "solid-js/web"]
