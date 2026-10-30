(** HeroUI's Form: a [<form>], which HeroUI gives no classes of its own, that
    refuses a submit while a field inside it is invalid and focuses the first
    such field, in the page's order, instead; and that shows a server's errors,
    [validation_errors], each on the field whose [name] it names, invalid with
    that message until the field is changed and then left, as React Aria commits
    a change, or until the errors are given again.

    {[
      <Form on_submit=save
        validation_errors=(fun () -> S.get from_server)>
        <Text_field name="email"
          is_invalid=(fun () -> not (is_email (S.get email)))
          on_change=(S.set set_email)>
          <Label>"Email"</Label> <Input />
          <Field_error>"Enter an email."</Field_error>
        </Text_field>
        <Button type_=`submit>"Save"</Button>
      </Form>
    ]}

    A refused submit dispatches an [invalid] event on the form, cancelable,
    which [on_invalid] is given once; preventing it leaves focus where it is,
    for the application to move.

    A field validates nothing itself: whether it is invalid is the application's
    to say, from its own state, by its [is_invalid]. The form asks the browser
    to validate nothing, [novalidate], since a field's input may be one Kobalte
    hides. *)

type field = {
  error : unit -> string option;
      (** The server's error for the field, while it stands. *)
  changed : unit -> unit;  (** Tells the form the field was changed. *)
  left : unit -> unit;
      (** Tells the form focus left the field: its error clears if it was
          changed. *)
  root : Dom.htmlDivElement -> unit;
      (** The field's element, given as its [ref]: the form focuses the first
          control inside it, a checked radio first. *)
}
(** A field as the form it is in reads it. *)

val field : name:(unit -> string option) -> invalid:(unit -> bool) -> field
(** [field ~name ~invalid] registers a field with the form it is in, for as long
    as the field is mounted, and is what it reads of the form. Outside a form,
    its error is [None] and the rest does nothing. *)

module Props : sig
  type t

  val check :
    ?action:string Solidtype.Check.value ->
    ?method_:[ `dialog | `post | `get ] Solidtype.Check.value ->
    ?aria_label:string Solidtype.Check.value ->
    ?aria_labelledby:string Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?validation_errors:(string * string) list Solidtype.Check.value ->
    ?on_submit:(Dom.event -> unit) ->
    ?on_reset:(Dom.event -> unit) ->
    ?on_invalid:(Dom.event -> unit) ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
