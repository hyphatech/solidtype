(** HeroUI's Skeleton: a [<div>], with HeroUI's classes from {!Styles.Skeleton},
    that stands where content is loading, its shape given by [class_]. Its
    animation is its [animation_type], else the page's [--skeleton-animation] --
    [shimmer], [pulse] or [none] -- else a shimmer. The page's is read once the
    skeleton is in the browser, never on the server, as HeroUI reads it, so a
    prerendered skeleton hydrates as it was rendered.

    {[
      <Skeleton class_="h-3 w-3/5 rounded-lg" />
    ]}

    Kobalte's Skeleton is a wrapper that hides its content while it loads, with
    a role and sizes of its own; HeroUI's is the placeholder alone, which this
    is, a [<div>] with no behaviour. *)

module Props : sig
  type t

  val check :
    ?animation_type:[ `shimmer | `pulse | `none ] Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
