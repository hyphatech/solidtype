(** HeroUI's Fieldset: a [<fieldset>] of fields, with HeroUI's classes from
    {!Styles.Fieldset}, its {!Legend}, the {!Group} of its fields and its
    {!Actions}. While it is [disabled], it gives the {!Button}s, {!Link}s and
    {!Radio_group}s inside it the state, as HeroUI's gives React Aria's: the
    browser disables a native button or input inside a disabled fieldset, but
    neither a group nor the state its styles read. A component's own
    [is_disabled] is its own.

    {[
      <Fieldset>
        <Fieldset.Legend>"Profile"</Fieldset.Legend>
        <Fieldset.Group>
          <Text_field name="name"><Label>"Name"</Label><Input /></Text_field>
        </Fieldset.Group>
        <Fieldset.Actions><Button type_=`submit>"Save"</Button></Fieldset.Actions>
      </Fieldset>
    ]}

    Kobalte has no fieldset. A part's classes are the same in any fieldset, so a
    part needs none around it. *)

(** Whether the fieldset a component is inside is disabled, read as it changes.
*)
module Context : sig
  module Provider : sig
    module Props : sig
      val check :
        value:(unit -> bool) Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Solidtype.Jsx.component
  end

  val use : unit -> (unit -> bool) option
end

val disabled : unit -> unit -> bool
(** [disabled ()], called as a component is made, is a read of whether the
    fieldset it is inside is disabled, [false] in none. *)

(** The fieldset's caption: a [<legend>]. *)
module Legend : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The fields, laid out together: a [<div>]. *)
module Group : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** Its buttons, laid out together: a [<div>]. *)
module Actions : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

module Props : sig
  type t

  val check :
    ?disabled:bool Solidtype.Check.value ->
    ?name:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
