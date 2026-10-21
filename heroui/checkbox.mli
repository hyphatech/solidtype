(** HeroUI's Checkbox: Kobalte's [Checkbox.Root], its [Label] and its [Input],
    in HeroUI's anatomy, with HeroUI's classes from {!Styles.Checkbox} and the
    state its styles read -- selected, indeterminate, disabled, invalid,
    hovered, pressed, focus-visible -- declared as React Aria writes it. Its
    props are named as HeroUI's documentation names them.

    {[
      <Checkbox default_selected=true>
        <Checkbox.Content>
          <Checkbox.Control><Checkbox.Indicator /></Checkbox.Control>
          <Label>"Accept terms"</Label>
        </Checkbox.Content>
      </Checkbox>
    ]}

    A part is used inside a [Checkbox]: elsewhere it raises [Invalid_argument]
    as it is made. *)

type checkbox
(** What a checkbox's parts read of it. *)

module Context : sig
  module Provider : sig
    module Props : sig
      val check :
        value:checkbox Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Solidtype.Jsx.component
  end

  val use : unit -> checkbox option
end

(** The clickable label that holds the control and its {!Label}: Kobalte's
    [Checkbox.Label], the checkbox's input inside it.

    @raise Invalid_argument outside a [Checkbox]. *)
module Content : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The box the indicator is drawn in.

    @raise Invalid_argument outside a [Checkbox]. *)
module Control : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The mark: HeroUI's check, drawn in as it is selected, or its dash while
    indeterminate, unless given children of its own.

    @raise Invalid_argument outside a [Checkbox]. *)
module Indicator : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

module Props : sig
  type t

  val check :
    ?variant:[ `primary | `secondary ] Solidtype.Check.value ->
    ?is_selected:bool Solidtype.Check.value ->
    ?default_selected:bool Solidtype.Check.value ->
    ?is_indeterminate:bool Solidtype.Check.value ->
    ?on_change:(bool -> unit) ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?is_invalid:bool Solidtype.Check.value ->
    ?is_read_only:bool Solidtype.Check.value ->
    ?is_required:bool Solidtype.Check.value ->
    ?name:string Solidtype.Check.value ->
    ?value:string Solidtype.Check.value ->
    ?aria_label:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
