(* The Iconify icons HeroUI's examples draw by name, `tabler:brand-apple-filled`,
   each a component from the @iconify-icons module of its set, named by set and
   icon. *)

module Tabler_brand_apple_filled = Icon.Iconify (struct
  external data : Icon.iconify = "default"
  [@@mel.module "@iconify-icons/tabler/brand-apple-filled"]
end)

module Logos_expo_icon = Icon.Iconify (struct
  external data : Icon.iconify = "default"
  [@@mel.module "@iconify-icons/logos/expo-icon"]
end)
