(** The state of an interaction with an element, written on it as React Aria
    writes it on HeroUI's components in React, for HeroUI's styles to read:
    [data-hovered], [data-pressed], [data-focused], [data-focus-visible] and
    [data-disabled], each ["true"] or absent.

    Kobalte gives its parts their behaviour and their ARIA state, but none of
    these, so a port tracks them on the element Kobalte renders:

    {[
      <Kobalte.Root
        ref=(fun b -> Interaction.track ~disabled:(fun[@u] () -> disabled ()) b)>
    ]} *)

val track :
  ?disabled:bool Solidtype.Solid.accessor -> _ Dom.element_like -> unit
(** [track ~disabled element] keeps [element]'s interaction state as React Aria
    does:

    - hovered while a mouse or a pen, never a touch, is over it;
    - pressed while a pointer is down on it and over it, or while Enter is held
      on it, or Space but on a link, an anchor with an href or the link role;
    - focused while it has the focus, and focus-visible while it has it after a
      key was pressed rather than a pointer;
    - disabled while [disabled] holds, and then neither hovered nor pressed.

    It is called once, as the element is made: from its [ref]. *)
