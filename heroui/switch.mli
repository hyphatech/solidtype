(** HeroUI's Switch: Kobalte's [Switch.Root], its [Label] and its [Input], in
    HeroUI's anatomy, with HeroUI's classes from {!Styles.Switch} and the state
    its styles read -- selected, disabled, hovered, pressed, focus-visible --
    declared as React Aria writes it. Its props are named as HeroUI's
    documentation names them.

    {[
      <Switch default_selected=true>
        <Switch.Content>
          <Switch.Control><Switch.Thumb /></Switch.Control>
          <Label>"Wi-Fi"</Label>
        </Switch.Content>
      </Switch>
    ]}

    A part is used inside a [Switch]: elsewhere it raises [Invalid_argument] as
    it is made. *)

type switch
(** What a switch's parts read of it, which its parts are given. *)

module Context : sig
  module Provider : sig
    module Props : sig
      val check :
        value:switch Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Solidtype.Jsx.component
  end

  val use : unit -> switch option
end

(** The clickable label that holds the control and its {!Label}: Kobalte's
    [Switch.Label], the switch's input inside it.

    @raise Invalid_argument outside a [Switch]. *)
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

(** The track the thumb moves along.

    @raise Invalid_argument outside a [Switch]. *)
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

(** The thumb.

    @raise Invalid_argument outside a [Switch]. *)
module Thumb : sig
  module Props : sig
    type t

    val check : ?class_:string Solidtype.Check.value -> ?props:t -> unit -> unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

module Props : sig
  type t

  val check :
    ?size:[ `lg | `md | `sm ] Solidtype.Check.value ->
    ?is_selected:bool Solidtype.Check.value ->
    ?default_selected:bool Solidtype.Check.value ->
    ?on_change:(bool -> unit) ->
    ?is_disabled:bool Solidtype.Check.value ->
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
