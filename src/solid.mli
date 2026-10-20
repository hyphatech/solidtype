(** Solid's reactive core, [solid-js], at 1.9.

    Names are Solid's, in snake case, so Solid's documentation reads across:
    [createSignal] is {!create_signal}. An options object is optional arguments.
    Where Solid passes a computation its previous value, the binding is two
    functions, the second ending in [_from] and taking [~init]. *)

(** {1 Signals} *)

type 'a accessor = (unit -> 'a[@u])
(** A reactive value, read by {!get}. A JavaScript function, so a read is a
    plain call that Solid tracks. *)

type 'a setter
(** What changes a signal, by {!set} or {!update}. *)

(** When a new value counts as a change. *)
type 'a equals =
  | By of ('a -> 'a -> bool)  (** Equal by this function: no change. *)
  | Never  (** Every write is a change, an equal value too. *)

val get : 'a accessor -> 'a
(** [get count] reads [count], and inside a tracking scope -- a thunk in a JSX
    position, an effect, a memo -- subscribes to it. *)

val create_signal :
  ?equals:'a equals -> ?name:string -> 'a -> 'a accessor * 'a setter
(** By default a value [===] to the last is no change. *)

val set : 'a setter -> 'a -> unit
(** [set s v] makes [v] the signal's value, a function too: Solid calls a
    function it is given, so a function value is passed through one that returns
    it. *)

val update : 'a setter -> ('a -> 'a) -> unit
(** [update s f] makes [f] of the value the new value. *)

(** {1 Computations} *)

val create_memo :
  ?equals:'a equals -> ?name:string -> (unit -> 'a) -> 'a accessor
(** A derived value, recomputed when what it reads changes, and notifying only
    when it is a change. *)

val create_memo_from :
  ?equals:'a equals -> ?name:string -> init:'a -> ('a -> 'a) -> 'a accessor
(** As {!create_memo}, given its previous value, [init] the first time. *)

val create_effect : ?name:string -> (unit -> unit) -> unit
(** Runs after rendering, and again whenever what it reads changes. *)

val create_effect_from : ?name:string -> init:'a -> ('a -> 'a) -> unit

val create_render_effect : ?name:string -> (unit -> unit) -> unit
(** As {!create_effect}, run first while rendering, before the DOM is connected.
*)

val create_render_effect_from : ?name:string -> init:'a -> ('a -> 'a) -> unit

val create_computed : ?name:string -> (unit -> unit) -> unit
(** Runs at once, and again before anything that reads what it writes. *)

val create_computed_from : ?name:string -> init:'a -> ('a -> 'a) -> unit

