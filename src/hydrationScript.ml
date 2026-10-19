module Props = struct
  let check ?nonce:(_ : string Check.value option)
      ?event_names:(_ : string array Check.value option) () =
    ()
end

external component : unit Jsx.component = "HydrationScript"
[@@mel.module "solid-js/web"]
