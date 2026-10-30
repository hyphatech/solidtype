(* What the tests of an rhp chart reach: a chart drawn as rhp draws it, and
   one test on an island and its twin, as drawn first or once a person has
   acted on both alike. *)

module E = Jest.Expect

(* A test is a run of steps that each wait: [let*] awaits a promise. *)
module Syntax = struct
  let ( let* ) p f = Js.Promise.then_ f p
end

open Syntax

type rendered

external render : (unit -> Solidtype.Jsx.element) -> rendered = "render"
[@@mel.module "@solidjs/testing-library"]

external cleanup : unit -> unit = "cleanup"
[@@mel.module "@solidjs/testing-library"]

external container : rendered -> Dom.element = "container" [@@mel.get]
external inner_html : Dom.element -> string = "innerHTML" [@@mel.get]

external query_all : Dom.element -> string -> Dom.element Js.Array.array_like
  = "querySelectorAll"
[@@mel.send]

external fire_click : Dom.element -> bool = "click"
[@@mel.module "@solidjs/testing-library"] [@@mel.scope "fireEvent"]

external fire_pointer_enter : Dom.element -> bool = "pointerEnter"
[@@mel.module "@solidjs/testing-library"] [@@mel.scope "fireEvent"]

(* The [n]th element, from 0, that [selector] finds in [chart]. *)
let nth selector n chart =
  let found = Js.Array.from (query_all chart selector) in
  if n < Array.length found then found.(n)
  else
    Js.Exn.raiseError
      ("no element " ^ string_of_int n ^ " of " ^ selector ^ ", of "
      ^ string_of_int (Array.length found)
      ^ " found")

(* [click selector n] and [point selector n] act on the [n]th element
   [selector] finds, as a person clicks it or moves the pointer onto it. *)
let click selector n chart = ignore (fire_click (nth selector n chart) : bool)

let point selector n chart =
  ignore (fire_pointer_enter (nth selector n chart) : bool)

external request_frame : ((float -> unit)[@mel.uncurry]) -> int
  = "requestAnimationFrame"

let next_frame () =
  Js.Promise.make (fun ~resolve ~reject:_ ->
      ignore (request_frame (fun _ -> (resolve true [@u])) : int))
  |> Js.Promise.then_ (fun (_ : bool) -> Js.Promise.resolve ())

(* rhp names a slat type's scope by its CSS, and a second type of the same
   CSS on the page, a twin's beside its island, by that name and a count:
   the count is set aside. *)
let scope_count = [%re {|/(data-rhp-slat="rhp-[a-z0-9]+)-[0-9]+"/g|}]

(* A keyed plot names its slats' ids by a count of the keyed plots drawn so
   far on the page, the twin's after the island's: the count is set aside
   too. *)
let keyed_count = [%re {|/rhp-cl-[0-9]+-/g|}]

(* The page a chart makes, once rhp has written the styles it writes a frame
   after a change, and again once [act] has acted on it. *)
let drawn ?(act = fun _ -> ()) make =
  let rendered = render make in
  let* () = next_frame () in
  let* () = next_frame () in
  act (container rendered);
  let* () = next_frame () in
  let* () = next_frame () in
  let html =
    inner_html (container rendered)
    |> Js.String.replaceByRe ~regexp:scope_count ~replacement:{|$1"|}
    |> Js.String.replaceByRe ~regexp:keyed_count ~replacement:"rhp-cl-"
  in
  cleanup ();
  Js.Promise.resolve html

(* [alike name ~island ~twin]: the island draws what its twin, the same
   chart in rhp's JSX, draws. *)
let alike name ~island ~twin =
  Jest.describe name (fun () ->
      Jest.testPromise "draws what rhp's JSX draws" (fun () ->
          let* ocaml = drawn island in
          let* tsx = drawn twin in
          Js.Promise.resolve E.(expect ocaml |> toEqual tsx)))

(* [alike_after name what ~act ~island ~twin]: once [act], [what] it does,
   has acted on each, the island draws what its twin draws. *)
let alike_after name what ~act ~island ~twin =
  Jest.describe name (fun () ->
      Jest.testPromise ("draws what rhp's JSX draws once " ^ what) (fun () ->
          let* ocaml = drawn ~act island in
          let* tsx = drawn ~act twin in
          Js.Promise.resolve E.(expect ocaml |> toEqual tsx)))
