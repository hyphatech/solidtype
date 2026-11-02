(** A segmented control in HeroUI Pro's shape: a few options side by side, one
    always selected, its indicator sliding to the option chosen. Pro's is
    licensed, so this is not a port of it but the same component made here, on
    Kobalte's segmented control, in HeroUI's free design: its look is Tailwind
    on HeroUI's tokens, which an application's Tailwind finds by an [@source] of
    this library, and Pro's class names, [segment__item] and the rest, are on
    its parts for a stylesheet that names them.

    {[
      <Segment aria_label="Billing" default_selected_key="monthly">
        <Segment.Item id="monthly">"Monthly"</Segment.Item>
        <Segment.Item id="yearly">"Yearly"</Segment.Item>
      </Segment>
    ]}

    It is Kobalte's: a [radiogroup] of radios, each option a [<label>] around
    its radio, which Tab reaches as one and the arrow keys move the selection
    through, passing over a disabled option. Pro's, on React Aria's toggle
    button group, moves the focus with the arrows and selects with Space; both
    are accessible, and this keeps Kobalte's. The indicator is drawn in the
    selected option, so a page prerendered shows it, and slides there from the
    option left. *)

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
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component

  val is_selected : unit -> unit -> bool
  (** [is_selected ()], called as a component inside an option is made, reads
      whether that option is selected, where it is shown: what Pro's render
      props give an option's children, to show an option's label only while it
      is selected. It raises [Invalid_argument] outside a [Segment.Item]. *)
end

(** A line at an option's start edge, hidden beside the selected option: a
    [<span>], placed in an option before its label. The first option's is hidden
    too, where Pro's draws a line at the track's edge. *)
module Separator : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
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
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
(** The control: Kobalte's radio group, a [<div>] of role [radiogroup],
    [data-disabled] while [is_disabled]. Its options' key is [selected_key]
    while it is given, else the one kept, [default_selected_key] at first;
    [on_selection_change] is told each option chosen, never the one already
    selected. [name] names its radios in a form. *)

val component : Props.t Solidtype.Jsx.component
