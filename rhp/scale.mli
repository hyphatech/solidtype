(** A scale drawn as a plot of its ticks: a slat for each tick, which draws the
    axis from blocks, a [Tick] and a [Label] at the tick's value.

    Ported by hand: its slat is a function of rhp's row of a tick, which no rule
    maps; here the tick is a record. *)

type tick = {
  at : float;  (** The tick's value. *)
  next : float;  (** The next tick's value, the scale's maximum for the last. *)
  first : bool;
  last : bool;
  to_end : float; [@mel.as "toEnd"]
      (** px from the tick to the end of the scale, once measured in the
          browser, [infinity] before. *)
}

module Props : sig
  external check :
    ?ticks:Ticks.t Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?style:string Js.Dict.t Solidtype.Check.value ->
    children:(tick Slat.t, [ `render ]) Solidtype.Check.children ->
    unit ->
    unit = "check"
  [@@mel.module "vite-plugin-solidtype/markers"]
  (** [ticks], the chart's by default; the slat, a [Slat.t] of a tick, given as
      [render=f] or a function child. *)
end

external component : unit Solidtype.Jsx.component = "Scale"
[@@mel.module "@bezda/rhp"]
