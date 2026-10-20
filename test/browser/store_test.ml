module S = Solidtype.Solid
module Store = Solidtype.Store
module E = Jest.Expect

type board = { title : string; count : int }
type counter = { mutable count : int; label : string }
type item = { id : int; name : string }
type inventory = { items : item array }

(* How many times a computation that reads [read] runs, once at first and
   again for each change [change] makes. *)
let reruns read change =
  let runs = ref 0 in
  let dispose =
    S.create_root (fun dispose ->
        S.create_computed (fun () ->
            read ();
            incr runs);
        dispose)
  in
  change ();
  dispose ();
  !runs

(* How many times a computation that reads [read] of a fresh store runs,
   once at first and again for each change after it. *)
let runs ~read change =
  let runs = ref 0 in
  let state, set_state = Store.create_store { title = "Board"; count = 0 } in
  let dispose =
    S.create_root (fun dispose ->
        S.create_computed (fun () ->
            read state;
            incr runs);
        dispose)
  in
  change set_state;
  dispose ();
  !runs

let () =
  Jest.describe "a store" (fun () ->
      Jest.test "tracked whole, reruns a computation on any field's change"
        (fun () ->
          E.(
            expect
              (runs ~read:Store.track (fun set ->
                   Store.set set { title = "Board"; count = 1 }))
            |> toBe 2));
      Jest.test "read by one field, reruns on that field's change alone"
        (fun () ->
          let seen = ref 0 in
          let read (b : board) = seen := b.count in
          E.(
            expect
              ( runs ~read (fun set ->
                    Store.set set { title = "Renamed"; count = 0 }),
                runs ~read (fun set ->
                    Store.set set { title = "Board"; count = 1 }) )
            |> toEqual (1, 2)));
      Jest.test "set merges the value's fields into the store" (fun () ->
          let state, set_state =
            Store.create_store { title = "Board"; count = 0 }
          in
          Store.set set_state { title = "Renamed"; count = 3 };
          E.(expect (state.title, state.count) |> toEqual ("Renamed", 3)));
      Jest.test "produce changes a draft in place, and the store notifies"
        (fun () ->
          let state, set_state =
            Store.create_store { count = 0; label = "n" }
          in
          let seen = ref 0 in
          let runs =
            reruns
              (fun () -> seen := state.count)
              (fun () ->
                Store.modify set_state
                  (Store.produce (fun d -> d.count <- d.count + 2)))
          in
          E.(expect (state.count, runs, !seen) |> toEqual (2, 2, 2)));
      Jest.test "reconcile keeps each item that is equal, the same object"
        (fun () ->
          let state, set_state =
            Store.create_store
              { items = [| { id = 1; name = "a" }; { id = 2; name = "b" } |] }
          in
          let first = state.items.(0) in
          Store.modify set_state
            (Store.reconcile
               { items = [| { id = 1; name = "a" }; { id = 2; name = "B" } |] });
          E.(
            expect (state.items.(0) == first, state.items.(1).name)
            |> toEqual (true, "B")));
      Jest.test "a mutable store notifies on each assignment" (fun () ->
          let state = Store.create_mutable { count = 0; label = "n" } in
          let seen = ref 0 in
          let runs =
            reruns (fun () -> seen := state.count) (fun () -> state.count <- 5)
          in
          E.(expect (runs, !seen) |> toEqual (2, 5)));
      Jest.test "modify_mutable changes a mutable store by a modifier"
        (fun () ->
          let state = Store.create_mutable { count = 1; label = "n" } in
          Store.modify_mutable state (Store.produce (fun d -> d.count <- 9));
          E.(expect state.count |> toBe 9));
      Jest.test "unwrap gives the plain object, which notifies nothing"
        (fun () ->
          let state = Store.create_mutable { count = 0; label = "n" } in
          let plain = Store.unwrap state in
          let seen = ref 0 in
          let runs =
            reruns (fun () -> seen := state.count) (fun () -> plain.count <- 4)
          in
          E.(expect (runs, !seen) |> toEqual (1, 0))))
