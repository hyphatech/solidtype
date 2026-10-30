external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/PlaceBadges.tsx"]

let () =
  Harness.alike "Place badges" ~island:Docs_islands.Rhp_place_badges.make ~twin
