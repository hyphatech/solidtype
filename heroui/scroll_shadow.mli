(** HeroUI's ScrollShadow: a [<div>] that scrolls, with HeroUI's classes from
    {!Styles.ScrollShadow}, faded at each edge it hides content at. It measures
    itself as it scrolls, as it is resized and as its content changes, and
    declares each edge as HeroUI's hook writes it -- [data-top-scroll] and
    [data-bottom-scroll], ["true"] or ["false"], or [data-top-bottom-scroll]
    where content is hidden at both -- or the edges its [visibility] gives.

    {[
      <Scroll_shadow class_="max-h-[300px]">(fun () -> long_text ())</Scroll_shadow>
    ]}

    It is measured once it is in the browser, never on the server, so a
    prerendered shadow marks no edge until it is. Kobalte has no scroll shadow.
*)

type edge = [ `top | `bottom | `left | `right | `both | `none ]
(** The edges content is hidden at: [`both] those of its orientation. *)

module Props : sig
  type t

  val check :
    ?orientation:[ `vertical | `horizontal ] Solidtype.Check.value ->
    ?visibility:
      [ `auto | `top | `bottom | `left | `right | `both | `none ]
      Solidtype.Check.value ->
    ?on_visibility_change:(edge -> unit) ->
    ?is_enabled:bool Solidtype.Check.value ->
    ?hide_scroll_bar:bool Solidtype.Check.value ->
    ?size:int Solidtype.Check.value ->
    ?offset:int Solidtype.Check.value ->
    ?variant:[ `fade ] Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    children:(_, [ `nodes ]) Solidtype.Check.children ->
    ?props:t Solidtype.Solid.rest ->
    unit ->
    unit
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
