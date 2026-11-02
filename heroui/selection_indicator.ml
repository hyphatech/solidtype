module Solid = Solidtype.Solid

type css_style
type rect

external computed_style : _ Dom.element_like -> css_style = "getComputedStyle"
external style : _ Dom.element_like -> css_style = "style" [@@mel.get]

external property_value : css_style -> string -> string = "getPropertyValue"
[@@mel.send]

external set_property : css_style -> string -> string -> unit = "setProperty"
[@@mel.send]

external bounding_rect : _ Dom.element_like -> rect = "getBoundingClientRect"
[@@mel.send]

external left : rect -> float = "left" [@@mel.get]
external top : rect -> float = "top" [@@mel.get]
external is_connected : _ Dom.element_like -> bool = "isConnected" [@@mel.get]

type animation
type animations_method

(* jsdom, and a browser too old, has no getAnimations. *)
external animations_method :
  _ Dom.element_like -> animations_method Js.undefined = "getAnimations"
[@@mel.get]

external animations_of : _ Dom.element_like -> animation array = "getAnimations"
[@@mel.send]

external cancel : animation -> unit = "cancel" [@@mel.send]
external request_frame : (float -> unit) -> int = "requestAnimationFrame"
external queue_microtask : (unit -> unit) -> unit = "queueMicrotask"

(* Where an indicator was, and the values its transition reads, as React
   Aria's shared element keeps them for the next to start from. *)
type snapshot = { rect : rect; values : (string * string) list }
type t = { mutable last : snapshot option }

let create () = { last = None }

type indicator = {
  ref : 'e. 'e Dom.element_like -> unit;
  entering : unit -> bool;
}

(* What is done to an indicator's element once it is given. *)
type placed = {
  connected : unit -> bool;
  leave : unit -> snapshot option;
  start : snapshot -> unit;
}

let snapshot e =
  let computed = computed_style e in
  match property_value computed "transition-property" with
  | "none" -> None
  | properties ->
      Some
        {
          rect = bounding_rect e;
          values =
            String.split_on_char ',' properties
            |> List.map String.trim
            |> List.filter (fun p -> String.length p > 0)
            |> List.map (fun p -> (p, property_value computed p));
        }

(* An indicator made where the last one was: it takes that one's place and
   values, then, a frame on, its own, which its style moves it to. *)
let start_from s e =
  let before =
    match Js.Undefined.toOption (animations_method e) with
    | Some _ -> animations_of e
    | None -> [||]
  in
  let inline = style e in
  let own =
    s.values
    |> List.map (fun (p, last) ->
        let value = property_value inline p in
        if String.equal p "translate" then
          let now = bounding_rect e in
          set_property inline p
            (Js.Float.toString (left s.rect -. left now)
            ^ "px "
            ^ Js.Float.toString (top s.rect -. top now)
            ^ "px")
        else set_property inline p last;
        (p, value))
  in
  (match Js.Undefined.toOption (animations_method e) with
  | Some _ ->
      Array.iter
        (fun a -> if not (Array.exists (fun b -> a == b) before) then cancel a)
        (animations_of e)
  | None -> ());
  ignore
    (request_frame (fun _ ->
         List.iter (fun (p, value) -> set_property inline p value) own)
      : int)

let indicator t =
  let entering, set_entering = Solid.create_signal false in
  let placed = ref None in
  (* Once the last has left and told where it was, which may be after this
     one is made. *)
  Solid.on_mount (fun () ->
      queue_microtask (fun () ->
          match (!placed, t.last) with
          | Some p, Some s ->
              t.last <- None;
              p.start s
          | Some _, None ->
              Solid.set set_entering true;
              ignore
                (request_frame (fun _ -> Solid.set set_entering false) : int)
          | None, _ -> ()));
  Solid.on_cleanup (fun () ->
      match !placed with
      | Some p when p.connected () -> t.last <- p.leave ()
      | Some _ | None -> ());
  {
    ref =
      (fun e ->
        placed :=
          Some
            {
              connected = (fun () -> is_connected e);
              leave = (fun () -> snapshot e);
              start = (fun s -> start_from s e);
            });
    entering = (fun () -> Solid.get entering);
  }
