external twin : unit -> Solidtype.Jsx.element = "make"
[@@mel.module "./twins/ManyDots.tsx"]

let () = Harness.alike "Many dots" ~island:Docs_islands.Rhp_many_dots.make ~twin

(* The eleventh point clicked: outlined, and read out as the one selected. *)
let () =
  Harness.alike_after "Many dots" "a point is clicked"
    ~act:(Harness.click ".rhp-manydot" 10)
    ~island:Docs_islands.Rhp_many_dots.make ~twin
