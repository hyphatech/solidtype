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

(* [eventually f] retries [f], which raises until what it checks holds, as
   Testing Library's waitFor does: a test waits for what it needs, never for
   a length of time. *)
external eventually : ((unit -> unit)[@mel.uncurry]) -> unit Js.Promise.t
  = "waitFor"
[@@mel.module "@solidjs/testing-library"]

(* What [eventually] retries: it raises while [cond] is false. *)
let holds ~what cond = if not cond then Js.Exn.raiseError ("not yet: " ^ what)

(* Resolves once the page reads [text]. *)
let page_reads text =
  eventually (fun () -> holds ~what:text (String.equal (page ()) text))
