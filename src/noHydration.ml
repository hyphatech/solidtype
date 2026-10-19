module Props = struct
  let check ?children:(_ : (_, [ `nodes ]) Check.children option) () = ()
end

external component : unit Jsx.component = "NoHydration"
[@@mel.module "solid-js/web"]
