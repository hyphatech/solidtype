(* The routes, called in-process as the board calls them, on a database file
   of each test's own, migrated as rowtype-migrate migrates the board's. *)

let ok what = function
  | Ok v -> v
  | Error e -> Alcotest.failf "%s: %s" what (Rowtype_migrate.error_to_string e)

let migrations =
  ok "the migrations" (Rowtype_migrate.of_directory "../migrations")

(* A file migrated by [migrate], and what SQLite keeps beside it, gone
   after. *)
let with_file ~migrate f =
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
      ok "migrating" (Rowtype_migrate_sqlite.run env file migrate);
      f env file)

let with_database f =
  with_file ~migrate:(fun db -> Rowtype_migrate_sqlite.apply db migrations) f

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

let check_status what status (got, _) = Alcotest.(check int) what status got

(* A refusal of the body, and where in it. *)
let check_refused what ~at (status, body) =
  let named = {|"at":"|} ^ at ^ {|"|} in
  let rec holds i =
    i + String.length named <= String.length body
    && (String.equal (String.sub body i (String.length named)) named
       || holds (i + 1))
  in
  Alcotest.(check (pair int bool)) what (400, true) (status, holds 0)

let start app =
  ignore
    (call app `POST "/api/projects"
       ~body:{|{"name":"API","colour":"blue","repo":"acme/api"}|}
      : int * string)

let write =
  {|{"project":1,"title":"Write the README","note":"its map first","labels":["docs"]}|}

let ship = {|{"project":1,"title":"Ship it","labels":[]}|}

let test_projects () =
  with_app @@ fun app ->
  check_answer "none yet" (200, "[]") (call app `GET "/api/projects");
  check_answer "started"
    ( 201,
      {|{"id":1,"name":"API","colour":"blue","repo":"acme/api","open_tasks":0}|}
    )
    (call app `POST "/api/projects"
       ~body:{|{"name":"API","colour":"blue","repo":"acme/api"}|});
  check_answer "started without a repository"
    (201, {|{"id":2,"name":"Docs","colour":"green","open_tasks":0}|})
    (call app `POST "/api/projects" ~body:{|{"name":"Docs","colour":"green"}|})

let test_project_refused () =
  with_app @@ fun app ->
  start app;
  check_refused "a name taken" ~at:"body.name"
    (call app `POST "/api/projects" ~body:{|{"name":"API","colour":"pink"}|});
  List.iter
    (fun repo ->
      check_refused repo ~at:"body.repo"
        (call app `POST "/api/projects"
           ~body:({|{"name":"Web","colour":"pink","repo":"|} ^ repo ^ {|"}|})))
    [ "acme"; "acme/api/v2"; "/api"; "acme/a pi" ];
  check_status "an unknown colour" 400
    (call app `POST "/api/projects" ~body:{|{"name":"Web","colour":"teal"}|});
  check_refused "a name of spaces alone" ~at:"body.name"
    (call app `POST "/api/projects" ~body:{|{"name":"   ","colour":"pink"}|});
  check_refused "a name taken, but for its spaces" ~at:"body.name"
    (call app `POST "/api/projects" ~body:{|{"name":" API ","colour":"pink"}|})

let test_project_removed () =
  with_app @@ fun app ->
  start app;
  ignore
    (call app `POST "/api/projects" ~body:{|{"name":"Docs","colour":"green"}|}
      : int * string);
  ignore (call app `POST "/api/tasks" ~body:write : int * string);
  ignore
    (call app `POST "/api/tasks"
       ~body:{|{"project":2,"title":"Index the guides","labels":[]}|}
      : int * string);
  check_answer "removed" (204, "") (call app `DELETE "/api/projects/1");
  check_status "removed twice" 404 (call app `DELETE "/api/projects/1");
  check_answer "the other project's tasks alone"
    ( 200,
      {|[{"id":2,"project":2,"title":"Index the guides","labels":[],"status":"to_do"}]|}
    )
    (call app `GET "/api/tasks");
  check_answer "the other project"
    (200, {|[{"id":2,"name":"Docs","colour":"green","open_tasks":1}]|})
    (call app `GET "/api/projects")

