(** HeroUI's RadioGroup: Kobalte's [RadioGroup.Root], the {!Radio}s inside it of
    which one at most is chosen, with HeroUI's classes from {!Styles.RadioGroup}
    and the state its styles read -- orientation, disabled, invalid -- declared
    as React Aria writes it. A {!Label} inside it, but outside a radio's
    content, is the group's, which names it, and a {!Description} the group's,
    which describes it. Its props are named as HeroUI's documentation names
    them.

    {[
      <Radio_group default_value="pro">
        <Label>"Plan"</Label>
        <Radio value="starter">
          <Radio.Content>
            <Radio.Control><Radio.Indicator /></Radio.Control>
            "Starter"
          </Radio.Content>
        </Radio>
      </Radio_group>
    ]} *)

type group = {
  value : unit -> string option;
  disabled : unit -> bool;
  invalid : unit -> bool;
}
(** What a group's radios read of it: the value chosen, if any, and whether it
    is disabled or invalid. *)

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

module Props : sig
  type t

  val check :
    ?variant:[ `primary | `secondary ] Solidtype.Check.value ->
    ?value:string Solidtype.Check.value ->
    ?default_value:string Solidtype.Check.value ->
    ?on_change:(string -> unit) ->
    ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?is_invalid:bool Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
