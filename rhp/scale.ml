type tick = {
  at : float;
  next : float;
  first : bool;
  last : bool;
  to_end : float; [@mel.as "toEnd"]
}

module Props = struct
  external check :
    ?ticks:Ticks.t Solidtype.Check.value ->
    ?class_:string Solidtype.Check.value ->
    ?style:string Js.Dict.t Solidtype.Check.value ->
    children:(tick Slat.t, [ `render ]) Solidtype.Check.children ->
    unit ->
    unit = "check"
  [@@mel.module "vite-plugin-solidtype/markers"]
end

external component : unit Solidtype.Jsx.component = "Scale"
[@@mel.module "@bezda/rhp"]
