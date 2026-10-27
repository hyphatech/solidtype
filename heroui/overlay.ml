module S = Solidtype.Solid

type animation

external animations_of : _ Dom.element_like -> animation array = "getAnimations"
[@@mel.send]

type animations_method

(* jsdom, and a browser too old, has no getAnimations. *)
external animations_method :
  _ Dom.element_like -> animations_method Js.undefined = "getAnimations"
[@@mel.get]

external finished : animation -> animation Js.Promise.t = "finished" [@@mel.get]
external as_element : _ Dom.element_like -> Dom.element = "%identity"

type t = {
  present : bool S.accessor;
  entering : bool S.accessor;
  set_entering : bool S.setter;
  exiting : bool S.accessor;
  mutable elements : Dom.element list;
}

(* Runs [f] once the animations running on [elements] end, as a backdrop and
   its container each run their own; one cancelled, by the overlay opened
   again as it closes, rejects, and [f] is left to whatever cancelled it. *)
let settled elements f =
  match elements with
  | e :: _ when Option.is_some (Js.Undefined.toOption (animations_method e)) ->
      let running = elements |> List.map animations_of |> Array.concat in
      let all = Js.Promise.all (Array.map finished running) in
      ignore
        (all
         |> Js.Promise.then_ (fun (_ : animation array) ->
             f ();
             Js.Promise.resolve ())
         |> Js.Promise.catch (fun _ -> Js.Promise.resolve ())
          : unit Js.Promise.t)
  | _ :: _ | [] -> f ()

let create ~is_open () =
  let present, set_present = S.create_signal false in
  let entering, set_entering = S.create_signal false in
  let exiting, set_exiting = S.create_signal false in
  let o = { present; entering; set_entering; exiting; elements = [] } in
  (* Opened, it enters as it is made; closed, it exits where it is, and leaves
     the page once its exit animation ends. Its attributes are on the element
     as each read runs, so the animation they start is running by then. *)
  S.create_computed (fun () ->
      if is_open () then begin
        S.set set_exiting false;
        if not (S.untrack (fun () -> S.get present)) then begin
          S.set set_entering true;
          S.set set_present true
        end
      end
      else if S.untrack (fun () -> S.get present) then begin
        S.set set_entering false;
        S.set set_exiting true;
        match o.elements with
        | [] -> S.set set_present false
        | _ :: _ ->
            S.on_mount (fun () ->
                settled o.elements (fun () ->
                    if S.get exiting then begin
                      S.set set_exiting false;
                      S.set set_present false
                    end))
      end);
  o

let watch o e =
  let e = as_element e in
  o.elements <- e :: o.elements;
  S.on_cleanup (fun () ->
      o.elements <- List.filter (fun x -> x != e) o.elements);
  S.on_mount (fun () ->
      settled o.elements (fun () -> S.set o.set_entering false))

let present o = S.get o.present
let entering o = S.get o.entering
let exiting o = S.get o.exiting

type observer
type watched

external observer : ((unit -> unit)[@mel.uncurry]) -> observer
  = "MutationObserver"
[@@mel.new]

external watched :
  attributes:bool ->
  attribute_filter:(string array[@mel.as "attributeFilter"]) ->
  unit ->
  watched = ""
[@@mel.obj]

external observe : observer -> _ Dom.element_like -> watched -> unit = "observe"
[@@mel.send]

external disconnect : observer -> unit = "disconnect" [@@mel.send]

type css_style

external style_of : _ Dom.element_like -> css_style = "style" [@@mel.get]

external side_value : css_style -> string -> string = "getPropertyValue"
[@@mel.send]

let arrow_position () =
  let position, set_position = S.create_signal "" in
  let follow k =
    let copy () =
      let style = style_of k in
      S.set set_position
        ([ "left"; "top"; "right"; "bottom" ]
        |> List.filter_map (fun side ->
            match side_value style side with
            | "" -> None
            | v -> Some (side ^ ": " ^ v ^ ";"))
        |> String.concat " ")
    in
    let watching = observer copy in
    observe watching k
      (watched ~attributes:true ~attribute_filter:[| "style" |] ());
    copy ();
    S.on_cleanup (fun () -> disconnect watching)
  in
  ((fun () -> S.get position), follow)

external parent : _ Dom.element_like -> Dom.element Js.null = "parentElement"
[@@mel.get]

let placed_side ~placement () =
  let side, set_side = S.create_signal None in
  let watch content =
    match Js.Null.toOption (parent content) with
    | None -> ()
    | Some positioner ->
        let read () =
          let origin =
            String.trim
              (side_value (style_of positioner)
                 "--kb-popper-content-transform-origin")
          in
          (* Kobalte's origin is the side of the content toward its trigger,
             the opposite of the side it is placed on. *)
          let toward =
            match String.index_opt origin ' ' with
            | Some at -> String.sub origin 0 at
            | None -> origin
          in
          S.set set_side
            (match toward with
            | "bottom" -> Some "top"
            | "top" -> Some "bottom"
            | "left" -> Some "right"
            | "right" -> Some "left"
            | _ -> None)
        in
        let watching = observer read in
        observe watching positioner
          (watched ~attributes:true ~attribute_filter:[| "style" |] ());
        read ();
        S.on_cleanup (fun () -> disconnect watching)
  in
  ((fun () -> match S.get side with Some s -> s | None -> placement ()), watch)

external active : Dom.element Js.null = "activeElement" [@@mel.scope "document"]
external body : Dom.element = "body" [@@mel.scope "document"]

type focus_options

external focus_options :
  prevent_scroll:(bool[@mel.as "preventScroll"]) -> unit -> focus_options = ""
[@@mel.obj]

external focus_with : Dom.element -> focus_options -> unit = "focus"
[@@mel.send]

let focus e = focus_with (as_element e) (focus_options ~prevent_scroll:true ())

let return_focus ~is_open ~inside () =
  let before = ref None in
  S.create_computed_from ~init:false (fun was ->
      let now = is_open () in
      (if now && not was then before := Js.Null.toOption active
       else if was && not now then
         match (Js.Null.toOption active, !before) with
         | Some focused, Some back when focused == body || inside focused ->
             focus back
         | (Some _ | None), _ -> ());
      now)
