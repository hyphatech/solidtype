(** HeroUI's RadioGroup: Kobalte's [RadioGroup.Root], the {!Radio}s inside it of
    which one at most is chosen, with HeroUI's classes from {!Styles.RadioGroup}
    and the state its styles read -- orientation, disabled, invalid -- declared
    as React Aria writes it. A {!Label} inside it, but outside a radio's
    content, is the group's, which names it, and a {!Description} the group's,
    which describes it. It is disabled as [is_disabled] says, else as the
    {!Fieldset} it is in is. Its props are named as HeroUI's documentation names
    them.

    {[
      <Radio_group default_value="pro">
        <Label>"Plan"</Label>
        <Radio value="starter">
          <Radio.Content>
            <Radio.Control><Radio.Indicator /></Radio.Control>
            "Starter"
          </Radio.Content>
        </Radio>
      </Radio_group>
    ]} *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

type group = {
  value : string option S.accessor;
  disabled : bool S.accessor;
  invalid : bool S.accessor;
  read_only : bool S.accessor;
  required : bool S.accessor;
}
(** What a group's radios read of it: the value chosen, if any, and whether it
    is disabled, invalid, read-only or required. *)

module Context : sig
  module Provider : sig
    module Props : sig
      val check :
        value:group Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Jsx.component
  end

  val use : unit -> group option
end

type state = {
  orientation : [ `horizontal | `vertical ] S.accessor;
  is_disabled : bool S.accessor;
  is_read_only : bool S.accessor;
  is_required : bool S.accessor;
  is_invalid : bool S.accessor;
}
(** What a group's children are drawn of, given as a function, as HeroUI's
    render props are, each read where Solid tracks it. *)

module Props : sig
  type t

  val check :
    ?variant:[ `primary | `secondary ] Solidtype.Check.value ->
    ?value:string Solidtype.Check.value ->
    ?default_value:string Solidtype.Check.value ->
    ?on_change:(string -> unit) ->
    ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?is_invalid:bool Solidtype.Check.value ->
    ?is_read_only:bool Solidtype.Check.value ->
    ?is_required:bool Solidtype.Check.value ->
    ?name:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?on_blur:(Dom.focusEvent -> unit) ->
    ?ref:(Dom.htmlDivElement -> unit) ->
    ?on_focus_out:(Dom.focusEvent -> unit) ->
    ?on_key_down:(Dom.keyboardEvent -> unit) ->
    ?on_click:(Dom.mouseEvent -> unit) ->
    children:
      (state -> Jsx.element, [ `nodes | `render ]) Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Div.props -> state -> Jsx.element) ->
    ?props:t S.rest ->
    (unit -> unit) Solidtype.Html.Div.check
end

val make : Props.t -> Jsx.element
val component : Props.t Jsx.component
