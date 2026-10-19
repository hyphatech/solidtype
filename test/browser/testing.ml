(* Solid's Testing Library, as far as these tests reach. *)

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
      ignore (Js.Global.setTimeout ~f:(fun () -> (resolve true [@u])) 0))
