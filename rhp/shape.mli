(** An outline a block wears in place of its rectangle, drawn in the block's own
    box: a point's first coordinate runs along the value axis, from the block's
    start to its end, and its second across the band. rhp turns it for a
    vertical chart and for a bar that runs backward, so a shape is written once.

    {[
    let gable =
      Shape.(
        make (share 0.) (share 0.)
          [
            l (css "-26px") (share 0.);
            l (share 1.) (share 0.5);
            l (css "-26px") (share 1.);
            l (share 0.) (share 1.);
            z;
          ])
    ]}

    Ported by hand: rhp declares its commands as tuples headed by a letter,
    [["L", x, y]], which no rule of the generator maps, and [shape] throws on a
    list that does not start with a move, which {!make} cannot be given. *)

type t

type coord
(** A coordinate in the block's box. *)

external share : float -> coord = "%identity"
(** A share of the box, from 0 to 1. *)

external css : string -> coord = "%identity"
(** A CSS length; one that starts with a minus is measured back from the far
    end, so ["-26px"] is 26px in from the block's end, as a cap wants. *)

type command
(** One step of the outline, as SVG's path draws it. *)

val m : coord -> coord -> command
(** Move to a point, starting a new part of the outline. *)

val l : coord -> coord -> command
(** A line to a point. *)

val q : coord -> coord -> coord -> coord -> command
(** [q cx cy x y] is a quadratic curve to [(x, y)] through the control point
    [(cx, cy)]. *)

val c : coord -> coord -> coord -> coord -> coord -> coord -> command
(** [c c1x c1y c2x c2y x y] is a cubic curve to [(x, y)] through two control
    points. *)

val z : command
(** Close the outline. *)

val make : coord -> coord -> command list -> t
(** [make x y commands] starts at [(x, y)] and follows [commands]. *)
