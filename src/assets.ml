module Props = struct
  let check ?children:(_ : (_, [ `elements ]) Check.children option) () = ()
end

external component : unit Jsx.component = "Assets" [@@mel.module "solid-js/web"]
