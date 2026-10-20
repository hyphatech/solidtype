type status = To_do | Doing | Done [@@deriving wiretype]

type task = { id : int; title : string; note : string option; status : status }
[@@deriving wiretype]

(* One lock for the whole board: every change is a few list operations, so
   nothing waits long behind it. *)
type t = { lock : Mutex.t; mutable tasks : task list; mutable next : int }

let create () = { lock = Mutex.create (); tasks = []; next = 1 }
let dep : t Spindle.Dep.t = Spindle.Dep.of_resource "board"
let resource b = Spindle.Dep.resource dep b

let placed status (t : task) =
  match (status, t.status) with
  | To_do, To_do | Doing, Doing | Done, Done -> true
  | (To_do | Doing | Done), _ -> false

let tasks ?status b =
  let all = Mutex.protect b.lock (fun () -> b.tasks) in
  match status with
  | None -> all
  | Some status -> List.filter (placed status) all

let add b ~title ?note () =
  Mutex.protect b.lock (fun () ->
      let t = { id = b.next; title; note; status = To_do } in
      b.next <- b.next + 1;
      b.tasks <- t :: b.tasks;
      t)

let move b id status =
  Mutex.protect b.lock (fun () ->
      match List.find_opt (fun (t : task) -> t.id = id) b.tasks with
      | None -> None
      | Some t ->
          let moved = { t with status } in
          b.tasks <-
            List.map (fun (c : task) -> if c.id = id then moved else c) b.tasks;
          Some moved)

let remove b id =
  Mutex.protect b.lock (fun () ->
      let kept = List.filter (fun (t : task) -> t.id <> id) b.tasks in
      let removed = List.compare_lengths kept b.tasks <> 0 in
      b.tasks <- kept;
      removed)
