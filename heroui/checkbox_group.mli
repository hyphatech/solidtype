(** HeroUI's CheckboxGroup: a [<div role="group">] of {!Checkbox}es, with
    HeroUI's classes from {!Styles.CheckboxGroup}, that keeps the values its
    checkboxes check, controlled or its own. A checkbox inside it is checked
    while its value is among them, and checks or unchecks it as it is clicked;
    it takes the group's variant where it sets none, and its state. A {!Label}
    inside it, but outside a checkbox's content, names the group, and a
    {!Description} describes it. It is disabled as [is_disabled] says, else as
    the {!Fieldset} it is in is.

    {[
      <Checkbox_group name="interests" default_value=(fun () -> [ "coding" ])>
        <Label>"Interests"</Label>
        <Checkbox value="coding">
          <Checkbox.Content>"Coding"</Checkbox.Content>
        </Checkbox>
      </Checkbox_group>
    ]}

    Kobalte has checkboxes but no group of them: the group is built on Kobalte's
    checkboxes, each its own [Checkbox.Root], which the group checks and is told
    of. *)

type group = {
  checked : string -> bool;
  set : string -> bool -> unit;
  variant : unit -> [ `primary | `secondary ] option;
  disabled : unit -> bool;
  invalid : unit -> bool;
  read_only : unit -> bool;
  name : unit -> string option;
  described_by : unit -> string option;
}
(** What a group's checkboxes read of it: whether a value is checked, read as it
    changes; [set value on], which checks or unchecks it; the variant they take
    where they set none; its state; the name they submit with; and the id of its
    description, which their inputs are described by. *)

module Context : sig
  module Provider : sig
    module Props : sig
      val check :
        value:group Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Solidtype.Jsx.component
  end

  val use : unit -> group option
end

type state = {
  is_disabled : bool Solidtype.Solid.accessor;
  is_read_only : bool Solidtype.Solid.accessor;
  is_required : bool Solidtype.Solid.accessor;
  is_invalid : bool Solidtype.Solid.accessor;
}
(** What a group's children are drawn of, given as a function, as HeroUI's
    render props are, each read where Solid tracks it. *)

module Props : sig
  type t

  val check :
    ?variant:[ `primary | `secondary ] Solidtype.Check.value ->
    ?value:string list Solidtype.Check.value ->
    ?default_value:string list Solidtype.Check.value ->
    ?on_change:(string list -> unit) ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?is_invalid:bool Solidtype.Check.value ->
    ?is_read_only:bool Solidtype.Check.value ->
    ?is_required:bool Solidtype.Check.value ->
    ?name:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?on_blur:(Dom.focusEvent -> unit) ->
    ?ref:(Dom.htmlDivElement -> unit) ->
    ?on_focus_out:(Dom.focusEvent -> unit) ->
    children:
      ( state -> Solidtype.Jsx.element,
        [ `nodes | `render ] )
      Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Div.props -> state -> Solidtype.Jsx.element) ->
    ?props:t Solidtype.Solid.rest ->
    (unit -> unit) Solidtype.Html.Div.check
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
