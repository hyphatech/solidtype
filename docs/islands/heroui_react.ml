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
