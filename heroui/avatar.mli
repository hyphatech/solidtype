(** HeroUI's Avatar: Kobalte's [Image.Root], a [<span>], with HeroUI's classes
    from {!Styles.Avatar}, that shows its {!Image} once it has loaded and its
    {!Fallback} until then, or where it cannot.

    {[
      <Avatar>
        <Avatar.Image alt="Ada Lovelace" src="/ada.png" />
        <Avatar.Fallback>"AL"</Avatar.Fallback>
      </Avatar>
    ]}

    A part is used inside an [Avatar]: elsewhere it raises [Invalid_argument] as
    it is made. *)

type color = [ `default | `accent | `success | `warning | `danger ]

(** The image, a [<img>] Kobalte renders once it has loaded. *)
module Image : sig
  module Props : sig
    type t

    val check :
      src:string Solidtype.Check.value ->
      ?alt:string Solidtype.Check.value ->
      ?srcset:string Solidtype.Check.value ->
      ?sizes:string Solidtype.Check.value ->
      ?crossorigin:[ `anonymous | `use_credentials ] Solidtype.Check.value ->
      ?loading:string Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?props:t ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** What the avatar shows while its image loads, or where it cannot: initials,
    an icon. Its [color] is its own, else the avatar's. *)
module Fallback : sig
  module Props : sig
    type t

    val check :
      ?color:color Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
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
    ?size:[ `sm | `md | `lg ] Solidtype.Check.value ->
    ?color:color Solidtype.Check.value ->
    ?variant:[ `default | `soft ] Solidtype.Check.value ->
    ?fallback_delay:float Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
