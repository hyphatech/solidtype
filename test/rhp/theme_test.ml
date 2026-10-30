external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/Theme.tsx"]

let () = Harness.alike "Theme" ~island:Docs_islands.Rhp_theme.make ~twin
