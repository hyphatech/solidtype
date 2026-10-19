(* The notes' command line: their API described from the routes -- the
   OpenAPI document, the Zod schemas the twin reads and the Melange client
   the island is built against. *)

let () =
  Spindle_cli.run ~name:"notes" ~title:"Notes"
    ~app:(Spindle.App.make Routes.routes)
    ()
