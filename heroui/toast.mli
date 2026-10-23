(** HeroUI's Toast: brief messages shown in a stack, on Kobalte's toast region,
    its list and its toasts, with HeroUI's classes from {!Styles.Toast}. A
    {!Provider}, rendered once at the root of the page, shows the toasts a queue
    holds; {!show} and its kin add, change and close them, from anywhere.

    {[
      <Toast.Provider />
      ...
      let key = Toast.show ~description:"Your event is set" "Event created" in
      Toast.update key ~variant:`success "Event saved"
    ]}

    The stack is HeroUI's: the newest toast in front, those behind it smaller
    and offset, at most [max_visible_toasts] of them shown, and all of them laid
    out apart while the stack is hovered or holds the focus, which also pauses
    every toast's countdown, as does the page while it is hidden. Alt and T, its
    [hotkey], moves the focus to it; Escape folds it. A toast closing stays for
    its exit, [data-exiting], before it is gone. *)

type key
(** A toast, as its queue knows it. *)

type variant = [ `default | `accent | `success | `warning | `danger ]

type indicator =
  | Variant_icon  (** The variant's own icon, HeroUI's. *)
  | Icon of Solidtype.Jsx.element  (** An icon of the caller's. *)
  | No_icon  (** None at all. *)

type action
(** A button a toast offers, beside its text. *)

val action :
  ?variant:
    [ `primary
    | `secondary
    | `tertiary
    | `outline
    | `ghost
    | `danger
    | `danger_soft ] ->
  on_press:(unit -> unit) ->
  string ->
  action
(** [action ~on_press label] is a button labelled [label] that calls [on_press],
    [`tertiary] unless [variant] says otherwise. *)

(** Toasts, held in order, the newest first, each until it is closed. *)
module Queue : sig
  type t

  val create : ?max_visible_toasts:int -> ?exit_duration_ms:float -> unit -> t
  (** A queue of its own, for a {!Provider} given it: at most
      [max_visible_toasts] shown, 3 by default, each closing toast kept for
      [exit_duration_ms], 300 by default, as its exit plays. *)

  val default : unit -> t
  (** The queue {!show} and every {!Provider} use unless given another, made the
      first time it is asked for. *)
end

val show :
  ?queue:Queue.t ->
  ?description:string ->
  ?variant:variant ->
  ?indicator:indicator ->
  ?action:action ->
  ?is_loading:bool ->
  ?timeout_ms:float ->
  ?on_close:(unit -> unit) ->
  string ->
  key
(** [show title] adds a toast titled [title] to [queue] and is its key. It
    closes itself after [timeout_ms], 4000 by default, or stays while that is
    [0.]; [on_close] is called as it begins to close. While [is_loading], its
    indicator is a spinner. *)

val success :
  ?queue:Queue.t ->
  ?description:string ->
  ?indicator:indicator ->
  ?action:action ->
  ?timeout_ms:float ->
  ?on_close:(unit -> unit) ->
  string ->
  key
(** {!show} of the [`success] variant. *)

val info :
  ?queue:Queue.t ->
  ?description:string ->
  ?indicator:indicator ->
  ?action:action ->
  ?timeout_ms:float ->
  ?on_close:(unit -> unit) ->
  string ->
  key
(** {!show} of the [`accent] variant, as HeroUI's [toast.info]. *)

val warning :
  ?queue:Queue.t ->
  ?description:string ->
  ?indicator:indicator ->
  ?action:action ->
  ?timeout_ms:float ->
  ?on_close:(unit -> unit) ->
  string ->
  key

val danger :
  ?queue:Queue.t ->
  ?description:string ->
  ?indicator:indicator ->
  ?action:action ->
  ?timeout_ms:float ->
  ?on_close:(unit -> unit) ->
  string ->
  key

val update :
  ?queue:Queue.t ->
  ?description:string ->
  ?variant:variant ->
  ?indicator:indicator ->
  ?action:action ->
  ?is_loading:bool ->
  ?timeout_ms:float ->
  ?on_close:(unit -> unit) ->
  key ->
  string ->
  key
(** [update key title] changes the toast in place, keeping its place in the
    stack, and is its key; what it does not name stays as it was, and a
    [timeout_ms] given starts its countdown anew. A toast already closed is
    shown again, as {!show} would, under a new key. *)

val promise :
  ?queue:Queue.t ->
  'a Js.Promise.t ->
  loading:string ->
  success:('a -> string) ->
  error:(Js.Promise.error -> string) ->
  key
(** [promise p ~loading ~success ~error] shows [loading] with a spinner, kept
    open, and changes it in place as [p] settles: to [success] of its value, a
    [`success] toast, or to [error] of why it failed, a [`danger] one, each then
    closing itself after 4000 ms. *)

val close : ?queue:Queue.t -> key -> unit
(** Closes the toast, its exit played, [on_close] called as it begins. *)

val clear : ?queue:Queue.t -> unit -> unit
(** Closes every toast. *)

val pause_all : ?queue:Queue.t -> unit -> unit
(** Holds every toast's countdown until {!resume_all}. *)

val resume_all : ?queue:Queue.t -> unit -> unit

type queued
(** A toast as a {!Provider}'s render function is given it. *)

val key : queued -> key
val title : queued -> string
val description : queued -> string option
val toast_variant : queued -> variant
val is_loading : queued -> bool

(** A toast's icon: the variant's own, HeroUI's, or its [children]. *)
module Indicator : sig
  module Props : sig
    type t

    val check :
      ?variant:variant Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** What holds a toast's title and description. *)
module Content : sig
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

(** A toast's title, Kobalte's, which names it. *)
module Title : sig
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

(** A toast's description, Kobalte's, which describes it. *)
module Description : sig
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

(** The button a toast offers, HeroUI's {!Button}, small. *)
module Action_button : sig
  module Props : sig
    type t

    val check :
      ?variant:
        [ `primary
        | `secondary
        | `tertiary
        | `outline
        | `ghost
        | `danger
        | `danger_soft ]
        Solidtype.Check.value ->
      ?on_press:(unit -> unit) ->
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** HeroUI's {!Close_button}, which closes the toast its [key] names. *)
module Close_button : sig
  module Props : sig
    type t

    val check :
      ?key:key Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** A toast of a {!Provider}'s stack, Kobalte's, given the toast its render
    function was given: its place in the stack and its state, as HeroUI's styles
    lay it out. *)
module Props : sig
  type t

  val check :
    toast:queued Solidtype.Check.value ->
    ?variant:variant Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component

(** The region the toasts are shown in, Kobalte's, with its list: render it
    once, at the root of the page. Its [children], given each toast, render it,
    HeroUI's own toast by default. *)
module Provider : sig
  module Props : sig
    type t

    val check :
      ?placement:
        [ `top_start | `top | `top_end | `bottom_start | `bottom | `bottom_end ]
        Solidtype.Check.value ->
      ?gap:float Solidtype.Check.value ->
      ?is_expanded:bool Solidtype.Check.value ->
      ?max_visible_toasts:int Solidtype.Check.value ->
      ?hotkey:string array Solidtype.Check.value ->
      ?scale_factor:float Solidtype.Check.value ->
      ?width:string Solidtype.Check.value ->
      ?queue:Queue.t Solidtype.Check.value ->
      ?class_:string Solidtype.Check.value ->
      ?children:
        (queued -> Solidtype.Jsx.element, [ `render ]) Solidtype.Check.children ->
      ?props:t Solidtype.Solid.rest ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end
