open Spindle.Syntax

type draft = {
  title : string; [@min_length 1] [@max_length 120]
  author : string; [@min_length 1] [@max_length 80]
}
[@@deriving wiretype]

type move = { status : Store.status [@with Store.status_json] }
[@@deriving wiretype]

type stars = { stars : int [@min 1] [@max 5] } [@@deriving wiretype]

let id = Spindle.Path.int "id"

(* The query's words are the enum's; the deriver keeps its spelling to
   itself, so it is written again here. *)
let filter =
  Spindle.Query.optional "status"
    (Spindle.Codec.enum ~kind:"status"
       (function
         | Store.To_read -> "to_read" | Reading -> "reading" | Read -> "read")
       [ To_read; Reading; Read ])

let not_read =
  Spindle.Refusal.Code.make "not_read" ~status:`Conflict
    ~doc:"Only a book that has been read can be rated."

let not_found = Spindle.Refusal.Code.not_found

let routes =
  [
    Spindle.get ~summary:"The books, newest first"
      Spindle.Path.(s "api" / s "books")
      (Spindle.Returns.json (Wiretype.list Store.book_json))
      (let+ shelf = Store.dep and+ status = filter in
       Ok (Store.books ?status shelf));
    Spindle.post ~summary:"Put a book on the shelf"
      Spindle.Path.(s "api" / s "books")
      (Spindle.Returns.json ~status:`Created Store.book_json)
      (let+ shelf = Store.dep and+ (d : draft) = Spindle.json draft_json in
       Ok (Store.add shelf ~title:d.title ~author:d.author));
    Spindle.put ~summary:"Move a book to another status" ~refuses:[ not_found ]
      Spindle.Path.(s "api" / s "books" / id / s "status")
      (Spindle.Returns.json Store.book_json)
      (let+ shelf = Store.dep
       and+ id = Spindle.param id
       and+ (m : move) = Spindle.json move_json in
       Option.to_result ~none:Spindle.Refusal.not_found
         (Store.move shelf id m.status));
    Spindle.put ~summary:"Rate a book that has been read"
      ~refuses:[ not_found; not_read ]
      Spindle.Path.(s "api" / s "books" / id / s "rating")
      (Spindle.Returns.json Store.book_json)
      (let+ shelf = Store.dep
       and+ id = Spindle.param id
       and+ r = Spindle.json stars_json in
       match Store.rate shelf id r.stars with
       | Ok b -> Ok b
       | Error `Missing -> Error Spindle.Refusal.not_found
       | Error (`Unread (b : Store.book)) ->
           Error
             (Spindle.Refusal.make not_read
                (Printf.sprintf "Finish %s before rating it." b.title)));
    Spindle.delete ~summary:"Take a book off the shelf" ~refuses:[ not_found ]
      Spindle.Path.(s "api" / s "books" / id)
      (Spindle.Returns.empty ())
      (let+ shelf = Store.dep and+ id = Spindle.param id in
       if Store.remove shelf id then Ok () else Error Spindle.Refusal.not_found);
  ]
