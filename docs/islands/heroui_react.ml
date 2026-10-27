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

type scroll_shadow_props

external scroll_shadow_props :
  visibility:string ->
  hide_scroll_bar:(bool[@mel.as "hideScrollBar"]) ->
  unit ->
  scroll_shadow_props = ""
[@@mel.obj]

external scroll_shadow : Dom.htmlDivElement -> scroll_shadow_props -> unit
  = "scrollShadow"
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

type avatar_props

external avatar_props :
  size:string -> color:string -> variant:string -> unit -> avatar_props = ""
[@@mel.obj]

external avatar : Dom.htmlDivElement -> avatar_props -> unit = "avatar"
[@@mel.module "./react/heroui.tsx"]

type avatar_group_props

external avatar_group_props :
  size:string ->
  overlap:string ->
  ?max:int ->
  is_grid:(bool[@mel.as "isGrid"]) ->
  unit ->
  avatar_group_props = ""
[@@mel.obj]

external avatar_group : Dom.htmlDivElement -> avatar_group_props -> unit
  = "avatarGroup"
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

type typography_props

external typography_props :
  type_:(string[@mel.as "type"]) ->
  align:string ->
  color:string ->
  truncate:bool ->
  unit ->
  typography_props = ""
[@@mel.obj]

external typography : Dom.htmlDivElement -> typography_props -> unit
  = "typography"
[@@mel.module "./react/heroui.tsx"]

type text_field_props

external text_field_props :
  variant:string ->
  is_required:(bool[@mel.as "isRequired"]) ->
  is_disabled:(bool[@mel.as "isDisabled"]) ->
  is_invalid:(bool[@mel.as "isInvalid"]) ->
  is_read_only:(bool[@mel.as "isReadOnly"]) ->
  unit ->
  text_field_props = ""
[@@mel.obj]

external text_field : Dom.htmlDivElement -> text_field_props -> unit
  = "textField"
[@@mel.module "./react/heroui.tsx"]

type fieldset_props

external fieldset_props : disabled:bool -> unit -> fieldset_props = ""
[@@mel.obj]

external fieldset : Dom.htmlDivElement -> fieldset_props -> unit = "fieldset"
[@@mel.module "./react/heroui.tsx"]

type checkbox_group_props

external checkbox_group_props :
  variant:string ->
  is_disabled:(bool[@mel.as "isDisabled"]) ->
  is_invalid:(bool[@mel.as "isInvalid"]) ->
  unit ->
  checkbox_group_props = ""
[@@mel.obj]

external checkbox_group : Dom.htmlDivElement -> checkbox_group_props -> unit
  = "checkboxGroup"
[@@mel.module "./react/heroui.tsx"]

type number_field_props

external number_field_props :
  variant:string ->
  is_disabled:(bool[@mel.as "isDisabled"]) ->
  is_invalid:(bool[@mel.as "isInvalid"]) ->
  unit ->
  number_field_props = ""
[@@mel.obj]

external number_field : Dom.htmlDivElement -> number_field_props -> unit
  = "numberField"
[@@mel.module "./react/heroui.tsx"]

type slider_props

external slider_props :
  orientation:string ->
  is_disabled:(bool[@mel.as "isDisabled"]) ->
  unit ->
  slider_props = ""
[@@mel.obj]

external slider : Dom.htmlDivElement -> slider_props -> unit = "slider"
[@@mel.module "./react/heroui.tsx"]

type search_field_props

external search_field_props :
  variant:string ->
  is_disabled:(bool[@mel.as "isDisabled"]) ->
  unit ->
  search_field_props = ""
[@@mel.obj]

external search_field : Dom.htmlDivElement -> search_field_props -> unit
  = "searchField"
[@@mel.module "./react/heroui.tsx"]

type input_group_props

external input_group_props : variant:string -> unit -> input_group_props = ""
[@@mel.obj]

external input_group : Dom.htmlDivElement -> input_group_props -> unit
  = "inputGroup"
[@@mel.module "./react/heroui.tsx"]

type alert_props

external alert_props : status:string -> unit -> alert_props = "" [@@mel.obj]

external alert : Dom.htmlDivElement -> alert_props -> unit = "alert"
[@@mel.module "./react/heroui.tsx"]

