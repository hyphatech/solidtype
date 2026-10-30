external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/LabelEdges.tsx"]

let () =
  Harness.alike "Label edges" ~island:Docs_islands.Rhp_label_edges.make ~twin
