external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/CellStrip.tsx"]

let () =
  Harness.alike "Cell strip" ~island:Docs_islands.Rhp_cell_strip.make ~twin