type meter_props

external meter_props : color:string -> size:string -> unit -> meter_props = ""
[@@mel.obj]

external meter : Dom.htmlDivElement -> meter_props -> unit = "meter"
[@@mel.module "./react/heroui.tsx"]

type progress_bar_props

external progress_bar_props :
  color:string -> size:string -> unit -> progress_bar_props = ""
[@@mel.obj]

external progress_bar : Dom.htmlDivElement -> progress_bar_props -> unit
  = "progressBar"
[@@mel.module "./react/heroui.tsx"]

type time_field_props

external time_field_props :
  variant:string -> is_disabled:bool -> unit -> time_field_props = ""
[@@mel.obj]

external time_field : Dom.htmlDivElement -> time_field_props -> unit
  = "timeField"
[@@mel.module "./react/heroui.tsx"]

type progress_circle_props

external progress_circle_props :
  color:string -> size:string -> unit -> progress_circle_props = ""
[@@mel.obj]

external progress_circle : Dom.htmlDivElement -> progress_circle_props -> unit
  = "progressCircle"
[@@mel.module "./react/heroui.tsx"]

type disclosure_props

external disclosure_props :
  is_disabled:(bool[@mel.as "isDisabled"]) -> unit -> disclosure_props = ""
[@@mel.obj]

external disclosure : Dom.htmlDivElement -> disclosure_props -> unit
  = "disclosure"
[@@mel.module "./react/heroui.tsx"]

type disclosure_group_props

external disclosure_group_props :
  allows_multiple_expanded:(bool[@mel.as "allowsMultipleExpanded"]) ->
  is_disabled:(bool[@mel.as "isDisabled"]) ->
  unit ->
  disclosure_group_props = ""
[@@mel.obj]

external disclosure_group : Dom.htmlDivElement -> disclosure_group_props -> unit
  = "disclosureGroup"
[@@mel.module "./react/heroui.tsx"]

type accordion_props

external accordion_props :
  allows_multiple_expanded:(bool[@mel.as "allowsMultipleExpanded"]) ->
  is_disabled:(bool[@mel.as "isDisabled"]) ->
  variant:([ `default | `surface ][@mel.as "variant"]) ->
  hide_separator:(bool[@mel.as "hideSeparator"]) ->
  unit ->
  accordion_props = ""
[@@mel.obj]

external accordion : Dom.htmlDivElement -> accordion_props -> unit = "accordion"
[@@mel.module "./react/heroui.tsx"]

type tabs_props

external tabs_props :
  orientation:([ `horizontal | `vertical ][@mel.as "orientation"]) ->
  variant:([ `primary | `secondary ][@mel.as "variant"]) ->
  align:
    ([ `start [@mel.as "start"]
     | `center [@mel.as "center"]
     | `end_ [@mel.as "end"] ]
    [@mel.as "align"]) ->
  is_disabled:(bool[@mel.as "isDisabled"]) ->
  unit ->
  tabs_props = ""
[@@mel.obj]

external tabs : Dom.htmlDivElement -> tabs_props -> unit = "tabs"
[@@mel.module "./react/heroui.tsx"]

type breadcrumbs_props

external breadcrumbs_props :
  is_disabled:(bool[@mel.as "isDisabled"]) ->
  on_action:((string -> unit)[@mel.as "onAction"]) ->
  unit ->
  breadcrumbs_props = ""
[@@mel.obj]

external breadcrumbs : Dom.htmlDivElement -> breadcrumbs_props -> unit
  = "breadcrumbs"
[@@mel.module "./react/heroui.tsx"]

type pagination_props

external pagination_props :
  size:([ `sm | `md | `lg ][@mel.as "size"]) -> unit -> pagination_props = ""
[@@mel.obj]

external pagination : Dom.htmlDivElement -> pagination_props -> unit
  = "pagination"
[@@mel.module "./react/heroui.tsx"]

type tooltip_props

external tooltip_props :
  placement:([ `top | `bottom | `left | `right ][@mel.as "placement"]) ->
  show_arrow:(bool[@mel.as "showArrow"]) ->
  unit ->
  tooltip_props = ""
