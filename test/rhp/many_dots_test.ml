external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/ManyDots.tsx"]

let () = Harness.alike "Many dots" ~island:Docs_islands.Rhp_many_dots.make ~twin
