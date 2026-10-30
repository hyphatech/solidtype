(** The order a plot shows its rows in: a place for each, or a sort.

    Ported by hand: rhp's order is a list of places or a function of its rows,
    two JavaScript kinds, and [sortBy] takes a row's field by name, which a
    typed row reads by a function instead. *)

type 'row t

external positions : float option array -> 'row t = "%identity"
(** A place on screen for each row, from 0, in the rows' order; [None] hides the
    row. Gaps, ties and fractions all draw. *)

val sort_by : ?direction:[ `asc | `desc ] -> ('row Row.t -> 'key) -> 'row t
(** The rows sorted by what [key] gives for each, [`asc] by default. Rows of
    equal keys keep their places on screen, and a row whose key is missing,
    [None], goes last either way. *)
