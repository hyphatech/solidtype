module Props = struct
  let check ~each:(_ : 'a array Check.value)
      ?fallback:(_ : Jsx.element Check.value option)
      ~children:
        (_ :
          ('a -> int Solid.accessor -> Jsx.element, [ `render ]) Check.children)
      () =
    ()
end

external component : unit Jsx.component = "For" [@@mel.module "solid-js"]
