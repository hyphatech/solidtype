(* A context value built by its generated constructor reaches Kobalte with
   each callback in the shape Kobalte calls it, however OCaml writes it:
   [fun id -> fun () -> ...] and [fun id () -> ...] are one OCaml type, and a
   register callback returns its cleanup, to be called later, not at once. *)

module S = Solidtype.Solid
module V = Solidtype_kobalte.Types.ToastContextValue
module Translations = Solidtype_kobalte.Types.Toast_Root_Translations
module E = Jest.Expect

let value v = fst (S.create_signal v)

(* What a component handed the value sees: the title registered, then the
   cleanup the registration gave back, called. *)
let registered_then_cleaned make_register =
  let events = ref [] in
  let note e = events := e :: !events in
  let ctx =
    V.make
      ~translations:(value (Translations.make ~close:"Close" ()))
      ~close:(fun () -> ())
      ~duration:(value 1000.) ~is_persistent:(value false)
      ~close_timer_start_time:(value 0.)
      ~generate_id:(fun s -> s)
      ~register_title_id:(make_register note)
      ~register_description_id:(make_register note) ()
  in
  let cleanup = V.register_title_id ctx "title" in
  let on_register = List.rev !events in
  (match cleanup () with
  | () -> ()
  | exception Js.Exn.Error _ -> note "the cleanup was not a function");
  (on_register, List.rev !events)

(* Each callback found under the name Kobalte reads it by, through the
   binding's getters, which read those names. *)
let called_by_name () =
  let events = ref [] in
  let note e = events := e :: !events in
  let ctx =
    V.make
      ~translations:(value (Translations.make ~close:"Close" ()))
      ~close:(fun () -> note "closed")
      ~duration:(value 1000.) ~is_persistent:(value false)
      ~close_timer_start_time:(value 0.)
      ~generate_id:(fun s -> "toast-" ^ s)
      ~register_title_id:(fun _ () -> ())
      ~register_description_id:(fun id () -> note ("forget " ^ id))
      ()
  in
  V.close ctx ();
  let id = V.generate_id ctx "title" in
  let cleanup = V.register_description_id ctx "description" in
  cleanup ();
  (id, List.rev !events)

let () =
  Jest.describe "a context value's callbacks" (fun () ->
      Jest.test "written fun id -> fun () ->, register now and clean up later"
        (fun () ->
          let register note id =
            note ("register " ^ id);
            fun () -> note ("forget " ^ id)
          in
          E.(
            expect (registered_then_cleaned register)
            |> toEqual
                 ([ "register title" ], [ "register title"; "forget title" ])));
      Jest.test "written fun id () ->, clean up later, not on registering"
        (fun () ->
          let register note id () = note ("forget " ^ id) in
          E.(
            expect (registered_then_cleaned register)
            |> toEqual ([], [ "forget title" ])));
      Jest.test "are each found under the name Kobalte reads" (fun () ->
          E.(
            expect (called_by_name ())
            |> toEqual ("toast-title", [ "closed"; "forget description" ]))))
