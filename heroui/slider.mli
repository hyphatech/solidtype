(** HeroUI's Slider: Kobalte's [Slider.Root], with HeroUI's classes from
    {!Styles.Slider}, whose values -- one, or two for a range -- are chosen by
    its thumbs along its track, by a pointer or the arrow, page, Home and End
    keys, on its step's grid within its range. Its {!Label} names it, its
    {!Output} shows its values, and its {!Fill} is drawn between them.

    {[
      <Slider default_value=(fun () -> [| 30. |])>
        <Label>"Volume"</Label>
        <Slider.Output />
        <Slider.Track><Slider.Fill /><Slider.Thumb /></Slider.Track>
      </Slider>
    ]}

    [format_options], as HeroUI's [formatOptions], formats each value its output
    shows and each thumb tells a reader, by Kobalte's
    [I18n.create_number_formatter] in Kobalte's locale, a decimal by default: a
    thumb's value as Kobalte tells it alone is a decimal.

    A part is used inside a [Slider]: elsewhere it raises [Invalid_argument] as
    it is made. *)

(** The values as text, joined by an en dash, or the children it is given. *)
module Output : sig
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

(** The line the thumbs move along, Kobalte's. *)
module Track : sig
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

(** The part of the track between the start, or the first thumb of a range, and
    the last thumb: a [<div>] placed and sized by its style. *)
module Fill : sig
  module Props : sig
    type t

    val check : ?class_:string Solidtype.Check.value -> ?props:t -> unit -> unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** A thumb, Kobalte's, with the input a keyboard and a reader reach: the
    [index]th, 0 the default, of the slider's values. *)
module Thumb : sig
  module Props : sig
    type t

    val check :
      ?index:int Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

module Props : sig
  type t

  val check :
    ?value:float array Solidtype.Check.value ->
    ?default_value:float array Solidtype.Check.value ->
    ?on_change:(float array -> unit) ->
    ?on_change_end:(float array -> unit) ->
    ?min_value:float Solidtype.Check.value ->
    ?max_value:float Solidtype.Check.value ->
    ?step:float Solidtype.Check.value ->
    ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?name:string Solidtype.Check.value ->
    ?aria_label:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?format_options:
      Solidtype_kobalte.Types.NumberFormatOptions.t Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
