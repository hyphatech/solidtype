(** What asks a list for more as its end comes into view, as React Aria's
    [useLoadMoreSentinel] does: a [<div>] placed after a list's last entry,
    which calls [on_load_more] as it comes within [scroll_offset] heights of the
    view of what scrolls it, 1 by default, and again as loading ends with it
    still in view; never while [is_loading]. What scrolls it is the nearest
    element above it that scrolls its content, else the page. It draws no style,
    and takes every attribute a [<div>] does: a list places it by its [style].

    {[
      <Load_more_sentinel
        is_loading=(fun () -> S.get loading)
        on_load_more=load
        style="position: relative; height: 1px; width: 1px;"
      />
    ]} *)

module Props : sig
  type t

  val check :
    ?is_loading:bool Solidtype.Check.value ->
    ?on_load_more:(unit -> unit) ->
    ?scroll_offset:float Solidtype.Check.value ->
    ?props:'spread Solidtype.Solid.rest ->
    (unit -> unit) Solidtype.Html.Div.check
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
