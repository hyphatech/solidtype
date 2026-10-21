(* HeroUI's components in React, from react/heroui.tsx, rendered into a host. *)

external unmount : Dom.htmlDivElement -> unit = "unmount"
[@@mel.module "./react/heroui.tsx"]

type button_props

external button_props :
  variant:string ->
  size:string ->
  full_width:(bool[@mel.as "fullWidth"]) ->
  is_icon_only:(bool[@mel.as "isIconOnly"]) ->
  is_disabled:(bool[@mel.as "isDisabled"]) ->
  label:string ->
  unit ->
  button_props = ""
[@@mel.obj]

external button : Dom.htmlDivElement -> button_props -> unit = "button"
[@@mel.module "./react/heroui.tsx"]

type separator_props

external separator_props :
  orientation:string ->
  variant:string ->
  class_name:(string[@mel.as "className"]) ->
  unit ->
  separator_props = ""
[@@mel.obj]

external separator : Dom.htmlDivElement -> separator_props -> unit = "separator"
[@@mel.module "./react/heroui.tsx"]

type badge_props

external badge_props :
  color:string ->
  placement:string ->
  size:string ->
  variant:string ->
  label:string ->
  unit ->
  badge_props = ""
[@@mel.obj]

external badge : Dom.htmlDivElement -> badge_props -> unit = "badge"
[@@mel.module "./react/heroui.tsx"]

type chip_props

external chip_props :
  color:string ->
  size:string ->
  variant:string ->
  label:string ->
  unit ->
  chip_props = ""
[@@mel.obj]

external chip : Dom.htmlDivElement -> chip_props -> unit = "chip"
[@@mel.module "./react/heroui.tsx"]

type link_props

external link_props :
  is_disabled:(bool[@mel.as "isDisabled"]) ->
  icon:bool ->
  label:string ->
  unit ->
  link_props = ""
[@@mel.obj]

external link : Dom.htmlDivElement -> link_props -> unit = "link"
[@@mel.module "./react/heroui.tsx"]

type switch_props

external switch_props :
  size:string ->
  is_disabled:(bool[@mel.as "isDisabled"]) ->
  label:string ->
  unit ->
  switch_props = ""
[@@mel.obj]

external switch_ : Dom.htmlDivElement -> switch_props -> unit = "switch_"
[@@mel.module "./react/heroui.tsx"]
