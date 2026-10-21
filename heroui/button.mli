(** HeroUI's Button: Kobalte's [Button.Root], a native [<button>], with HeroUI's
    classes from {!Styles.Button.classes}. Its props are named as HeroUI's
    documentation names them -- [variant], [size], [full_width], [is_icon_only],
    [is_disabled] -- but for [on_click], a click as Kobalte gives it, where
    HeroUI's is [onPress].

    {[
      <Button variant=`ghost size=`sm on_click=(fun _ -> save ())>"Save"</Button>
    ]}

    An icon-only button names itself with text in its children, hidden by
    [class_="sr-only"], until a component can be given an [aria-label] it may
    leave out. *)

module Props : sig
  type t

  val check :
    ?variant:
      [ `primary
      | `secondary
      | `tertiary
      | `outline
      | `ghost
      | `danger
      | `danger_soft ]
      Solidtype.Check.value ->
    ?size:[ `sm | `md | `lg ] Solidtype.Check.value ->
    ?full_width:bool Solidtype.Check.value ->
    ?is_icon_only:bool Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?type_:Solidtype.Html.Button.type_ Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?on_click:(Dom.mouseEvent -> unit) ->
    ?aria_label:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
