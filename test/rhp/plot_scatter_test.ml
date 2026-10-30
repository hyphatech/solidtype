external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/PlotScatter.tsx"]

let () =
  Harness.alike "Plot scatter" ~island:Docs_islands.Rhp_plot_scatter.make ~twin
