module Props = struct
  let check ~each:(_ : 'a array Check.value)
      ?fallback:(_ : Jsx.element Check.value option)
      ~children:
        (_ :
          ('a Solid.accessor -> int -> Jsx.element, [ `render ]) Check.children)
      () =
    ()
end

external component : unit Jsx.component = "Index" [@@mel.module "solid-js"]
