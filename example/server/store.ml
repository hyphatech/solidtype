type status = To_read | Reading | Read [@@deriving wiretype]

type book = {
  id : int;
  title : string;
  author : string;
  status : status;
  rating : int option; [@min 1] [@max 5]
}
[@@deriving wiretype]

(* One lock for the whole shelf: every change is a few list operations, so
   nothing waits long behind it. *)
type t = { lock : Mutex.t; mutable books : book list; mutable next : int }

let create () = { lock = Mutex.create (); books = []; next = 1 }
let dep : t Spindle.Dep.t = Spindle.Dep.of_resource "shelf"
let resource s = Spindle.Dep.resource dep s

let shelved status (b : book) =
  match (status, b.status) with
  | To_read, To_read | Reading, Reading | Read, Read -> true
  | (To_read | Reading | Read), _ -> false

let books ?status s =
  let all = Mutex.protect s.lock (fun () -> s.books) in
  match status with
  | None -> all
  | Some status -> List.filter (shelved status) all

let add s ~title ~author =
  Mutex.protect s.lock (fun () ->
      let b = { id = s.next; title; author; status = To_read; rating = None } in
      s.next <- s.next + 1;
      s.books <- b :: s.books;
      b)

(* [f] of the book [id], kept in its place, or what [f] refused with. *)
let change s id f =
  Mutex.protect s.lock (fun () ->
      match List.find_opt (fun (b : book) -> b.id = id) s.books with
      | None -> Error `Missing
      | Some b ->
          Result.map
            (fun (changed : book) ->
              s.books <-
                List.map
                  (fun (c : book) -> if c.id = id then changed else c)
                  s.books;
              changed)
            (f b))

let move s id status =
  Result.to_option
    (change s id (fun b ->
         let rating =
           match status with Read -> b.rating | To_read | Reading -> None
         in
         Ok { b with status; rating }))

let rate s id stars =
  change s id (fun b ->
      match b.status with
      | Read -> Ok { b with rating = Some stars }
      | To_read | Reading -> Error (`Unread b))

let remove s id =
  Mutex.protect s.lock (fun () ->
      let kept = List.filter (fun (b : book) -> b.id <> id) s.books in
      let removed = List.compare_lengths kept s.books <> 0 in
      s.books <- kept;
      removed)
