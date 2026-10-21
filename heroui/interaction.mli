(** The state of an interaction with an element, kept as React Aria keeps it on
    HeroUI's components in React, for a port to declare as the attributes
    HeroUI's styles read: [data-hovered], [data-pressed], [data-focused],
    [data-focus-visible] and [data-disabled], each ["true"] or absent.

    Kobalte gives its parts their behaviour and their ARIA state, but none of
    these. A port makes the state, has it listen to the element Kobalte renders,
    and declares each attribute, which Solid then writes, on the server as in
    the browser:

    {[
      let i = Interaction.create ~disabled:(fun[@u] () -> disabled ()) () in
      <Kobalte.Root
        ref=(fun b -> Interaction.watch i b)
        data_hovered=(fun () -> Jsx.flag (Interaction.hovered i))
        data_pressed=(fun () -> Jsx.flag (Interaction.pressed i))
        data_focused=(fun () -> Jsx.flag (Interaction.focused i))
        data_focus_visible=(fun () -> Jsx.flag (Interaction.focus_visible i))
        data_disabled=(fun () -> Jsx.flag (Interaction.disabled i))>
    ]} *)

type t

val create :
  ?disabled:bool Solidtype.Solid.accessor ->
  ?no_hover:bool Solidtype.Solid.accessor ->
  ?no_pointer_press:bool Solidtype.Solid.accessor ->
  ?keys:[ `target | `element ] ->
  unit ->
  t
(** A state with nothing hovered, pressed or focused, disabled while [disabled]
    holds. While [no_hover] holds it is not hovered, and while
    [no_pointer_press] holds no pointer presses it, though a key still does:
    React Aria's read-only checkbox and switch are neither, its read-only radio
    only not hovered. A key presses as [keys] says React Aria judges it: by what
    it went to, [`target], the default; or by the element watched, [`element],
    as React Aria's radio judges a key on its label, which the input's key
    reaches as it bubbles, so Enter presses a radio's content as Space does. *)

val watch : t -> _ Dom.element_like -> unit
(** [watch i element] keeps [i] as React Aria keeps an element's state:

    - hovered while a mouse or a pen, never a touch, is over it;
    - pressed while a pointer is down on it and over it, or while Enter is held
      on it but for a checkbox or a radio, or Space but on a link, an anchor
      with an href or the link role, as React Aria decides by what the key went
      to, or by the element itself as [keys] says;
    - focused while it or an element inside it has the focus, and focus-visible
      while it has it and the page's last input was a key rather than a pointer,
      a key typed into a text not counted, but Tab and Escape, as React Aria
      decides; so a pointer pressed elsewhere hides its ring.

    It is called once, as the element is made: from its [ref]. *)

val hovered : t -> bool
(** Whether it is hovered, and not disabled; a read Solid tracks, as are the
    others. *)

val pressed : t -> bool
(** Whether it is pressed, and not disabled. *)

val focused : t -> bool
val focus_visible : t -> bool

val pointer_inert : t -> bool
(** Whether [no_pointer_press], given to {!create}, holds. *)

val disabled : t -> bool
(** Whether [disabled], given to {!create}, holds. *)
