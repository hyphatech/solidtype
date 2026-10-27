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

type t

val create : is_open:(unit -> bool) -> unit -> t
(** Made where the overlay is, as it is made; [is_open] is read in Solid's
    tracking. *)

val watch : t -> _ Dom.element_like -> unit
(** The element whose animations it waits for: from its [ref], each time it is
    made. *)

val present : t -> bool
(** Whether it is on the page: open, or closing until its exit animation ends.
*)

val entering : t -> bool
(** Whether its enter animation runs. *)

val exiting : t -> bool
(** Whether its exit animation runs. *)

val arrow_position : unit -> (unit -> string) * (_ Dom.element_like -> unit)
(** Where Kobalte places an overlay's arrow, as the [left], [top], [right] and
    [bottom] of a style, and the [ref] that gives it Kobalte's arrow. Kobalte's
    arrow draws a shape of its own and takes no other, so it is kept, hidden,
    and HeroUI's arrow is drawn where it is. *)

val placed_side :
  placement:(unit -> string) ->
  unit ->
  (unit -> string) * (_ Dom.element_like -> unit)
(** The side Kobalte placed an overlay's content on, ["top"] or another, as
    React Aria's [data-placement] names it, read from Kobalte's positioner as it
    moves, else [placement] until it is placed; and the [ref] that gives it the
    content. For a Kobalte overlay that does not tell its placement. *)
