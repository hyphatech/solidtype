external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/BoxPlot.tsx"]

let () = Harness.alike "Box plot" ~island:Docs_islands.Rhp_box_plot.make ~twin
