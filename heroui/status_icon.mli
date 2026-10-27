(** HeroUI's icon for each status -- info for the default and accent, success,
    warning, danger -- as an alert, a toast and an alert dialog draw it. *)

type status = [ `default | `accent | `success | `warning | `danger ]

val svg : slot:string -> (unit -> status) -> Solidtype.Jsx.element
(** [svg ~slot status] is the icon of [status ()], hidden from a reader, its
    [data-slot] [slot]. *)
