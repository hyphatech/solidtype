(* What the tests of a Kobalte component reach: Solid's Testing Library,
   user-event and axe, and running one test on an island and its twin. *)

module E = Jest.Expect

(* A test is a run of steps that each wait: [let*] awaits a promise. *)
module Syntax = struct
  let ( let* ) p f = Js.Promise.then_ f p
end

open Syntax

external render : (unit -> Solidtype.Jsx.element) -> unit = "render"
[@@mel.module "@solidjs/testing-library"]

external cleanup : unit -> unit = "cleanup"
[@@mel.module "@solidjs/testing-library"]

type query

external query : name:string -> unit -> query = "" [@@mel.obj]

external by_role_named : string -> query -> Dom.element = "getByRole"
[@@mel.module "@solidjs/testing-library"] [@@mel.scope "screen"]

external by_role : string -> Dom.element = "getByRole"
[@@mel.module "@solidjs/testing-library"] [@@mel.scope "screen"]

external all_by_role : string -> Dom.element array = "queryAllByRole"
[@@mel.module "@solidjs/testing-library"] [@@mel.scope "screen"]

external by_text : string -> Dom.element = "getByText"
[@@mel.module "@solidjs/testing-library"] [@@mel.scope "screen"]

external attribute_js : Dom.element -> string -> string Js.null = "getAttribute"
[@@mel.send]

let attribute e name = Js.Null.toOption (attribute_js e name)

external text : Dom.element -> string = "textContent" [@@mel.get]
external focused : Dom.element = "activeElement" [@@mel.scope "document"]
external body : Dom.element = "body" [@@mel.scope "document"]

(* What has focus, by its text or label. *)
let focused_label () =
  match attribute focused "aria-label" with Some l -> l | None -> text focused

type user

external setup : unit -> user = "setup"
[@@mel.module "@testing-library/user-event"] [@@mel.scope "default"]

external click : user -> Dom.element -> unit Js.Promise.t = "click" [@@mel.send]

external keyboard : user -> string -> unit Js.Promise.t = "keyboard"
[@@mel.send]

external tab_js : user -> unit -> unit Js.Promise.t = "tab" [@@mel.send]

let tab user = tab_js user ()

(* [eventually f] retries [f], which raises until what it checks holds, as
   Testing Library's waitFor does, for a change a frame or more away. *)
external eventually : ((unit -> unit)[@mel.uncurry]) -> unit Js.Promise.t
  = "waitFor"
[@@mel.module "@solidjs/testing-library"]

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
   left out: colour contrast and landmarks. Nor does jsdom have a canvas, so
   the checks axe makes by measuring text on one do not run. *)
let accessibility_violations () =
  let off = rule ~enabled:false () in
  let* results =
    axe_run body
      (axe_options ~rules:(rules ~color_contrast:off ~region:off ()) ())
  in
  Js.Promise.resolve (Array.map violation_id (violations results))

type style

external style : Dom.element -> style = "style" [@@mel.get]
external pointer_events : style -> string = "pointerEvents" [@@mel.get]

(* A modal overlay takes pointer events from the page while it is open, and
   hides the rest of it from the accessibility tree, and gives both back
   once it closes: each test waits for that, so none reaches the next, and
   no click or query of the next is refused. *)
let released () =
  eventually (fun () ->
      if String.equal (pointer_events (style body)) "none" then
        Js.Exn.raiseError "the page still refuses pointer events";
      if Option.is_some (attribute body "aria-hidden") then
        Js.Exn.raiseError "the page is still hidden from the accessibility tree")

(* [alike name ~island ~twin check]: [check] passes on the OCaml island and
   on its TSX twin, and axe finds no violation in either. *)
let alike name ~island ~twin check =
  Jest.describe name (fun () ->
      (* vitest runs these last first: cleanup, then the release waited for. *)
      Jest.afterEachPromise released;
      Jest.afterEach cleanup;
      List.iter
        (fun (which, make) ->
          Jest.testPromise which (fun () ->
              render make;
              let* () = check (setup ()) in
              let* found = accessibility_violations () in
              Js.Promise.resolve E.(expect found |> toEqual [||])))
        [ ("in OCaml", island); ("its TSX twin", twin) ])

(* An assertion inside a check: it throws, which fails the test. *)
let expect_equal ~what expected actual =
  if not (String.equal expected actual) then
    Js.Exn.raiseError
      (Printf.sprintf "%s: expected %S, got %S" what expected actual)

external checked : Dom.element -> bool = "checked" [@@mel.get]
