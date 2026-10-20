(* Where a reader is with a book, as the board shows it: a column each, in
   reading order. The client prints the server's one status as a type per
   place it is used, so this is the book's, and a move's is made from it. *)

type t = Api.book_status = To_read | Reading | Read

let all = [ To_read; Reading; Read ]

let label = function
  | To_read -> "To read"
  | Reading -> "Reading"
  | Read -> "Read"

let next = function
  | To_read -> Some Reading
  | Reading -> Some Read
  | Read -> None

let previous = function
  | To_read -> None
  | Reading -> Some To_read
  | Read -> Some Reading

let equal a b =
  match (a, b) with
  | To_read, To_read | Reading, Reading | Read, Read -> true
  | (To_read | Reading | Read), _ -> false

let to_move : t -> Api.move_status = function
  | To_read -> To_read
  | Reading -> Reading
  | Read -> Read
