(** HeroUI's AlertDialog: Kobalte's [Dialog] as an [alertdialog], with HeroUI's
    classes from {!Styles.AlertDialog}, a dialog that asks the user to decide
    before going on.

    {[
      <Alert_dialog>
        <Button variant=`danger>"Delete Project"</Button>
        <Alert_dialog.Backdrop>
          <Alert_dialog.Container>
            <Alert_dialog.Dialog>
              <Alert_dialog.Header>
                <Alert_dialog.Icon status=`danger />
                <Alert_dialog.Heading>"Delete project permanently?"</Alert_dialog.Heading>
              </Alert_dialog.Header>
              <Alert_dialog.Body><p>"This cannot be undone."</p></Alert_dialog.Body>
              <Alert_dialog.Footer>
                <Button slot=`close variant=`tertiary>"Cancel"</Button>
                <Button slot=`close variant=`danger>"Delete"</Button>
              </Alert_dialog.Footer>
            </Alert_dialog.Dialog>
          </Alert_dialog.Container>
        </Alert_dialog.Backdrop>
      </Alert_dialog>
    ]}

    It is a {!Modal} in all but these: its dialog's role is [alertdialog]; a
    press on its backdrop and Escape leave it open unless its backdrop says
    otherwise, so only its own buttons close it; its container takes no scroll;
    and its {!Icon} draws HeroUI's icon for its status.

    A part but the backdrop is used inside an [Alert_dialog.Backdrop]: elsewhere
    it raises [Invalid_argument] as it is made. *)

(** A trigger of anything that is not a {!Button}: Kobalte's trigger, a [<div>]
    with the role of a button, reached by Tab. *)
module Trigger : sig
  module Props : sig
    type t

    val check :
      ?aria_label:string Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** What covers the page while the dialog is open: a [<div>], [opaque] by
    default. A press on it closes the dialog only while [is_dismissable], and
    Escape only while not [is_keyboard_dismiss_disabled]: by default neither.
    With no {!Alert_dialog} around it, [is_open], [default_open] and
    [on_open_change] are its own. *)
module Backdrop : sig
  module Props : sig
    type t

    val check :
      ?variant:[ `opaque | `blur | `transparent ] Solidtype.Check.value ->
      ?is_dismissable:bool Solidtype.Check.value ->
      ?is_keyboard_dismiss_disabled:bool Solidtype.Check.value ->
      ?is_open:bool Solidtype.Check.value ->
      ?default_open:bool Solidtype.Check.value ->
      ?on_open_change:(bool -> unit) ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** Where the dialog is placed: a [<div>], [placement] [`auto] by default, at
    the foot of a phone's screen and in the middle of a wider one; [size] [`md]
    by default. *)
module Container : sig
  module Props : sig
    type t

    val check :
      ?placement:[ `auto | `center | `top | `bottom ] Solidtype.Check.value ->
      ?size:[ `xs | `sm | `md | `lg | `cover ] Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The dialog: Kobalte's content, a [<section>] with the role of an
    [alertdialog], its {!Heading} names it, and it takes the focus as it opens.
*)
module Dialog : sig
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

(** The dialog's top, its {!Icon} and {!Heading}: a [<div>]. *)
module Header : sig
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

(** What the dialog says: a [<div>]. *)
module Body : sig
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

(** The dialog's actions: a [<div>]. *)
module Footer : sig
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

(** HeroUI's icon for [status], [`danger] by default -- info for the default and
    accent, success, warning, danger -- in a [<div>] coloured as the status is,
    or the [children] it is given. *)
module Icon : sig
  module Props : sig
    type t

    val check :
      ?status:
        [ `default | `accent | `success | `warning | `danger ]
        Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The dialog's title, which names it: Kobalte's title, an [<h2>]. *)
module Heading : sig
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

(** HeroUI's close button in the dialog's corner, which closes it. *)
module Close_trigger : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
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
    ?is_open:bool Solidtype.Check.value ->
    ?default_open:bool Solidtype.Check.value ->
    ?on_open_change:(bool -> unit) ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
