type descriptor

external descriptor :
  get:((unit -> 'f option)[@u]) ->
  enumerable:bool ->
  configurable:bool ->
  descriptor = ""
[@@mel.obj]

external define : 'props -> string -> descriptor -> unit = "defineProperty"
[@@mel.scope "Object"]

external no_props : unit -> 'props = "" [@@mel.obj]

(* The prop as its caller gave it. Its type is the one the component's check
   held it to, which only the binding that adapts it knows, and names. *)
external given : 'props -> string -> 'f option = "" [@@mel.get_index]

external create : 'props Jsx.component -> 'props -> Jsx.element
  = "createComponent"
[@@mel.module "solid-js"]

let adapted name at_arity component =
  Jsx.component (fun props ->
      let over = no_props () in
      define over name
        (descriptor
           ~get:(fun[@u] () -> Option.map at_arity (given props name))
           ~enumerable:true ~configurable:true);
      create component (Solid.merge_props [| props; over |]))

let of2 name component =
  adapted name (fun (f : 'a -> 'b -> 'c) -> fun[@u] a b -> f a b) component

let of3 name component =
  adapted name
    (fun (f : 'a -> 'b -> 'c -> 'd) -> fun[@u] a b c -> f a b c)
    component
