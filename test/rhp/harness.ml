(* What the tests of an rhp chart reach: a chart drawn as rhp draws it, and
   one test on an island and its twin. *)

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

(* The page a chart makes, once rhp has written the styles it writes a frame
   after a change. *)
let drawn make =
  let rendered = render make in
  let* () = next_frame () in
  let* () = next_frame () in
  let html =
    Js.String.replaceByRe ~regexp:scope_count ~replacement:{|$1"|}
      (inner_html (container rendered))
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
