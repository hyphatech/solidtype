(* What the board shows: every project's tasks, or one project's. *)

type t = All | Project of float

let equal a b =
  match (a, b) with
  | All, All -> true
  | Project a, Project b -> Float.equal a b
  | (All | Project _), _ -> false

let shows view (t : Api.task) =
  match view with All -> true | Project id -> Float.equal t.project id
