(* The example served: the notes on [PORT], and, given [SITE], the built
   site beside them. A test starts it on a port free at the time, and waits
   for the line Spindle prints once it listens. *)

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
        ~resources:[ Routes.resource (Routes.create ()) ]
        (Routes.routes
        @ Option.fold ~none:[]
            ~some:(fun dir -> [ Spindle.Static.directory dir ])
            site)
