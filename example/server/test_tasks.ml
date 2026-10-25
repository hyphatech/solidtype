(* The routes, called in-process as the board calls them, on a database file
   of each test's own, migrated as rowtype-migrate migrates the board's. *)

let ok what = function
  | Ok v -> v
  | Error e -> Alcotest.failf "%s: %s" what (Rowtype_migrate.error_to_string e)

let migrations =
  ok "the migrations" (Rowtype_migrate.of_directory "../migrations")

(* A migrated file, and what SQLite keeps beside it, gone after. *)
let with_database f =
  let file = Filename.temp_file "board" ".db" in
  Fun.protect
    ~finally:(fun () ->
      List.iter
        (fun suffix ->
          match Sys.remove (file ^ suffix) with
          | () -> ()
          | exception Sys_error _ -> ())
        [ ""; "-wal"; "-shm" ])
    (fun () ->
      Eio_main.run @@ fun env ->
      ok "migrating"
        (Rowtype_migrate_sqlite.run env file (fun db ->
             Rowtype_migrate_sqlite.apply db migrations));
      f env file)

(* The board's routes on [file], as the server serves them. *)
let on_board env file f =
  Spindle_sqlite.Pool.run env file @@ fun pool ->
  f (Spindle.Test.app ~resources:[ Store.resource pool ] Routes.routes)

let with_app f = with_database (fun env file -> on_board env file f)

let call app meth ?body target =
  let r = Spindle.Test.call app meth target ?body in
  (Spindle_http.Status.to_int r.status, r.body)

let check_answer what (status, body) got =
  Alcotest.(check (pair int string)) what (status, body) got

let write = {|{"title":"Write the README","note":"its map first"}|}

let test_add_and_list () =
  with_app @@ fun app ->
  check_answer "added"
    ( 201,
      {|{"id":1,"title":"Write the README","note":"its map first","status":"to_do"}|}
    )
    (call app `POST "/api/tasks" ~body:write);
  check_answer "added without a note"
    (201, {|{"id":2,"title":"Ship it","status":"to_do"}|})
    (call app `POST "/api/tasks" ~body:{|{"title":"Ship it"}|});
  let _, listed = call app `GET "/api/tasks" in
  Alcotest.(check bool)
    "newest first" true
    (String.starts_with ~prefix:{|[{"id":2|} listed)

let test_filter () =
  with_app @@ fun app ->
  ignore (call app `POST "/api/tasks" ~body:write : int * string);
  ignore
    (call app `POST "/api/tasks" ~body:{|{"title":"Ship it"}|} : int * string);
  ignore
    (call app `PUT "/api/tasks/2/status" ~body:{|{"status":"doing"}|}
      : int * string);
  check_answer "doing"
    (200, {|[{"id":2,"title":"Ship it","status":"doing"}]|})
    (call app `GET "/api/tasks?status=doing");
  let status, _ = call app `GET "/api/tasks?status=lost" in
  Alcotest.(check int) "an unknown status" 400 status

let test_move () =
  with_app @@ fun app ->
  ignore (call app `POST "/api/tasks" ~body:write : int * string);
  check_answer "done"
    ( 200,
      {|{"id":1,"title":"Write the README","note":"its map first","status":"done"}|}
    )
    (call app `PUT "/api/tasks/1/status" ~body:{|{"status":"done"}|});
  let status, _ =
    call app `PUT "/api/tasks/9/status" ~body:{|{"status":"done"}|}
  in
  Alcotest.(check int) "a task not there" 404 status

let test_remove () =
  with_app @@ fun app ->
  ignore (call app `POST "/api/tasks" ~body:write : int * string);
  check_answer "removed" (204, "") (call app `DELETE "/api/tasks/1");
  let status, _ = call app `DELETE "/api/tasks/1" in
  Alcotest.(check int) "removed twice" 404 status;
  check_answer "empty" (200, "[]") (call app `GET "/api/tasks")

let test_draft_bounds () =
  with_app @@ fun app ->
  let empty, _ = call app `POST "/api/tasks" ~body:{|{"title":""}|} in
  let long, _ =
    call app `POST "/api/tasks"
      ~body:({|{"title":"x","note":"|} ^ String.make 201 'n' ^ {|"}|})
  in
  Alcotest.(check (pair int int))
    "an empty title, a long note" (400, 400) (empty, long)

(* The board is the file's: a server started again on it shows what the last
   one was given, where it stands now. *)
let test_kept () =
  with_database @@ fun env file ->
  on_board env file (fun app ->
      ignore (call app `POST "/api/tasks" ~body:write : int * string);
      ignore
        (call app `PUT "/api/tasks/1/status" ~body:{|{"status":"doing"}|}
          : int * string));
  on_board env file (fun app ->
      check_answer "after a restart"
        ( 200,
          {|[{"id":1,"title":"Write the README","note":"its map first","status":"doing"}]|}
        )
        (call app `GET "/api/tasks"))

(* An id is never given again, so a page that still shows a task removed
   cannot move the one added after it. *)
let test_ids_not_reused () =
  with_app @@ fun app ->
  ignore (call app `POST "/api/tasks" ~body:write : int * string);
  ignore (call app `DELETE "/api/tasks/1" : int * string);
  check_answer "the next id"
    (201, {|{"id":2,"title":"Ship it","status":"to_do"}|})
    (call app `POST "/api/tasks" ~body:{|{"title":"Ship it"}|})

(* What each statement declares, against the table the migration makes. *)
let test_statements () =
  with_database @@ fun env file ->
  match
    ok "opening"
      (Rowtype_migrate_sqlite.run env file (fun db ->
           Ok (Rowtype_sqlite.verify db Store.statements)))
  with
  | Ok () -> ()
  | Error e -> Alcotest.fail (Rowtype_sqlite.error_to_string e)

let () =
  Alcotest.run "tasks"
    [
      ( "routes",
        [
          Alcotest.test_case "add and list" `Quick test_add_and_list;
          Alcotest.test_case "filter by status" `Quick test_filter;
          Alcotest.test_case "move" `Quick test_move;
          Alcotest.test_case "remove" `Quick test_remove;
          Alcotest.test_case "a draft's bounds" `Quick test_draft_bounds;
          Alcotest.test_case "kept across a restart" `Quick test_kept;
          Alcotest.test_case "an id is never reused" `Quick test_ids_not_reused;
          Alcotest.test_case "the statements match the table" `Quick
            test_statements;
        ] );
    ]
