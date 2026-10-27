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
(** A component taking ['props]: an OCaml one, by {!val-component}, or a
    binding's. *)

external component : ('props -> element) -> 'props component = "%identity"
external string : string -> content = "%identity"
external int : int -> content = "%identity"
external element : element -> content = "%identity"

val nothing : element
(** An element that renders nothing, for an optional one left out. *)

external fragment : element array -> element = "%identity"
(** [fragment [| a; b |]] is [a] and [b] side by side where one element is
    given, as JSX's [<>...</>] is: Solid renders an array of elements in order,
    as one. *)

type data
(** A [data-] attribute's value, on an element or a component: present, or
    absent, as React Aria writes a state, ["true"] or no attribute.
    [data_slot="badge"] is written as [data] for you. *)

external data : string -> data = "%identity"
(** [data s] is the attribute present, [s]. *)

val flag : bool -> data
(** [flag b] is ["true"] while [b] holds, and no attribute otherwise:
    [data_selected=(fun () -> Jsx.flag (checked ()))]. *)

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

(** {1 Solid's namespaces}

    A namespace wraps an attribute's value, never its name: Solid's
    [ns:name={v}] is [name=(Jsx.ns v)]. [ppx_solidtype] reads the wrapper where
    it is written, in an element's attribute, and writes the namespace; a
    wrapper left out is Solid's default. A component takes {!attr}, {!bool} and
    {!named} outside its props' check and passes them on to its element; each,
    optional, is [?name=(Jsx.attr (fun () -> o))]. *)

type 'a namespaced

external native : 'a -> 'a namespaced = "%identity"
(** [on_click=(Jsx.native f)] is [on:click={f}]: a listener on the element
    itself, never delegated. *)

external capture : 'a -> 'a namespaced = "%identity"
(** [on_click=(Jsx.capture f)] is [oncapture:click={f}]: a listener in the
    capture phase. *)

external prop : 'a -> 'a namespaced = "%identity"
(** [value=(Jsx.prop v)] is [prop:value={v}]: set as the element's property. *)

external attr : 'a -> 'a namespaced = "%identity"
(** [title=(Jsx.attr s)] is [attr:title={s}]: set as an attribute, a [string].
*)

external bool : 'a -> 'a namespaced = "%identity"
(** [hidden=(Jsx.bool b)] is [bool:hidden={b}]: an attribute present while [b]
    is [true]. *)

val listen : string -> 'a -> 'a namespaced
(** [on=(Jsx.listen "myEvent" f)] is [on:myEvent={f}]: a listener for an event
    whose name the spelling rule cannot keep, a custom one. *)

val named : string -> 'a -> 'a namespaced
(** [attr=(Jsx.named "data-x" s)] is [data-x={s}]: an attribute whose name the
    spelling rule cannot keep. *)
