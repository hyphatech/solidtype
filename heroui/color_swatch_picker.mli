(** HeroUI's ColorSwatchPicker: a list of colour swatches one is chosen from,
    the headless {!Solidtype_headless.Color_swatch_picker} dressed in HeroUI's
    classes from {!Styles.ColorSwatchPicker}. Kobalte has no such component; its
    list is made of Kobalte's list hooks, as Kobalte makes its own.

    {[
      <Color_swatch_picker default_value=(fun () -> Colors.parse_color "#8B5CF6")>
        <For each=(fun () -> colors)>
          (fun c _ ->
            <Color_swatch_picker.Item color=(fun () -> Colors.parse_color c)>
              <Color_swatch_picker.Swatch />
              <Color_swatch_picker.Indicator />
            </Color_swatch_picker.Item>)
        </For>
      </Color_swatch_picker>
    ]}

    Tab reaches the chosen swatch, or the first; the arrows move among the
    swatches -- in a grid by where each is, Left and Right as the page's
    direction reads them, in a stack Up and Down -- passing over a disabled one;
    Home and End reach the ends, and typing a colour's name the swatch of that
    name. A press, Space or Enter chooses one. Its colours are Kobalte's
    {!Solidtype_kobalte.Types.Color}, read from a CSS string by
    {!Solidtype_kobalte.Colors.parse_color}.

    A part is used inside the part above it: elsewhere it raises
    [Invalid_argument] as it is made. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

(** A swatch to choose, of its [color], disabled while [is_disabled]; its colour
    is [--color-swatch-current], which HeroUI's styles border it with once it is
    chosen, before its own [style]. It declares [data-hovered], [data-pressed],
    [data-focused], [data-focus-visible], [data-selected] and [data-disabled].
    Inside it, {!Solidtype_headless.Color_swatch_picker.use_item_context} reads
    its colour and state. *)
module Item : sig
  type state = {
    is_hovered : bool S.accessor;
    is_pressed : bool S.accessor;
    is_selected : bool S.accessor;
    is_focused : bool S.accessor;
    is_focus_visible : bool S.accessor;
    is_disabled : bool S.accessor;
    color : Solidtype_kobalte.Types.Color.t S.accessor;
  }
  (** What its children are drawn of, given as a function, as HeroUI's render
      props are, each read where Solid tracks it. *)

  module Props : sig
    type t

    val check :
      color:Solidtype_kobalte.Types.Color.t Solidtype.Check.value ->
      ?is_disabled:bool Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?style:string Solidtype.Check.value ->
      ?ref:(Dom.htmlDivElement -> unit) ->
      children:
        (state -> Jsx.element, [ `nodes | `render ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> state -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** Its item's colour, painted as {!Color_swatch} paints one, which names the
    item: the colour's name, or [color_name]. *)
module Swatch : sig
  module Props : sig
    type t

    val check :
      ?color_name:string Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** What shows its item is chosen, hidden from a reader: a checkmark, or its
    [children]; [data-light-color] over a light colour, which HeroUI's styles
    draw it black over, else white. *)
module Indicator : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Span.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Span.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** The list, its colour [value] while it is given one, else the one it keeps,
    [default_value] at first; choosing another swatch calls [on_change] with its
    colour. Its swatches are [size], [`md] by default, and [variant], [`circle]
    or [`square], laid out by [layout], wrapped in rows, [`grid], the default,
    or one above another, [`stack]. It is named "Color swatches" unless it is
    given [aria_label] or [aria_labelledby]. *)

module Props : sig
  type t

  val check :
    ?value:Solidtype_kobalte.Types.Color.t Solidtype.Check.value ->
    ?default_value:Solidtype_kobalte.Types.Color.t Solidtype.Check.value ->
    ?on_change:(Solidtype_kobalte.Types.Color.t -> unit) ->
    ?size:[ `xs | `sm | `md | `lg | `xl ] Solidtype.Check.value ->
    ?variant:[ `circle | `square ] Solidtype.Check.value ->
    ?layout:[ `grid | `stack ] Solidtype.Check.value ->
    ?aria_label:string Solidtype.Check.value ->
    ?aria_labelledby:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
    ?props:t S.rest ->
    (unit -> unit) Solidtype.Html.Div.check
end

val make : Props.t -> Jsx.element
val component : Props.t Jsx.component
