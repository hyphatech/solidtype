(** HeroUI's Drawer: Kobalte's [Dialog] sliding in from an edge of the page,
    with HeroUI's classes from {!Styles.Drawer}.

    {[
      <Drawer>
        <Button variant=`secondary>"Open Drawer"</Button>
        <Drawer.Backdrop>
          <Drawer.Content placement=`right>
            <Drawer.Dialog>
              <Drawer.Close_trigger />
              <Drawer.Header>
                <Drawer.Heading>"Drawer Title"</Drawer.Heading>
              </Drawer.Header>
              <Drawer.Body><p>"Its content."</p></Drawer.Body>
              <Drawer.Footer><Button slot=`close>"Continue"</Button></Drawer.Footer>
            </Drawer.Dialog>
          </Drawer.Content>
        </Drawer.Backdrop>
      </Drawer>
    ]}

    It is a {!Modal} in all but these: its content slides in from the edge its
    [placement] names, the bottom by default; its {!Trigger} is a button, as
    HeroUI's is; and while it may be dismissed its dialog is dragged toward its
    edge, from anywhere on it but a button, a field, a link or its body, and
    closes past a third of its size or at a flick, sliding on out from where it
    was let go, else springs back, as HeroUI's does.

    A part but the backdrop is used inside a [Drawer.Backdrop]: elsewhere it
    raises [Invalid_argument] as it is made. *)

(** A button that opens it, as HeroUI's is: Kobalte's trigger, a [<button>],
    hovered, pressed and focused as React Aria's is, and pressed while the
    drawer is open. A {!Button} inside a drawer opens it too. *)
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

(** What covers the page while the drawer is open: a [<div>], [opaque] by
    default. A press on it, and a drag, close the drawer while [is_dismissable],
    and Escape while not [is_keyboard_dismiss_disabled]. With no {!Drawer}
    around it, [is_open], [default_open] and [on_open_change] are its own. *)
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

(** Where the drawer is: a [<div>] at the edge [placement] names, [`bottom] by
    default. *)
module Content : sig
  module Props : sig
    type t

    val check :
      ?placement:[ `top | `bottom | `left | `right ] Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The drawer: Kobalte's content, a [<section>] its {!Heading} names, which
    takes the focus as it opens and is dragged toward its edge. *)
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

(** Its top: a [<div>]. *)
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

(** What it holds: a [<div>], which scrolls, and from which no drag starts. *)
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

(** Its actions: a [<div>]. *)
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

(** Its title, which names it: Kobalte's title, an [<h2>]. *)
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

(** HeroUI's bar that shows the drawer can be dragged: a [<div>] hidden from a
    reader. *)
module Handle : sig
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

(** HeroUI's close button in its corner, which closes it. *)
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
