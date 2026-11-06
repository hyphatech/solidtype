(** A segmented control: a few options, one always selected, its indicator
    sliding to the option chosen, on Kobalte's segmented control, its look
    segment.css's.

    {[
      <Segment aria_label="Billing" default_selected_key="monthly">
        <Segment.Item id="monthly">"Monthly"</Segment.Item>
        <Segment.Item id="yearly">"Yearly"</Segment.Item>
      </Segment>
    ]}

    A [radiogroup] of radios: Tab reaches it once, and the arrow keys move the
    selection, passing over a disabled option. *)

type size = [ `sm | `md | `lg ]
type variant = [ `default | `ghost ]

(** An option: a [<label>] around Kobalte's radio, named by its children or by
    [aria_label], its state declared as React Aria writes it -- [data-selected],
    [data-disabled], [data-hovered], [data-pressed], [data-focused] and
    [data-focus-visible]. *)
module Item : sig
  module Props : sig
    type t

    val check :
      id:string Solidtype.Check.value ->
      ?is_disabled:bool Solidtype.Check.value ->
      ?aria_label:string Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Label.props -> Solidtype.Jsx.element) ->
      ?props:t Solidtype.Solid.rest ->
      (unit -> unit) Solidtype.Html.Label.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component

  val is_selected : unit -> unit -> bool
  (** [is_selected ()], called as a component inside an option is made, reads
      whether that option is selected, where it is shown, as a render prop would
      give an option's children: to show an option's label only while it is
      selected. It raises [Invalid_argument] outside a [Segment.Item]. *)
end

(** A line at an option's start edge, hidden beside the selected option: a
    [<span>], placed in an option before its label. The first option's is hidden
    too, where a line would sit at the track's edge. *)
module Separator : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?as_:(Solidtype.Html.Span.props -> Solidtype.Jsx.element) ->
      ?props:t Solidtype.Solid.rest ->
      (unit -> unit) Solidtype.Html.Span.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

module Props : sig
  type t

  val check :
    ?variant:variant Solidtype.Check.value ->
    ?size:size Solidtype.Check.value ->
    ?selected_key:string Solidtype.Check.value ->
    ?default_selected_key:string Solidtype.Check.value ->
    ?on_selection_change:(string -> unit) ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?name:string Solidtype.Check.value ->
    ?aria_label:string Solidtype.Check.value ->
    ?aria_labelledby:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Div.props -> Solidtype.Jsx.element) ->
    ?props:t Solidtype.Solid.rest ->
    (unit -> unit) Solidtype.Html.Div.check
end

val make : Props.t -> Solidtype.Jsx.element
(** The control: Kobalte's radio group, a [<div>] of role [radiogroup],
    [data-disabled] while [is_disabled]. Its options' key is [selected_key]
    while it is given, else the one kept, [default_selected_key] at first;
    [on_selection_change] is told each option chosen, never the one already
    selected. [name] names its radios in a form. *)

val component : Props.t Solidtype.Jsx.component
