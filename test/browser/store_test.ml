module S = Solidtype.Solid
module Store = Solidtype.Store
module E = Jest.Expect

type board = { title : string; count : int }

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
            |> toEqual (1, 2))))
