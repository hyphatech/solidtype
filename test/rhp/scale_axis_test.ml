external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/ScaleAxis.tsx"]

let () =
  Harness.alike "Scale axis" ~island:Docs_islands.Rhp_scale_axis.make ~twin
