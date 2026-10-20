open Spindle.Syntax

type draft = {
  title : string; [@min_length 1] [@max_length 120]
  note : string option; [@max_length 200]
}
[@@deriving wiretype]

type move = { status : Store.status [@with Store.status_json] }
[@@deriving wiretype]

let id = Spindle.Path.int "id"

(* The query's words are the enum's; the deriver keeps its spelling to
   itself, so it is written again here. *)
let filter =
  Spindle.Query.optional "status"
    (Spindle.Codec.enum ~kind:"status"
       (function Store.To_do -> "to_do" | Doing -> "doing" | Done -> "done")
       [ To_do; Doing; Done ])

let not_found = Spindle.Refusal.Code.not_found

let routes =
  [
    Spindle.get ~summary:"The tasks, newest first"
      Spindle.Path.(s "api" / s "tasks")
      (Spindle.Returns.json (Wiretype.list Store.task_json))
      (let+ board = Store.dep and+ status = filter in
       Ok (Store.tasks ?status board));
    Spindle.post ~summary:"Put a task on the board"
      Spindle.Path.(s "api" / s "tasks")
      (Spindle.Returns.json ~status:`Created Store.task_json)
      (let+ board = Store.dep and+ (d : draft) = Spindle.json draft_json in
       Ok (Store.add board ~title:d.title ?note:d.note ()));
    Spindle.put ~summary:"Move a task to another column" ~refuses:[ not_found ]
      Spindle.Path.(s "api" / s "tasks" / id / s "status")
      (Spindle.Returns.json Store.task_json)
      (let+ board = Store.dep
       and+ id = Spindle.param id
       and+ (m : move) = Spindle.json move_json in
       Option.to_result ~none:Spindle.Refusal.not_found
         (Store.move board id m.status));
    Spindle.delete ~summary:"Take a task off the board" ~refuses:[ not_found ]
      Spindle.Path.(s "api" / s "tasks" / id)
      (Spindle.Returns.empty ())
      (let+ board = Store.dep and+ id = Spindle.param id in
       if Store.remove board id then Ok () else Error Spindle.Refusal.not_found);
  ]
