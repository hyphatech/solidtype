(** HeroUI's EmptyState: a [<div>], with HeroUI's class from
    {!Styles.EmptyState}, that a list, a table or a select shows where it has
    nothing to show, and says "No results found" unless it is given children.

    {[
      <Empty_state>"No tasks yet"</Empty_state>
    ]}

    It has no behaviour, so no Kobalte component underlies it. *)

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
