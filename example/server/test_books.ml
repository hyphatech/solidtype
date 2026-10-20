(* The routes, called in-process as the front end calls them. *)

let app () =
  Spindle.Test.app ~resources:[ Store.resource (Store.create ()) ] Routes.routes

let call app meth ?body target =
  let r = Spindle.Test.call app meth target ?body in
  (Spindle_http.Status.to_int r.status, r.body)

let check_answer what (status, body) got =
  Alcotest.(check (pair int string)) what (status, body) got

let dune = {|{"title":"Dune","author":"Frank Herbert"}|}

let test_add_and_list () =
  let app = app () in
  check_answer "added"
    ( 201,
      {|{"id":1,"title":"Dune","author":"Frank Herbert","status":"to_read"}|} )
    (call app `POST "/api/books" ~body:dune);
  ignore
    (call app `POST "/api/books"
       ~body:{|{"title":"Emma","author":"Jane Austen"}|});
  let _, listed = call app `GET "/api/books" in
  Alcotest.(check bool)
    "newest first" true
    (String.starts_with ~prefix:{|[{"id":2|} listed)

let test_filter () =
  let app = app () in
  ignore (call app `POST "/api/books" ~body:dune);
  ignore
    (call app `POST "/api/books"
       ~body:{|{"title":"Emma","author":"Jane Austen"}|});
  ignore (call app `PUT "/api/books/2/status" ~body:{|{"status":"reading"}|});
  check_answer "reading"
    ( 200,
      {|[{"id":2,"title":"Emma","author":"Jane Austen","status":"reading"}]|} )
    (call app `GET "/api/books?status=reading");
  let status, _ = call app `GET "/api/books?status=lost" in
  Alcotest.(check int) "an unknown status" 400 status

let test_rate_only_read () =
  let app = app () in
  ignore (call app `POST "/api/books" ~body:dune);
  check_answer "unread"
    (409, {|{"error":"not_read","message":"Finish Dune before rating it."}|})
    (call app `PUT "/api/books/1/rating" ~body:{|{"stars":4}|});
  ignore (call app `PUT "/api/books/1/status" ~body:{|{"status":"read"}|});
  check_answer "rated"
    ( 200,
      {|{"id":1,"title":"Dune","author":"Frank Herbert","status":"read","rating":4}|}
    )
    (call app `PUT "/api/books/1/rating" ~body:{|{"stars":4}|});
  let status, _ = call app `PUT "/api/books/1/rating" ~body:{|{"stars":6}|} in
  Alcotest.(check int) "six stars" 400 status

let test_reread_forgets_rating () =
  let app = app () in
  ignore (call app `POST "/api/books" ~body:dune);
  ignore (call app `PUT "/api/books/1/status" ~body:{|{"status":"read"}|});
  ignore (call app `PUT "/api/books/1/rating" ~body:{|{"stars":2}|});
  check_answer "reading again"
    ( 200,
      {|{"id":1,"title":"Dune","author":"Frank Herbert","status":"reading"}|} )
    (call app `PUT "/api/books/1/status" ~body:{|{"status":"reading"}|})

let test_remove () =
  let app = app () in
  ignore (call app `POST "/api/books" ~body:dune);
  check_answer "removed" (204, "") (call app `DELETE "/api/books/1");
  let status, _ = call app `DELETE "/api/books/1" in
  Alcotest.(check int) "removed twice" 404 status;
  check_answer "empty" (200, "[]") (call app `GET "/api/books")

let test_draft_bounds () =
  let app = app () in
  let status, _ =
    call app `POST "/api/books" ~body:{|{"title":"","author":"Anon"}|}
  in
  Alcotest.(check int) "an empty title" 400 status

let () =
  Alcotest.run "books"
    [
      ( "routes",
        [
          Alcotest.test_case "add and list" `Quick test_add_and_list;
          Alcotest.test_case "filter by status" `Quick test_filter;
          Alcotest.test_case "rate only what was read" `Quick
            test_rate_only_read;
          Alcotest.test_case "reading again forgets the rating" `Quick
            test_reread_forgets_rating;
          Alcotest.test_case "remove" `Quick test_remove;
          Alcotest.test_case "a draft's bounds" `Quick test_draft_bounds;
        ] );
    ]
