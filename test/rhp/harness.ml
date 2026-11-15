(* What the tests of rhp's charts reach: Solid's Testing Library, the page,
   and a frame, which rhp draws a changed row on. *)

module Syntax = struct
  let ( let* ) p f = Js.Promise.then_ f p
end

external promise : ((('a -> unit) -> unit)[@mel.uncurry]) -> 'a Js.Promise.t
  = "Promise"
[@@mel.new]

external request_frame : ((float -> unit)[@mel.uncurry]) -> int
  = "requestAnimationFrame"

let frame () =
  promise (fun resolve -> ignore (request_frame (fun _ -> resolve ()) : int))

external render : (unit -> Solidtype.Jsx.element) -> unit = "render"
[@@mel.module "@solidjs/testing-library"]

external cleanup : unit -> unit = "cleanup"
[@@mel.module "@solidjs/testing-library"]

external query : string -> Dom.element = "querySelector"
[@@mel.scope "document"]

external query_all : string -> Dom.element array = "querySelectorAll"
[@@mel.scope "document"]

external text : Dom.element -> string = "textContent" [@@mel.get]
external style : Dom.element -> Dom.cssStyleDeclaration = "style" [@@mel.get]

external property : Dom.cssStyleDeclaration -> string -> string
  = "getPropertyValue"
[@@mel.send]

(* An element's custom property, the value rhp places it by. *)
let custom name e = property (style e) name
