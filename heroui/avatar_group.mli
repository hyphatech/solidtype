(** HeroUI's AvatarGroup: a [<div>] of {!Avatar}s, with HeroUI's classes from
    {!Styles.AvatarGroup}, stacked or in a grid. It gives the avatars inside it
    its [size], [color] and [variant], each where an avatar sets none itself,
    shows the first [max] of them, and counts the rest, "+2", unless it holds a
    {!Count} of its own.

    {[
      <Avatar_group max=3>
        <Avatar><Avatar.Fallback>"AL"</Avatar.Fallback></Avatar>
        <Avatar><Avatar.Fallback>"GH"</Avatar.Fallback></Avatar>
      </Avatar_group>
    ]}

    React counts a group's own children; Solid cannot single them out, so an
    avatar joins the group as it is made, and its place among them is the order
    they were made in: an avatar added later, by a [For], is counted after the
    others, wherever it is. Kobalte has no group. *)

type size = [ `sm | `md | `lg ]
type color = [ `default | `accent | `success | `warning | `danger ]
type variant = [ `default | `soft ]

type group = {
  size : unit -> size;
  color : unit -> color option;
  variant : unit -> variant option;
  join : unit -> unit -> bool;
      (** [join ()], as an avatar is made, counts it among the group's until its
          owner is cleaned up, and is whether it is shown. *)
  count : unit -> unit;
      (** [count ()], as a {!Count} is made, has the group count none itself
          until its owner is cleaned up. *)
}
(** What a group gives its avatars. *)

module Context : sig
  module Provider : sig
    module Props : sig
      val check :
        value:group Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Solidtype.Jsx.component
  end

  val use : unit -> group option
end

(** The avatar that counts those a group does not show, its children the count,
    "+40"; a group that holds one counts none itself, and shows it whatever its
    [max]. Its [size], [color] and [variant] are its own, else the group's. *)
module Count : sig
  module Props : sig
    type t

    val check :
      ?size:size Solidtype.Check.value ->
      ?color:color Solidtype.Check.value ->
      ?variant:variant Solidtype.Check.value ->
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
    ?size:size Solidtype.Check.value ->
    ?color:color Solidtype.Check.value ->
    ?variant:variant Solidtype.Check.value ->
    ?max:int Solidtype.Check.value ->
    ?is_grid:bool Solidtype.Check.value ->
    ?overlap:[ `clip | `ring ] Solidtype.Check.value ->
    ?role:Solidtype.Html.Div.role Solidtype.Check.value ->
    ?aria_label:string Solidtype.Check.value ->
    ?aria_labelledby:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
