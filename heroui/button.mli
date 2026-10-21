(** HeroUI's Button: Kobalte's [Button.Root], a native [<button>], with HeroUI's
    classes from {!Styles.Button.classes}. Its look is HeroUI's props --
    [variant], [size], [full_width], [is_icon_only] -- and its behaviour
    Kobalte's: [disabled], [type_], [on_click].

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
    ?disabled:bool Solidtype.Check.value ->
    ?type_:Solidtype.Html.Button.type_ Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?on_click:(Dom.mouseEvent -> unit) ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
