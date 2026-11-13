(** What an overlay -- a tooltip, a popover, a modal -- keeps of its own
    presence, as React Aria keeps it for HeroUI's styles: it is on the page
    while it is open and while its exit animation plays after, and it is
    entering, then exiting, while HeroUI's keyframes for each run.

    {[
      let o = Overlay.create ~is_open () in
      <Show when_=(fun () -> Overlay.present o)>
        <div
          ref=(fun e -> Overlay.watch o e)
          data_entering=(fun () -> Jsx.flag (Overlay.entering o))
          data_exiting=(fun () -> Jsx.flag (Overlay.exiting o))>
          ...
        </div>
      </Show>
    ]}

    An animation is one the element runs as an attribute starts it; with none,
    as in a browser that cannot tell, an overlay enters and leaves at once. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

type t

val create : is_open:(unit -> bool) -> unit -> t
(** Made where the overlay is, as it is made; [is_open] is read in Solid's
    tracking. *)

val watch : t -> _ Dom.element_like -> unit
(** An element whose animations it waits for, with any other it watches: from
    its [ref], each time it is made. *)

val present : t -> bool
(** Whether it is on the page: open, or closing until its exit animation ends.
*)

val entering : t -> bool
(** Whether its enter animation runs. *)

val exiting : t -> bool
(** Whether its exit animation runs. *)

val arrow_position : unit -> string S.accessor * (_ Dom.element_like -> unit)
(** Where Kobalte places an overlay's arrow, as the [left], [top], [right] and
    [bottom] of a style, and the [ref] that gives it Kobalte's arrow. Kobalte's
    arrow draws a shape of its own and takes no other, so it is kept, hidden,
    and HeroUI's arrow is drawn where it is. *)

val placed_side :
  placement:(unit -> string) ->
  unit ->
  string S.accessor * (_ Dom.element_like -> unit)
(** The side Kobalte placed an overlay's content on, ["top"] or another, as
    React Aria's [data-placement] names it, read from Kobalte's positioner as it
    moves, else [placement] until it is placed; and the [ref] that gives it the
    content. For a Kobalte overlay that does not tell its placement. *)

val focus : _ Dom.element_like -> unit
(** [focus e] gives [e] the focus without scrolling the page: an overlay is
    given it before it is placed, at the page's top, as React Aria's is too. *)

val return_focus :
  is_open:(unit -> bool) -> inside:(Dom.element -> bool) -> unit -> unit
(** Gives the focus back, as an overlay closes, to what had it as the overlay
    opened, while the focus is [inside] the overlay or nowhere, as React Aria
    does: Kobalte's does as its content unmounts, which waits here for HeroUI's
    exit animation, when the focus has already left. *)

val dismiss : (unit -> unit) -> Jsx.element
(** A button only a reader finds, which closes an overlay, as React Aria puts
    one for a reader with no Escape key. *)

type placement =
  [ `bottom
  | `bottom_left
  | `bottom_right
  | `bottom_start
  | `bottom_end
  | `top
  | `top_left
  | `top_right
  | `top_start
  | `top_end
  | `left
  | `left_top
  | `left_bottom
  | `start
  | `start_top
  | `start_bottom
  | `right
  | `right_top
  | `right_bottom
  | `end_
  | `end_top
  | `end_bottom ]
(** Where an overlay sits beside its trigger, as React Aria names it: its side,
    then where along that side. [start] and [end] are as the page's direction
    reads them, [left] and [right] whatever it is. *)

val kobalte_placement : [ `ltr | `rtl ] -> placement -> string
(** [kobalte_placement direction p] is [p] as Kobalte's popper names it, its
    side then [start] or [end], read in the page's [direction]. *)

val side_of : string -> string
(** The side a Kobalte placement is on, ["bottom"] of ["bottom-end"], as an
    overlay names it until Kobalte has placed it. *)
