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

(* What reading [$TRACK] gives, which nothing uses: the read itself is what
   subscribes. Melange drops a property read whose value is unused as one
   with no effect, so the read is a call, [Reflect.get], which it keeps. *)
type tracked

external track_key : key = "$TRACK" [@@mel.module "solid-js"]
external read_key : 's -> key -> tracked = "get" [@@mel.scope "Reflect"]

let track s = ignore (read_key s track_key : tracked)
