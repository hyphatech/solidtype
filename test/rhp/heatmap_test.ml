external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/Heatmap.tsx"]

let () = Harness.alike "Heatmap" ~island:Docs_islands.Rhp_heatmap.make ~twin

(* Wednesday's two o'clock pointed at: its day and its hour lit, and read in
   the dek. *)
let () =
  Harness.alike_after "Heatmap" "an hour is pointed at"
    ~act:(Harness.point "[data-rhp-slat]" ((2 * 24) + 14))
    ~island:Docs_islands.Rhp_heatmap.make ~twin
