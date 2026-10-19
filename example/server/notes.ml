(* Notes, kept in memory: what the example's island lists, adds and marks
   done. Each answer is a description the island reads through the client
   printed from these routes. *)

open Spindle.Syntax

type state = Open | Done

let state =
  Wiretype.enum ~kind:"state"
    (function Open -> "open" | Done -> "done")
    [ Open; Done ]

type note = { id : int; text : string; state : state }

let note =
  Wiretype.Object.map ~kind:"note" (fun id text state -> { id; text; state })
  |> Wiretype.Object.mem "id" Wiretype.int ~enc:(fun n -> n.id)
  |> Wiretype.Object.mem "text"
       (Wiretype.string_bounded ~min_length:1 ~max_length:80 ())
       ~doc:"What is to be done." ~enc:(fun n -> n.text)
  |> Wiretype.Object.mem "state" state ~enc:(fun n -> n.state)
  |> Wiretype.Object.finish

type draft = { text : string }

let draft =
  Wiretype.Object.map ~kind:"draft" (fun text -> { text })
  |> Wiretype.Object.mem "text"
       (Wiretype.string_bounded ~min_length:1 ~max_length:80 ())
       ~enc:(fun (d : draft) -> d.text)
  |> Wiretype.Object.finish

(* The notes, newest last. The server runs one domain, and the mutex keeps
   the store right under more. *)
type store = { lock : Mutex.t; mutable notes : note list; mutable next : int }

let create () = { lock = Mutex.create (); notes = []; next = 1 }
let store : store Spindle.Dep.t = Spindle.Dep.of_resource "notes"
let resource s = Spindle.Dep.resource store s
let id = Spindle.Path.int "id"

let routes =
  [
    Spindle.get ~summary:"Every note"
      Spindle.Path.(s "notes")
      (Spindle.Returns.json (Wiretype.list note))
      (let+ s = store in
       Ok (Mutex.protect s.lock (fun () -> s.notes)));
    Spindle.post ~summary:"Add a note"
      Spindle.Path.(s "notes")
      (Spindle.Returns.json ~status:`Created note)
      (let+ s = store and+ (d : draft) = Spindle.json draft in
       Ok
         (Mutex.protect s.lock (fun () ->
              let n = { id = s.next; text = d.text; state = Open } in
              s.next <- s.next + 1;
              s.notes <- s.notes @ [ n ];
              n)));
    Spindle.put ~summary:"Mark a note done"
      Spindle.Path.(s "notes" / id / s "done")
      (Spindle.Returns.json note)
      (let+ s = store and+ id = Spindle.param id in
       Mutex.protect s.lock (fun () ->
           match List.find_opt (fun (n : note) -> n.id = id) s.notes with
           | None -> Error Spindle.Refusal.not_found
           | Some n ->
               let n = { n with state = Done } in
               s.notes <-
                 List.map (fun (m : note) -> if m.id = id then n else m) s.notes;
               Ok n));
  ]
