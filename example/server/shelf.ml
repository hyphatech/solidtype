(* The shelf's command line: its API described from the routes -- the
   OpenAPI document, the Zod schemas and the Melange client the front end
   is built against. *)

let () =
  Spindle_cli.run ~name:"shelf" ~title:"Shelf"
    ~app:(Spindle.App.make Routes.routes)
    ()
