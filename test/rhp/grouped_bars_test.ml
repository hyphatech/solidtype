external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/GroupedBars.tsx"]

let () =
  Harness.alike "GroupedBars" ~island:Docs_islands.Rhp_grouped_bars.make ~twin
