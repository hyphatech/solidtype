external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/BarRange.tsx"]

let () = Harness.alike "Bar range" ~island:Docs_islands.Rhp_bar_range.make ~twin
