(** HeroUI's Kbd: a [<kbd>], with HeroUI's classes from {!Styles.Kbd}, that
    shows a key or a combination of keys, each modifier by its symbol and the
    rest by its text.

    {[
      <Kbd>
        <Kbd.Abbr key_value=`command />
        <Kbd.Content>"K"</Kbd.Content>
      </Kbd>
    ]}

    Kbd's variants are a keyboard's, not a component's behaviour, so no Kobalte
    component underlies it. A part's classes are the same in any key, so a part
    needs no [Kbd] around it. *)

type key =
  [ `command
  | `shift
  | `ctrl
  | `option
  | `enter
  | `delete
  | `escape
  | `tab
  | `capslock
  | `up
  | `right
  | `down
  | `left
  | `pageup
  | `pagedown
  | `home
  | `end_
  | `help
  | `space
  | `fn
  | `win
  | `alt ]
(** A key HeroUI draws by its symbol: [`command] is [⌘], named "Command". *)

(** A key's symbol: an [<abbr>] titled with the key's name. *)
module Abbr : sig
  module Props : sig
    type t

    val check :
      key_value:key Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?props:t ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** A key's text, a letter or a word: a [<span>]. *)
module Content : sig
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

module Props : sig
  type t

  val check :
    ?variant:[ `default | `light ] Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
