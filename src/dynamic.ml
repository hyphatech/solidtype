module Props = struct
  let check ~component:(_ : 'props Jsx.component Check.value)
      ?props:(_ : 'props option) () =
    ()
end

external component : unit Jsx.component = "Dynamic"
[@@mel.module "solid-js/web"]

module Element = struct
  module Props = struct
    let check ~component:(_ : string Check.value) ?props:(_ : 'a option)
        ?children:(_ : (_, [ `nodes ]) Check.children option) () =
      ()
  end

  external component : unit Jsx.component = "Dynamic"
  [@@mel.module "solid-js/web"]
end

external create_dynamic :
  ((unit -> 'props Jsx.component)[@mel.uncurry]) -> 'props -> Jsx.element
  = "createDynamic"
[@@mel.module "solid-js/web"]
