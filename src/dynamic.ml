module Props = struct
  let check ~component:(_ : 'props Jsx.component Check.value)
      ~props:(_ : 'props) () =
    ()
end

external component : unit Jsx.component = "Dynamic"
[@@mel.module "solid-js/web"]

module Element = struct
  module Props = struct
    (* Every attribute an HTML element takes is a label here, too many to
       write by hand: the check is an external, as a generated part's is,
       which nothing calls, since the ppx applies it under [if false]. *)
    external check :
      component:string Check.value ->
      (?children:('f, [ `nodes ]) Check.children -> unit -> unit)
      Html.Element.check = "check"
    [@@mel.module "vite-plugin-solidtype/markers"]
  end

  external component : unit Jsx.component = "Dynamic"
  [@@mel.module "solid-js/web"]
end

external create_dynamic :
  ((unit -> 'props Jsx.component)[@mel.uncurry]) -> 'props -> Jsx.element
  = "createDynamic"
[@@mel.module "solid-js/web"]
