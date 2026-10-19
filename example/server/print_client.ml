(* The island's client, printed from the routes as the build runs: a route
   that changes is a client that changes, and an island that no longer
   matches it does not compile. *)

let () =
  match Spindle.App.make Notes.routes with
  | Error e ->
      prerr_endline e;
      exit 1
  | Ok app -> (
      match
        Spindle.Melange.client
          ~header:"Printed from example/server/notes.ml as the build runs." app
      with
      | Ok text -> print_string text
      | Error errors ->
          List.iter prerr_endline errors;
          exit 1)
