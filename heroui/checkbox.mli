(** HeroUI's Checkbox: Kobalte's [Checkbox.Root], its [Label] and its [Input],
    in HeroUI's anatomy, with HeroUI's classes from {!Styles.Checkbox} and the
    state its styles read -- selected, indeterminate, disabled, invalid,
    hovered, pressed, focus-visible -- declared as React Aria writes it. Its
    props are named as HeroUI's documentation names them. A {!Description}
    inside it, but outside its content, is its own, which its input is described
    by. Inside a {!Checkbox_group}, it is checked while its [value] is among the
    group's, and takes the group's variant where it sets none, and its state.

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

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

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

    val component : unit Jsx.component
  end

  val use : unit -> checkbox option
end

(** The clickable label that holds the control and its {!Label}: Kobalte's
    [Checkbox.Label], the checkbox's input inside it.

    Raises [Invalid_argument] outside a [Checkbox]. *)
module Content : sig
  type state = {
    is_selected : bool S.accessor;
    is_indeterminate : bool S.accessor;
    is_hovered : bool S.accessor;
    is_pressed : bool S.accessor;
    is_focused : bool S.accessor;
    is_focus_visible : bool S.accessor;
    is_disabled : bool S.accessor;
    is_read_only : bool S.accessor;
    is_invalid : bool S.accessor;
    is_required : bool S.accessor;
  }
  (** What its children are drawn of, given as a function, as HeroUI's render
      props are, each read where Solid tracks it. *)

  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:
        (state -> Jsx.element, [ `nodes | `render ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Label.props -> state -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Label.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The box the indicator is drawn in.

    Raises [Invalid_argument] outside a [Checkbox]. *)
module Control : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Span.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Span.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The mark: HeroUI's check, drawn in as it is selected, or its dash while
    indeterminate, unless given children of its own.

    Raises [Invalid_argument] outside a [Checkbox]. *)
module Indicator : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Span.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Span.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

type selection = {
  selected : bool S.accessor;
  indeterminate : bool S.accessor;
  set : bool -> unit;
  disabled : bool S.accessor;
}
(** What a checkbox of [slot=`selection] is, as the part above it gives it, as
    React Aria's selection slot does: whether it is checked, or some but not all
    of what it stands for is, what checking it does, and whether it is disabled.
    A {!Table.Row} gives its row's selection, and a {!Table.Header} its rows',
    all of them. *)

module Selection : sig
  module Provider : sig
    module Props : sig
      val check :
        value:selection Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Jsx.component
  end

  val use : unit -> selection option
end

type state = {
  is_selected : bool S.accessor;
  is_indeterminate : bool S.accessor;
  is_disabled : bool S.accessor;
  is_read_only : bool S.accessor;
  is_invalid : bool S.accessor;
  is_required : bool S.accessor;
}
(** What a checkbox's children are drawn of, given as a function, as HeroUI's
    render props are, each read where Solid tracks it. *)

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
    ?slot:[ `selection ] Solidtype.Check.value ->
    ?on_blur:(Dom.focusEvent -> unit) ->
    ?ref:(Dom.htmlDivElement -> unit) ->
    ?on_focus_out:(Dom.focusEvent -> unit) ->
    children:
      (state -> Jsx.element, [ `nodes | `render ]) Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Div.props -> state -> Jsx.element) ->
    ?props:t S.rest ->
    (unit -> unit) Solidtype.Html.Div.check
end

val make : Props.t -> Jsx.element
val component : Props.t Jsx.component
