external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/DotDumbbell.tsx"]

let () =
  Harness.alike "Dot dumbbell" ~island:Docs_islands.Rhp_dot_dumbbell.make ~twin
