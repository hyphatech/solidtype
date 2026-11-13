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
    its component's props, and is called from that component. A [style], a [ref]
    or a handler it takes is the caller's, given beside the port's own: a
    handler and a [ref] are called before the port's, and a style's declarations
    follow the port's. *)

module S := Solidtype.Solid
module Jsx := Solidtype.Jsx

type t
(** A backdrop, as its parts read it. *)

val within : string -> backdrop:string -> t
(** [within part ~backdrop] is the backdrop [part] is inside. Raises
    [Invalid_argument] where it is inside none, naming [part] and its
    [backdrop]. *)

val close : t -> unit
(** Closes the dialog. *)

val overlay : t -> Overlay.t
(** Its presence. *)

val dismissable : t -> bool
(** Whether a press outside closes it, as its backdrop says. *)

type overlay_state = {
  is_entering : bool S.accessor;
  is_exiting : bool S.accessor;
}
(** What a backdrop's and a container's children are drawn of, given as a
    function, as HeroUI's render props are: whether it is entering or exiting,
    as its styles animate it. *)

type dialog_state = { close : unit -> unit }
(** What a dialog's children are drawn of, given as a function, as HeroUI's
    render props are: what closes it. *)

val root :
  is_open:(unit -> bool option) ->
  default_open:(unit -> bool option) ->
  on_open_change:(bool -> unit) ->
  (unit -> Jsx.content) ->
  Jsx.element

val trigger :
  slot:string ->
  class_:(unit -> string) ->
  aria_label:(unit -> string option) ->
  others:_ S.rest ->
  (unit -> Jsx.content) ->
  Jsx.element
(** Kobalte's trigger as the [<div role="button">] HeroUI's is, reached by Tab,
    so a button inside it is not a button inside a button. *)

val backdrop :
  slot:string ->
  portal_container:(unit -> _ Dom.element_like option) ->
  class_:(unit -> string) ->
  style:(unit -> string option) ->
  ref:(Dom.htmlDivElement -> unit option) ->
  dismissable:(unit -> bool) ->
  keyboard_dismissable:(unit -> bool) ->
  is_open:(unit -> bool option) ->
  default_open:(unit -> bool option) ->
  on_open_change:(bool -> unit) ->
  as_:
    (unit -> (Solidtype.Html.Div.props -> overlay_state -> Jsx.element) option) ->
  others:_ S.rest ->
  (overlay_state -> Jsx.content) ->
  Jsx.element
(** A press on it closes the dialog while [dismissable], and Escape while
    [keyboard_dismissable]; [is_open], [default_open] and [on_open_change] are
    its own where no root is above it. It is drawn at the end of the page's
    body, or inside [portal_container] while that gives an element. *)

val container :
  t ->
  slot:string ->
  class_:(unit -> string) ->
  placement:(unit -> string) ->
  ref:(Dom.htmlDivElement -> unit option) ->
  as_:
    (unit -> (Solidtype.Html.Div.props -> overlay_state -> Jsx.element) option) ->
  others:_ S.rest ->
  (overlay_state -> Jsx.content) ->
  Jsx.element
(** A [<div>] that enters and exits with the backdrop. *)

val dialog :
  ?on_element:(Dom.element -> unit) ->
  t ->
  slot:string ->
  role:Solidtype.Html.Section.role ->
  class_:(unit -> string) ->
  placement:(unit -> string) ->
  ref:(Dom.htmlElement -> unit option) ->
  on_focus_out:(Dom.focusEvent -> unit option) ->
  as_:
    (unit ->
    (Solidtype.Html.Section.props -> dialog_state -> Jsx.element) option) ->
  others:_ S.rest ->
  (dialog_state -> Jsx.content) ->
  Jsx.element
(** [on_element] is given the dialog's element as it is made, for a part that
    does more with it, as a drawer is dragged. *)

val heading :
  slot:string ->
  class_:(unit -> string) ->
  others:_ S.rest ->
  (unit -> Jsx.content) ->
  Jsx.element
(** Kobalte's title, an [<h2>], which names the dialog. *)

val close_trigger :
  t ->
  slot:string ->
  class_:(unit -> string) ->
  on_click:(Dom.mouseEvent -> unit option) ->
  as_:
    (unit ->
    (Solidtype.Html.Button.props -> Close_button.state -> Jsx.element) option) ->
  others:Close_button.Props.t S.rest ->
  children:(unit -> Close_button.state Jsx.children option) ->
  Jsx.element
(** HeroUI's close button, which closes the dialog: HeroUI's cross, or the
    children it is given. *)
