(** The books on a shelf, kept in memory, newest first, and the rules a change
    to one keeps. *)

(** Where a reader is with a book. *)
type status = To_read | Reading | Read

val status_json : status Wiretype.t

type book = {
  id : int;
  title : string;
  author : string;
  status : status;
  rating : int option;  (** One to five stars, once the book is read. *)
}

val book_json : book Wiretype.t

type t
(** A shelf, safe to share between the server's domains. *)

val create : unit -> t
(** An empty shelf. *)

val dep : t Spindle.Dep.t
(** The shelf, as a route reads it. *)

val resource : t -> Spindle.Dep.resource
(** [shelf] as the one {!dep} reads, for [Spindle.serve ~resources]. *)

val books : ?status:status -> t -> book list
(** Every book, or those with [status]. *)

val add : t -> title:string -> author:string -> book
(** A book put on the shelf, to read. *)

val move : t -> int -> status -> book option
(** The book [id] at [status], [None] when there is none. Its rating is kept
    only while it stays read: a book read again is rated again. *)

val rate : t -> int -> int -> (book, [ `Missing | `Unread of book ]) result
(** The book [id] rated [stars], once it has been read. *)

val remove : t -> int -> bool
(** Whether the book [id] was there to take off the shelf. *)
