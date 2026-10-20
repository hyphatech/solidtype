type string_options

external string_options :
  ?timeoutMs:int -> ?nonce:string -> ?renderId:string -> unit -> string_options
  = ""
[@@mel.obj]

external render_to_string_js :
  ((unit -> Jsx.element)[@mel.uncurry]) -> string_options -> string
  = "renderToString"
[@@mel.module "solid-js/web"]

let render_to_string ?nonce ?render_id app =
  render_to_string_js app (string_options ?nonce ?renderId:render_id ())

external render_to_string_async_js :
  ((unit -> Jsx.element)[@mel.uncurry]) -> string_options -> string Js.Promise.t
  = "renderToStringAsync"
[@@mel.module "solid-js/web"]

(* Solid's server build rejects this promise only when the render outlasts its
   time, with a string that says so; anything else rejecting is a bug, left a
   rejection. *)
let timed_out = "renderToString timed out"

let render_to_string_async ?timeout_ms ?nonce ?render_id app =
  render_to_string_async_js app
    (string_options ?timeoutMs:timeout_ms ?nonce ?renderId:render_id ())
  |> Js.Promise.then_ (fun html -> Js.Promise.resolve (Ok html))
  |> Js.Promise.catch (fun e ->
      match Js.Types.classify e with
      | JSString reason when String.equal reason timed_out ->
          Js.Promise.resolve (Error `Timed_out)
      | _ -> Js.Promise.reject (Js.Exn.anyToExnInternal e))

type stream
type writable

(* What Solid writes to a writable, its text encoded as UTF-8, and what reads
   it back: both the web's own, as every server runtime has them. *)
type chunk
type decoder
type decode_options
type sink

external decoder : unit -> decoder = "TextDecoder" [@@mel.new]
external decode_options : stream:bool -> unit -> decode_options = "" [@@mel.obj]

external decode : decoder -> chunk -> decode_options -> string = "decode"
[@@mel.send]

external sink : write:(chunk -> unit) -> close:(unit -> unit) -> unit -> sink
  = ""
[@@mel.obj]

external writable_of_sink : sink -> writable = "WritableStream" [@@mel.new]

let writable ~write ?(close = fun () -> ()) () =
  let d = decoder () in
  writable_of_sink
    (sink
       ~write:(fun chunk ->
         write (decode d chunk (decode_options ~stream:true ())))
       ~close ())

(* What Solid gives a completion callback: the stream's [write]. *)
type completion

external write : completion -> string -> unit = "write" [@@mel.send]

type stream_options

external stream_options :
  ?nonce:string ->
  ?renderId:string ->
  ?onCompleteShell:(completion -> unit) ->
  ?onCompleteAll:(completion -> unit) ->
  unit ->
  stream_options = ""
[@@mel.obj]

external render_to_stream_js :
  ((unit -> Jsx.element)[@mel.uncurry]) -> stream_options -> stream
  = "renderToStream"
[@@mel.module "solid-js/web"]

let render_to_stream ?nonce ?render_id ?on_complete_shell ?on_complete_all app =
  let given f = Option.map (fun f c -> f (write c)) f in
  render_to_stream_js app
    (stream_options ?nonce ?renderId:render_id
       ?onCompleteShell:(given on_complete_shell)
       ?onCompleteAll:(given on_complete_all) ())

external pipe_to : stream -> writable -> unit Js.Promise.t = "pipeTo"
[@@mel.send]

type pipe_options

external pipe_options : ?nonce:string -> unit -> pipe_options = "" [@@mel.obj]

external pipe_to_writable_js :
  ((unit -> Jsx.element)[@mel.uncurry]) -> writable -> pipe_options -> unit
  = "pipeToWritable"
[@@mel.module "solid-js/web"]

let pipe_to_writable ?nonce app w =
  pipe_to_writable_js app w (pipe_options ?nonce ())

type script_options

external script_options :
  ?nonce:string -> ?eventNames:string array -> unit -> script_options = ""
[@@mel.obj]

external generate_hydration_script_js : script_options -> string
  = "generateHydrationScript"
[@@mel.module "solid-js/web"]

let generate_hydration_script ?nonce ?event_names () =
  generate_hydration_script_js
    (script_options ?nonce ?eventNames:event_names ())

type request_event

external get_request_event : unit -> request_event option = "getRequestEvent"
[@@mel.module "solid-js/web"]

external use_assets : ((unit -> Jsx.element)[@mel.uncurry]) -> unit
  = "useAssets"
[@@mel.module "solid-js/web"]

external get_assets : unit -> string = "getAssets" [@@mel.module "solid-js/web"]
