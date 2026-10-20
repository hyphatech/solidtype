(* Where a task is, as the board shows it: a column each, in the order work
   goes. The client prints the server's one status as a type per place it is
   used, so this is the task's, and a move's is made from it. *)

type t = Api.task_status = To_do | Doing | Done

let all = [ To_do; Doing; Done ]
let label = function To_do -> "To do" | Doing -> "Doing" | Done -> "Done"
let next = function To_do -> Some Doing | Doing -> Some Done | Done -> None

let previous = function
  | To_do -> None
  | Doing -> Some To_do
  | Done -> Some Doing

let equal a b =
  match (a, b) with
  | To_do, To_do | Doing, Doing | Done, Done -> true
  | (To_do | Doing | Done), _ -> false

let to_move : t -> Api.move_status = function
  | To_do -> To_do
  | Doing -> Doing
  | Done -> Done
