(** Solid's renderer, [solid-js/web]: mounting, hydration and rendering on the
    server. Its components are [Portal], [Dynamic], [NoHydration], [Hydration],
    [HydrationScript] and [Assets]. *)

val render : (unit -> Jsx.element) -> Dom.element -> unit -> unit
(** [render app root] mounts [app] in [root], and gives what unmounts it. *)

val hydrate :
  ?render_id:string -> (unit -> Jsx.element) -> Dom.element -> unit -> unit
(** As {!render}, over the HTML the server rendered for [app]. *)

val is_server : bool
val is_dev : bool

val render_to_string :
  ?nonce:string -> ?render_id:string -> (unit -> Jsx.element) -> string

val render_to_string_async :
  ?timeout_ms:int ->
  ?nonce:string ->
  ?render_id:string ->
  (unit -> Jsx.element) ->
  string Js.Promise.t
(** As {!render_to_string}, once every resource read has resolved. *)

type stream
(** HTML rendered as it resolves, by {!render_to_stream}. *)

type node_writable
(** A Node [Writable]. *)

type web_writable
(** A web [WritableStream]. *)

val render_to_stream :
  ?nonce:string ->
  ?render_id:string ->
  ?on_complete_shell:((string -> unit) -> unit) ->
  ?on_complete_all:((string -> unit) -> unit) ->
  (unit -> Jsx.element) ->
  stream
(** The shell first, then each resolved part. [on_complete_shell write] and
    [on_complete_all write] may write more. *)

val pipe : stream -> node_writable -> unit
val pipe_to : stream -> web_writable -> unit

val pipe_to_node_writable :
  ?nonce:string -> (unit -> Jsx.element) -> node_writable -> unit

val pipe_to_writable :
  ?nonce:string -> (unit -> Jsx.element) -> web_writable -> unit

val generate_hydration_script :
  ?nonce:string -> ?event_names:string array -> unit -> string

type request_event
(** The request a server render answers, as the server framework gave it. *)

val get_request_event : unit -> request_event option

val use_assets : (unit -> Jsx.element) -> unit
(** Adds elements to the head of a page rendered on the server. *)

val get_assets : unit -> string
