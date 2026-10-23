(** HeroUI's ToggleButton: a button pressed on or off, Kobalte's toggle button,
    with HeroUI's classes from {!Styles.ToggleButton}.
    {[
      <Toggle_button variant=`ghost>"Like"</Toggle_button>
    ]}
    Alone, it is selected while [is_selected] says so where it is given, else as
    it is kept, [default_selected] at first, and a press calls [on_change] with
    its new state. Inside a {!Toggle_button_group} it is the group's button of
    its [id], selected as the group holds it; its own [is_selected],
    [default_selected] and [on_change] are not read there. It shows the state
    HeroUI's styles read, [data-selected] and the hover, press and focus React
    Aria shows. A function of its state as its children, React's render prop, is
    not taken: a page reads the state it gives. *)

module Props : sig
  type t

  val check :
    ?variant:[ `default | `ghost ] Solidtype.Check.value ->
    ?size:Toggle_button_group.size Solidtype.Check.value ->
    ?is_icon_only:bool Solidtype.Check.value ->
    ?id:string Solidtype.Check.value ->
    ?is_selected:bool Solidtype.Check.value ->
    ?default_selected:bool Solidtype.Check.value ->
    ?on_change:(bool -> unit) ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?on_click:(Dom.mouseEvent -> unit) ->
    ?aria_label:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
(** @raise Invalid_argument
      as it is made inside a {!Toggle_button_group} with no [id]. *)

val component : Props.t Solidtype.Jsx.component
