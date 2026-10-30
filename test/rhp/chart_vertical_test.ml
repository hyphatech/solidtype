external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/ChartVertical.tsx"]

let () =
  Harness.alike "Chart vertical" ~island:Docs_islands.Rhp_chart_vertical.make
    ~twin
