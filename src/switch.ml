module Props = struct
  let check ?fallback:(_ : Jsx.element Check.value option)
      ?children:(_ : (_, [ `nodes ]) Check.children option) () =
    ()
end

external component : unit Jsx.component = "Switch" [@@mel.module "solid-js"]
