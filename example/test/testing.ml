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
external class_name : Dom.element -> string = "className" [@@mel.get]
external checked : Dom.element -> bool = "checked" [@@mel.get]

external find_by_text : string -> Dom.element Js.Promise.t = "findByText"
[@@mel.module "@solidjs/testing-library"] [@@mel.scope "screen"]

external by_label : string -> Dom.element = "getByLabelText"
[@@mel.module "@solidjs/testing-library"] [@@mel.scope "screen"]

external set_value : Dom.element -> string -> unit = "value" [@@mel.set]

external input : Dom.element -> unit = "input"
[@@mel.module "@solidjs/testing-library"] [@@mel.scope "fireEvent"]

(* What vitest's global setup provided: the example server's origin. *)
external inject : string -> string = "inject" [@@mel.module "vitest"]
