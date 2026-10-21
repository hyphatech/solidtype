(* Solid's Testing Library, as far as the ports' tests reach. *)

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

external class_name : Dom.element -> string = "className" [@@mel.get]

external attribute_js : Dom.element -> string -> string Js.null = "getAttribute"
[@@mel.send]

let attribute e name = Js.Null.toOption (attribute_js e name)

type user

external setup : unit -> user = "setup"
[@@mel.module "@testing-library/user-event"] [@@mel.scope "default"]

external click : user -> Dom.element -> unit Js.Promise.t = "click" [@@mel.send]
external hover : user -> Dom.element -> unit Js.Promise.t = "hover" [@@mel.send]

external unhover : user -> Dom.element -> unit Js.Promise.t = "unhover"
[@@mel.send]

external tab_js : user -> unit -> unit Js.Promise.t = "tab" [@@mel.send]

let tab user = tab_js user ()

external keyboard : user -> string -> unit Js.Promise.t = "keyboard"
[@@mel.send]

type pointers

external pointer : user -> string -> pointers Js.Promise.t = "pointer"
[@@mel.send]

external body : Dom.element = "body" [@@mel.scope "document"]
