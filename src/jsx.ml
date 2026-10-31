type element
type prop
type child
type content
type 'a namespaced = 'a
type 'props component

external component : ('props -> element) -> 'props component = "%identity"
external string : string -> content = "%identity"
external int : int -> content = "%identity"
external element : element -> content = "%identity"
external of_undefined : unit Js.undefined -> element = "%identity"

(* Solid renders an undefined child as nothing. *)
let nothing = of_undefined Js.undefined

(* Solid renders an array of elements, as a fragment, in order. *)
external fragment : element array -> element = "%identity"

(* A token is an object of its own, told from any other child -- a node, a
   string, another module's token -- by its mark, an object made once per
   module and compared by identity. *)
module Token (T : sig
  type t
end) =
struct
  let mark = ref ()

  external token :
    solidtype_token:(unit ref[@mel.as "solidtypeToken"]) ->
    value:T.t ->
    unit ->
    element = ""
  [@@mel.obj]

  external to_nullable : element -> element Js.Nullable.t = "%identity"

  external mark_of : element -> unit ref Js.undefined = "solidtypeToken"
  [@@mel.get]

  external value_of : element -> T.t = "value" [@@mel.get]

  let element value = token ~solidtype_token:mark ~value ()

  let marked e =
    String.equal (Js.typeof e) "object"
    && (not (Js.Nullable.isNullable (to_nullable e)))
    &&
    match Js.Undefined.toOption (mark_of e) with
    | Some m -> m == mark
    | None -> false

  let read elements =
    elements |> Js.Array.filter ~f:marked |> Js.Array.map ~f:value_of
end

(* A data- attribute's value: a string, or undefined, which Solid writes as
   no attribute, on the server as in the browser. *)
type data = string Js.undefined

external data : string -> data = "%identity"

let flag b = if b then data "true" else Js.undefined

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

external native : 'a -> 'a namespaced = "%identity"
external capture : 'a -> 'a namespaced = "%identity"
external prop : 'a -> 'a namespaced = "%identity"
external attr : 'a -> 'a namespaced = "%identity"
external bool : 'a -> 'a namespaced = "%identity"

let listen (_ : string) v = v
let named (_ : string) v = v
