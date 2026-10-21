(** HeroUI's CloseButton: Kobalte's [Button.Root], a native [<button>] named
    "Close", with HeroUI's classes from {!Styles.CloseButton} and the state its
    styles read -- hovered, pressed, focused, focus-visible, disabled -- kept by
    {!Interaction} as React Aria keeps it. It draws HeroUI's cross, or the
    children it is given. Its props are named as HeroUI's documentation names
    them, but for [on_click], a click as Kobalte gives it, where HeroUI's is
    [onPress].

    {[
      <Close_button on_click=(fun _ -> close ()) />
    ]} *)

module Props : sig
  type t

  val check :
    ?variant:[ `default ] Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?aria_label:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?on_click:(Dom.mouseEvent -> unit) ->
    ?children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
