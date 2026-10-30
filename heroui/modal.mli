(** HeroUI's Modal: Kobalte's [Dialog], with HeroUI's classes from
    {!Styles.Modal}.

    {[
      <Modal>
        <Button variant=`secondary>"Open Modal"</Button>
        <Modal.Backdrop>
          <Modal.Container>
            <Modal.Dialog>
              <Modal.Close_trigger />
              <Modal.Header>
                <Modal.Heading>"Welcome to HeroUI"</Modal.Heading>
              </Modal.Header>
              <Modal.Body><p>"A beautiful, fast, and modern UI library."</p></Modal.Body>
              <Modal.Footer><Button slot=`close>"Continue"</Button></Modal.Footer>
            </Modal.Dialog>
          </Modal.Container>
        </Modal.Backdrop>
      </Modal>
    ]}

    A {!Button} inside a modal is its trigger, as in HeroUI, and shows pressed
    while the modal is open; so is a {!Trigger}, around anything else. A button
    with [slot=`close] inside the dialog closes it. The modal opens as its
    trigger is pressed and gives the focus to its {!Dialog}; Tab keeps the focus
    inside it, and the page outside is hidden from a reader and does not scroll
    while it is open. Escape, a press on the backdrop, the {!Close_trigger} or a
    reader's dismiss button closes it, unless the backdrop says otherwise, and
    the focus goes back to what had it.

    A {!Backdrop} with no modal around it is a modal of its own, open as its
    [is_open] says.

    It is drawn in a portal at the end of the page while it is open, and while
    HeroUI's exit animation plays after.

    A part but the backdrop is used inside a [Modal.Backdrop]: elsewhere it
    raises [Invalid_argument] as it is made. *)

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

(** What covers the page while the modal is open: a [<div>], [opaque] by
    default. A press on it closes the modal while [is_dismissable], and Escape
    while not [is_keyboard_dismiss_disabled]. With no {!Modal} around it,
    [is_open], [default_open] and [on_open_change] are its own. It is drawn at
    the end of the page's body, or inside [portal_container] while that is
    given. *)
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
      ?portal_container:_ Dom.element_like Solidtype.Check.value ->
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
    by default; scrolling the dialog's body [`inside] it, or the page [`outside]
    it. *)
module Container : sig
  module Props : sig
    type t

    val check :
      ?placement:[ `auto | `center | `top | `bottom ] Solidtype.Check.value ->
      ?scroll:[ `inside | `outside ] Solidtype.Check.value ->
      ?size:[ `xs | `sm | `md | `lg | `cover | `full ] Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The dialog: Kobalte's content, a [<section>] its {!Heading} names, which
    takes the focus as the modal opens. *)
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

(** What the dialog says: a [<div>], scrolled as its container says. *)
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

(** An icon beside the heading: a [<div>]. *)
module Icon : sig
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
