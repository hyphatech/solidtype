module Props = struct
  let check ?mount:(_ : Dom.element Check.value option)
      ?use_shadow:(_ : bool Check.value option)
      ?is_svg:(_ : bool Check.value option)
      ?ref:(_ : (Dom.element -> unit) option)
      ?children:(_ : (_, [ `nodes ]) Check.children option) () =
    ()
end

external component : unit Jsx.component = "Portal" [@@mel.module "solid-js/web"]
