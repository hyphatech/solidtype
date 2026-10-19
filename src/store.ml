type 's setter
type options

external options : ?name:string -> unit -> options = "" [@@mel.obj]

external create : 's -> options -> 's * 's setter = "createStore"
[@@mel.module "solid-js/store"]

let create_store ?name state = create state (options ?name ())

external setter : 's setter -> ('s -> unit[@u]) = "%identity"

let set s v = (setter s) v [@u]

type 's modifier

external produce : (('s -> unit)[@mel.uncurry]) -> 's modifier = "produce"
[@@mel.module "solid-js/store"]

type reconcile_options

external reconcile_options :
  ?key:string -> ?merge:bool -> unit -> reconcile_options = ""
[@@mel.obj]

external reconcile_js : 's -> reconcile_options -> 's modifier = "reconcile"
[@@mel.module "solid-js/store"]

let reconcile ?key ?merge v = reconcile_js v (reconcile_options ?key ?merge ())

external modifier_setter : 's setter -> ('s modifier -> unit[@u]) = "%identity"

let modify s m = (modifier_setter s) m [@u]

external create_mutable_js : 's -> options -> 's = "createMutable"
[@@mel.module "solid-js/store"]

let create_mutable ?name state = create_mutable_js state (options ?name ())

external modify_mutable : 's -> 's modifier -> unit = "modifyMutable"
[@@mel.module "solid-js/store"]

external unwrap : 's -> 's = "unwrap" [@@mel.module "solid-js/store"]

type key

external track_key : key = "$TRACK" [@@mel.module "solid-js"]
external read_key : 's -> key -> unit = "" [@@mel.get_index]

let track s = read_key s track_key
