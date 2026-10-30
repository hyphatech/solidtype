(** A timing curve a value moves along: one of CSS's, a cubic Bézier, or a
    function of the time, from 0 to 1.

    Ported by hand: rhp declares it as five names, four numbers and a function,
    three JavaScript kinds, where the generator's rule binds two. *)

type t

val linear : t
val ease : t
val ease_in : t
val ease_out : t
val ease_in_out : t

val cubic_bezier : float -> float -> float -> float -> t
(** [cubic_bezier x1 y1 x2 y2] is CSS's [cubic-bezier(x1, y1, x2, y2)]. *)

external custom : (float -> float) -> t = "%identity"
(** The progress at each time, both from 0 to 1. *)
