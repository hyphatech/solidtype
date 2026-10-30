external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/Gantt.tsx"]

let () = Harness.alike "Gantt" ~island:Docs_islands.Rhp_gantt.make ~twin
