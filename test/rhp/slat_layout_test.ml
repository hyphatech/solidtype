external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/SlatLayout.tsx"]

let () =
  Harness.alike "Slat layout" ~island:Docs_islands.Rhp_slat_layout.make ~twin
