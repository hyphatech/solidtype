(** Kobalte's colour field, fixed: a field of a colour's hex, as
    {!Solidtype_kobalte.ColorField} is, its parts taking Kobalte's props and
    every attribute their element does. Its value is a colour, as its channel
    field's is, where Kobalte's is the text typed; and three of Kobalte's bugs
    are fixed:

    - Enter commits what is typed, as leaving the field does, where Kobalte's
      commits only as focus leaves;
    - the arrow keys, and Page Up and Page Down, step the hex by one, and Home
      and End take it to [#000000] and [#FFFFFF], where Kobalte's field is a
      text box no key steps;
    - the wheel steps it while its input has the focus, unless [change_on_wheel]
      is [false], as Kobalte's number field does.

    What is typed is committed as React Aria commits it: nothing is no colour, a
    hex with or without its [#] is that colour, and anything else leaves the
    colour as it was; the input then shows the colour's hex. Only a colour other
    than the field's is told [on_change].

    {[
      <Color_field.Root
        default_value=(fun () -> Colors.parse_color "#0485F7")
        on_change=(fun c -> ...)>
        <Color_field.Label>"Colour"</Color_field.Label>
        <Color_field.Input />
      </Color_field.Root>
    ]}

    A part reads its field's, and raises as Kobalte's does elsewhere. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

(** The field. Its colour is [value] while it is given one -- null for none --
    else the one it keeps, [default_value] at first; [on_change] is told each
    colour committed other than its own, [None] for none. The rest are Kobalte's
    root's. *)
module Root : sig
  module Props : sig
    type t

    val check :
      ?value:Solidtype_kobalte.Types.Color.t Js.Nullable.t Solidtype.Check.value ->
      ?default_value:Solidtype_kobalte.Types.Color.t Solidtype.Check.value ->
      ?on_change:(Solidtype_kobalte.Types.Color.t option -> unit) ->
      ?change_on_wheel:bool Solidtype.Check.value ->
      ?id:string Solidtype.Check.value ->
      ?name:string Solidtype.Check.value ->
      ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
      ?required:bool Solidtype.Check.value ->
      ?disabled:bool Solidtype.Check.value ->
      ?read_only:bool Solidtype.Check.value ->
      ?props:t S.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The field's input, Kobalte's, committed by Enter and stepped by the keys and
    the wheel. Its [on_blur], [on_key_down] and [on_wheel] are called after its
    own.

    It raises [Invalid_argument] outside a {!Root}. *)
module Input : sig
  module Props : sig
    include module type of Solidtype_kobalte.ColorField.Input.Props

    type t
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

module Label = Solidtype_kobalte.ColorField.Label
module Description = Solidtype_kobalte.ColorField.Description
module ErrorMessage = Solidtype_kobalte.ColorField.ErrorMessage
