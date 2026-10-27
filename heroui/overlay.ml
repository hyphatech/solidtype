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
  mutable element : Dom.element option;
}

(* Runs [f] once the animations running on [e] end; one cancelled, by the
   overlay opened again as it closes, rejects, and [f] is left to whatever
   cancelled it. *)
let settled e f =
  match Js.Undefined.toOption (animations_method e) with
  | None -> f ()
  | Some _ ->
      let all = Js.Promise.all (Array.map finished (animations_of e)) in
      ignore
        (all
         |> Js.Promise.then_ (fun (_ : animation array) ->
             f ();
             Js.Promise.resolve ())
         |> Js.Promise.catch (fun _ -> Js.Promise.resolve ())
          : unit Js.Promise.t)

let create ~is_open () =
  let present, set_present = S.create_signal false in
  let entering, set_entering = S.create_signal false in
  let exiting, set_exiting = S.create_signal false in
  let o = { present; entering; set_entering; exiting; element = None } in
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
        match o.element with
        | None -> S.set set_present false
        | Some e ->
            S.on_mount (fun () ->
                settled e (fun () ->
                    if S.get exiting then begin
                      S.set set_exiting false;
                      S.set set_present false
                    end))
      end);
  o

let watch o e =
  let e = as_element e in
  o.element <- Some e;
  S.on_mount (fun () -> settled e (fun () -> S.set o.set_entering false))

let present o = S.get o.present
let entering o = S.get o.entering
let exiting o = S.get o.exiting
