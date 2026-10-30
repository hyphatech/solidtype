external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/Pie.tsx"]

let () = Harness.alike "Pie" ~island:Docs_islands.Rhp_pie.make ~twin