val create_deferred :
  ?timeout_ms:int ->
  ?equals:'a equals ->
  ?name:string ->
  (unit -> 'a) ->
  'a accessor
(** A copy of a value that changes only once the browser is idle, or after
    [timeout_ms]. *)

val create_selector : ?equals:('k -> 'a -> bool) -> (unit -> 'a) -> 'k -> bool
(** [create_selector source] gives [is k], tracked for [k] alone: a change of
    [source] notifies only the keys that become or stop being selected. *)

val create_reaction : ?name:string -> (unit -> unit) -> (unit -> unit) -> unit
(** [create_reaction on_invalidate] gives [track]: [track f] runs [f], and the
    next change of what [f] read calls [on_invalidate], once. *)

val on :
  ?defer:bool -> (unit -> 'd) -> ('d -> 'd option -> unit) -> unit -> unit
(** [create_effect (on deps f)] runs [f input previous_input] when [deps]
    changes, reading nothing else tracked; [~defer:true] skips the first run. *)

val on_from :
  ?defer:bool -> (unit -> 'd) -> ('d -> 'd option -> 'a -> 'a) -> 'a -> 'a
(** As {!on}, for the [_from] computations. *)

val batch : (unit -> 'a) -> 'a
(** Runs [f], holding every notification until it returns. *)

val untrack : (unit -> 'a) -> 'a
(** Runs [f] without subscribing to what it reads. *)

(** {1 Ownership and lifecycle} *)

type owner
(** What a computation belongs to, and is disposed with. *)

val create_root : ?owner:owner -> ((unit -> unit) -> 'a) -> 'a
(** [create_root f] runs [f dispose] in a new root, which lives until [dispose]
    is called. *)

val get_owner : unit -> owner option

val run_with_owner : owner -> (unit -> 'a) -> 'a option
(** [run_with_owner o f] runs [f] as [o]'s, for a computation or a context
    reached from a callback; [None] when [f] raised, which Solid passes to the
    owner's error handler. *)

val on_mount : (unit -> unit) -> unit
(** Runs once after the first render, untracked. *)

val on_cleanup : (unit -> unit) -> unit
(** Runs when the current owner is disposed or reruns. *)

val catch_error : (unit -> 'a) -> (exn -> unit) -> 'a option
(** [catch_error f handler] runs [f]: [Some] what it returned, [None] when it
    raised. An error it raises, or one raised later by a computation it created,
    goes to [handler]. A value JavaScript threw is [Js.Exn.Error]. *)

type thrown
(** What JavaScript threw, as Solid hands it to a handler: any value, an OCaml
    exception among them. *)

val exn_of_thrown : thrown -> exn
(** What JavaScript threw, as an exception: an OCaml one as it was raised --
    also when Solid wrapped it in an [Error], its cause -- and any other value
    as [Js.Exn.Error]. *)

val on_error : (exn -> unit) -> unit
(** Deprecated by Solid for {!catch_error}: sends the current owner's errors to
    [handler]. *)

(** {1 Transitions} *)

val start_transition : (unit -> unit) -> unit Js.Promise.t
(** Runs [f] as a transition: its updates show together, once what they suspend
    on resolves. *)

val use_transition :
  unit -> bool accessor * ((unit -> unit) -> unit Js.Promise.t)
(** Whether a transition is pending, and what starts one. *)

(** {1 Resources} *)

type 'a resource
(** A value fetched asynchronously, read by {!read}. *)

type 'a resource_actions
(** What changes a resource: {!mutate} and {!refetch}. *)

type 'a fetch_info = {
  value : 'a option;  (** The value it is fetched again over, if any. *)
  refetching : bool;  (** Whether {!refetch} started it. *)
}
(** What a fetch is told. *)

(** Where a resource is in its fetch. *)
type state =
  | Unresolved  (** Not fetched, or its source is absent. *)
  | Pending  (** Fetching, no value yet. *)
  | Ready  (** A value. *)
  | Refreshing  (** Fetching again, the last value held. *)
  | Errored  (** The fetch failed. *)

(** Where a server-rendered resource's first value comes from. *)
type ssr_load_from = Server | Initial

val create_resource :
  ?initial_value:'a ->
  ?name:string ->
  ?defer_stream:bool ->
  ?ssr_load_from:ssr_load_from ->
  ?storage:('a option -> 'a option accessor * 'a option setter) ->
  ?on_hydrated:('a option -> unit) ->
  ('a fetch_info -> 'a Js.Promise.t) ->
  'a resource * 'a resource_actions
(** A resource fetched once, and again by {!refetch}. *)

val create_resource_from :
  ?initial_value:'a ->
  ?name:string ->
  ?defer_stream:bool ->
  ?ssr_load_from:ssr_load_from ->
  ?storage:('a option -> 'a option accessor * 'a option setter) ->
  ?on_hydrated:('a option -> unit) ->
  (unit -> 's option) ->
  ('s -> 'a fetch_info -> 'a Js.Promise.t) ->
  'a resource * 'a resource_actions
(** A resource fetched from its source's value whenever it changes, and not
    while it is [None]. A source value of [false] is fetched as any other, as
    against Solid's, which skips it. *)

val read : 'a resource -> 'a option
(** The value, tracked; [None] before the first. Reading an [Errored] resource
    raises its error, which an [ErrorBoundary] catches. *)

val state : 'a resource -> state
val loading : 'a resource -> bool
val error : 'a resource -> exn option

val latest : 'a resource -> 'a option
(** The last value, held while it is fetched again. *)

val mutate : 'a resource_actions -> 'a option -> unit
(** Sets the value without fetching. *)

val refetch : 'a resource_actions -> unit

(** {1 Arrays} *)

val map_array :
  ?fallback:(unit -> 'b) ->
  (unit -> 'a array) ->
  ('a -> int accessor -> 'b) ->
  'b array accessor
(** Maps each item once, by identity, as [For] does: an item that stays keeps
    its result, and its index is tracked. *)

val index_array :
  ?fallback:(unit -> 'b) ->
  (unit -> 'a array) ->
  ('a accessor -> int -> 'b) ->
  'b array accessor
(** Maps each index once, as [Index] does: the item at an index is tracked. *)

(** {1 Observables} *)

type 'a observable
(** An accessor as a TC39 observable, for a library that takes one. *)

type subscription

val observable : 'a accessor -> 'a observable
val subscribe : 'a observable -> ('a -> unit) -> subscription
val unsubscribe : subscription -> unit

val from : (('a -> unit) -> unit -> unit) -> 'a option accessor
(** [from produce] reads what [produce] sets: [produce set] starts it and gives
    what stops it, which runs when the owner is disposed. *)

val from_observable : 'a observable -> 'a option accessor

(** {1 Components} *)

val create_unique_id : unit -> string
(** An id unique to this render, the same on the server and in the browser. *)

type resolved
(** Children resolved to their elements, by {!children}. *)

val children : (unit -> Jsx.content) -> resolved accessor
(** [children (fun () -> props_children ())] resolves a component's children
    once, so it can look at them without creating them again. *)

val to_array : resolved -> Jsx.element array

val lazy_ : (unit -> 'props Jsx.component Js.Promise.t) -> 'props Jsx.component
(** A component loaded when it is first rendered, which suspends until it is. *)

type 'props rest
(** Props without some of their keys, given only to a spread. *)

val merge_props : 'props array -> 'props
(** Props whose each read takes the last part that has it, live: nothing is
    copied. *)

val omit : 'props -> string array -> 'props rest
(** [omit props names] is [props] without the props [names], live, for a spread:
    Solid's [splitProps], whose other half is [props] read through its getters.
    A component written by [let%component] has [Props.omit], which takes its own
    props' names as a variant. *)
