(* Solid's Testing Library, as far as these tests reach. *)

(* A test is a run of steps that each wait: [let*] awaits a promise. *)
module Syntax = struct
  let ( let* ) p f = Js.Promise.then_ f p
end

external render : (unit -> Solidtype.Jsx.element) -> unit = "render"
[@@mel.module "@solidjs/testing-library"]

external cleanup : unit -> unit = "cleanup"
[@@mel.module "@solidjs/testing-library"]

external text : Dom.element -> string = "textContent" [@@mel.get]

external find_by_text : string -> Dom.element Js.Promise.t = "findByText"
[@@mel.module "@solidjs/testing-library"] [@@mel.scope "screen"]

external by_label : string -> Dom.element = "getByLabelText"
[@@mel.module "@solidjs/testing-library"] [@@mel.scope "screen"]

type query

external query : name:string -> unit -> query = "" [@@mel.obj]

external by_role_named_js : string -> query -> Dom.element = "getByRole"
[@@mel.module "@solidjs/testing-library"] [@@mel.scope "screen"]

let by_role_named role name = by_role_named_js role (query ~name ())

external find_by_role_named_js : string -> query -> Dom.element Js.Promise.t
  = "findByRole"
[@@mel.module "@solidjs/testing-library"] [@@mel.scope "screen"]

(* As [by_role_named], once the page shows it: a modal dialog closing gives
   the page back to the accessibility tree a frame or more later. *)
let find_by_role_named role name = find_by_role_named_js role (query ~name ())

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

(* user-event, for what Kobalte opens on a pointer's press rather than a
   click: a menu, a select. *)
type user
type user_options

external user_options :
  pointer_events_check:(int[@mel.as "pointerEventsCheck"]) ->
  unit ->
  user_options = ""
[@@mel.obj]

external setup_js : user_options -> user = "setup"
[@@mel.module "@testing-library/user-event"] [@@mel.scope "default"]

(* jsdom lays nothing out, so no element is under the pointer to check. *)
let setup () = setup_js (user_options ~pointer_events_check:0 ())

external press : user -> Dom.element -> unit Js.Promise.t = "click" [@@mel.send]

external type_into : user -> Dom.element -> string -> unit Js.Promise.t = "type"
[@@mel.send]

external all_by_role_named_js : string -> query -> Dom.element array
  = "queryAllByRole"
[@@mel.module "@solidjs/testing-library"] [@@mel.scope "screen"]

let all_by_role_named role name = all_by_role_named_js role (query ~name ())
