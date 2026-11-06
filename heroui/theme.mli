(** HeroUI's [useTheme]: which theme a page shows, kept across visits, and
    written on its [<html>] as the class and [data-theme] HeroUI's themes read.

    {[
      let t = Theme.use () in
      <button on_click=(fun _ -> t.set_theme "dark")>
        (fun () -> Solidtype.Jsx.string (S.get t.theme))
      </button>
    ]}

    An application calls it once, in a component, since the state is [<html>]'s
    and each call writes it. Stored under ["heroui-theme"], as HeroUI's is, so a
    page moved from React keeps its visitor's choice. Where it differs from
    HeroUI's: the stored theme is read once the page is mounted, so a
    prerendered page hydrates, and a browser's refusal of storage leaves the
    choice for as long as the page lasts, where HeroUI's throws. *)

type t = {
  theme : string Solidtype.Solid.accessor;
      (** What was chosen: ["system"], ["light"], ["dark"] or a theme of the
          application's own. *)
  resolved : string option Solidtype.Solid.accessor;
      (** What [<html>] shows: the system's while ["system"] is chosen, and
          [None] until that is known, on the server. *)
  set_theme : string -> unit;
      (** Chooses a theme, keeps it, and writes it on [<html>]. *)
}

val use : ?default:string -> unit -> t
(** [use ?default ()] is the theme, ["system"] unless the visitor chose another
    or [default] names it. *)
