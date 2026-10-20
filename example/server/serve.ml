(* The board: its API, the API's document at /docs, and the built page
   beside them on one origin. Vite names what it builds under /assets/ by
   a hash of its bytes, so a browser keeps those a year. *)

let routes =
  Routes.routes
  @ Spindle.Openapi.routes Routes.routes
  @ [ Spindle.Static.directory "_build/example-dist" ]

let () =
  Spindle.Log.setup ();
  Eio_main.run @@ fun env ->
  Spindle.serve env ~port:4420
    ~resources:[ Store.resource (Store.create ()) ]
    ~middleware:[ Spindle.Cache.forever ~under:Spindle.Path.[ s "assets" ] ]
    routes
