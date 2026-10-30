external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/AreaViolin.tsx"]

let () =
  Harness.alike "Area violin" ~island:Docs_islands.Rhp_area_violin.make ~twin
