module S = Solidtype.Solid
module E = Jest.Expect

exception Boom

(* A computation needs an owner; this one lives until the test disposes it. *)
(* A component's props, optional, as merge_props merges them. *)
type sized = { size : int option; label : string option }

let rooted f =
  S.create_root (fun dispose ->
      f ();
      dispose)

let () =
  Jest.describe "signals" (fun () ->
      Jest.test "set writes a value, update applies a function to it" (fun () ->
          let count, set_count = S.create_signal 1 in
          S.set set_count 2;
          let after_set = S.get count in
          S.update set_count (fun n -> n * 10);
          E.(expect (after_set, S.get count) |> toEqual (2, 20)));
      Jest.test "a signal holding a function stores it, and never calls it"
        (fun () ->
          let f, set_f = S.create_signal (fun n -> n + 1) in
          S.set set_f (fun n -> n * 2);
          E.(expect ((S.get f) 5) |> toBe 10));
      Jest.test "an equal value is no change, unless equals is Never" (fun () ->
          let runs = ref 0 and runs_never = ref 0 in
          let plain, set_plain = S.create_signal 1 in
          let never, set_never = S.create_signal ~equals:S.Never 1 in
          let dispose =
            rooted (fun () ->
                S.create_effect (fun () ->
                    ignore (S.get plain : int);
                    incr runs);
                S.create_effect (fun () ->
                    ignore (S.get never : int);
                    incr runs_never))
          in
          S.set set_plain 1;
          S.set set_never 1;
          dispose ();
          E.(expect (!runs, !runs_never) |> toEqual (1, 2)));
      Jest.test "equals By decides what a change is" (fun () ->
          let runs = ref 0 in
          let word, set_word =
            S.create_signal
              ~equals:
                (S.By (fun a b -> Int.equal (String.length a) (String.length b)))
              "one"
          in
          let dispose =
            rooted (fun () ->
                S.create_effect (fun () ->
                    ignore (S.get word : string);
                    incr runs))
          in
          S.set set_word "two";
          S.set set_word "three";
          dispose ();
          E.(expect !runs |> toBe 2)));
  Jest.describe "computations" (fun () ->
      Jest.test "an effect reruns on a change, and stops once disposed"
        (fun () ->
          let seen = ref [] in
          let count, set_count = S.create_signal 0 in
          let dispose =
            rooted (fun () ->
                S.create_effect (fun () -> seen := S.get count :: !seen))
          in
          S.set set_count 1;
          dispose ();
          S.set set_count 2;
          E.(expect (List.rev !seen) |> toEqual [ 0; 1 ]));
      Jest.test "an effect from a previous value is given it" (fun () ->
          let seen = ref [] in
          let count, set_count = S.create_signal 1 in
          let dispose =
            rooted (fun () ->
                S.create_effect_from ~init:0 (fun previous ->
                    let n = S.get count in
                    seen := (previous, n) :: !seen;
                    n))
          in
          S.set set_count 5;
          dispose ();
          E.(expect (List.rev !seen) |> toEqual [ (0, 1); (1, 5) ]));
      Jest.test "a memo derives, and computes only on a change" (fun () ->
          let computed = ref 0 in
          let count, set_count = S.create_signal 2 in
          let result = ref 0 in
          let dispose =
            rooted (fun () ->
                let double =
                  S.create_memo (fun () ->
                      incr computed;
                      S.get count * 2)
                in
                result := S.get double + S.get double)
          in
          S.set set_count 3;
          dispose ();
          E.(expect (!result, !computed) |> toEqual (8, 2)));
      Jest.test "a memo from a previous value accumulates" (fun () ->
          let count, set_count = S.create_signal 1 in
          let total = ref (fun () -> 0) in
          let dispose =
            rooted (fun () ->
                let sum =
                  S.create_memo_from ~init:0 (fun acc -> acc + S.get count)
                in
                total := fun () -> S.get sum)
          in
          S.set set_count 2;
          let t = !total () in
          dispose ();
          E.(expect t |> toBe 3));
      Jest.test "batch holds notifications until it returns" (fun () ->
          let runs = ref 0 in
          let a, set_a = S.create_signal 0 and b, set_b = S.create_signal 0 in
          let dispose =
            rooted (fun () ->
                S.create_effect (fun () ->
                    ignore (S.get a + S.get b : int);
                    incr runs))
          in
          S.batch (fun () ->
              S.set set_a 1;
              S.set set_b 1);
          dispose ();
          E.(expect !runs |> toBe 2));
      Jest.test "untrack reads without subscribing" (fun () ->
          let runs = ref 0 in
          let a, set_a = S.create_signal 0 in
          let dispose =
            rooted (fun () ->
                S.create_effect (fun () ->
                    ignore (S.untrack (fun () -> S.get a) : int);
                    incr runs))
          in
          S.set set_a 1;
          dispose ();
          E.(expect !runs |> toBe 1));
      Jest.test "on runs for its dependencies alone, given the last input"
        (fun () ->
          let seen = ref [] in
          let a, set_a = S.create_signal 1 and b, set_b = S.create_signal 0 in
          let dispose =
            rooted (fun () ->
                S.create_effect
                  (S.on
                     (fun () -> S.get a)
                     (fun input previous ->
                       ignore (S.get b : int);
                       seen := (input, previous) :: !seen)))
          in
          S.set set_b 1;
          S.set set_a 2;
          dispose ();
          E.(expect (List.rev !seen) |> toEqual [ (1, None); (2, Some 1) ]));
      Jest.test "on with defer skips the first run" (fun () ->
          let seen = ref [] in
          let a, set_a = S.create_signal 1 in
          let dispose =
            rooted (fun () ->
                S.create_effect
                  (S.on ~defer:true
                     (fun () -> S.get a)
                     (fun input _ -> seen := input :: !seen)))
          in
          S.set set_a 2;
          dispose ();
          E.(expect !seen |> toEqual [ 2 ]));
      Jest.test "on_cleanup runs before a rerun and on dispose" (fun () ->
          let cleaned = ref 0 in
          let a, set_a = S.create_signal 0 in
          let dispose =
            rooted (fun () ->
                S.create_effect (fun () ->
                    ignore (S.get a : int);
                    S.on_cleanup (fun () -> incr cleaned)))
          in
          S.set set_a 1;
          dispose ();
          E.(expect !cleaned |> toBe 2));
      Jest.test "a selector notifies only the keys whose answer changes"
        (fun () ->
          let selected, select = S.create_signal 1 in
          let runs = Array.make 3 0 in
          let dispose =
            rooted (fun () ->
                let is = S.create_selector (fun () -> S.get selected) in
                for k = 0 to 2 do
                  S.create_effect (fun () ->
                      ignore (is k : bool);
                      runs.(k) <- runs.(k) + 1)
                done)
          in
          S.set select 2;
          dispose ();
          E.(expect runs |> toEqual [| 1; 2; 2 |]));
      Jest.test "a reaction is told of the next change, once" (fun () ->
          let invalidated = ref 0 in
          let a, set_a = S.create_signal 0 in
          let dispose =
            rooted (fun () ->
                let track = S.create_reaction (fun () -> incr invalidated) in
                track (fun () -> ignore (S.get a : int)))
          in
          S.set set_a 1;
          S.set set_a 2;
          dispose ();
          E.(expect !invalidated |> toBe 1));
      Jest.test "a computed runs at once" (fun () ->
          let seen = ref [] in
          let a, set_a = S.create_signal 0 in
          let dispose =
            rooted (fun () ->
                S.create_computed (fun () -> seen := S.get a :: !seen))
          in
          let at_once = !seen in
          S.set set_a 1;
          dispose ();
          E.(expect (at_once, !seen) |> toEqual ([ 0 ], [ 1; 0 ]))));
  Jest.describe "ownership" (fun () ->
      Jest.test "an OCaml exception reaches catch_error as itself" (fun () ->
          let caught = ref None in
          ignore
            (S.catch_error
               (fun () -> raise Boom)
               (fun e ->
                 caught := Some (match e with Boom -> true | _ -> false))
              : unit option);
          E.(expect !caught |> toEqual (Some true)));
      Jest.test "a value JavaScript threw reaches catch_error as Js.Exn.Error"
        (fun () ->
          let caught = ref "" in
          ignore
            (S.catch_error
               (fun () -> Js.Exn.raiseError "thrown")
               (fun e ->
                 caught :=
                   match e with
                   | Js.Exn.Error js ->
                       Option.value (Js.Exn.message js) ~default:""
                   | _ -> "another")
              : unit option);
          E.(expect !caught |> toBe "thrown"));
      Jest.test "catch_error gives the value when nothing raised" (fun () ->
          E.(
            expect (S.catch_error (fun () -> 3) (fun _ -> ()))
            |> toEqual (Some 3)));
      Jest.test "catch_error tells a unit or a None returned from a raise"
        (fun () ->
          let raised = ref 0 in
          let count _ = incr raised in
          let unit = S.catch_error (fun () -> ()) count in
          let none = S.catch_error (fun () -> (None : int option)) count in
          let some = S.catch_error (fun () -> Some 0) count in
          let failed = S.catch_error (fun () -> raise Boom) count in
          E.(
            expect
              ( Option.is_some unit,
                Option.map Option.is_none none,
                some,
                Option.is_none failed,
                !raised )
            |> toEqual (true, Some true, Some (Some 0), true, 1)));
      Jest.test "run_with_owner registers a cleanup on that owner" (fun () ->
          let cleaned = ref false in
          let owner = ref None in
          let dispose = rooted (fun () -> owner := S.get_owner ()) in
          (match !owner with
          | Some o ->
              ignore
                (S.run_with_owner o (fun () ->
                     S.on_cleanup (fun () -> cleaned := true))
                  : unit option)
          | None -> ());
          dispose ();
          E.(expect (Option.is_some !owner, !cleaned) |> toEqual (true, true)));
      Jest.test "run_with_owner gives a unit returned, not a raise" (fun () ->
          let ran = ref None in
          let dispose =
            rooted (fun () ->
                match S.get_owner () with
                | Some o -> ran := Some (S.run_with_owner o (fun () -> ()))
                | None -> ())
          in
          dispose ();
          E.(expect (Option.map Option.is_some !ran) |> toEqual (Some true)));
      Jest.test "is_server is false in the browser" (fun () ->
          E.(expect Solidtype.Web.is_server |> toBe false));
      Jest.test "no owner outside a root" (fun () ->
          E.(expect (Option.is_none (S.get_owner ())) |> toBe true)));
  Jest.describe "arrays" (fun () ->
      Jest.test "map_array maps each item once, by identity" (fun () ->
          let mapped = ref 0 in
          let items, set_items = S.create_signal [| "a"; "b" |] in
          let result = ref [||] in
          let dispose =
            rooted (fun () ->
                let upper =
                  S.map_array
                    (fun () -> S.get items)
                    (fun s _ ->
                      incr mapped;
                      String.uppercase_ascii s)
                in
                S.create_effect (fun () -> result := S.get upper))
          in
          S.update set_items (fun xs -> Array.append xs [| "c" |]);
          dispose ();
          E.(expect (!result, !mapped) |> toEqual ([| "A"; "B"; "C" |], 3)));
      Jest.test "index_array tracks the item at each index" (fun () ->
          let items, set_items = S.create_signal [| 1; 2 |] in
          let result = ref [||] in
          let dispose =
            rooted (fun () ->
                let doubled =
                  S.index_array
                    (fun () -> S.get items)
                    (fun item i -> fun () -> (S.get item * 2) + i)
                in
                S.create_effect (fun () ->
                    result := Array.map (fun f -> f ()) (S.get doubled)))
          in
          S.set set_items [| 5; 6 |];
          dispose ();
          E.(expect !result |> toEqual [| 10; 13 |])));
  Jest.describe "observables" (fun () ->
      Jest.test "from reads what its producer sets, and stops it on dispose"
        (fun () ->
          let stopped = ref false in
          let push = ref (fun (_ : int) -> ()) in
          let read = ref (fun () -> None) in
          let dispose =
            rooted (fun () ->
                let value =
                  S.from (fun set ->
                      push := set;
                      fun () -> stopped := true)
                in
                read := fun () -> S.get value)
          in
          !push 4;
          let v = !read () in
          dispose ();
          E.(expect (v, !stopped) |> toEqual (Some 4, true)));
      Jest.test "an observable of an accessor gives its values" (fun () ->
          let a, set_a = S.create_signal 1 in
          let seen = ref [] in
          let subscription =
            S.subscribe (S.observable a) (fun v -> seen := v :: !seen)
          in
          S.set set_a 2;
          S.unsubscribe subscription;
          S.set set_a 3;
          E.(expect (List.rev !seen) |> toEqual [ 1; 2 ])));
  Jest.describe "components" (fun () ->
      Jest.test "merge_props reads each prop from the last part that has it"
        (fun () ->
          let defaults = { size = Some 1; label = Some "item" } in
          let given = { size = Some 3; label = None } in
          let merged = S.merge_props [| defaults; given |] in
          E.(
            expect (merged.size, merged.label) |> toEqual (Some 3, Some "item")));
      Jest.test "a unique id is a string" (fun () ->
          E.(expect (String.length (S.create_unique_id ()) > 0) |> toBe true)))