let test_add_and_list () =
  with_app @@ fun app ->
  start app;
  check_answer "added"
    ( 201,
      {|{"id":1,"project":1,"title":"Write the README","note":"its map first","labels":["docs"],"status":"to_do"}|}
    )
    (call app `POST "/api/tasks" ~body:write);
  check_answer "added with a link"
    ( 201,
      {|{"id":2,"project":1,"title":"Ship it","link":"https://github.com/acme/api/pull/9","labels":[],"status":"to_do"}|}
    )
    (call app `POST "/api/tasks"
       ~body:
         {|{"project":1,"title":"Ship it","link":"https://github.com/acme/api/pull/9","labels":[]}|});
  let _, listed = call app `GET "/api/tasks" in
  Alcotest.(check bool)
    "newest first" true
    (String.starts_with ~prefix:{|[{"id":2|} listed);
  check_answer "the project counts them"
    ( 200,
      {|[{"id":1,"name":"API","colour":"blue","repo":"acme/api","open_tasks":2}]|}
    )
    (call app `GET "/api/projects")

let test_task_refused () =
  with_app @@ fun app ->
  start app;
  check_refused "no such project" ~at:"body.project"
    (call app `POST "/api/tasks" ~body:{|{"project":9,"title":"x","labels":[]}|});
  List.iter
    (fun link ->
      check_refused link ~at:"body.link"
        (call app `POST "/api/tasks"
           ~body:
             ({|{"project":1,"title":"x","labels":[],"link":"|} ^ link ^ {|"}|})))
    [ "javascript:alert(1)"; "ftp://acme.dev/x"; "acme.dev" ];
  check_status "six labels" 400
    (call app `POST "/api/tasks"
       ~body:{|{"project":1,"title":"x","labels":["a","b","c","d","e","f"]}|});
  check_status "an empty label" 400
    (call app `POST "/api/tasks"
       ~body:{|{"project":1,"title":"x","labels":[""]}|});
  check_refused "a title of spaces alone" ~at:"body.title"
    (call app `POST "/api/tasks"
       ~body:{|{"project":1,"title":"   ","labels":[]}|});
  check_status "a label of spaces alone" 400
    (call app `POST "/api/tasks"
       ~body:{|{"project":1,"title":"x","labels":["  "]}|});
  check_answer "kept without the spaces around it"
    ( 201,
      {|{"id":1,"project":1,"title":"Ship it","labels":["docs"],"status":"to_do"}|}
    )
    (call app `POST "/api/tasks"
       ~body:{|{"project":1,"title":" Ship it  ","labels":[" docs"]}|})

let test_filter () =
  with_app @@ fun app ->
  start app;
  ignore
    (call app `POST "/api/projects" ~body:{|{"name":"Docs","colour":"green"}|}
      : int * string);
  ignore (call app `POST "/api/tasks" ~body:write : int * string);
  ignore (call app `POST "/api/tasks" ~body:ship : int * string);
  ignore
    (call app `POST "/api/tasks"
       ~body:{|{"project":2,"title":"Index the guides","labels":[]}|}
      : int * string);
  ignore
    (call app `PUT "/api/tasks/2/status" ~body:{|{"status":"review"}|}
      : int * string);
  check_answer "in review"
    ( 200,
      {|[{"id":2,"project":1,"title":"Ship it","labels":[],"status":"review"}]|}
    )
    (call app `GET "/api/tasks?status=review");
  check_answer "a project's"
    ( 200,
      {|[{"id":3,"project":2,"title":"Index the guides","labels":[],"status":"to_do"}]|}
    )
    (call app `GET "/api/tasks?project=2");
  check_answer "a project's, to do"
    ( 200,
      {|[{"id":1,"project":1,"title":"Write the README","note":"its map first","labels":["docs"],"status":"to_do"}]|}
    )
    (call app `GET "/api/tasks?project=1&status=to_do");
  check_status "an unknown status" 400 (call app `GET "/api/tasks?status=lost")

