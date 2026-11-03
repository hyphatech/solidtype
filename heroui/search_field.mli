(** HeroUI's SearchField: Kobalte's [TextField.Root], with HeroUI's classes from
    {!Styles.SearchField}, whose input is a search: Escape clears it, Enter
    submits it, and its {!Clear_button} clears it and gives its input the focus
    back, as React Aria's does. Its {!Label}, {!Description} and {!Field_error}
    are Kobalte's.

    {[
      <Search_field on_submit=(fun query -> search query)>
        <Label>"Search"</Label>
        <Search_field.Group>
          <Search_field.Search_icon />
          <Search_field.Input placeholder="Search..." />
          <Search_field.Clear_button />
        </Search_field.Group>
      </Search_field>
    ]}

    Kobalte's [Search] is a combobox; HeroUI's search field is a text field,
    which this is. Inside an {!Autocomplete.Filter} it is the autocomplete's
    search: its text is the autocomplete's, and its input Kobalte's combo box
    input, whose keys move through the list and choose. A part is used inside a
    [Search_field]: elsewhere it raises [Invalid_argument] as it is made. *)

(** The icon, the input and the clear button, laid out together: a
    [<div role="group">]. *)
module Group : sig
  type state = {
    is_hovered : bool Solidtype.Solid.accessor;
    is_focus_within : bool Solidtype.Solid.accessor;
    is_focus_visible : bool Solidtype.Solid.accessor;
    is_disabled : bool Solidtype.Solid.accessor;
    is_invalid : bool Solidtype.Solid.accessor;
  }
  (** What its children are drawn of, given as a function, as HeroUI's render
      props are, each read where Solid tracks it. *)

  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:
        ( state -> Solidtype.Jsx.element,
          [ `nodes | `render ] )
        Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      (unit -> unit) Solidtype.Html.Div.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** HeroUI's magnifier, or the icon it is given. *)
module Search_icon : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      (unit -> unit) Solidtype.Html.Svg.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The field's input, Kobalte's, of type [search]. *)
module Input : sig
  module Props : sig
    type t

    val check :
      ?placeholder:string Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?on_key_down:(Dom.keyboardEvent -> unit) ->
      ?ref:(Dom.htmlInputElement -> unit) ->
      ?props:t Solidtype.Solid.rest ->
      (unit -> unit) Solidtype.Html.Input.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The button that clears the field and gives its input the focus back:
    HeroUI's close button, named "Close" and drawing {!Close_button.Icon}, or
    the children it is given, out of the tab order, as React Aria's is. *)
module Clear_button : sig
  type state = {
    is_hovered : bool Solidtype.Solid.accessor;
    is_pressed : bool Solidtype.Solid.accessor;
    is_focused : bool Solidtype.Solid.accessor;
    is_focus_visible : bool Solidtype.Solid.accessor;
    is_disabled : bool Solidtype.Solid.accessor;
  }
  (** What its children are drawn of, given as a function, as HeroUI's render
      props are, each read where Solid tracks it. *)

  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?children:
        ( state -> Solidtype.Jsx.element,
          [ `nodes | `render ] )
        Solidtype.Check.children ->
      ?on_pointer_down:(Dom.pointerEvent -> unit) ->
      ?on_click:(Dom.mouseEvent -> unit) ->
      ?ref:(Dom.htmlButtonElement -> unit) ->
      ?props:t Solidtype.Solid.rest ->
      (unit -> unit) Solidtype.Html.Button.check
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

type state = {
  is_empty : bool Solidtype.Solid.accessor;
  is_disabled : bool Solidtype.Solid.accessor;
  is_invalid : bool Solidtype.Solid.accessor;
  is_read_only : bool Solidtype.Solid.accessor;
  is_required : bool Solidtype.Solid.accessor;
}
(** What its children are drawn of, given as a function, as HeroUI's render
    props are, each read where Solid tracks it. *)

module Props : sig
  type t

  val check :
    ?variant:[ `primary | `secondary ] Solidtype.Check.value ->
    ?full_width:bool Solidtype.Check.value ->
    ?value:string Solidtype.Check.value ->
    ?default_value:string Solidtype.Check.value ->
    ?on_change:(string -> unit) ->
    ?on_submit:(string -> unit) ->
    ?on_clear:(unit -> unit) ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?is_invalid:bool Solidtype.Check.value ->
    ?is_read_only:bool Solidtype.Check.value ->
    ?is_required:bool Solidtype.Check.value ->
    ?name:string Solidtype.Check.value ->
    ?aria_label:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?on_blur:(Dom.focusEvent -> unit) ->
    ?on_focus_out:(Dom.focusEvent -> unit) ->
    ?ref:(Dom.htmlDivElement -> unit) ->
    children:
      ( state -> Solidtype.Jsx.element,
        [ `nodes | `render ] )
      Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    (unit -> unit) Solidtype.Html.Div.check
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
