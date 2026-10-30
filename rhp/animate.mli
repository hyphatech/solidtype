(** How a plot moves by the JavaScript version, where the numbers themselves
    move: every field of its rows that holds numbers, or only the fields named,
    and the timing.

    Name the fields that change, as rhp advises for data that changes all the
    time, a live feed or a race:
    [animate=(fun () -> Animate.groups [| "points" |])].

    Ported by hand: rhp declares a plot's [animate] as a union of three
    JavaScript kinds, [true], a list of names and an object of timing and names,
    where the generator's rule binds two. *)

type t

val all : t
(** Every field of the rows that holds numbers. *)

external groups : string array -> t = "%identity"
(** Only the fields of the rows of these names. *)

external make :
  ?groups:string array ->
  ?duration:float ->
  ?ease:Ease.t ->
  ?slide:float ->
  unit ->
  t = ""
[@@mel.obj]
(** [groups], the fields that move, every field of numbers when left out;
    [duration], the ms a value takes to move, 150 by default; [ease], how it
    moves, ease-out by default; [slide], the ms a slat takes to slide to a new
    place, 175 by default. *)