let test_move () =
  with_app @@ fun app ->
  start app;
  ignore (call app `POST "/api/tasks" ~body:write : int * string);
  check_answer "in the backlog"
    ( 200,
      {|{"id":1,"project":1,"title":"Write the README","note":"its map first","labels":["docs"],"status":"backlog"}|}
    )
    (call app `PUT "/api/tasks/1/status" ~body:{|{"status":"backlog"}|});
  ignore
    (call app `PUT "/api/tasks/1/status" ~body:{|{"status":"done"}|}
      : int * string);
  check_answer "done is not open"
    ( 200,
      {|[{"id":1,"name":"API","colour":"blue","repo":"acme/api","open_tasks":0}]|}
    )
    (call app `GET "/api/projects");
  check_status "a task not there" 404
    (call app `PUT "/api/tasks/9/status" ~body:{|{"status":"done"}|})

let test_remove () =
  with_app @@ fun app ->
  start app;
  ignore (call app `POST "/api/tasks" ~body:write : int * string);
  check_answer "removed" (204, "") (call app `DELETE "/api/tasks/1");
  check_status "removed twice" 404 (call app `DELETE "/api/tasks/1");
  check_answer "empty" (200, "[]") (call app `GET "/api/tasks")

let test_draft_bounds () =
  with_app @@ fun app ->
  start app;
  let empty, _ =
    call app `POST "/api/tasks" ~body:{|{"project":1,"title":"","labels":[]}|}
  in
  let long, _ =
    call app `POST "/api/tasks"
      ~body:
        ({|{"project":1,"title":"x","labels":[],"note":"|} ^ String.make 201 'n'
       ^ {|"}|})
  in
  Alcotest.(check (pair int int))
    "an empty title, a long note" (400, 400) (empty, long)

(* The board is the file's: a server started again on it shows what the last
   one was given, where it stands now. *)
let test_kept () =
  with_database @@ fun env file ->
  on_board env file (fun app ->
      start app;
      ignore (call app `POST "/api/tasks" ~body:write : int * string);
      ignore
        (call app `PUT "/api/tasks/1/status" ~body:{|{"status":"doing"}|}
          : int * string));
  on_board env file (fun app ->
      check_answer "after a restart"
        ( 200,
          {|[{"id":1,"project":1,"title":"Write the README","note":"its map first","labels":["docs"],"status":"doing"}]|}
        )
        (call app `GET "/api/tasks"))

(* An id is never given again, so a page that still shows a task removed
   cannot move the one added after it. *)
let test_ids_not_reused () =
  with_app @@ fun app ->
  start app;
  ignore (call app `POST "/api/tasks" ~body:write : int * string);
  ignore (call app `DELETE "/api/tasks/1" : int * string);
  check_answer "the next id"
    ( 201,
      {|{"id":2,"project":1,"title":"Ship it","labels":[],"status":"to_do"}|} )
    (call app `POST "/api/tasks" ~body:ship)

(* A board made before projects keeps its tasks, in a project of their own,
   and still never gives a removed task's id again. *)
let test_tasks_before_projects () =
  let first =
    match migrations with
    | first :: _ -> first
    | [] -> Alcotest.fail "no migrations"
  in
  with_file
    ~migrate:(fun db ->
      match Rowtype_migrate_sqlite.apply db [ first ] with
      | Error e -> Error e
      | Ok () -> (
          match
            Rowtype_sqlite.exec_raw db
              "insert into tasks (title, note, status) values ('Write the \
               README', 'its map first', 'doing'), ('Ship it', null, 'to_do'); \
               delete from tasks where id = 2"
          with
          | Error e -> Error e
          | Ok () -> Rowtype_migrate_sqlite.apply db migrations))
    (fun env file ->
      on_board env file (fun app ->
          check_answer "the board's project"
            (200, {|[{"id":1,"name":"Board","colour":"blue","open_tasks":1}]|})
            (call app `GET "/api/projects");
          check_answer "its task, where it was"
            ( 200,
              {|[{"id":1,"project":1,"title":"Write the README","note":"its map first","labels":[],"status":"doing"}]|}
            )
            (call app `GET "/api/tasks");
          check_answer "the next id"
            ( 201,
              {|{"id":3,"project":1,"title":"Ship it","labels":[],"status":"to_do"}|}
            )
            (call app `POST "/api/tasks" ~body:ship)))

(* What each statement declares, against the tables the migrations make. *)
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
      ( "projects",
        [
          Alcotest.test_case "start and list" `Quick test_projects;
          Alcotest.test_case "refused" `Quick test_project_refused;
          Alcotest.test_case "removed with its tasks" `Quick
            test_project_removed;
        ] );
      ( "tasks",
        [
          Alcotest.test_case "add and list" `Quick test_add_and_list;
          Alcotest.test_case "refused" `Quick test_task_refused;
          Alcotest.test_case "filter by project and status" `Quick test_filter;
          Alcotest.test_case "move" `Quick test_move;
          Alcotest.test_case "remove" `Quick test_remove;
          Alcotest.test_case "a draft's bounds" `Quick test_draft_bounds;
          Alcotest.test_case "kept across a restart" `Quick test_kept;
          Alcotest.test_case "an id is never reused" `Quick test_ids_not_reused;
        ] );
      ( "the store",
        [
          Alcotest.test_case "tasks made before projects" `Quick
            test_tasks_before_projects;
          Alcotest.test_case "the statements match the tables" `Quick
            test_statements;
        ] );
    ]
