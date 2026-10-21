(** HeroUI's Button: Kobalte's [Button.Root], a native [<button>], with HeroUI's
    classes from {!Styles.Button.classes}. Its props are named as HeroUI's
    documentation names them -- [variant], [size], [full_width], [is_icon_only],
    [is_disabled] -- but for [on_click], a click as Kobalte gives it, where
    HeroUI's is [onPress]. Inside a {!Button_group}, a [variant], [size],
    [full_width] or [is_disabled] the button does not set is its group's, else
    HeroUI's default: [`primary], [`md], neither full width nor disabled; and it
    is disabled in a disabled {!Fieldset} where neither it nor its group says.

    {[
      <Button variant=`ghost size=`sm on_click=(fun _ -> save ())>"Save"</Button>
    ]}

    An icon-only button is named by its [aria_label]. *)

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
