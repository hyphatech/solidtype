(** What HeroUI's fields share -- a switch, a checkbox, a radio: the state their
    content shows, a value controlled or kept, and the content, the clickable
    label that holds the control and its {!Label}, with Kobalte's input inside
    it, as React Aria's is. *)

type state = {
  selected : unit -> bool;
  indeterminate : unit -> bool;
  disabled : unit -> bool;
  invalid : unit -> bool;
  read_only : unit -> bool;
  required : unit -> bool;
  aria_label : unit -> string option;
  interaction : Interaction.t;
}
(** A field's state, which its content declares as React Aria writes it:
    [data-selected], [data-indeterminate], [data-disabled], [data-invalid],
    [data-readonly] and [data-required], and the {!Interaction} with it; and the
    name its input is given where no label names it, [aria-label]. Content no
    pointer presses keeps its click from its input, as React Aria's read-only
    checkbox and switch do, so a pointer neither focuses nor toggles it. *)

val controlled :
  value:(unit -> 'a option) ->
  default:'a ->
  on_change:('a -> 'b) ->
  (unit -> 'a) * ('a -> unit)
(** [controlled ~value ~default ~on_change] is a field's value and its setter,
    as React Stately keeps one: [value ()] while it is [Some], else the value
    kept, [default] at first. Setting it keeps the value and calls [on_change],
    whose result is ignored, so an optional callback is given as it comes. *)

(** The parts of a Kobalte component that make a field's content: its label and
    the input inside it. *)
module type Kobalte = sig
  val label : unit Solidtype.Jsx.component
  val input : unit Solidtype.Jsx.component
end

(** A field's content, on the label and input of a Kobalte component:
    [Field.Content (struct let label = Switch.Label.component let input =
     Switch.Input.component end)]. A port's own content renders it with its slot
    and its classes. *)
module Content (_ : Kobalte) : sig
  module Props : sig
    type t

    val check :
      field:state Solidtype.Check.value ->
      slot:string Solidtype.Check.value ->
      class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end
