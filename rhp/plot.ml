module Props = struct
  external check :
    rows:'row array Solidtype.Check.value ->
    ?reorder:[ `slide | `move | `refill ] Solidtype.Check.value ->
    ?orientation:[ `horizontal | `vertical | `across ] Solidtype.Check.value ->
    ?overlap:bool Solidtype.Check.value ->
    ?slats:float Solidtype.Check.value ->
    ?key:('row Row.t -> 'key) ->
    ?animate:(bool, Types.Timing.t) Types.Either.t Solidtype.Check.value ->
    ?thick:(string, float) Types.Either.t Solidtype.Check.value ->
    ?static:bool Solidtype.Check.value ->
    ?keyboard:bool Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?style:string Solidtype.Check.value ->
    ?ref:(Dom.htmlDivElement -> unit) ->
    children:('row Slat.t, [ `render ]) Solidtype.Check.children ->
    unit ->
    unit = "check"
  [@@mel.module "vite-plugin-solidtype/markers"]
end

external component : unit Solidtype.Jsx.component = "Plot"
[@@mel.module "@bezda/rhp"]
