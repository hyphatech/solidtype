(** React Aria's selection indicator, as the ports of a collection draw it -- a
    tab's, a segment's: an element drawn in the selected item alone which, as
    the selection moves, is drawn first where the last one was, then moved to
    its own place by the transition its style gives it -- its [translate] from
    the last one's place, and any other property it transitions from the last
    one's value. Where its style gives no transition, it is drawn in its place
    at once. *)

type t
(** A collection's indicators, which keep where the last one was. *)

val create : unit -> t

type indicator = {
  ref : 'e. 'e Dom.element_like -> unit;  (** Given the indicator's element. *)
  entering : unit -> bool;
      (** True for a frame once the collection's first indicator is drawn, where
          no last one was, as React Aria's marks it entering. *)
}

val indicator : t -> indicator
(** [indicator t], as an indicator is made in the selected item, starts it from
    the last one once both are on the page, and keeps where it is for the next
    as it leaves. *)
