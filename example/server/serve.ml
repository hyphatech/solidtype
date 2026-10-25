(* The board: its API, the API's document at /docs, and the built page
   beside them on one origin, its tasks in the SQLite file BOARD_DB names,
   which rowtype-migrate has migrated before it starts. Vite names what it
   builds under /assets/ by a hash of its bytes, so a browser keeps those a
   year. *)

let routes =
  Routes.routes
  @ Spindle.Openapi.routes Routes.routes
  @ [ Spindle.Static.directory "_build/example-dist" ]

let () =
  let file =
    Option.value (Sys.getenv_opt "BOARD_DB") ~default:"example/board.db"
  in
  Spindle.Log.setup ();
  Eio_main.run @@ fun env ->
  Spindle_sqlite.Pool.run env file @@ fun pool ->
  Spindle.serve env ~port:4420
    ~resources:[ Store.resource pool ]
    ~middleware:[ Spindle.Cache.forever ~under:Spindle.Path.[ s "assets" ] ]
    routes
