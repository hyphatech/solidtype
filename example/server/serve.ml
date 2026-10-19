(* The example served: the notes and, beside them on one origin, the site
   Astro built. *)

let () =
  Eio_main.run @@ fun env ->
  Spindle.serve env ~port:4420
    ~resources:[ Store.resource (Store.create ()) ]
    (Routes.routes @ [ Spindle.Static.directory "_build/example-dist" ])
