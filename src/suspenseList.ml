(* Melange writes a polymorphic variant's tag as its name, the string Solid
   reads. *)
module Props = struct
  let check
      ~reveal_order:(_ : [ `forwards | `backwards | `together ] Check.value)
      ?tail:(_ : [ `collapsed | `hidden ] Check.value option)
      ?children:(_ : (_, [ `nodes ]) Check.children option) () =
    ()
end

external component : unit Jsx.component = "SuspenseList"
[@@mel.module "solid-js"]
