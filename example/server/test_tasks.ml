(* The routes, called in-process as the board calls them. *)

let app () =
  Spindle.Test.app ~resources:[ Store.resource (Store.create ()) ] Routes.routes

let call app meth ?body target =
  let r = Spindle.Test.call app meth target ?body in
  (Spindle_http.Status.to_int r.status, r.body)

let check_answer what (status, body) got =
  Alcotest.(check (pair int string)) what (status, body) got

let write = {|{"title":"Write the README","note":"its map first"}|}

let test_add_and_list () =
  let app = app () in
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
  let app = app () in
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
  let app = app () in
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
  let app = app () in
  ignore (call app `POST "/api/tasks" ~body:write : int * string);
  check_answer "removed" (204, "") (call app `DELETE "/api/tasks/1");
  let status, _ = call app `DELETE "/api/tasks/1" in
  Alcotest.(check int) "removed twice" 404 status;
  check_answer "empty" (200, "[]") (call app `GET "/api/tasks")

let test_draft_bounds () =
  let app = app () in
  let empty, _ = call app `POST "/api/tasks" ~body:{|{"title":""}|} in
  let long, _ =
    call app `POST "/api/tasks"
      ~body:({|{"title":"x","note":"|} ^ String.make 201 'n' ^ {|"}|})
  in
  Alcotest.(check (pair int int))
    "an empty title, a long note" (400, 400) (empty, long)

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
        ] );
    ]
