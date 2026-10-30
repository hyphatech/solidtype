external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/LineSparklines.tsx"]

let () =
  Harness.alike "Line sparklines" ~island:Docs_islands.Rhp_line_sparklines.make
    ~twin
