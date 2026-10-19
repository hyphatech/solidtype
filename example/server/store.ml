(* The notes, kept in memory, newest last: what the routes list, add and
   mark done. The server runs one domain, and the mutex keeps the notes
   right under more. *)

type state = Open | Done [@@deriving wiretype]

type note = {
  id : int;
  text : string; [@min_length 1] [@max_length 80]  (** What is to be done. *)
  state : state;
}
[@@deriving wiretype]

type t = { lock : Mutex.t; mutable notes : note list; mutable next : int }

let create () = { lock = Mutex.create (); notes = []; next = 1 }

(* How a route reads the store, and the store the server gives it. *)
let dep : t Spindle.Dep.t = Spindle.Dep.of_resource "notes"
let resource s = Spindle.Dep.resource dep s
let all s = Mutex.protect s.lock (fun () -> s.notes)

let add s text =
  Mutex.protect s.lock (fun () ->
      let n = { id = s.next; text; state = Open } in
      s.next <- s.next + 1;
      s.notes <- s.notes @ [ n ];
      n)

let mark_done s id =
  Mutex.protect s.lock (fun () ->
      match List.find_opt (fun (n : note) -> n.id = id) s.notes with
      | None -> None
      | Some n ->
          let n = { n with state = Done } in
          s.notes <-
            List.map (fun (m : note) -> if m.id = id then n else m) s.notes;
          Some n)
