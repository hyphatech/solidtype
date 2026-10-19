(** The markers [ppx_solidtype] writes and the Vite plugin rewrites into Solid's
    JSX. None runs: a build without the plugin fails on
    ["vite-plugin-solidtype/markers"]. Write JSX, never these. *)

type element
(** What a JSX element is: a node Solid's compiler made. *)

type prop
type child

type content
(** What a dynamic child gives: a string, a number or an element. *)

type 'props component
(** A component taking ['props]: an OCaml one, by {!component}, or a binding's.
*)

external component : ('props -> element) -> 'props component = "%identity"
external string : string -> content = "%identity"
external int : int -> content = "%identity"
external element : element -> content = "%identity"

val nothing : element
(** An element that renders nothing, for an optional one left out. *)

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
(** A component's only child when it is a function the component calls, as
    [For]'s is. Its type is the component's props check's to hold. *)

external dynamic : (unit -> content) -> child = "dynamic"
[@@mel.module "vite-plugin-solidtype/markers"]
