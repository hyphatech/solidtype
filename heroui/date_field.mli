(** HeroUI's DateField: a date's segments typed into or stepped by the arrow
    keys, with HeroUI's classes from {!Styles.DateField} and
    {!Styles.DateInputGroup}, on {!Solidtype_headless.Date_field}, since Kobalte
    has no date field. Its segments are the reader's locale's, in its order and
    its calendar; its {!Label} names it, its {!Description} describes it, its
    {!Field_error} shows while it is invalid, and it submits its value with a
    form as \@internationalized/date writes it, [2026-11-21].

    Its page, with its examples:
    [$(opam var solidtype:doc)/pages/heroui/date-field.md].

    {[
      <Date_field name="date">
        <Label>"Date"</Label>
        <Date_field.Group>
          <Date_field.Input>
            (fun segment -> <Date_field.Segment segment=(S.get segment) />)
          </Date_field.Input>
        </Date_field.Group>
      </Date_field>
    ]}

    Its value is a {!Solidtype_internationalized_date.Types.CalendarDate}, made
    by [CalendarDate.make 2026 11 21], [parse_date "2026-11-21"] or
    [today zone]. A date with a time is {!Date_time}'s, and one in a zone
    {!Zoned}'s, each given back as the kind it was given: the three share the
    parts below. A [value] of [Js.Null.empty] controls a field empty, as React's
    [null] does, and [on_change] is told [None] once every segment is erased. It
    is invalid while [is_invalid], and while its value is before [min_value],
    after [max_value] or a day [is_date_unavailable] refuses, which a {!Form}
    refuses to submit. A part is used inside a field: elsewhere it raises
    [Invalid_argument] as it is made. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx
module D := Solidtype_internationalized_date

type segment = Solidtype_headless.Date_field.segment
(** A segment, as {!Input} gives each to its children. *)

(** The box the input sits in, React Aria's group, with HeroUI's
    {!Styles.DateInputGroup}: a [<div role="group">]. *)
module Group : sig
  type state = {
    is_hovered : bool S.accessor;
    is_focus_within : bool S.accessor;
    is_focus_visible : bool S.accessor;
    is_disabled : bool S.accessor;
    is_invalid : bool S.accessor;
  }
  (** What its children are drawn of, given as a function, as HeroUI's render
      props are, each read where Solid tracks it. *)

  module Props : sig
    type t

    val check :
      ?variant:[ `primary | `secondary ] Solidtype.Check.value ->
      ?full_width:bool Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:
        (state -> Jsx.element, [ `elements | `render ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> state -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** What sits before the input in its group, an icon: a [<div>]. *)
module Prefix : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `elements ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** What sits after the input in its group: a [<div>]. *)
module Suffix : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `elements ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** What holds several inputs side by side and scrolls across them, a range's
    start and end: a [<div>]. *)
module Input_container : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `elements ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The date's segments, a [<div role="group">] named by the field's label: it
    renders [children] for each segment, in order, the literals between them
    among them. *)
module Input : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?ref:(Dom.htmlDivElement -> unit) ->
      children:
        ( segment S.accessor -> Jsx.element,
          [ `render ] )
        Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** One segment, the [segment] {!Input} gave: a literal its text; a part a spin
    button, its text the part's value, or its placeholder while it has none,
    [mm] or [––], which it declares as [data-placeholder]. *)
module Segment : sig
  module Props : sig
    type t

    val check :
      segment:segment Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?ref:(Dom.htmlDivElement -> unit) ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

type state = {
  is_disabled : bool S.accessor;
  is_invalid : bool S.accessor;
  is_read_only : bool S.accessor;
  is_required : bool S.accessor;
}
(** What a date field's children are drawn of, given as a function, as HeroUI's
    render props are, each read where Solid tracks it. *)

module V := D.Types.CalendarDate

module Props : sig
  type t

  val check :
    ?value:V.t Js.Null.t Solidtype.Check.value ->
    ?default_value:V.t Solidtype.Check.value ->
    ?on_change:(V.t option -> unit) ->
    ?placeholder_value:V.t Solidtype.Check.value ->
    ?min_value:V.t Solidtype.Check.value ->
    ?max_value:V.t Solidtype.Check.value ->
    ?is_date_unavailable:(V.t -> bool) ->
    ?should_force_leading_zeros:bool Solidtype.Check.value ->
    ?is_required:bool Solidtype.Check.value ->
    ?is_invalid:bool Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?is_read_only:bool Solidtype.Check.value ->
    ?name:string Solidtype.Check.value ->
    ?auto_focus:bool Solidtype.Check.value ->
    ?aria_label:string Solidtype.Check.value ->
    ?full_width:bool Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?on_blur:(Dom.focusEvent -> unit) ->
    ?ref:(Dom.htmlDivElement -> unit) ->
    children:
      (state -> Jsx.element, [ `elements | `render ]) Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Div.props -> state -> Jsx.element) ->
    ?props:t S.rest ->
    (unit -> unit) Solidtype.Html.Div.check
