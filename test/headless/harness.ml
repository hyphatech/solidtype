(* What the tests of a headless component reach: Solid's Testing Library,
   user-event and axe. *)

(* A test is a run of steps that each wait: [let*] awaits a promise. *)
module Syntax = struct
  let ( let* ) p f = Js.Promise.then_ f p
end

open Syntax

external render : (unit -> Solidtype.Jsx.element) -> unit = "render"
[@@mel.module "@solidjs/testing-library"]

external cleanup : unit -> unit = "cleanup"
[@@mel.module "@solidjs/testing-library"]

external by_text : string -> Dom.element = "getByText"
[@@mel.module "@solidjs/testing-library"] [@@mel.scope "screen"]

external all_by_role : string -> Dom.element array = "queryAllByRole"
[@@mel.module "@solidjs/testing-library"] [@@mel.scope "screen"]

external attribute_js : Dom.element -> string -> string Js.null = "getAttribute"
[@@mel.send]

let attribute e name = Js.Null.toOption (attribute_js e name)

external text : Dom.element -> string = "textContent" [@@mel.get]
external focused : Dom.element = "activeElement" [@@mel.scope "document"]
external body : Dom.element = "body" [@@mel.scope "document"]
external focus : Dom.element -> unit = "focus" [@@mel.send]

external by_id : string -> Dom.element Js.null = "getElementById"
[@@mel.scope "document"]

external parent : Dom.element -> Dom.element Js.null = "parentElement"
[@@mel.get]

type user

external setup : unit -> user = "setup"
[@@mel.module "@testing-library/user-event"] [@@mel.scope "default"]

external click : user -> Dom.element -> unit Js.Promise.t = "click" [@@mel.send]

external keyboard : user -> string -> unit Js.Promise.t = "keyboard"
[@@mel.send]

external dbl_click : user -> Dom.element -> unit Js.Promise.t = "dblClick"
[@@mel.send]

type pointer_action

external pointer_action : keys:string -> target:Dom.element -> pointer_action
  = ""
[@@mel.obj]

external pointer : user -> pointer_action array -> unit Js.Promise.t = "pointer"
[@@mel.send]

(* A wait as long as a touch is held. *)
let sleep ms =
  Js.Promise.make (fun ~resolve ~reject:_ ->
      let (_ : Js.Global.timeoutId) =
        Js.Global.setTimeout ~f:(fun () -> (resolve true [@u])) ms
      in
      ())
  |> Js.Promise.then_ (fun (_ : bool) -> Js.Promise.resolve ())

external tab_js : user -> unit -> unit Js.Promise.t = "tab" [@@mel.send]

let tab user = tab_js user ()

type rule
type rules
type axe_options
type results
type violation

external rule : enabled:bool -> unit -> rule = "" [@@mel.obj]

external rules :
  color_contrast:(rule[@mel.as "color-contrast"]) ->
  region:rule ->
  unit ->
  rules = ""
[@@mel.obj]

external axe_options : rules:rules -> unit -> axe_options = "" [@@mel.obj]

external axe_run : Dom.element -> axe_options -> results Js.Promise.t = "run"
[@@mel.module "axe-core"] [@@mel.scope "default"]

external violations : results -> violation array = "violations" [@@mel.get]
external violation_id : violation -> string = "id" [@@mel.get]

(* The rules axe cannot judge without layout, which jsdom has none of, are
   left out: colour contrast and landmarks. *)
let accessibility_violations () =
  let off = rule ~enabled:false () in
  let* results =
    axe_run body
      (axe_options ~rules:(rules ~color_contrast:off ~region:off ()) ())
  in
  Js.Promise.resolve (Array.map violation_id (violations results))
