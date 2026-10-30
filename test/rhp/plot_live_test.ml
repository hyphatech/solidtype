external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/PlotLive.tsx"]

let () = Harness.alike "Plot live" ~island:Docs_islands.Rhp_plot_live.make ~twin