[@@mel.obj]

external tooltip : Dom.htmlDivElement -> tooltip_props -> unit = "tooltip"
[@@mel.module "./react/heroui.tsx"]

type list_box_props

external list_box_props :
  selection_mode:([ `none | `single | `multiple ][@mel.as "selectionMode"]) ->
  variant:([ `default | `danger ][@mel.as "variant"]) ->
  unit ->
  list_box_props = ""
[@@mel.obj]

external list_box : Dom.htmlDivElement -> list_box_props -> unit = "listBox"
[@@mel.module "./react/heroui.tsx"]

type dropdown_props

external dropdown_props :
  selection_mode:([ `none | `single | `multiple ][@mel.as "selectionMode"]) ->
  placement:([ `top | `bottom | `left | `right ][@mel.as "placement"]) ->
  trigger:([ `press | `long_press [@mel.as "longPress"] ][@mel.as "trigger"]) ->
  unit ->
  dropdown_props = ""
[@@mel.obj]

external dropdown : Dom.htmlDivElement -> dropdown_props -> unit = "dropdown"
[@@mel.module "./react/heroui.tsx"]

type popover_props

external popover_props :
  placement:([ `top | `bottom | `left | `right ][@mel.as "placement"]) ->
  arrow:bool ->
  unit ->
  popover_props = ""
[@@mel.obj]

external popover : Dom.htmlDivElement -> popover_props -> unit = "popover"
[@@mel.module "./react/heroui.tsx"]

type modal_props

external modal_props :
  variant:([ `opaque | `blur | `transparent ][@mel.as "variant"]) ->
  placement:([ `auto | `center | `top | `bottom ][@mel.as "placement"]) ->
  size:([ `xs | `sm | `md | `lg | `cover | `full ][@mel.as "size"]) ->
  is_dismissable:(bool[@mel.as "isDismissable"]) ->
  unit ->
  modal_props = ""
[@@mel.obj]

external modal : Dom.htmlDivElement -> modal_props -> unit = "modal"
[@@mel.module "./react/heroui.tsx"]

type alert_dialog_props

external alert_dialog_props :
  status:
    ([ `default | `accent | `success | `warning | `danger ][@mel.as "status"]) ->
  variant:([ `opaque | `blur | `transparent ][@mel.as "variant"]) ->
  is_dismissable:(bool[@mel.as "isDismissable"]) ->
  unit ->
  alert_dialog_props = ""
[@@mel.obj]

external alert_dialog : Dom.htmlDivElement -> alert_dialog_props -> unit
  = "alertDialog"
[@@mel.module "./react/heroui.tsx"]

type drawer_props

external drawer_props :
  placement:([ `top | `bottom | `left | `right ][@mel.as "placement"]) ->
  variant:([ `opaque | `blur | `transparent ][@mel.as "variant"]) ->
  is_dismissable:(bool[@mel.as "isDismissable"]) ->
  unit ->
  drawer_props = ""
[@@mel.obj]

external drawer : Dom.htmlDivElement -> drawer_props -> unit = "drawer"
[@@mel.module "./react/heroui.tsx"]

type toggle_button_props

external toggle_button_props :
  variant:string ->
  size:string ->
  is_icon_only:(bool[@mel.as "isIconOnly"]) ->
  is_disabled:(bool[@mel.as "isDisabled"]) ->
  unit ->
  toggle_button_props = ""
[@@mel.obj]

external toggle_button : Dom.htmlDivElement -> toggle_button_props -> unit
  = "toggleButton"
[@@mel.module "./react/heroui.tsx"]

type toggle_button_group_props

external toggle_button_group_props :
  selection_mode:(string[@mel.as "selectionMode"]) ->
  size:string ->
  orientation:string ->
  is_detached:(bool[@mel.as "isDetached"]) ->
  full_width:(bool[@mel.as "fullWidth"]) ->
  is_disabled:(bool[@mel.as "isDisabled"]) ->
  unit ->
  toggle_button_group_props = ""
[@@mel.obj]

external toggle_button_group :
  Dom.htmlDivElement -> toggle_button_group_props -> unit = "toggleButtonGroup"
[@@mel.module "./react/heroui.tsx"]
