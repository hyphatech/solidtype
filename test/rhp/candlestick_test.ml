external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/Candlestick.tsx"]

let () =
  Harness.alike "Candlestick" ~island:Docs_islands.Rhp_candlestick.make ~twin

(* The sixth day pointed at: its prices read out, and its close crossed. *)
let () =
  Harness.alike_after "Candlestick" "a day is pointed at"
    ~act:(Harness.point ".day" 5) ~island:Docs_islands.Rhp_candlestick.make
    ~twin
