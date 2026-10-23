(** HeroUI's SwitchGroup: a [<div>] of {!Switch}es, with HeroUI's classes from
    {!Styles.SwitchGroup}, laid out vertically or horizontally. Each switch is
    its own; the group lays them out.

    {[
      <Switch_group>
        <Switch name="email">
          <Switch.Content>
            <Switch.Control><Switch.Thumb /></Switch.Control>
            "Email"
          </Switch.Content>
        </Switch>
      </Switch_group>
    ]}

    Kobalte has no switch group, and a group has no behaviour. *)

module Props : sig
  type t

  val check :
    ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
