(** An inline select, in HeroUI's look, which ships no stylesheet for it: a
    {!Select} drawn as text, with no field around it, for a choice made in a
    sentence, a toolbar or a cell. Its choice, keys, list and form are the
    select's; its look is a stylesheet, [inline-select.css], in the [components]
    layer, rules for its classes.

    Its page, with its examples:
    [$(opam var solidtype:doc)/pages/heroui/inline-select.md].

    {[
      <Inline_select aria_label="Language" default_value=[| "en" |]>
        <Inline_select.Trigger>
          <Inline_select.Value /> <Inline_select.Indicator />
        </Inline_select.Trigger>
        <Inline_select.Popover>
          <List_box>
            <List_box.Item id="en" text_value="English">
              "English" <List_box.Item_indicator />
            </List_box.Item>
          </List_box>
        </Inline_select.Popover>
      </Inline_select>
    ]}

    A part is used inside an [Inline_select]: elsewhere it raises
    [Invalid_argument] as it is made. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

(** Its button: the select's {!Select.Trigger}, its text muted until it is
    hovered. *)
module Trigger : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?on_key_down:(Dom.keyboardEvent -> unit) ->
      ?ref:(Dom.htmlButtonElement -> unit) ->
      children:
        ( Select.Trigger.state -> Jsx.element,
          [ `elements | `render ] )
        Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Button.props -> Select.Trigger.state -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Button.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The option chosen, as {!Select.Value} draws it, cut short past
    [--inline-select-value-max-width]. *)
module Value : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?children:
        ( Select.Value.state -> Jsx.element,
          [ `elements | `render ] )
        Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Span.props -> Select.Value.state -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Span.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** Chevrons up and down, or the [children] it is given, beside the value and
    never turned. *)
module Indicator : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?children:(_, [ `elements ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Svg.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Svg.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The list's popover: {!Select.Popover}, [placement] beside the trigger,
    [`bottom_end] by default, at least 12rem wide. *)
module Popover : sig
  module Props : sig
    type t

    val check :
      ?placement:Select.placement Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?style:string Solidtype.Check.value ->
      ?ref:(Dom.htmlDivElement -> unit) ->
      children:(_, [ `elements ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The select: {!Select}'s root, [<div class="select inline-select">], with its
    props but the field's [variant] and [full_width]. *)
module Props : sig
  type t

  val check :
    ?placeholder:string Solidtype.Check.value ->
    ?selection_mode:[ `single | `multiple ] Solidtype.Check.value ->
    ?value:string array Solidtype.Check.value ->
    ?default_value:string array Solidtype.Check.value ->
    ?on_change:(string array -> unit) ->
    ?disabled_keys:string array Solidtype.Check.value ->
    ?is_open:bool Solidtype.Check.value ->
    ?default_open:bool Solidtype.Check.value ->
    ?on_open_change:(bool -> unit) ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?is_required:bool Solidtype.Check.value ->
    ?is_invalid:bool Solidtype.Check.value ->
    ?name:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?ref:(Dom.htmlDivElement -> unit) ->
    ?on_focus_out:(Dom.focusEvent -> unit) ->
    children:(_, [ `elements ]) Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Div.props -> Select.state -> Jsx.element) ->
    ?props:t S.rest ->
    (unit -> unit) Solidtype.Html.Div.check
end

val make : Props.t -> Jsx.element
val component : Props.t Jsx.component
