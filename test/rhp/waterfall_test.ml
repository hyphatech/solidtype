external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/Waterfall.tsx"]

let () = Harness.alike "Waterfall" ~island:Docs_islands.Rhp_waterfall.make ~twin
