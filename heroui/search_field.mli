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
    which this is. A part is used inside a [Search_field]: elsewhere it raises
    [Invalid_argument] as it is made. *)

(** The icon, the input and the clear button, laid out together: a
    [<div role="group">]. *)
module Group : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t ->
      unit ->
      unit
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
      ?props:t ->
      unit ->
      unit
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
      ?props:t ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The button that clears the field and gives its input the focus back:
    HeroUI's close button, named "Close" and drawing {!Close_button.Icon}, out
    of the tab order, as React Aria's is. *)
module Clear_button : sig
  module Props : sig
    type t

    val check : ?class_:string Solidtype.Check.value -> ?props:t -> unit -> unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

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
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
