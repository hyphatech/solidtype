(** An action bar, in HeroUI's look, which ships no stylesheet for it: a
    {!Toolbar} that floats at the foot of the page, centred, while [is_open],
    for what can be done with what is chosen -- rows of a {!Data_grid} or a
    {!List_view} -- sliding in and out as it opens and closes. Its look is a
    stylesheet, [action-bar.css], in the [components] layer, rules for its
    classes.

    Its page, with its examples:
    [$(opam var solidtype:doc)/pages/heroui/action-bar.md].

    {[
      <Action_bar is_open=(Array.length (S.get chosen) > 0)>
        <Action_bar.Prefix>(count)</Action_bar.Prefix>
        <Separator />
        <Action_bar.Content>
          <Button size=`sm variant=`ghost>
            <Gravity.Pencil />
            <span class_="action-bar__label">"Edit"</span>
          </Button>
        </Action_bar.Content>
        <Separator />
        <Action_bar.Suffix>(clear)</Action_bar.Suffix>
      </Action_bar>
    ]}

    Its keys are its toolbar's. Text of the class [action-bar__label] is read
    but not shown below 640 pixels, so a button there shows its icon alone. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

(** What leads the bar, a count of what is chosen: a
    [<div class="action-bar__prefix">]. *)
module Prefix : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `elements ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** Its actions: a [<div class="action-bar__content">]. *)
module Content : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `elements ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

(** What ends the bar, a button that clears what is chosen: a
    [<div class="action-bar__suffix">]. *)
module Suffix : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `elements ]) Solidtype.Check.children ->
      ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
      ?props:t S.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Jsx.element
  val component : Props.t Jsx.component
end

module Props : sig
  type t

  val check :
    is_open:bool Solidtype.Check.value ->
    ?aria_label:string Solidtype.Check.value ->
    ?is_attached:bool Solidtype.Check.value ->
    ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `elements ]) Solidtype.Check.children ->
    ?as_:(Solidtype.Html.Div.props -> Jsx.element) ->
    ?props:t S.rest ->
    (unit -> unit) Solidtype.Html.Div.check
end

val make : Props.t -> Jsx.element
(** The bar: a [<div class="action-bar">] fixed at the foot of the page,
    [data-entering] and [data-exiting] while it slides, around its {!Toolbar},
    [<div role="toolbar" class="action-bar__wrapper">], named [aria_label],
    ["Actions"] by default, attached unless [is_attached] is [false], which
    takes the rest of its props. *)

val component : Props.t Jsx.component
