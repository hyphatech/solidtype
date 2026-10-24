module Solid = Solidtype.Solid

type animation

external animations_of : _ Dom.element_like -> animation array = "getAnimations"
[@@mel.send]

type animations_method

(* jsdom, and a browser too old, has no getAnimations. *)
external animations_method :
  _ Dom.element_like -> animations_method Js.undefined = "getAnimations"
[@@mel.get]

external finished : animation -> animation Js.Promise.t = "finished" [@@mel.get]
external scroll_width : _ Dom.element_like -> float = "scrollWidth" [@@mel.get]

external scroll_height : _ Dom.element_like -> float = "scrollHeight"
[@@mel.get]

external request_frame : (float -> unit) -> int = "requestAnimationFrame"

external on_before_match :
  _ Dom.element_like ->
  (_[@mel.as "beforematch"]) ->
  ((Dom.event -> unit)[@mel.uncurry]) ->
  unit = "addEventListener"
[@@mel.send]

type size = { width : string; height : string }

let auto = { width = "auto"; height = "auto" }
let none = { width = "0px"; height = "0px" }

let measured e =
  let px n = Js.Float.toString n ^ "px" in
  { width = px (scroll_width e); height = px (scroll_height e) }

(* Runs [f] once the transitions running on [e] end; one interrupted, by a
   toggle before it ends, rejects, and [f] is left to the toggle after. *)
let settled e f =
  let all = Js.Promise.all (Array.map finished (animations_of e)) in
  ignore
    (all
     |> Js.Promise.then_ (fun (_ : animation array) ->
         f ();
         Js.Promise.resolve ())
     |> Js.Promise.catch (fun _ -> Js.Promise.resolve ())
      : unit Js.Promise.t)

type t = {
  expanded : unit -> bool;
  expand : unit -> unit;
  size : size Solid.accessor;
  set_size : size Solid.setter;
  hidden : bool Solid.accessor;
  set_hidden : bool Solid.setter;
  mutable toggled : bool -> unit;
      (* What the content does as it is toggled, once its element is watched;
         nothing before. *)
}

let create ~expanded ~expand () =
  let now = Solid.untrack expanded in
  let size, set_size = Solid.create_signal (if now then auto else none) in
  (* Written again as a toggle refused leaves it so. *)
  let hidden, set_hidden = Solid.create_signal ~equals:Never (not now) in
  let p =
    {
      expanded;
      expand;
      size;
      set_size;
      hidden;
      set_hidden;
      toggled = (fun (_ : bool) -> ());
    }
  in
  Solid.create_effect
    (Solid.on ~defer:true expanded (fun now _ -> p.toggled now));
  p

let watch p e =
  p.toggled <-
    (fun now ->
      match (Js.Undefined.toOption (animations_method e), now) with
      | None, true ->
          Solid.set p.set_hidden false;
          Solid.set p.set_size auto
      | None, false ->
          Solid.set p.set_size none;
          Solid.set p.set_hidden true
      | Some _, true ->
          Solid.set p.set_hidden false;
          ignore
            (request_frame (fun _ ->
                 if p.expanded () then (
                   Solid.set p.set_size (measured e);
                   settled e (fun () ->
                       if p.expanded () then Solid.set p.set_size auto)))
              : int)
      | Some _, false ->
          Solid.set p.set_size (measured e);
          ignore
            (request_frame (fun _ ->
                 if not (p.expanded ()) then (
                   Solid.set p.set_size none;
                   settled e (fun () ->
                       if not (p.expanded ()) then Solid.set p.set_hidden true)))
              : int));
  on_before_match e (fun _ ->
      p.expand ();
      (* The browser takes hidden away once its event is told: content
         controlled collapsed is hidden again. *)
      ignore
        (request_frame (fun _ ->
             if not (p.expanded ()) then Solid.set p.set_hidden true)
          : int))

let hidden p = if Solid.get p.hidden then Some "until-found" else None

let style p =
  let s = Solid.get p.size in
  "--disclosure-panel-width: " ^ s.width ^ "; --disclosure-panel-height: "
  ^ s.height
