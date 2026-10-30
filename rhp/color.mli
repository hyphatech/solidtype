(** A color a block draws with: a key of the chart's theme, which follows the
    page's theme, or any CSS color.

    Ported by hand: rhp declares it as [`series-${number}`], seven keys and
    [string & {}], any string, which the generator's rule reads as a [string]
    and would lose the keys. *)

type t

val series : int -> t
(** [series n] is the theme's [n]th series color, ["series-n"], from 1. *)

val positive : t
val negative : t
val ink : t
val muted : t
val grid : t
val surface : t

val low : t
(** The color at the bottom of a [Cell]'s scale. *)

val high : t
(** The color at the top of a [Cell]'s scale. *)

val css : string -> t
(** [css c] is any CSS color, ["#c00"] or ["oklch(70% 0.1 200)"], which no theme
    changes. *)
