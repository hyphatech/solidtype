(* The example served: the notes on [PORT], and, given [SITE], the built
   site beside them. It prints where it listens once it does, which is what
   a test waits for. *)

let () =
  let port, site =
    match Array.to_list Sys.argv with
    | [ _; port ] -> (int_of_string_opt port, None)
    | [ _; port; site ] -> (int_of_string_opt port, Some site)
    | _ -> (None, None)
  in
  match port with
  | None ->
      prerr_endline "usage: serve PORT [SITE]";
      exit 2
  | Some port ->
      Eio_main.run @@ fun env ->
      Spindle.serve env ~port
        ~resources:[ Notes.resource (Notes.create ()) ]
        ~ready:(fun where ->
          print_endline where;
          flush stdout)
        (Notes.routes
        @ Option.fold ~none:[]
            ~some:(fun dir -> [ Spindle.Static.directory dir ])
            site)
