(** HeroUI's Button: Kobalte's [Button.Root], a native [<button>], with HeroUI's
    classes from {!Styles.Button.classes}. Its props are named as HeroUI's
    documentation names them -- [variant], [size], [full_width], [is_icon_only],
    [is_disabled] -- but for [on_click], a click as Kobalte gives it, where
    HeroUI's is [onPress]. Inside a {!Button_group}, a [variant], [size],
    [full_width] or [is_disabled] the button does not set is its group's, else
    HeroUI's default: [`primary], [`md], neither full width nor disabled; and it
    is disabled in a disabled {!Fieldset} where neither it nor its group says.

    {[
      <Button variant=`ghost size=`sm on_click=(fun _ -> save ())>"Save"</Button>
    ]}

    An icon-only button is named by its [aria_label].

    Given [slot=`trigger], a button is the trigger of the part above it that
    takes one, as React Aria's slots are: inside a {!Disclosure.Heading}, the
    button that expands and collapses the disclosure, in HeroUI's look and
    disabled with it. Inside a {!Tooltip}, any button is its trigger, as React
    Aria's focusable context makes it. Where no part above takes one, it is a
    button.

    Given [slot=`close], a button closes the dialog it is in, as React Aria's
    close slot does, besides calling its [on_click]: inside a {!Modal}'s dialog.
*)

type trigger = {
  component : unit Solidtype.Jsx.component;
      (** What the button renders as, in place of Kobalte's [Button.Root]: a
          component that takes the same props and is a [<button>]. *)
  is_disabled : (unit -> bool) option;
      (** Whether the part is disabled, which the button is where it does not
          say; a part that says nothing leaves it to the button's group. *)
  controls : string option;
      (** The id of what it shows and hides, its [aria-controls]. *)
  described_by : string option;
      (** The id of what describes it, its [aria-describedby]: how a dropdown
          opened by a long press opens. *)
  pressed : (unit -> bool) option;
      (** Whether the button shows pressed, as a popover's does while it is
          open, besides while it is pressed. *)
  needs_slot : bool;
      (** Whether only a button with [slot=`trigger] takes it, as a disclosure's
          heading gives it, or any button, as a tooltip does. *)
  element : (Dom.element -> unit) option;
      (** What the part does with the button's element as it is made, as a
          dropdown opened by a long press listens to it. *)
}
(** The trigger a part gives a button below it. *)

val no_trigger : trigger
(** What a part gives the buttons inside it to make them buttons again: an
    overlay's content, inside an overlay that makes every button its trigger. *)

(** What closes the dialog a part is, which it gives a button inside it with
    [slot=`close]. *)
module Close : sig
  module Provider : sig
    module Props : sig
      val check :
        value:(unit -> unit) Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Solidtype.Jsx.component
  end

  val use : unit -> (unit -> unit) option
end

(** The {!trigger} a part gives the buttons below it. *)
module Trigger : sig
  module Provider : sig
    module Props : sig
      val check :
        value:trigger Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Solidtype.Jsx.component
  end

  val use : unit -> trigger option
end

module Props : sig
  type t

  val check :
    ?variant:
      [ `primary
      | `secondary
      | `tertiary
      | `outline
      | `ghost
      | `danger
      | `danger_soft ]
      Solidtype.Check.value ->
    ?size:[ `sm | `md | `lg ] Solidtype.Check.value ->
    ?full_width:bool Solidtype.Check.value ->
    ?is_icon_only:bool Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?slot:[ `trigger | `close ] Solidtype.Check.value ->
    ?type_:Solidtype.Html.Button.type_ Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?on_click:(Dom.mouseEvent -> unit) ->
    ?aria_label:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
