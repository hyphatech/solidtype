external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/StackedBars.tsx"]

let () =
  Harness.alike "Stacked bars" ~island:Docs_islands.Rhp_stacked_bars.make ~twin