end

val make : Props.t -> Jsx.element
val component : Props.t Jsx.component

(** A date field whose value is a date with a time, a
    {!Solidtype_internationalized_date.Types.CalendarDateTime}: its segments run
    to [granularity], [`minute] by default, its hour on the clock of
    [hour_cycle], else the locale's. A time typed while it has none is put on
    [placeholder_value], else today at midnight. It submits
    [2026-11-21T09:30:00]. *)
module Date_time : sig
  module V := D.Types.CalendarDateTime

  module Props : sig
    type t

    val check :
      ?value:V.t Js.Null.t Solidtype.Check.value ->
      ?default_value:V.t Solidtype.Check.value ->
      ?on_change:(V.t option -> unit) ->
      ?placeholder_value:V.t Solidtype.Check.value ->
      ?min_value:V.t Solidtype.Check.value ->
      ?max_value:V.t Solidtype.Check.value ->
      ?is_date_unavailable:(V.t -> bool) ->
      ?granularity:[ `day | `hour | `minute | `second ] Solidtype.Check.value ->
      ?hour_cycle:[ `h12 | `h24 ] Solidtype.Check.value ->
      ?should_force_leading_zeros:bool Solidtype.Check.value ->
      ?is_required:bool Solidtype.Check.value ->
      ?is_invalid:bool Solidtype.Check.value ->
      ?is_disabled:bool Solidtype.Check.value ->
      ?is_read_only:bool Solidtype.Check.value ->
      ?name:string Solidtype.Check.value ->
      ?auto_focus:bool Solidtype.Check.value ->
      ?aria_label:string Solidtype.Check.value ->
      ?full_width:bool Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?on_blur:(Dom.focusEvent -> unit) ->
      ?ref:(Dom.htmlDivElement -> unit) ->
      children:
        (state -> Jsx.element, [ `elements | `render ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> state -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** A date field whose value is a date with a time in a zone, a
    {!Solidtype_internationalized_date.Types.ZonedDateTime}: its zone's name, as
    the locale writes it at the time shown, follows its segments, unless
    [hide_time_zone], and its hour steps by the zone's rules. A time typed while
    it has none is put on [placeholder_value]'s date and zone. It submits
    [2026-11-21T09:30:00+02:00[Europe/Kyiv]]. *)
module Zoned : sig
  module V := D.Types.ZonedDateTime

  module Props : sig
    type t

    val check :
      ?value:V.t Js.Null.t Solidtype.Check.value ->
      ?default_value:V.t Solidtype.Check.value ->
      ?on_change:(V.t option -> unit) ->
      placeholder_value:V.t Solidtype.Check.value ->
      ?min_value:V.t Solidtype.Check.value ->
      ?max_value:V.t Solidtype.Check.value ->
      ?is_date_unavailable:(V.t -> bool) ->
      ?granularity:[ `day | `hour | `minute | `second ] Solidtype.Check.value ->
      ?hour_cycle:[ `h12 | `h24 ] Solidtype.Check.value ->
      ?hide_time_zone:bool Solidtype.Check.value ->
      ?should_force_leading_zeros:bool Solidtype.Check.value ->
      ?is_required:bool Solidtype.Check.value ->
      ?is_invalid:bool Solidtype.Check.value ->
      ?is_disabled:bool Solidtype.Check.value ->
      ?is_read_only:bool Solidtype.Check.value ->
      ?name:string Solidtype.Check.value ->
      ?auto_focus:bool Solidtype.Check.value ->
      ?aria_label:string Solidtype.Check.value ->
      ?full_width:bool Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?on_blur:(Dom.focusEvent -> unit) ->
      ?ref:(Dom.htmlDivElement -> unit) ->
      children:
        (state -> Jsx.element, [ `elements | `render ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> state -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** {1 What a date picker shares}

    A date picker's root is a date field's, its value kept and its parts drawn
    as a field's are. *)

type 'v kind = { compare : 'v -> 'v -> float }
(** How two values of a root's kind compare. *)

type 'v root = {
  current : 'v option S.accessor;
  change : 'v option -> unit;
  invalid : bool S.accessor;
  in_form : Form.field;
  leave : Dom.focusEvent -> unit;
}
(** A root's value, kept or given, what it is told, whether it is invalid --
    given so, out of its range, unavailable, or refused by its form -- its
    form's field, and what it does as the focus leaves it. *)

val root :
  kind:'v kind ->
  value:'v Js.Null.t option S.accessor ->
  default_value:'v option S.accessor ->
  on_change:('v option -> unit option) ->
  min_value:'v option S.accessor ->
  max_value:'v option S.accessor ->
  is_date_unavailable:('v -> bool option) ->
  is_invalid:(unit -> bool) ->
  name:(unit -> string option) ->
  on_blur:(Dom.focusEvent -> unit option) ->
  'v root

val fields : (unit -> Jsx.element) -> Jsx.element
(** What [draw] draws, its [Label], [Description] and [Field_error] the field's,
    inside a root. *)
