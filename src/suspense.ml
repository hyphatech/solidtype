module Props = struct
  let check ?fallback:(_ : Jsx.element Check.value option)
      ?children:(_ : (_, [ `elements ]) Check.children option) () =
    ()
end

external component : unit Jsx.component = "Suspense" [@@mel.module "solid-js"]
