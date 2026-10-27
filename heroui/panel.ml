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
external cancel_frame : int -> unit = "cancelAnimationFrame"

external on_before_match :
  _ Dom.element_like ->
  (_[@mel.as "beforematch"]) ->
  ((Dom.event -> unit)[@mel.uncurry]) ->
  unit = "addEventListener"
[@@mel.send]

type css_style

external style_of : _ Dom.element_like -> css_style = "style" [@@mel.get]

external set_property : css_style -> string -> string -> unit = "setProperty"
[@@mel.send]

external remove_property : css_style -> string -> string = "removeProperty"
[@@mel.send]

external computed_style : _ Dom.element_like -> css_style = "getComputedStyle"
external height : css_style -> string = "height" [@@mel.get]

external set_attribute : _ Dom.element_like -> string -> string -> unit
  = "setAttribute"
[@@mel.send]

external remove_attribute : _ Dom.element_like -> string -> unit
  = "removeAttribute"
[@@mel.send]

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
  at_first : bool;
  mutable toggled : bool -> unit;
      (* What the content does as it is toggled, once its element is watched;
         nothing before. *)
}

let create ~expanded ~expand () =
  let p =
    {
      expanded;
      expand;
      at_first = Solid.untrack expanded;
      toggled = (fun (_ : bool) -> ());
    }
  in
  Solid.create_effect
    (Solid.on ~defer:true expanded (fun now _ -> p.toggled now));
  p

let watch p e =
  let inline = style_of e in
  let size width height =
    set_property inline "--disclosure-panel-width" width;
    set_property inline "--disclosure-panel-height" height
  in
  let measured () =
    let px n = Js.Float.toString n ^ "px" in
    size (px (scroll_width e)) (px (scroll_height e))
  in
  let hide () = set_attribute e "hidden" "until-found" in
  let frame = ref None in
  (* Kobalte stops its content's transitions as it mounts, and lets them run
     again only once it has opened; content kept on the page collapsed would
     open the first time with none. The panel's are its own: a frame on, once
     Kobalte has stopped them, they run again. *)
  ignore
    (request_frame (fun _ ->
         ignore (remove_property inline "transition-duration" : string);
         ignore (remove_property inline "animation-name" : string))
      : int);
  p.toggled <-
    (fun now ->
      Option.iter cancel_frame !frame;
      match (Js.Undefined.toOption (animations_method e), now) with
      | None, true ->
          remove_attribute e "hidden";
          size "auto" "auto"
      | None, false ->
          hide ();
          size "0px" "0px"
      | Some _, true ->
          remove_attribute e "hidden";
          measured ();
          settled e (fun () -> if p.expanded () then size "auto" "auto")
      | Some _, false ->
          measured ();
          (* Its size is read, so the transition starts from it. *)
          ignore (height (computed_style e) : string);
          size "0px" "0px";
          settled e (fun () -> if not (p.expanded ()) then hide ()));
  on_before_match e (fun _ ->
      (* The browser takes hidden away once its event is told: content
         controlled collapsed is hidden again. *)
      frame :=
        Some (request_frame (fun _ -> if not (p.expanded ()) then hide ()));
      p.expand ())

let hidden p = if p.at_first then None else Some "until-found"

let style p =
  if p.at_first then
    "--disclosure-panel-width: auto; --disclosure-panel-height: auto"
  else "--disclosure-panel-width: 0px; --disclosure-panel-height: 0px"
