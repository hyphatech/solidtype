(* The routes' Zod schemas, which the notes island's TSX twin reads, as
   a TypeScript front end reads its own. *)

let () =
  match Spindle.App.make Notes.routes with
  | Error e ->
      prerr_endline e;
      exit 1
  | Ok app -> (
      match
        Spindle.Zod.schemas
          ~header:
            "Printed from example/server/notes.ml. Do not edit: run dune \
             promote."
          app
      with
      | Ok text -> print_string text
      | Error errors ->
          List.iter prerr_endline errors;
          exit 1)
