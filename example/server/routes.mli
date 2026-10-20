(** The shelf over HTTP, under [/api]: list, add, move, rate and remove a book.
*)

val not_read : Spindle.Refusal.Code.t
(** A rating given to a book not yet read: [409]. *)

val routes : Spindle.Route.t list
