(** What HeroUI's dialogs share -- {!Modal}, {!Alert_dialog} -- on Kobalte's
    [Dialog]: each port's parts are its own components, with its own classes,
    names and defaults, and call these for what they do alike.

    A dialog's root is Kobalte's, modal, and gives any {!Button} below it
    Kobalte's trigger, shown pressed while the dialog is open. Its backdrop is
    drawn in a portal while the dialog is open and while HeroUI's exit animation
    plays after, and is a dialog of its own where no root is above it. Its
    dialog is Kobalte's content as the [<section>] React Aria's is: it takes the
    focus as it opens and gives it back as it closes, keeps it while a press on
    a backdrop that stays leaves it nowhere, starts with a dismiss button only a
    reader finds while it may be dismissed, and gives a {!Button} with
    [slot=`close] inside it what closes it.

    Each function takes its element's [data-slot], its classes, and the rest of
    its component's props, and is called from that component. *)

type t
(** A backdrop, as its parts read it. *)

val within : string -> backdrop:string -> t
(** [within part ~backdrop] is the backdrop [part] is inside.
    @raise Invalid_argument
      where it is inside none, naming [part] and its [backdrop]. *)

val close : t -> unit
(** Closes the dialog. *)

val overlay : t -> Overlay.t
(** Its presence. *)

val root :
  is_open:(unit -> bool option) ->
  default_open:(unit -> bool option) ->
  on_open_change:(bool -> unit) ->
  (unit -> Solidtype.Jsx.content) ->
  Solidtype.Jsx.element

val trigger :
  slot:string ->
  class_:(unit -> string) ->
  aria_label:(unit -> string option) ->
  others:_ Solidtype.Solid.rest ->
  (unit -> Solidtype.Jsx.content) ->
  Solidtype.Jsx.element
(** Kobalte's trigger as the [<div role="button">] HeroUI's is, reached by Tab,
    so a button inside it is not a button inside a button. *)

val backdrop :
  slot:string ->
  class_:(unit -> string) ->
  dismissable:(unit -> bool) ->
  keyboard_dismissable:(unit -> bool) ->
  is_open:(unit -> bool option) ->
  default_open:(unit -> bool option) ->
  on_open_change:(bool -> unit) ->
  others:_ Solidtype.Solid.rest ->
  (unit -> Solidtype.Jsx.content) ->
  Solidtype.Jsx.element
(** A press on it closes the dialog while [dismissable], and Escape while
    [keyboard_dismissable]; [is_open], [default_open] and [on_open_change] are
    its own where no root is above it. *)

val container :
  t ->
  slot:string ->
  class_:(unit -> string) ->
  placement:(unit -> string) ->
  others:_ Solidtype.Solid.rest ->
  (unit -> Solidtype.Jsx.content) ->
  Solidtype.Jsx.element
(** A [<div>] that enters and exits with the backdrop. *)

val dialog :
  t ->
  slot:string ->
  role:Solidtype.Html.Section.role ->
  class_:(unit -> string) ->
  placement:(unit -> string) ->
  others:_ Solidtype.Solid.rest ->
  (unit -> Solidtype.Jsx.content) ->
  Solidtype.Jsx.element

val heading :
  slot:string ->
  class_:(unit -> string) ->
  others:_ Solidtype.Solid.rest ->
  (unit -> Solidtype.Jsx.content) ->
  Solidtype.Jsx.element
(** Kobalte's title, an [<h2>], which names the dialog. *)

val close_trigger :
  t ->
  slot:string ->
  class_:(unit -> string) ->
  others:Close_button.Props.t Solidtype.Solid.rest ->
  Solidtype.Jsx.element
(** HeroUI's close button, which closes the dialog. *)
