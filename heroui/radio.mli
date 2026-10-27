(** HeroUI's Radio: Kobalte's [RadioGroup.Item], its [ItemLabel] and its
    [ItemInput], in HeroUI's anatomy, with HeroUI's classes from {!Styles.Radio}
    and the state its styles read -- selected, disabled, invalid, hovered,
    pressed, focus-visible -- declared as React Aria writes it. A {!Description}
    inside it, but outside its content, is the radio's, which its input is
    described by.

    {[
      <Radio value="pro">
        <Radio.Content>
          <Radio.Control><Radio.Indicator /></Radio.Control>
          "Pro"
        </Radio.Content>
        <Description>"Advanced reporting"</Description>
      </Radio>
    ]}

    A radio is used inside a {!Radio_group}, and a part inside a [Radio]:
    elsewhere each raises [Invalid_argument] as it is made. *)

type radio
(** What a radio's parts read of it. *)

module Context : sig
  module Provider : sig
    module Props : sig
      val check :
        value:radio Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Solidtype.Jsx.component
  end

  val use : unit -> radio option
end

(** The clickable label that holds the control and its text: Kobalte's
    [RadioGroup.ItemLabel], the radio's input inside it.

    Raises [Invalid_argument] outside a [Radio]. *)
module Content : sig
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

(** The circle the indicator is drawn in.

    Raises [Invalid_argument] outside a [Radio]. *)
module Control : sig
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

(** The dot, which HeroUI's styles draw as the radio is selected, or the
    children it is given.

    Raises [Invalid_argument] outside a [Radio]. *)
module Indicator : sig
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
    value:string Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?aria_label:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
