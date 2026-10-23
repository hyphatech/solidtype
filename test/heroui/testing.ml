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

external query_js : string -> Dom.element Js.null = "querySelector"
[@@mel.scope "document"]

(* The first element [selector] finds on the page, if any. *)
let query selector = Js.Null.toOption (query_js selector)

open Syntax

(* The state HeroUI's styles read, which React Aria writes on an element. *)
let state e =
  [
    "data-hovered";
    "data-pressed";
    "data-focused";
    "data-focus-visible";
    "data-disabled";
  ]
  |> List.filter_map (fun name ->
      Option.map (fun v -> name ^ "=" ^ v) (attribute e name))
  |> String.concat " "

(* An element hovered, pressed and let go by the mouse, left, then reached by
   Tab and pressed by Enter, then by Space: its state after each step, by the
   step's name. Each step runs through [step], a twin's act, which React asks
   of a test and Solid's side does not mind. *)
let walk ~step e =
  let user = setup () in
  let seen = ref [] in
  let after name action =
    let* () = step action in
    seen := (name, state e) :: !seen;
    Js.Promise.resolve ()
  in
  let pointer keys () =
    let* (_ : pointers) = pointer user keys in
    Js.Promise.resolve ()
  in
  let* () = after "rendered" Js.Promise.resolve in
  let* () = after "hovered" (fun () -> hover user e) in
  let* () = after "pressed" (pointer "[MouseLeft>]") in
  let* () = after "released" (pointer "[/MouseLeft]") in
  let* () = after "left" (fun () -> unhover user e) in
  let* () =
    after "tabbed to" (fun () ->
        let* () = click user body in
        tab user)
  in
  let* () = after "Enter held" (fun () -> keyboard user "{Enter>}") in
  let* () = after "Enter let go" (fun () -> keyboard user "{/Enter}") in
  let* () = after "Space held" (fun () -> keyboard user "[Space>]") in
  let* () = after "Space let go" (fun () -> keyboard user "[/Space]") in
  Js.Promise.resolve (Array.of_list (List.rev !seen))

external attribute_names : Dom.element -> string array = "getAttributeNames"
[@@mel.send]

(* What each framework writes for itself and no style reads: Solid's
   hydration key, React Aria's markers and the id it generates. *)
let framework_only = function
  | "data-hk" | "data-rac" | "data-react-aria-pressable" | "id" -> true
  | _ -> false

(* An element's attributes and their values, in order of name, but for each
   framework's own and those [but] names: the order a framework writes them in
   is its own, and no style reads it. *)
let attributes_but but e =
  attribute_names e |> Array.to_list
  |> List.filter (fun name ->
      not (framework_only name || List.exists (String.equal name) but))
  |> List.sort String.compare
  |> List.map (fun name ->
      name ^ "=" ^ Option.value (attribute e name) ~default:"")
  |> String.concat " "

let attributes e = attributes_but [] e

external query_all_in : Dom.element -> string -> Dom.element Js.Array.array_like
  = "querySelectorAll"
[@@mel.send]

external focus : Dom.element -> unit = "focus" [@@mel.send]

external create_element : string -> Dom.element = "createElement"
[@@mel.scope "document"]

external append : Dom.element -> Dom.element -> Dom.element = "appendChild"
[@@mel.send]

external remove : Dom.element -> unit = "remove" [@@mel.send]

(* How many times a field tells it is left as focus moves into each of its
   controls in turn, and then out of it to a button after it: [render on_blur]
   renders the field, found by [root], telling [on_blur] each time. *)
let blurs ~root render =
  let told = ref 0 in
  render (fun (_ : Dom.focusEvent) -> incr told);
  let outside = append body (create_element "button") in
  (match query root with
  | Some field ->
      Js.Array.from
        (query_all_in field
           "input:not([type=hidden]), textarea, [role=slider], \
            [role=spinbutton]")
      |> Array.iter focus
  | None -> ());
  focus outside;
  remove outside;
  !told
