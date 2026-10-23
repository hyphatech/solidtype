(** HeroUI's TextField: Kobalte's [TextField.Root], a field's [<div>], with
    HeroUI's classes from {!Styles.TextField}, and the parts inside it as
    Kobalte's: its {!Label} names its {!Input} or {!Text_area}, its
    {!Description} describes it, and its {!Field_error} shows while it is
    invalid. It keeps its value, controlled or its own, and declares its state
    as React Aria writes it -- disabled, invalid, read-only, required, and the
    focus within it.

    {[
      <Text_field name="email" is_required=true>
        <Label>"Email"</Label>
        <Input type_=`email placeholder="ada@example.org" />
        <Description>"We'll never share it."</Description>
        <Field_error>"Enter a valid email."</Field_error>
      </Text_field>
    ]}

    Kobalte writes its own state on each part too -- [data-valid],
    [data-required] and the rest, present and empty -- which HeroUI's styles,
    reading React Aria's ["true"], pass over; and gives the field's [<div>] the
    [group] role, and its input [aria-required] and [aria-disabled] beside the
    native [required] and [disabled]. *)

type field = {
  variant : unit -> [ `primary | `secondary ] option;
  disabled : unit -> bool;
  invalid : unit -> bool;
  read_only : unit -> bool;
  required : unit -> bool;
}
(** What a field's parts read of it: the variant its input takes where it sets
    none, and its state. *)

module Context : sig
  module Provider : sig
    module Props : sig
      val check :
        value:field Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Solidtype.Jsx.component
  end

  val use : unit -> field option
end

module Props : sig
  type t

  val check :
    ?variant:[ `primary | `secondary ] Solidtype.Check.value ->
    ?full_width:bool Solidtype.Check.value ->
    ?value:string Solidtype.Check.value ->
    ?default_value:string Solidtype.Check.value ->
    ?on_change:(string -> unit) ->
    ?is_required:bool Solidtype.Check.value ->
    ?is_invalid:bool Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?is_read_only:bool Solidtype.Check.value ->
    ?name:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?on_blur:(Dom.focusEvent -> unit) ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
