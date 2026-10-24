(** HeroUI's Tabs: a list of tabs, each showing its panel while it is selected,
    Kobalte's [Tabs], with HeroUI's classes from {!Styles.Tabs}.

    {[
      <Tabs>
        <Tabs.List_container>
          <Tabs.List aria_label="Options">
            <Tabs.Tab id="overview">"Overview" <Tabs.Indicator /></Tabs.Tab>
            <Tabs.Tab id="analytics">
              <Tabs.Separator /> "Analytics" <Tabs.Indicator />
            </Tabs.Tab>
          </Tabs.List>
        </Tabs.List_container>
        <Tabs.Panel id="overview">"Your project at a glance."</Tabs.Panel>
        <Tabs.Panel id="analytics">"Metrics over time."</Tabs.Panel>
      </Tabs>
    ]}

    The tab selected is the one [selected_key] names where it is given, else the
    one it keeps, [default_selected_key] at first, or the first not disabled;
    selecting another calls [on_selection_change] with its id. A panel is on the
    page while its tab, of the same [id], is selected.

    The arrows of its orientation move focus between the tabs, round from the
    last to the first, and Home and End to the first and the last, skipping a
    disabled tab; focus selects the tab it reaches, or, with
    [keyboard_activation=`manual], Enter and Space do.

    A tab's indicator is drawn in the selected tab alone, and slides from the
    tab selected before as HeroUI's styles animate it.

    A part is used inside a [Tabs], an indicator and a separator inside a
    [Tabs.Tab]: elsewhere it raises [Invalid_argument] as it is made. *)

(** What holds the list when its tabs may overflow it: a [<div>] that scrolls
    the list, fading at the edge content is hidden past, with a button at each
    end that scrolls it on by most of a view, shown while it can. *)
module List_container : sig
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

(** The tabs: Kobalte's list, a [<div>] of role [tablist]. *)
module List : sig
  module Props : sig
    type t

    val check :
      ?aria_label:string Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** One tab: Kobalte's trigger, a [<button>] of role [tab], which selects the
    panel of its [id]. *)
module Tab : sig
  module Props : sig
    type t

    val check :
      id:string Solidtype.Check.value ->
      ?is_disabled:bool Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The selected tab's background, or its line in the secondary variant: a
    [<div>] in the tab while it is selected. *)
module Indicator : sig
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

(** A line before a tab, hidden beside the selected one: a [<span>]. *)
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

(** A tab's content: Kobalte's content, a [<div>] of role [tabpanel], on the
    page while the tab of its [id] is selected. *)
module Panel : sig
  module Props : sig
    type t

    val check :
      id:string Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
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
    ?selected_key:string Solidtype.Check.value ->
    ?default_selected_key:string Solidtype.Check.value ->
    ?on_selection_change:(string -> unit) ->
    ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
    ?variant:[ `primary | `secondary ] Solidtype.Check.value ->
    ?align:[ `start | `center | `end_ ] Solidtype.Check.value ->
    ?keyboard_activation:[ `automatic | `manual ] Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
