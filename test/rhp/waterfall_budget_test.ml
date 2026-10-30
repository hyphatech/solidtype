external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/WaterfallBudget.tsx"]

let () =
  Harness.alike "WaterfallBudget" ~island:Docs_islands.Rhp_waterfall_budget.make
    ~twin

(* Rent, the first expense, cut. *)
let () =
  Harness.alike_after "WaterfallBudget" "an expense is cut"
    ~act:(Harness.click ".item button" 0)
    ~island:Docs_islands.Rhp_waterfall_budget.make ~twin
