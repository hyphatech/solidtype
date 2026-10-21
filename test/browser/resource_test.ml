module S = Solidtype.Solid
module E = Jest.Expect
module T = Testing
open Testing.Syntax

let () =
  Jest.describe "resources" (fun () ->
      Jest.testPromise "a fetch resolves to a value, read and ready" (fun () ->
          let resource = ref None in
          let dispose =
            S.create_root (fun dispose ->
                resource :=
                  Some (fst (S.create_resource (fun _ -> Js.Promise.resolve 7)));
                dispose)
          in
          let ready () =
            match !resource with
            | Some r -> (
                match S.state r with
                | S.Ready -> true
                | S.Unresolved | S.Pending | S.Refreshing | S.Errored -> false)
            | None -> false
          in
          let* () = T.eventually (fun () -> T.holds ~what:"ready" (ready ())) in
          let seen =
            match !resource with
            | Some r -> (S.read r, S.state r, S.loading r)
            | None -> (None, S.Unresolved, true)
          in
          dispose ();
          Js.Promise.resolve E.(expect seen |> toEqual (Some 7, S.Ready, false)));
      Jest.testPromise "a source of None does not fetch; Some false does"
        (fun () ->
          let fetched = ref [] in
          let source, set_source = S.create_signal None in
          let dispose =
            S.create_root (fun dispose ->
                ignore
                  (S.create_resource_from
                     (fun () -> S.get source)
                     (fun s _ ->
                       fetched := s :: !fetched;
                       Js.Promise.resolve s)
                    : _ S.resource * _ S.resource_actions);
                dispose)
          in
          (* Solid fetches as a source becomes Some, at once: none yet is none. *)
          let before = !fetched in
          S.set set_source (Some false);
          let* () =
            T.eventually (fun () ->
                T.holds ~what:"fetched" (List.length !fetched = 1))
          in
          dispose ();
          Js.Promise.resolve
            E.(expect (before, !fetched) |> toEqual ([], [ false ])));
      Jest.testPromise "mutate sets the value; refetch fetches again" (fun () ->
          let fetches = ref 0 in
          let read = ref (fun () -> None) and actions = ref None in
          let dispose =
            S.create_root (fun dispose ->
                let r, a =
                  S.create_resource (fun info ->
                      incr fetches;
                      Js.Promise.resolve (if info.S.refetching then 2 else 1))
                in
                (read := fun () -> S.read r);
                actions := Some a;
                dispose)
          in
          let* () =
            T.eventually (fun () ->
                T.holds ~what:"fetched" (Option.is_some (!read ())))
          in
          let first = !read () in
          Option.iter (fun a -> S.mutate a (Some 10)) !actions;
          let mutated = !read () in
          Option.iter S.refetch !actions;
          let* () =
            T.eventually (fun () ->
                T.holds ~what:"refetched" (!fetches = 2 && !read () = Some 2))
          in
          let refetched = !read () in
          dispose ();
          Js.Promise.resolve
            E.(
              expect (first, mutated, refetched, !fetches)
              |> toEqual (Some 1, Some 10, Some 2, 2)));
      Jest.testPromise "a failed fetch is Errored, its error the exception"
        (fun () ->
          let resource = ref None in
          let dispose =
            S.create_root (fun dispose ->
                resource :=
                  Some
                    (fst
                       (S.create_resource (fun _ -> Js.Promise.reject Not_found)));
                dispose)
          in
          let errored () =
            match !resource with
            | Some r -> (
                match S.state r with
                | S.Errored -> true
                | S.Unresolved | S.Pending | S.Ready | S.Refreshing -> false)
            | None -> false
          in
          let* () =
            T.eventually (fun () -> T.holds ~what:"errored" (errored ()))
          in
          let seen =
            match !resource with
            | Some r ->
                ( S.state r,
                  match S.error r with Some Not_found -> true | _ -> false )
            | None -> (S.Unresolved, false)
          in
          dispose ();
          Js.Promise.resolve E.(expect seen |> toEqual (S.Errored, true))));
  Jest.describe "transitions" (fun () ->
      Jest.testPromise "start_transition runs its updates and resolves"
        (fun () ->
          let a, set_a = S.create_signal 0 in
          let* () = S.start_transition (fun () -> S.set set_a 1) in
          Js.Promise.resolve E.(expect (S.get a) |> toBe 1));
      Jest.testPromise "use_transition is not pending once done" (fun () ->
          let pending = ref (fun () -> true) in
          let start = ref (fun _ -> Js.Promise.resolve ()) in
          let dispose =
            S.create_root (fun dispose ->
                let p, s = S.use_transition () in
                (pending := fun () -> S.get p);
                start := s;
                dispose)
          in
          let* () = !start (fun () -> ()) in
          let still = !pending () in
          dispose ();
          Js.Promise.resolve E.(expect still |> toBe false)))
