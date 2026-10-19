(** Solid's stores, [solid-js/store]: state whose every field is tracked on its
    own.

    A store's state is an OCaml record, which Melange writes as an object with
    its field names: [store.count] is a read Solid tracks. A copy made by a
    functional update, [{ store with count = 1 }], is a plain object no longer
    tracked; a change goes through the setter. Solid's path setter is not bound,
    since OCaml cannot type it: a change is a whole value, a {!produce} over a
    mutable draft, or a {!reconcile}. *)

type 's setter

val create_store : ?name:string -> 's -> 's * 's setter

val set : 's setter -> 's -> unit
(** Merges the value's fields into the store's, as Solid's setter does. *)

type 's modifier
(** A change to a whole store: {!produce} or {!reconcile}. *)

val produce : ('s -> unit) -> 's modifier
(** [produce f] changes the store by [f draft], where [draft]'s mutable fields
    are assigned in place. *)

val reconcile : ?key:string -> ?merge:bool -> 's -> 's modifier
(** Changes the store to the value, keeping every part that is equal, so only
    what differs notifies. Arrays' items are matched by their [key] field,
    ["id"] by default. *)

val modify : 's setter -> 's modifier -> unit

val create_mutable : ?name:string -> 's -> 's
(** A store whose mutable fields are assigned in place, each assignment a
    change. *)

val modify_mutable : 's -> 's modifier -> unit

val unwrap : 's -> 's
(** The plain object under a store, untracked. *)

val track : 's -> unit
(** Reads every field of the store, so the computation that calls it reruns on
    any change. *)
