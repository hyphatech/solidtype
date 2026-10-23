(** HeroUI's ProgressBar: Kobalte's [Progress.Root], a
    [<div role="progressbar">], with HeroUI's classes from
    {!Styles.ProgressBar}, that shows a quantity within a known range: its
    {!Label} names it, its {!Output} shows its value as Kobalte formats it for
    the reader's locale, and its {!Fill} is as wide in its {!Track} as the value
    is far along the range.

    {[
      <Progress_bar value=60.>
        <Label>"Loading"</Label>
        <Progress_bar.Output />
        <Progress_bar.Track><Progress_bar.Fill /></Progress_bar.Track>
      </Progress_bar>
    ]}

    A part is used inside a [Progress_bar]: elsewhere it raises
    [Invalid_argument] as it is made. *)

(** The value as text, Kobalte's, a percentage by default, or the children it is
    given: a [<span>]. *)
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

(** The bar the fill is drawn in: a [<div>]. *)
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

(** The part of the track up to the value: a [<div>] as wide as its share, or of
    no width of its own while the bar is indeterminate, which HeroUI's styles
    animate. *)
module Fill : sig
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
    ?value:float Solidtype.Check.value ->
    ?is_indeterminate:bool Solidtype.Check.value ->
    ?min_value:float Solidtype.Check.value ->
    ?max_value:float Solidtype.Check.value ->
    ?color:
      [ `default | `accent | `success | `warning | `danger ]
      Solidtype.Check.value ->
    ?size:[ `sm | `md | `lg ] Solidtype.Check.value ->
    ?aria_label:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
