external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/PlotSorted.tsx"]

let () =
  Harness.alike "Plot sorted" ~island:Docs_islands.Rhp_plot_sorted.make ~twin
