(** A list of colour swatches one is chosen from, as Kobalte would make one: a
    [<div role="listbox">] of [<div role="option">]s, a list of Kobalte's made
    of {!Solidtype_kobalte.Selection}'s hooks, each option named by the
    {!Swatch} inside it. It draws no style: each part is the element it names,
    its roles and state as attributes, and takes every attribute its element
    does -- a class, a style, a [ref], a handler -- which it passes on, a [ref]
    and a handler called beside its own.

    {[
      <Color_swatch_picker.Root
        default_value=(fun () -> Colors.parse_color "#8B5CF6")>
        <For each=(fun () -> colors)>
          (fun c _ ->
            <Color_swatch_picker.Item color=(fun () -> Colors.parse_color c)>
              <Color_swatch_picker.Swatch />
            </Color_swatch_picker.Item>)
        </For>
      </Color_swatch_picker.Root>
    ]}

    Tab reaches the chosen option, or the first, and the keys move among the
    options, a disabled one passed over: in a [`grid], laid out in rows, Left
    and Right to the one before and after, as the page's direction reads them,
    and Up and Down to the one above and below in the same column; in a
    [`stack], Up and Down to the one before and after. Home and End reach the
    first and the last, Page Up and Page Down the first and the last unless the
    list scrolls, then a page at a time, and typing the start of a colour's name
    the next option of that name. A press, Space or Enter chooses the option. A
    chosen option is [aria-selected] and [data-selected], and a disabled one
    [aria-disabled] and [data-disabled], present and empty as Kobalte's state
    is.

    A part is used inside the part above it: elsewhere it raises
    [Invalid_argument] as it is made. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

type item = {
  color : Solidtype_kobalte.Types.Color.t S.accessor;
  is_selected : bool S.accessor;
  is_disabled : bool S.accessor;
}
(** What a part inside an {!Item} reads of it, and a style's attribute on it. *)

(** The list, its colour [value] while it is given one, else the one it keeps,
    [default_value] at first, and none chosen while neither names an option's.
    Choosing another option calls [on_change] with its colour. Its [layout],
    [`grid] by default, says how the keys move, and is its [data-layout]. A
    colour is its option's when the two are one colour, read as a hex with its
    alpha, so [rgb(139, 92, 246)] chooses [#8B5CF6]. It is named "Color
    swatches" unless it is given [aria_label] or [aria_labelledby]. *)
module Root : sig
  module Props : sig
    type t

    val check :
      ?value:Solidtype_kobalte.Types.Color.t Solidtype.Check.value ->
      ?default_value:Solidtype_kobalte.Types.Color.t Solidtype.Check.value ->
      ?on_change:(Solidtype_kobalte.Types.Color.t -> unit) ->
      ?layout:[ `grid | `stack ] Solidtype.Check.value ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** An option, of its [color], disabled while [is_disabled]; named by the
    {!Swatch} inside it, which its [aria-labelledby] names. It joins the list
    once it is on the page, ordered as the page has it. *)
module Item : sig
  module Context : sig
    val use : unit -> item
    (** The item above, read by a part inside it, or by a style's attribute on
        it, which Solid reads inside the item; outside an {!Item} it raises
        [Invalid_argument]. *)
  end

  module Props : sig
    type t

    val check :
      color:Solidtype_kobalte.Types.Color.t Solidtype.Check.value ->
      ?is_disabled:bool Solidtype.Check.value ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:'spread S.rest ->
      (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit)
      Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** Its option's colour, Kobalte's {!Solidtype_kobalte.ColorSwatch.Root}, fixed
    as {!Color_swatch} is: a [<div role="img">] painted the colour and named by
    it, [color_name] in place of the colour's own, the name its option takes. *)
module Swatch : sig
  module Props : sig
    type t

    val check :
      ?color_name:string Solidtype.Check.value ->
      ?props:'spread S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end
