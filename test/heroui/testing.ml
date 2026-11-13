(* Solid's Testing Library, as far as the ports' tests reach. *)

(* A test is a run of steps that each wait: [let*] awaits a promise. *)
module Syntax = struct
  let ( let* ) p f = Js.Promise.then_ f p
end

(* A promise made by an OCaml function given [resolve], as JavaScript's own
   constructor makes one. *)
external promise : ((('a -> unit) -> unit)[@mel.uncurry]) -> 'a Js.Promise.t
  = "Promise"
[@@mel.new]

external request_frame : ((float -> unit)[@mel.uncurry]) -> int
  = "requestAnimationFrame"

(* [ms] milliseconds passed. *)
let wait ms =
  promise (fun resolve ->
      ignore
        (Js.Global.setTimeout ~f:(fun () -> resolve ()) ms
          : Js.Global.timeoutId))

(* A frame drawn, as a browser draws one after the page changes. *)
let frame () =
  promise (fun resolve -> ignore (request_frame (fun _ -> resolve ()) : int))

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

external dbl_click : user -> Dom.element -> unit Js.Promise.t = "dblClick"
[@@mel.send]

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
    "data-pending";
    "data-dragging";
  ]
  |> List.filter_map (fun name ->
      Option.map (fun v -> name ^ "=" ^ v) (attribute e name))
  |> String.concat " "

external text_content : Dom.element -> string = "textContent" [@@mel.get]

external all_with : string -> Dom.element Js.Array.array_like
  = "querySelectorAll"
[@@mel.scope "document"]

external attribute_or_null : Dom.element -> string -> string Js.null
  = "getAttribute"
[@@mel.send]

(* What every part on the page wrote of its state, each in an element marked
   [data-words] with the part's name: a walk's [read] for a component of
   several parts, whatever element it walks. *)
let words_shown (_ : Dom.element) =
  Js.Array.from (all_with "[data-words]")
  |> Array.to_list
  |> List.map (fun e ->
      Option.value
        (Js.Null.toOption (attribute_or_null e "data-words"))
        ~default:""
      ^ ": " ^ text_content e)
  |> String.concat " | "

(* The [n]th element on the page that [selector] finds, from 0, which a test
   has just drawn. *)
let nth selector n =
  match
    Array.to_list (Js.Array.from (all_with selector))
    |> List.filteri (fun i _ -> i = n)
  with
  | e :: _ -> e
  | [] -> invalid_arg ("no element " ^ string_of_int n ^ " of " ^ selector)

(* A walk with [word] taken out of what each step read. *)
let without word walked =
  Array.map
    (fun (step, read) ->
      ( step,
        String.split_on_char ' ' read
        |> List.filter (fun w -> not (String.equal w word || String.equal w ""))
        |> String.concat " " ))
    walked

(* The part on the page of the slot [name], which a test has just drawn. *)
let slot name =
  match query ("[data-slot=" ^ name ^ "]") with
  | Some e -> e
  | None -> invalid_arg ("no part of the slot " ^ name ^ " is on the page")

(* A part's state as words, the true ones alone, in the order given: what a
   test compares with the React twin's render function. *)
let words flags =
  flags
  |> List.filter_map (fun (word, holds) ->
      if Solidtype.Solid.get holds then Some word else None)
  |> String.concat " "

(* An element hovered, pressed and let go by the mouse, left, then reached by
   Tab and pressed by Enter, then by Space: what [read] reads of it after each
   step, its state by default, by the step's name. Each step runs through
   [step], a twin's act, which React asks of a test and Solid's side does not
   mind. *)
let walk ?(read = state) ~step e =
  let user = setup () in
  let seen = ref [] in
  let after name action =
    let* () = step action in
    seen := (name, read e) :: !seen;
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

(* What [read] reads of an element hovered, left, then reached by Tab, after
   each step, by its name: a walk with no press, for a trigger whose press
   opens an overlay that takes the page's pointer. *)
let glance ~read ~step e =
  let user = setup () in
  let seen = ref [] in
  let after name action =
    let* () = step action in
    seen := (name, read e) :: !seen;
    Js.Promise.resolve ()
  in
  let* () = after "rendered" Js.Promise.resolve in
  let* () = after "hovered" (fun () -> hover user e) in
  let* () = after "left" (fun () -> unhover user e) in
  let* () =
    after "tabbed to" (fun () ->
        let* () = click user body in
        tab user)
  in
  Js.Promise.resolve (Array.of_list (List.rev !seen))

external attribute_names : Dom.element -> string array = "getAttributeNames"
[@@mel.send]

(* What each framework writes for itself and no style reads: Solid's
   hydration key, React Aria's markers and the id it generates. *)
let framework_only = function
  | "data-hk" | "data-rac" | "data-react-aria-pressable" | "id" -> true
  | _ -> false

external icon : string -> string option = "icon"
[@@mel.module "./twins/icons.ts"]

(* An attribute's value, but a path's is the icon it draws where it is one of
   HeroUI's: React's is HeroUI's copy of a Gravity UI icon, a port's Gravity's
   own, the same shape spelt otherwise. *)
let attribute_shown e name =
  let v = Option.value (attribute e name) ~default:"" in
  match name with
  | "d" -> ( match icon v with Some drawn -> "icon " ^ drawn | None -> v)
  | _ -> v

(* An element's attributes and their values, in order of name, but for each
   framework's own and those [but] names: the order a framework writes them in
   is its own, and no style reads it. *)
let attributes_but but e =
  attribute_names e |> Array.to_list
  |> List.filter (fun name ->
      not (framework_only name || List.exists (String.equal name) but))
  |> List.sort String.compare
  |> List.map (fun name -> name ^ "=" ^ attribute_shown e name)
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

type rule
type rules
type axe_options
type results
type violation

external rule : enabled:bool -> unit -> rule = "" [@@mel.obj]

external rules :
  color_contrast:(rule[@mel.as "color-contrast"]) ->
  region:rule ->
  unit ->
  rules = ""
[@@mel.obj]

external axe_options : rules:rules -> unit -> axe_options = "" [@@mel.obj]

external axe_run : Dom.element -> axe_options -> results Js.Promise.t = "run"
[@@mel.module "axe-core"] [@@mel.scope "default"]

external violations : results -> violation array = "violations" [@@mel.get]
external violation_id : violation -> string = "id" [@@mel.get]

(* What axe finds wrong with the page, for a port with no twin to be held
   beside: the rules axe cannot judge without layout, which jsdom has none
   of, left out -- colour contrast and landmarks. *)
let accessibility_violations () =
  let off = rule ~enabled:false () in
  let* results =
    axe_run body
      (axe_options ~rules:(rules ~color_contrast:off ~region:off ()) ())
  in
  Js.Promise.resolve (Array.map violation_id (violations results))

type rect

external rect :
  left:float -> top:float -> width:float -> height:float -> unit -> rect = ""
[@@mel.obj]

external set_rect : Dom.element -> ((unit -> rect)[@mel.uncurry]) -> unit
  = "getBoundingClientRect"
[@@mel.set]

type mouse_init

external mouse_init :
  bubbles:bool -> client_x:(float[@mel.as "clientX"]) -> unit -> mouse_init = ""
[@@mel.obj]

type mouse_event

external mouse_event : string -> mouse_init -> mouse_event = "MouseEvent"
[@@mel.new]

external dispatch : Dom.element -> mouse_event -> bool = "dispatchEvent"
[@@mel.send]

(* A press and release at [x] on a [track] a hundred pixels wide, which jsdom
   lays out at none. *)
let press_track track x =
  set_rect track (fun () -> rect ~left:0. ~top:0. ~width:100. ~height:10. ());
  List.iter
    (fun name ->
      ignore
        (dispatch track
           (mouse_event name (mouse_init ~bubbles:true ~client_x:x ()))
          : bool))
    [ "pointerdown"; "pointerup" ]
