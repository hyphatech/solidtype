external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/Poster.tsx"]

let () = Harness.alike "Poster" ~island:Docs_islands.Rhp_poster.make ~twin
