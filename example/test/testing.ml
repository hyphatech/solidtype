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
external class_name : Dom.element -> string = "className" [@@mel.get]
external checked : Dom.element -> bool = "checked" [@@mel.get]

external find_by_text : string -> Dom.element Js.Promise.t = "findByText"
[@@mel.module "@solidjs/testing-library"] [@@mel.scope "screen"]

external by_label : string -> Dom.element = "getByLabelText"
[@@mel.module "@solidjs/testing-library"] [@@mel.scope "screen"]

external set_value : Dom.element -> string -> unit = "value" [@@mel.set]

external input : Dom.element -> unit = "input"
[@@mel.module "@solidjs/testing-library"] [@@mel.scope "fireEvent"]

type query

external query : name:string -> unit -> query = "" [@@mel.obj]

external by_role_named_js : string -> query -> Dom.element = "getByRole"
[@@mel.module "@solidjs/testing-library"] [@@mel.scope "screen"]

let by_role_named role name = by_role_named_js role (query ~name ())

external by_text : string -> Dom.element = "getByText"
[@@mel.module "@solidjs/testing-library"] [@@mel.scope "screen"]

external find_by_label : string -> Dom.element Js.Promise.t = "findByLabelText"
[@@mel.module "@solidjs/testing-library"] [@@mel.scope "screen"]

external closest : Dom.element -> string -> Dom.element Js.null = "closest"
[@@mel.send]

external attribute : Dom.element -> string -> string Js.null = "getAttribute"
[@@mel.send]

(* The board's column an element is in, by the column's label. *)
let column e =
  match Js.Null.toOption (closest e "section") with
  | None -> None
  | Some section -> Js.Null.toOption (attribute section "aria-label")

(* [eventually f] retries [f], which raises until what it checks holds, as
   Testing Library's waitFor does, for a change a call to the server away. *)
external eventually : ((unit -> unit)[@mel.uncurry]) -> unit Js.Promise.t
  = "waitFor"
[@@mel.module "@solidjs/testing-library"]

(* An assertion inside [eventually]: it throws, which fails the try. *)
let expect_equal ~what expected actual =
  if not (String.equal expected actual) then
    Js.Exn.raiseError (what ^ ": expected " ^ expected ^ ", got " ^ actual)
