(* Solid's Testing Library, as far as these tests reach. *)

(* A test is a run of steps that each wait: [let*] awaits a promise. *)
module Syntax = struct
  let ( let* ) p f = Js.Promise.then_ f p
end

external render : (unit -> Solidtype.Jsx.element) -> unit = "render"
[@@mel.module "@solidjs/testing-library"]

external cleanup : unit -> unit = "cleanup"
[@@mel.module "@solidjs/testing-library"]

external by_role : string -> Dom.element = "getByRole"
[@@mel.module "@solidjs/testing-library"] [@@mel.scope "screen"]

external click : Dom.element -> unit = "click"
[@@mel.module "@solidjs/testing-library"] [@@mel.scope "fireEvent"]

external text : Dom.element -> string = "textContent" [@@mel.get]
external body : Dom.element = "body" [@@mel.scope "document"]

(* What the page reads, as a person would. *)
let page () = text body

(* Resolves once what is queued now has run, a resource's fetch among it.
   It resolves to [true], since Melange calls a function of [()] with no
   argument, and [resolve] takes one. *)
let later () =
  Js.Promise.make (fun ~resolve ~reject:_ ->
      ignore
        (Js.Global.setTimeout ~f:(fun () -> (resolve true [@u])) 0
          : Js.Global.timeoutId))

external query : string -> Dom.element = "querySelector"
[@@mel.scope "document"]

external title : Dom.element -> string = "title" [@@mel.get]

(* The first element [selector] finds: its text and its title, as a person
   reads them. *)
let shown selector = (text (query selector), title (query selector))

external query_opt : string -> Dom.element Js.null = "querySelector"
[@@mel.scope "document"]

(* The element rendered first, inside the container the library mounts. *)
let first_element () = Js.Null.toOption (query_opt "body > div > *")

external tag_name : Dom.element -> string = "tagName" [@@mel.get]
external class_name : Dom.element -> string = "className" [@@mel.get]

(* Resolves after [ms] milliseconds, for what waits on a timer of its own. *)
let after ms =
  Js.Promise.make (fun ~resolve ~reject:_ ->
      ignore
        (Js.Global.setTimeout ~f:(fun () -> (resolve true [@u])) ms
          : Js.Global.timeoutId))
