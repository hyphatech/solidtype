type 'a accessor = (unit -> 'a[@u])
type 'a setter
type 'a equals = By of ('a -> 'a -> bool) | Never

(* Inlined, so a read is the call Solid's own JSX would make, [count()]. *)
let[@inline] get (f : 'a accessor) = f () [@u]

(* Solid's [equals] is a function or [false]. *)
type 'a js_equals

external equals_by : (('a -> 'a -> bool)[@u]) -> 'a js_equals = "%identity"
external equals_never : bool -> 'a js_equals = "%identity"

let js_equals = function
  | By f -> equals_by (fun[@u] a b -> f a b)
  | Never -> equals_never false

type 'a options

external options : ?equals:'a js_equals -> ?name:string -> unit -> 'a options
  = ""
[@@mel.obj]

external signal : 'a -> 'a accessor * 'a setter = "createSignal"
[@@mel.module "solid-js"]

external signal_with : 'a -> 'a options -> 'a accessor * 'a setter
  = "createSignal"
[@@mel.module "solid-js"]

let[@inline] create_signal ?equals ?name v =
  match (equals, name) with
  | None, None -> signal v
  | _ -> signal_with v (options ?equals:(Option.map js_equals equals) ?name ())

external value_setter : 'a setter -> ('a -> unit[@u]) = "%identity"
external function_setter : 'a setter -> (('a -> 'a) -> unit[@u]) = "%identity"

(* A setter given a function calls it with the value, so a value that is a
   function goes inside one that returns it. *)
let[@inline] set s v =
  if String.equal (Js.typeof v) "function" then
    (function_setter s) (fun _ -> v) [@u]
  else (value_setter s) v [@u]

let[@inline] update s f = (function_setter s) f [@u]

external memo :
  ((unit -> 'a)[@mel.uncurry]) -> 'a Js.undefined -> 'a options -> 'a accessor
  = "createMemo"
[@@mel.module "solid-js"]

external memo_from :
  (('a -> 'a)[@mel.uncurry]) -> 'a -> 'a options -> 'a accessor = "createMemo"
[@@mel.module "solid-js"]

let create_memo ?equals ?name f =
  memo f Js.undefined (options ?equals:(Option.map js_equals equals) ?name ())

let create_memo_from ?equals ?name ~init f =
  memo_from f init (options ?equals:(Option.map js_equals equals) ?name ())

type effect_options

external effect_options : ?name:string -> unit -> effect_options = ""
[@@mel.obj]

external effect_js :
  ((unit -> unit)[@mel.uncurry]) -> unit Js.undefined -> effect_options -> unit
  = "createEffect"
[@@mel.module "solid-js"]

external effect_from_js :
  (('a -> 'a)[@mel.uncurry]) -> 'a -> effect_options -> unit = "createEffect"
[@@mel.module "solid-js"]

external render_effect :
  ((unit -> unit)[@mel.uncurry]) -> unit Js.undefined -> effect_options -> unit
  = "createRenderEffect"
[@@mel.module "solid-js"]

external render_effect_from :
  (('a -> 'a)[@mel.uncurry]) -> 'a -> effect_options -> unit
  = "createRenderEffect"
[@@mel.module "solid-js"]

external computed :
  ((unit -> unit)[@mel.uncurry]) -> unit Js.undefined -> effect_options -> unit
  = "createComputed"
[@@mel.module "solid-js"]

external computed_from :
  (('a -> 'a)[@mel.uncurry]) -> 'a -> effect_options -> unit = "createComputed"
[@@mel.module "solid-js"]

let create_effect ?name f = effect_js f Js.undefined (effect_options ?name ())

let create_effect_from ?name ~init f =
  effect_from_js f init (effect_options ?name ())

let create_render_effect ?name f =
  render_effect f Js.undefined (effect_options ?name ())

let create_render_effect_from ?name ~init f =
  render_effect_from f init (effect_options ?name ())

let create_computed ?name f = computed f Js.undefined (effect_options ?name ())

let create_computed_from ?name ~init f =
  computed_from f init (effect_options ?name ())

type 'a deferred_options

external deferred_options :
  ?timeoutMs:int ->
  ?equals:'a js_equals ->
  ?name:string ->
  unit ->
  'a deferred_options = ""
[@@mel.obj]

external deferred :
  ((unit -> 'a)[@mel.uncurry]) -> 'a deferred_options -> 'a accessor
  = "createDeferred"
[@@mel.module "solid-js"]

let create_deferred ?timeout_ms ?equals ?name f =
  deferred f
    (deferred_options ?timeoutMs:timeout_ms
       ?equals:(Option.map js_equals equals)
       ?name ())

external selector :
  ((unit -> 'a)[@mel.uncurry]) ->
  (('k -> 'a -> bool)[@u]) Js.undefined ->
  ('k -> bool[@u]) = "createSelector"
[@@mel.module "solid-js"]

let create_selector ?equals source =
  let is =
    selector source
      (Js.Undefined.fromOption
         (Option.map (fun f -> fun[@u] k a -> f k a) equals))
  in
  fun k -> (is k [@u])

external reaction :
  ((unit -> unit)[@mel.uncurry]) ->
  effect_options ->
  ((unit -> unit) -> unit[@u]) = "createReaction"
[@@mel.module "solid-js"]

let create_reaction ?name on_invalidate =
  let track = reaction on_invalidate (effect_options ?name ()) in
  fun f -> (track f [@u])

type on_options

external on_options : ?defer:bool -> unit -> on_options = "" [@@mel.obj]

external on_js :
  ((unit -> 'd)[@mel.uncurry]) ->
  (('d -> 'd option -> 'a -> 'a)[@mel.uncurry]) ->
  on_options ->
  ('a -> 'a[@u]) = "on"
[@@mel.module "solid-js"]

(* An effect's [on] is called with no previous value, which a function of
   [unit] is in Melange. *)
external on_effect_js :
  ((unit -> 'd)[@mel.uncurry]) ->
  (('d -> 'd option -> unit -> unit)[@mel.uncurry]) ->
  on_options ->
  (unit -> unit[@u]) = "on"
[@@mel.module "solid-js"]

let on ?defer deps f =
  let run =
    on_effect_js deps (fun d previous () -> f d previous) (on_options ?defer ())
  in
  fun () -> (run () [@u])

let on_from ?defer deps f =
  let run = on_js deps f (on_options ?defer ()) in
  fun v -> (run v [@u])

external batch : ((unit -> 'a)[@mel.uncurry]) -> 'a = "batch"
[@@mel.module "solid-js"]

external untrack : ((unit -> 'a)[@mel.uncurry]) -> 'a = "untrack"
[@@mel.module "solid-js"]

type owner

external root :
  ((((unit -> unit)[@u]) -> 'a)[@mel.uncurry]) -> owner Js.undefined -> 'a
  = "createRoot"
[@@mel.module "solid-js"]

let create_root ?owner f =
  root
    (fun dispose -> f (fun () -> (dispose () [@u])))
    (Js.Undefined.fromOption owner)

external owner : unit -> owner Js.null = "getOwner" [@@mel.module "solid-js"]

let get_owner () = Js.Null.toOption (owner ())

external run_with_owner : owner -> ((unit -> 'a)[@mel.uncurry]) -> 'a option
  = "runWithOwner"
[@@mel.module "solid-js"]

external on_mount : ((unit -> unit)[@mel.uncurry]) -> unit = "onMount"
[@@mel.module "solid-js"]

external cleanup : ((unit -> unit)[@mel.uncurry]) -> (unit -> unit[@u])
  = "onCleanup"
[@@mel.module "solid-js"]

let on_cleanup f = ignore (cleanup f)

external cause : 'e -> 'c Js.undefined = "cause" [@@mel.get]

(* Solid wraps a thrown value that is not an Error in one, the value as its
   cause, so an OCaml exception reaches a handler inside it. *)
let exn_of_thrown e =
  if Js.Exn.isCamlExceptionOrOpenVariant e then Js.Exn.anyToExnInternal e
  else if
    String.equal (Js.typeof e) "object"
    && not (Js.Nullable.isNullable (Js.Nullable.return e))
  then
    match Js.Undefined.toOption (cause e) with
    | Some c when Js.Exn.isCamlExceptionOrOpenVariant c ->
        Js.Exn.anyToExnInternal c
    | _ -> Js.Exn.anyToExnInternal e
  else Js.Exn.anyToExnInternal e

let exn_of_error = exn_of_thrown

external catch_error_js :
  ((unit -> 'a)[@mel.uncurry]) -> (('e -> unit)[@mel.uncurry]) -> 'a option
  = "catchError"
[@@mel.module "solid-js"]

let catch_error f handler = catch_error_js f (fun e -> handler (exn_of_error e))

external on_error_js : (('e -> unit)[@mel.uncurry]) -> unit = "onError"
[@@mel.module "solid-js"]

let on_error handler = on_error_js (fun e -> handler (exn_of_error e))

external start_transition : ((unit -> unit)[@mel.uncurry]) -> unit Js.Promise.t
  = "startTransition"
[@@mel.module "solid-js"]

external transition :
  unit -> bool accessor * (((unit -> unit) -> unit Js.Promise.t)[@u])
  = "useTransition"
[@@mel.module "solid-js"]

let use_transition () =
  let pending, start = transition () in
  (pending, fun f -> (start f [@u]))

type 'a resource
type 'a resource_actions
type 'a fetch_info = { value : 'a option; refetching : bool }
type state = Unresolved | Pending | Ready | Refreshing | Errored
type ssr_load_from = Server | Initial
type 'a resource_options

external resource_options :
  ?initialValue:'a ->
  ?name:string ->
  ?deferStream:bool ->
  ?ssrLoadFrom:string ->
  ?storage:('a option -> 'a option accessor * 'a option setter) ->
  ?onHydrated:(('k -> 'a fetch_info -> unit)[@u]) ->
  unit ->
  'a resource_options = ""
[@@mel.obj]

let resource_options ?initial_value ?name ?defer_stream ?ssr_load_from ?storage
    ?on_hydrated () =
  resource_options ?initialValue:initial_value ?name ?deferStream:defer_stream
    ?ssrLoadFrom:
      (Option.map
         (function Server -> "server" | Initial -> "initial")
         ssr_load_from)
    ?storage
    ?onHydrated:
      (Option.map
         (fun f -> fun[@u] _ (info : _ fetch_info) -> f info.value)
         on_hydrated)
    ()

(* Without a source, Solid calls the fetch with [true] for it, then the
   info. *)
external resource :
  ((bool -> 'a fetch_info -> 'a Js.Promise.t)[@mel.uncurry]) ->
  'a resource_options ->
  'a resource * 'a resource_actions = "createResource"
[@@mel.module "solid-js"]

(* Solid skips a source that is [false], so the source's value travels in a
   box, and [Some false] is fetched as any other. *)
type 's box = { boxed : 's }

external resource_from :
  ((unit -> 's box Js.undefined)[@mel.uncurry]) ->
  (('s box -> 'a fetch_info -> 'a Js.Promise.t)[@mel.uncurry]) ->
  'a resource_options ->
  'a resource * 'a resource_actions = "createResource"
[@@mel.module "solid-js"]

let create_resource ?initial_value ?name ?defer_stream ?ssr_load_from ?storage
    ?on_hydrated fetch =
  resource
    (fun _ info -> fetch info)
    (resource_options ?initial_value ?name ?defer_stream ?ssr_load_from ?storage
       ?on_hydrated ())

let create_resource_from ?initial_value ?name ?defer_stream ?ssr_load_from
    ?storage ?on_hydrated source fetch =
  resource_from
    (fun () ->
      match source () with
      | Some s -> Js.Undefined.return { boxed = s }
      | None -> Js.undefined)
    (fun box info -> fetch box.boxed info)
    (resource_options ?initial_value ?name ?defer_stream ?ssr_load_from ?storage
       ?on_hydrated ())

external resource_accessor : 'a resource -> 'a option accessor = "%identity"

let[@inline] read r = get (resource_accessor r)

external state_name : 'a resource -> string = "state" [@@mel.get]

let state r =
  match state_name r with
  | "pending" -> Pending
  | "ready" -> Ready
  | "refreshing" -> Refreshing
  | "errored" -> Errored
  | _ -> Unresolved

external loading : 'a resource -> bool = "loading" [@@mel.get]
external error_value : 'a resource -> 'e Js.undefined = "error" [@@mel.get]

let error r = Option.map exn_of_error (Js.Undefined.toOption (error_value r))

external latest : 'a resource -> 'a option = "latest" [@@mel.get]

external mutator : 'a resource_actions -> 'a option setter = "mutate"
[@@mel.get]

let mutate actions v = set (mutator actions) v

external refetch_js : 'a resource_actions -> unit -> unit = "refetch"
[@@mel.send]

let refetch actions = refetch_js actions ()

type 'b array_options

external array_options : ?fallback:(unit -> 'b) -> unit -> 'b array_options = ""
[@@mel.obj]

external map_array_js :
  ((unit -> 'a array)[@mel.uncurry]) ->
  (('a -> int accessor -> 'b)[@mel.uncurry]) ->
  'b array_options ->
  'b array accessor = "mapArray"
[@@mel.module "solid-js"]

external index_array_js :
  ((unit -> 'a array)[@mel.uncurry]) ->
  (('a accessor -> int -> 'b)[@mel.uncurry]) ->
  'b array_options ->
  'b array accessor = "indexArray"
[@@mel.module "solid-js"]

let map_array ?fallback items f =
  map_array_js items f (array_options ?fallback ())

let index_array ?fallback items f =
  index_array_js items f (array_options ?fallback ())

type 'a observable
type subscription

external observable : 'a accessor -> 'a observable = "observable"
[@@mel.module "solid-js"]

external subscribe : 'a observable -> ('a -> unit) -> subscription = "subscribe"
[@@mel.send]

external unsubscribe_js : subscription -> unit -> unit = "unsubscribe"
[@@mel.send]

let unsubscribe s = unsubscribe_js s ()

external from_js :
  (('a option setter -> (unit -> unit[@u]))[@mel.uncurry]) -> 'a option accessor
  = "from"
[@@mel.module "solid-js"]

let from produce =
  from_js (fun s ->
      let stop = produce (fun v -> set s (Some v)) in
      fun[@u] () -> stop ())

external from_observable : 'a observable -> 'a option accessor = "from"
[@@mel.module "solid-js"]

external create_unique_id : unit -> string = "createUniqueId"
[@@mel.module "solid-js"]

type resolved

external children : ((unit -> Jsx.content)[@mel.uncurry]) -> resolved accessor
  = "children"
[@@mel.module "solid-js"]

external is_array : resolved -> bool = "isArray" [@@mel.scope "Array"]
external elements : resolved -> Jsx.element array = "%identity"
external element : resolved -> Jsx.element = "%identity"

let to_array r =
  if is_array r then elements r
  else if Js.Nullable.isNullable (Js.Nullable.return r) then [||]
  else [| element r |]

(* Solid's [lazy] takes what a dynamic import gives: a module, its component
   as [default]. *)
external lazy_js :
  ((unit -> < default : 'props Jsx.component > Js.t Js.Promise.t)[@mel.uncurry]) ->
  'props Jsx.component = "lazy"
[@@mel.module "solid-js"]

let lazy_ load =
  lazy_js (fun () ->
      Js.Promise.then_
        (fun c -> Js.Promise.resolve [%mel.obj { default = c }])
        (load ()))

type 'props rest

external merge_props : 'props array -> 'props = "mergeProps"
[@@mel.module "solid-js"] [@@mel.variadic]

external split_props : 'props -> string array -> 'props * 'props rest
  = "splitProps"
[@@mel.module "solid-js"]

let omit props names = snd (split_props props names)
