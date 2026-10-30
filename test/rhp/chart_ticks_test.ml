external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/ChartTicks.tsx"]

let () =
  Harness.alike "Chart ticks" ~island:Docs_islands.Rhp_chart_ticks.make ~twin
