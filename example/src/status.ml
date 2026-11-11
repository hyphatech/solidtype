(* Where a task is, as the board shows it: a column each, in the order work
   goes. The client prints the server's one status as a type per place it is
   used, so this is the task's, and a move's is made from it. *)

type t = Api.task_status = Backlog | To_do | Doing | Review | Done

let all = [ Backlog; To_do; Doing; Review; Done ]

let label = function
  | Backlog -> "Backlog"
  | To_do -> "To do"
  | Doing -> "Doing"
  | Review -> "Review"
  | Done -> "Done"

(* The name a menu item is known by. *)
let key = function
  | Backlog -> "backlog"
  | To_do -> "to_do"
  | Doing -> "doing"
  | Review -> "review"
  | Done -> "done"

let of_key k = List.find_opt (fun s -> String.equal (key s) k) all

let equal a b =
  match (a, b) with
  | Backlog, Backlog | To_do, To_do | Doing, Doing | Review, Review | Done, Done
    ->
      true
  | (Backlog | To_do | Doing | Review | Done), _ -> false

let to_move : t -> Api.move_status = function
  | Backlog -> Backlog
  | To_do -> To_do
  | Doing -> Doing
  | Review -> Review
  | Done -> Done
