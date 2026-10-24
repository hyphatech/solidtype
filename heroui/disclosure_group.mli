(** HeroUI's DisclosureGroup: the {!Disclosure}s inside it, each by its [id],
    expanded as the group keeps them, with HeroUI's classes from
    {!Styles.DisclosureGroup}. A [<div>].

    {[
      <Disclosure_group default_expanded_keys=[| "shipping" |]>
        <Disclosure id="shipping">...</Disclosure>
        <Disclosure id="returns">...</Disclosure>
      </Disclosure_group>
    ]}

    [expanded_keys] are the expanded disclosures' ids while it is given, else
    those kept, [default_expanded_keys] at first; a change calls
    [on_expanded_change] with them all. One is expanded at a time, expanding
    another collapsing it, unless [allows_multiple_expanded]. [is_disabled]
    disables every disclosure inside it. A disclosure in a group is expanded as
    the group holds its [id], one made for it where it has none, and its own
    [is_expanded] and [default_expanded] are not read there; its
    [on_expanded_change] is still called. *)

type group = {
  is_expanded : string -> bool;
      (** Whether the disclosure of a key is expanded, read where it is shown.
      *)
  toggle : string -> unit;  (** Expands or collapses the disclosure of a key. *)
  is_disabled : unit -> bool;
}
(** What a group gives its disclosures. *)

module Context : sig
  module Provider : sig
    module Props : sig
      val check :
        value:group Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children ->
        unit ->
        unit
    end

    val component : unit Solidtype.Jsx.component
  end

  val use : unit -> group option
end

type navigation = {
  current_index : unit -> int;
      (** The index in [item_ids] of the first expanded disclosure, else 0; -1
          while there are none. *)
  is_prev_disabled : unit -> bool;
      (** Whether no disclosure comes before the one expanded. *)
  is_next_disabled : unit -> bool;
      (** Whether no disclosure comes after the one expanded. *)
  on_previous : unit -> unit;
      (** Expands the disclosure before, alone, or beside those expanded. *)
  on_next : unit -> unit;
      (** Expands the disclosure after, alone, or beside those expanded. *)
}
(** Previous and next buttons over a group's disclosures. *)

val navigation :
  ?allows_multiple_expanded:bool ->
  expanded_keys:(unit -> string array) ->
  item_ids:string array ->
  on_expanded_change:(string array -> unit) ->
  unit ->
  navigation
(** HeroUI's [useDisclosureGroupNavigation]: the disclosures of [item_ids], in
    their order, stepped through by the expanded keys, which it reads while they
    change and sets by [on_expanded_change]. Where several may be expanded,
    [allows_multiple_expanded], next expands the one after the last expanded and
    previous the one before the first, so each press reaches another. *)

module Props : sig
  type t

  val check :
    ?expanded_keys:string array Solidtype.Check.value ->
    ?default_expanded_keys:string array Solidtype.Check.value ->
    ?on_expanded_change:(string array -> unit) ->
    ?allows_multiple_expanded:bool Solidtype.Check.value ->
    ?is_disabled:bool Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
