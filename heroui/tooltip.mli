(** HeroUI's Tooltip: Kobalte's [Tooltip], with HeroUI's classes from
    {!Styles.Tooltip} and its arrow.

    {[
      <Tooltip delay_ms=0.>
        <Button variant=`secondary>"Hover me"</Button>
        <Tooltip.Content show_arrow=true>
          <Tooltip.Arrow /> <p>"This is a tooltip"</p>
        </Tooltip.Content>
      </Tooltip>
    ]}

    A {!Button} inside a tooltip is its trigger, as in HeroUI, and so is a
    {!Trigger}, around anything else. It opens as its trigger is hovered, after
    [delay_ms], or reached by the keyboard, and closes after [close_delay_ms]
    once the pointer leaves -- Kobalte lets the pointer cross to the tooltip
    without closing it -- or on Escape. A delay not given is the page's
    [--tooltip-delay] or [--tooltip-close-delay], as HeroUI reads them, else
    1500 and 500.

    The tooltip is drawn in a portal at the end of the page while it is open,
    and while HeroUI's exit animation plays after.

    A part is used inside a [Tooltip]: elsewhere it raises [Invalid_argument] as
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

(** The tooltip: Kobalte's content, [placement] beside its trigger, [offset]
    pixels from it, 3 by default and 7 with [show_arrow]; on the other side
    where there is no room, unless [should_flip] is false. *)
module Content : sig
  module Props : sig
    type t

    val check :
      ?placement:[ `top | `bottom | `left | `right ] Solidtype.Check.value ->
      ?offset:float Solidtype.Check.value ->
      ?show_arrow:bool Solidtype.Check.value ->
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

(** HeroUI's arrow, or the [children] it is given, inside the {!Content}, on the
    side of its trigger and turned toward it, where Kobalte places an arrow. *)
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
    ?delay_ms:float Solidtype.Check.value ->
    ?close_delay_ms:float Solidtype.Check.value ->
    ?trigger:[ `hover | `focus ] Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
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
