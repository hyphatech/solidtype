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

type button_group_props

external button_group_props :
  variant:string ->
  size:string ->
  orientation:string ->
  full_width:(bool[@mel.as "fullWidth"]) ->
  is_disabled:(bool[@mel.as "isDisabled"]) ->
  unit ->
  button_group_props = ""
[@@mel.obj]

external button_group : Dom.htmlDivElement -> button_group_props -> unit
  = "buttonGroup"
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

type close_button_props

external close_button_props :
  is_disabled:(bool[@mel.as "isDisabled"]) -> unit -> close_button_props = ""
[@@mel.obj]

external close_button : Dom.htmlDivElement -> close_button_props -> unit
  = "closeButton"
[@@mel.module "./react/heroui.tsx"]

type kbd_props

external kbd_props :
  variant:string -> key_value:(string[@mel.as "keyValue"]) -> unit -> kbd_props
  = ""
[@@mel.obj]

external kbd : Dom.htmlDivElement -> kbd_props -> unit = "kbd"
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

type skeleton_props

external skeleton_props :
  animation_type:(string[@mel.as "animationType"]) ->
  class_name:(string[@mel.as "className"]) ->
  unit ->
  skeleton_props = ""
[@@mel.obj]

external skeleton : Dom.htmlDivElement -> skeleton_props -> unit = "skeleton"
[@@mel.module "./react/heroui.tsx"]

type spinner_props

external spinner_props : color:string -> size:string -> unit -> spinner_props
  = ""
[@@mel.obj]

external spinner : Dom.htmlDivElement -> spinner_props -> unit = "spinner"
[@@mel.module "./react/heroui.tsx"]

type surface_props

external surface_props :
  variant:string ->
  class_name:(string[@mel.as "className"]) ->
  unit ->
  surface_props = ""
[@@mel.obj]

external surface : Dom.htmlDivElement -> surface_props -> unit = "surface"
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

type card_props

external card_props : variant:string -> unit -> card_props = "" [@@mel.obj]

external card : Dom.htmlDivElement -> card_props -> unit = "card"
[@@mel.module "./react/heroui.tsx"]

type checkbox_props

external checkbox_props :
  variant:string ->
  is_indeterminate:(bool[@mel.as "isIndeterminate"]) ->
  is_disabled:(bool[@mel.as "isDisabled"]) ->
  is_invalid:(bool[@mel.as "isInvalid"]) ->
  label:string ->
  unit ->
  checkbox_props = ""
[@@mel.obj]

external checkbox : Dom.htmlDivElement -> checkbox_props -> unit = "checkbox"
[@@mel.module "./react/heroui.tsx"]

type radio_group_props

external radio_group_props :
  variant:string ->
  orientation:string ->
  is_disabled:(bool[@mel.as "isDisabled"]) ->
  is_invalid:(bool[@mel.as "isInvalid"]) ->
  unit ->
  radio_group_props = ""
[@@mel.obj]

external radio_group : Dom.htmlDivElement -> radio_group_props -> unit
  = "radioGroup"
[@@mel.module "./react/heroui.tsx"]
