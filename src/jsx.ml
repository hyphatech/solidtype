type element
type prop
type child
type content
type 'props component

external component : ('props -> element) -> 'props component = "%identity"
external string : string -> content = "%identity"
external int : int -> content = "%identity"
external element : element -> content = "%identity"
external of_undefined : unit Js.undefined -> element = "%identity"

(* Solid renders an undefined child as nothing. *)
let nothing = of_undefined Js.undefined

external el : string -> prop array -> child array -> element = "el"
[@@mel.module "vite-plugin-solidtype/markers"]

external c : 'props component -> prop array -> child array -> element = "c"
[@@mel.module "vite-plugin-solidtype/markers"]

external s : string -> 'a -> prop = "s"
[@@mel.module "vite-plugin-solidtype/markers"]

external d : string -> (unit -> 'a) -> prop = "d"
[@@mel.module "vite-plugin-solidtype/markers"]

external spread : 'props -> prop = "spread"
[@@mel.module "vite-plugin-solidtype/markers"]

external text : string -> child = "%identity"
external node : element -> child = "%identity"
external render : 'f -> child = "%identity"

external dynamic : (unit -> content) -> child = "dynamic"
[@@mel.module "vite-plugin-solidtype/markers"]
