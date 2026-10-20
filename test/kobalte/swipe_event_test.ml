(* A swipe event, as Kobalte hands one to a toast's handlers, read through
   its binding: the swipe's detail, the event's own members, and its
   methods called as methods. *)

module Types = Solidtype_kobalte.Types
module Swipe = Types.SwipeEvent
module Detail = Types.SwipeEvent_Detail
module Delta = Types.SwipeEvent_Detail_Delta
module E = Jest.Expect

type init

external init : detail:Detail.t -> cancelable:bool -> unit -> init = ""
[@@mel.obj]

external custom_event : string -> init -> Swipe.t = "CustomEvent" [@@mel.new]
external pointer_event : string -> Dom.pointerEvent = "PointerEvent" [@@mel.new]

let swipe () =
  let detail =
    Detail.make
      ~original_event:(pointer_event "pointermove")
      ~delta:(Delta.make ~x:12. ~y:(-3.) ())
      ()
  in
  custom_event "swipe.move" (init ~detail ~cancelable:true ())

let () =
  Jest.describe "a swipe event" (fun () ->
      Jest.test "reads its swipe's delta and its type" (fun () ->
          let e = swipe () in
          let delta = Detail.delta (Swipe.detail e) in
          E.(
            expect (Swipe.type_ e, Delta.x delta, Delta.y delta)
            |> toEqual ("swipe.move", 12., -3.)));
      Jest.test "prevents its default, as a method" (fun () ->
          let e = swipe () in
          Swipe.prevent_default e ();
          E.(expect (Swipe.default_prevented e) |> toBe true));
      Jest.test "is initialised again by initEvent, a method, not an event"
        (fun () ->
          let e = swipe () in
          Swipe.init_event e "swipe.end" ();
          E.(expect (Swipe.type_ e) |> toBe "swipe.end")))
