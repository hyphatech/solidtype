(** A row as a slat reads it: its data, its number among the rows and its place
    on screen.

    Ported by hand: rhp's [Row<T>] is its row type and two numbers at once, an
    intersection with a type parameter, which no rule of the generator maps;
    here the data is the row's own OCaml type. *)

type 'row t

external data : 'row t -> 'row = "%identity"
(** The row's data, a value of the type given to the plot's [rows]. A field of
    it is read from rhp when it is read, so a read inside a thunk follows the
    row as it changes, as [d.sold] does in rhp's JSX:
    [let f = Row.data d in <Bar to_=(fun () -> f.sold) />]. *)

val index : 'row t -> int
(** The row's number among the rows, from 0. *)

val position : 'row t -> int option
(** The row's place on screen, from 0, or [None] while it is hidden. *)
