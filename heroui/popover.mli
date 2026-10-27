(** HeroUI's Popover: Kobalte's [Popover], with HeroUI's classes from
    {!Styles.Popover} and its arrow.

    {[
      <Popover>
        <Button>"Click me"</Button>
        <Popover.Content class_="max-w-64">
          <Popover.Dialog>
            <Popover.Heading>"Popover Title"</Popover.Heading>
            <p>"This is the popover content."</p>
          </Popover.Dialog>
        </Popover.Content>
      </Popover>
    ]}

    A {!Button} inside a popover is its trigger, as in HeroUI, and shows pressed
    while the popover is open; so is a {!Trigger}, around anything else. A
    button inside the popover's content is a button. The popover opens as its
    trigger is pressed and gives the focus to its {!Dialog}; Tab keeps the focus
    inside it, and the page outside is hidden from a reader while it is open, as
    React Aria's is. Escape, a press outside, or a reader's dismiss button
    closes it, and the focus goes back to its trigger.

    It is drawn in a portal at the end of the page while it is open, and while
    HeroUI's exit animation plays after.

    A part is used inside a [Popover]: elsewhere it raises [Invalid_argument] as
    it is made. *)

(** A trigger of anything that is not a {!Button}: Kobalte's trigger, a [<div>]
    with the role of a button, reached by Tab. *)
module Trigger : sig
  module Props : sig
    type t

    val check :
      ?aria_label:string Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The popover: Kobalte's content, the dialog its {!Heading} names, [placement]
    beside its trigger, [bottom] by default, [offset] pixels from it, 8 by
    default; on the other side where there is no room, unless [should_flip] is
    false. *)
module Content : sig
  module Props : sig
    type t

    val check :
      ?placement:[ `top | `bottom | `left | `right ] Solidtype.Check.value ->
      ?offset:float Solidtype.Check.value ->
      ?should_flip:bool Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** What the popover holds, padded: a [<section>], which takes the focus as the
    popover opens. *)
module Dialog : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The popover's title, which names it: Kobalte's title, an [<h2>]. *)
module Heading : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** HeroUI's arrow, or the [children] it is given, on the side of the trigger
    and turned toward it, where Kobalte places an arrow. *)
module Arrow : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

module Props : sig
  type t

  val check :
    ?is_open:bool Solidtype.Check.value ->
    ?default_open:bool Solidtype.Check.value ->
    ?on_open_change:(bool -> unit) ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
