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
