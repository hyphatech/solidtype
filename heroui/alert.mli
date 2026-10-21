(** HeroUI's Alert: a [<div>] that shows a message, with HeroUI's classes from
    {!Styles.Alert}, its {!Indicator} drawing its status's icon, and its
    {!Content}'s {!Title} and {!Description}. It is a default surface to what is
    inside it, as HeroUI's is.

    {[
      <Alert status=`success>
        <Alert.Indicator />
        <Alert.Content>
          <Alert.Title>"Saved"</Alert.Title>
          <Alert.Description>"Your changes are saved."</Alert.Description>
        </Alert.Content>
      </Alert>
    ]}

    It has no role, as HeroUI's has none: Kobalte's Alert is [role="alert"],
    which a reader announces as it appears; an alert that should be announced is
    given the role, [role=`alert], as HeroUI's documentation says. A part is
    used inside an [Alert]: elsewhere it raises [Invalid_argument] as it is
    made. *)

type status = [ `default | `accent | `success | `warning | `danger ]

(** The status's icon -- HeroUI's info, success, warning or danger -- or the
    children it is given: a [<div>]. *)
module Indicator : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      ?children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The title and description: a [<div>]. *)
module Content : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The message's title: a [<p>]. *)
module Title : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

(** The message: a [<span>]. *)
module Description : sig
  module Props : sig
    type t

    val check :
      ?class_:string Solidtype.Check.value ->
      children:(_, [ `nodes ]) Solidtype.Check.children ->
      ?props:t ->
      unit ->
      unit
  end

  val make : Props.t -> Solidtype.Jsx.element
  val component : Props.t Solidtype.Jsx.component
end

module Props : sig
  type t

  val check :
    ?status:status Solidtype.Check.value ->
    ?role:Solidtype.Html.Div.role Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
