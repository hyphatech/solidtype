(** The ticks of an axis: these values, about that many round ones, ones a
    function of the scale works out, or none.

    Ported by hand: rhp declares them as a union of four JavaScript kinds, a
    list, a number, a function and [false], where the generator's rule binds
    two. *)

type t

external values : float array -> t = "%identity"
(** A tick at each of these values. *)

val count : int -> t
(** About this many round values across the scale. *)

val custom : (float * float -> float array) -> t
(** The ticks a function gives for the scale's [(min, max)], as
    [Solidtype_rhp.every] gives: [Ticks.custom (Solidtype_rhp.every 5. ())]. *)

val none : t
(** No ticks, and no grid lines. *)
