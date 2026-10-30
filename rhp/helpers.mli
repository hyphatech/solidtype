(** rhp's functions of a row and of its values, which [Solidtype_rhp] includes,
    as rhp exports them beside its other helpers.

    Ported by hand: [series] and [cycle] give a function of rhp's row, which no
    rule maps, and [stackUp], [shares] and [running] are each two overloads
    whose results differ. A missing value, [None], is one rhp leaves out. *)

val series : ?n:int -> unit -> 'row Row.t -> Color.t
(** The theme's series colors through the rows, [Color.series 1] for the first,
    back to the first after [n], the theme's count by default. *)

val cycle : 'a array -> 'row Row.t -> 'a
(** An item of the list for each row, repeated over the rows. *)

type stack = { from : float option array; to_ : float option array }
(** Where each segment starts and ends. *)

val stack_up : float option array -> stack
(** Stacked segments: positive values stack up from 0, negative ones down; a
    missing value is a missing segment. *)

val running : float option array -> stack
(** Running totals, for a waterfall: each change from the total before it; a
    missing change is a missing step. *)

val shares : ?total:float -> float option array -> float option array
(** Each value as its share of the sum, scaled to [total], 100 by default; a
    missing value has no share. *)
