external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/BarChart.tsx"]

let () = Harness.alike "Bar chart" ~island:Docs_islands.Rhp_bar_chart.make ~twin
