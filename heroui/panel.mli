(** What a disclosure's content and an accordion's panel share: content kept on
    the page while collapsed, hidden until the browser's find in page reaches a
    word in it, and sized step by step as HeroUI's styles animate it, by
    [--disclosure-panel-width] and [--disclosure-panel-height].

    It grows from no size to its own, measured once it is shown, and then takes
    its own as it changes; it shrinks from its size to none, and is hidden once
    it has. Each step waits a frame, so the transition starts from the size
    before it, and a toggle before a transition ends leaves its end to the
    toggle after. Where the browser cannot tell a transition, as jsdom cannot,
    it takes its size at once, as React Aria's does. *)

type t

val create : expanded:(unit -> bool) -> expand:(unit -> unit) -> unit -> t
(** [create ~expanded ~expand ()] is content shown while [expanded ()], read as
    it changes, which calls [expand] as find in page reaches it. It is made
    while a component is, which it runs an effect beside. *)

val watch : t -> _ Dom.element_like -> unit
(** [watch p element] sizes [element] and listens for find in page on it: the
    content's [ref]. *)

val hidden : t -> string option
(** ["until-found"] while it is collapsed and done shrinking, its [hidden]
    attribute; a read Solid tracks, as {!style} is. *)

val style : t -> string
(** The sizes HeroUI's styles animate, its [style] attribute. *)
