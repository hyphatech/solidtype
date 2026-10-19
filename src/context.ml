type 'a context

external create : 'a -> 'a context = "createContext" [@@mel.module "solid-js"]

external create_empty : unit -> 'a option context = "createContext"
[@@mel.module "solid-js"]

external provider : 'a context -> unit Jsx.component = "Provider" [@@mel.get]
external use : 'a context -> 'a = "useContext" [@@mel.module "solid-js"]

module type Value = sig
  type t

  val default : t
end

module Make (V : Value) = struct
  let context = create V.default

  module Provider = struct
    module Props = struct
      let check ~value:(_ : V.t Check.value)
          ?children:(_ : (_, [ `nodes ]) Check.children option) () =
        ()
    end

    let component = provider context
  end

  let use () = use context
end

module Make_optional (V : sig
  type t
end) =
struct
  let context : V.t option context = create_empty ()

  module Provider = struct
    module Props = struct
      let check ~value:(_ : V.t Check.value)
          ?children:(_ : (_, [ `nodes ]) Check.children option) () =
        ()
    end

    let component = provider context
  end

  (* A provider's value [v] is read back as [Some v], which Melange writes as
     [v]; no provider reads as [undefined], which is [None]. *)
  let use () = use context
end
