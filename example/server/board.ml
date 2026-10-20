(* The board's command line: its API described from the routes -- the
   OpenAPI document, the Zod schemas and the Melange client the front end
   is built against. *)

let () =
  Spindle_cli.run ~name:"board" ~title:"Kanban Board"
    ~app:(Spindle.App.make Routes.routes)
    ()
