external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/TickBullet.tsx"]

let () =
  Harness.alike "Tick bullet" ~island:Docs_islands.Rhp_tick_bullet.make ~twin
