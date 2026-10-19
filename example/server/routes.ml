(* The notes over HTTP: what the example's island lists, adds and marks
   done. Each answer is a description the island reads through the client
   printed from these routes. *)

open Spindle.Syntax

type draft = { text : string [@min_length 1] [@max_length 80] }
[@@deriving wiretype]

let id = Spindle.Path.int "id"

let routes =
  [
    Spindle.get ~summary:"Every note"
      Spindle.Path.(s "notes")
      (Spindle.Returns.json (Wiretype.list Store.note_json))
      (let+ s = Store.dep in
       Ok (Store.all s));
    Spindle.post ~summary:"Add a note"
      Spindle.Path.(s "notes")
      (Spindle.Returns.json ~status:`Created Store.note_json)
      (let+ s = Store.dep and+ (d : draft) = Spindle.json draft_json in
       Ok (Store.add s d.text));
    Spindle.put ~summary:"Mark a note done"
      ~refuses:[ Spindle.Refusal.Code.not_found ]
      Spindle.Path.(s "notes" / id / s "done")
      (Spindle.Returns.json Store.note_json)
      (let+ s = Store.dep and+ id = Spindle.param id in
       Option.to_result ~none:Spindle.Refusal.not_found (Store.mark_done s id));
  ]
