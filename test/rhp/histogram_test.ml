external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/Histogram.tsx"]

let () = Harness.alike "Histogram" ~island:Docs_islands.Rhp_histogram.make ~twin
