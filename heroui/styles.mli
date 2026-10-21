(* Each of HeroUI's variant functions, by its component: [options] built
   from its variants, then [classes], its class string, or for a component of
   several parts [slots], a class string per part. Generated from the
   declarations of @heroui/styles 3.2.6 by generate/heroui.ts; never edited
   by hand. *)

(** HeroUI's [accordionVariants]. *)
module Accordion : sig
  type options

  external options :
    ?variant:([ `default [@mel.as "default"] | `surface [@mel.as "surface"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "accordionVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external body : slots -> string = "body" [@@mel.send]
  external body_inner : slots -> string = "bodyInner" [@@mel.send]
  external heading : slots -> string = "heading" [@@mel.send]
  external indicator : slots -> string = "indicator" [@@mel.send]
  external item : slots -> string = "item" [@@mel.send]
  external panel : slots -> string = "panel" [@@mel.send]
  external trigger : slots -> string = "trigger" [@@mel.send]
end

(** HeroUI's [alertVariants]. *)
module Alert : sig
  type options

  external options :
    ?status:([ `accent [@mel.as "accent"] | `danger [@mel.as "danger"] | `default [@mel.as "default"] | `success [@mel.as "success"] | `warning [@mel.as "warning"] ] [@mel.as "status"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "alertVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external content : slots -> string = "content" [@@mel.send]
  external description : slots -> string = "description" [@@mel.send]
  external indicator : slots -> string = "indicator" [@@mel.send]
  external title : slots -> string = "title" [@@mel.send]
end

(** HeroUI's [alertDialogVariants]. *)
module AlertDialog : sig
  type options

  external options :
    ?size:([ `cover [@mel.as "cover"] | `lg [@mel.as "lg"] | `md [@mel.as "md"] | `sm [@mel.as "sm"] | `xs [@mel.as "xs"] ] [@mel.as "size"]) ->
    ?status:([ `accent [@mel.as "accent"] | `danger [@mel.as "danger"] | `default [@mel.as "default"] | `success [@mel.as "success"] | `warning [@mel.as "warning"] ] [@mel.as "status"]) ->
    ?variant:([ `blur [@mel.as "blur"] | `opaque [@mel.as "opaque"] | `transparent [@mel.as "transparent"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "alertDialogVariants"
  [@@mel.module "@heroui/styles"]

  external backdrop : slots -> string = "backdrop" [@@mel.send]
  external body : slots -> string = "body" [@@mel.send]
  external close_trigger : slots -> string = "closeTrigger" [@@mel.send]
  external container : slots -> string = "container" [@@mel.send]
  external dialog : slots -> string = "dialog" [@@mel.send]
  external footer : slots -> string = "footer" [@@mel.send]
  external header : slots -> string = "header" [@@mel.send]
  external heading : slots -> string = "heading" [@@mel.send]
  external icon : slots -> string = "icon" [@@mel.send]
  external trigger : slots -> string = "trigger" [@@mel.send]
end

(** HeroUI's [autocompleteVariants]. *)
module Autocomplete : sig
  type options

  external options :
    ?full_width:(bool [@mel.as "fullWidth"]) ->
    ?variant:([ `primary [@mel.as "primary"] | `secondary [@mel.as "secondary"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "autocompleteVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external clear_button : slots -> string = "clearButton" [@@mel.send]
  external filter : slots -> string = "filter" [@@mel.send]
  external indicator : slots -> string = "indicator" [@@mel.send]
  external popover : slots -> string = "popover" [@@mel.send]
  external trigger : slots -> string = "trigger" [@@mel.send]
  external value : slots -> string = "value" [@@mel.send]
end

(** HeroUI's [avatarVariants]. *)
module Avatar : sig
  type options

  external options :
    ?color:([ `accent [@mel.as "accent"] | `danger [@mel.as "danger"] | `default [@mel.as "default"] | `success [@mel.as "success"] | `warning [@mel.as "warning"] ] [@mel.as "color"]) ->
    ?size:([ `lg [@mel.as "lg"] | `md [@mel.as "md"] | `sm [@mel.as "sm"] ] [@mel.as "size"]) ->
    ?variant:([ `default [@mel.as "default"] | `soft [@mel.as "soft"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "avatarVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external fallback : slots -> string = "fallback" [@@mel.send]
  external image : slots -> string = "image" [@@mel.send]
end

(** HeroUI's [avatarGroupVariants]. *)
module AvatarGroup : sig
  type options

  external options :
    ?is_grid:(bool [@mel.as "isGrid"]) ->
    ?overlap:([ `clip [@mel.as "clip"] | `ring [@mel.as "ring"] ] [@mel.as "overlap"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "avatarGroupVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external count : slots -> string = "count" [@@mel.send]
end

(** HeroUI's [badgeVariants]. *)
module Badge : sig
  type options

  external options :
    ?color:([ `accent [@mel.as "accent"] | `danger [@mel.as "danger"] | `default [@mel.as "default"] | `success [@mel.as "success"] | `warning [@mel.as "warning"] ] [@mel.as "color"]) ->
    ?placement:([ `bottom_left [@mel.as "bottom-left"] | `bottom_right [@mel.as "bottom-right"] | `top_left [@mel.as "top-left"] | `top_right [@mel.as "top-right"] ] [@mel.as "placement"]) ->
    ?size:([ `lg [@mel.as "lg"] | `md [@mel.as "md"] | `sm [@mel.as "sm"] ] [@mel.as "size"]) ->
    ?variant:([ `primary [@mel.as "primary"] | `secondary [@mel.as "secondary"] | `soft [@mel.as "soft"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "badgeVariants"
  [@@mel.module "@heroui/styles"]

  external anchor : slots -> string = "anchor" [@@mel.send]
  external base : slots -> string = "base" [@@mel.send]
  external label : slots -> string = "label" [@@mel.send]
end

(** HeroUI's [breadcrumbsVariants]. *)
module Breadcrumbs : sig
  type options

  external options :
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "breadcrumbsVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external item : slots -> string = "item" [@@mel.send]
  external link : slots -> string = "link" [@@mel.send]
  external separator : slots -> string = "separator" [@@mel.send]
end

(** HeroUI's [buttonVariants]. *)
module Button : sig
  type options

  external options :
    ?full_width:(bool [@mel.as "fullWidth"]) ->
    ?is_icon_only:(bool [@mel.as "isIconOnly"]) ->
    ?size:([ `lg [@mel.as "lg"] | `md [@mel.as "md"] | `sm [@mel.as "sm"] ] [@mel.as "size"]) ->
    ?variant:([ `danger [@mel.as "danger"] | `danger_soft [@mel.as "danger-soft"] | `ghost [@mel.as "ghost"] | `outline [@mel.as "outline"] | `primary [@mel.as "primary"] | `secondary [@mel.as "secondary"] | `tertiary [@mel.as "tertiary"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  external classes : options -> string = "buttonVariants"
  [@@mel.module "@heroui/styles"]
end

(** HeroUI's [buttonGroupVariants]. *)
module ButtonGroup : sig
  type options

  external options :
    ?full_width:(bool [@mel.as "fullWidth"]) ->
    ?orientation:([ `horizontal [@mel.as "horizontal"] | `vertical [@mel.as "vertical"] ] [@mel.as "orientation"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "buttonGroupVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external separator : slots -> string = "separator" [@@mel.send]
end

(** HeroUI's [calendarVariants]. *)
module Calendar : sig
  type options

  external options :
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "calendarVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external cell : slots -> string = "cell" [@@mel.send]
  external cell_indicator : slots -> string = "cellIndicator" [@@mel.send]
  external grid : slots -> string = "grid" [@@mel.send]
  external grid_body : slots -> string = "gridBody" [@@mel.send]
  external grid_header : slots -> string = "gridHeader" [@@mel.send]
  external grid_row : slots -> string = "gridRow" [@@mel.send]
  external header : slots -> string = "header" [@@mel.send]
  external header_cell : slots -> string = "headerCell" [@@mel.send]
  external heading : slots -> string = "heading" [@@mel.send]
  external nav_button : slots -> string = "navButton" [@@mel.send]
  external nav_button_icon : slots -> string = "navButtonIcon" [@@mel.send]
end

(** HeroUI's [calendarYearPickerVariants]. *)
module CalendarYearPicker : sig
  type options

  external options :
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "calendarYearPickerVariants"
  [@@mel.module "@heroui/styles"]

  external trigger : slots -> string = "trigger" [@@mel.send]
  external trigger_heading : slots -> string = "triggerHeading" [@@mel.send]
  external trigger_indicator : slots -> string = "triggerIndicator" [@@mel.send]
  external year_cell : slots -> string = "yearCell" [@@mel.send]
  external year_grid : slots -> string = "yearGrid" [@@mel.send]
end

(** HeroUI's [rangeCalendarVariants]. *)
module RangeCalendar : sig
  type options

  external options :
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "rangeCalendarVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external cell : slots -> string = "cell" [@@mel.send]
  external cell_indicator : slots -> string = "cellIndicator" [@@mel.send]
  external grid : slots -> string = "grid" [@@mel.send]
  external grid_body : slots -> string = "gridBody" [@@mel.send]
  external grid_header : slots -> string = "gridHeader" [@@mel.send]
  external grid_row : slots -> string = "gridRow" [@@mel.send]
  external header : slots -> string = "header" [@@mel.send]
  external header_cell : slots -> string = "headerCell" [@@mel.send]
  external heading : slots -> string = "heading" [@@mel.send]
  external nav_button : slots -> string = "navButton" [@@mel.send]
  external nav_button_icon : slots -> string = "navButtonIcon" [@@mel.send]
end

(** HeroUI's [cardVariants]. *)
module Card : sig
  type options

  external options :
    ?variant:([ `default [@mel.as "default"] | `secondary [@mel.as "secondary"] | `tertiary [@mel.as "tertiary"] | `transparent [@mel.as "transparent"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "cardVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external content : slots -> string = "content" [@@mel.send]
  external description : slots -> string = "description" [@@mel.send]
  external footer : slots -> string = "footer" [@@mel.send]
  external header : slots -> string = "header" [@@mel.send]
  external title : slots -> string = "title" [@@mel.send]
end

(** HeroUI's [checkboxVariants]. *)
module Checkbox : sig
  type options

  external options :
    ?variant:([ `primary [@mel.as "primary"] | `secondary [@mel.as "secondary"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "checkboxVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external content : slots -> string = "content" [@@mel.send]
  external control : slots -> string = "control" [@@mel.send]
  external indicator : slots -> string = "indicator" [@@mel.send]
end

(** HeroUI's [checkboxGroupVariants]. *)
module CheckboxGroup : sig
  type options

  external options :
    ?variant:([ `primary [@mel.as "primary"] | `secondary [@mel.as "secondary"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  external classes : options -> string = "checkboxGroupVariants"
  [@@mel.module "@heroui/styles"]
end

(** HeroUI's [chipVariants]. *)
module Chip : sig
  type options

  external options :
    ?color:([ `accent [@mel.as "accent"] | `danger [@mel.as "danger"] | `default [@mel.as "default"] | `success [@mel.as "success"] | `warning [@mel.as "warning"] ] [@mel.as "color"]) ->
    ?size:([ `lg [@mel.as "lg"] | `md [@mel.as "md"] | `sm [@mel.as "sm"] ] [@mel.as "size"]) ->
    ?variant:([ `primary [@mel.as "primary"] | `secondary [@mel.as "secondary"] | `soft [@mel.as "soft"] | `tertiary [@mel.as "tertiary"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "chipVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external label : slots -> string = "label" [@@mel.send]
end

(** HeroUI's [colorAreaVariants]. *)
module ColorArea : sig
  type options

  external options :
    ?show_dots:(bool [@mel.as "showDots"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "colorAreaVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external thumb : slots -> string = "thumb" [@@mel.send]
end

(** HeroUI's [colorFieldVariants]. *)
module ColorField : sig
  type options

  external options :
    ?full_width:(bool [@mel.as "fullWidth"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  external classes : options -> string = "colorFieldVariants"
  [@@mel.module "@heroui/styles"]
end

(** HeroUI's [colorInputGroupVariants]. *)
module ColorInputGroup : sig
  type options

  external options :
    ?full_width:(bool [@mel.as "fullWidth"]) ->
    ?variant:([ `primary [@mel.as "primary"] | `secondary [@mel.as "secondary"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "colorInputGroupVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external input : slots -> string = "input" [@@mel.send]
  external prefix : slots -> string = "prefix" [@@mel.send]
  external suffix : slots -> string = "suffix" [@@mel.send]
end

(** HeroUI's [colorPickerVariants]. *)
module ColorPicker : sig
  type options

  external options :
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "colorPickerVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external popover : slots -> string = "popover" [@@mel.send]
  external trigger : slots -> string = "trigger" [@@mel.send]
end

(** HeroUI's [colorSliderVariants]. *)
module ColorSlider : sig
  type options

  external options :
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "colorSliderVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external output : slots -> string = "output" [@@mel.send]
  external thumb : slots -> string = "thumb" [@@mel.send]
  external track : slots -> string = "track" [@@mel.send]
end

(** HeroUI's [colorSwatchVariants]. *)
module ColorSwatch : sig
  type options

  external options :
    ?shape:([ `circle [@mel.as "circle"] | `square [@mel.as "square"] ] [@mel.as "shape"]) ->
    ?size:([ `lg [@mel.as "lg"] | `md [@mel.as "md"] | `sm [@mel.as "sm"] | `xl [@mel.as "xl"] | `xs [@mel.as "xs"] ] [@mel.as "size"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  external classes : options -> string = "colorSwatchVariants"
  [@@mel.module "@heroui/styles"]
end

(** HeroUI's [closeButtonVariants]. *)
module CloseButton : sig
  type options

  external options :
    ?variant:([ `default [@mel.as "default"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  external classes : options -> string = "closeButtonVariants"
  [@@mel.module "@heroui/styles"]
end

(** HeroUI's [colorSwatchPickerVariants]. *)
module ColorSwatchPicker : sig
  type options

  external options :
    ?layout:([ `grid [@mel.as "grid"] | `stack [@mel.as "stack"] ] [@mel.as "layout"]) ->
    ?size:([ `lg [@mel.as "lg"] | `md [@mel.as "md"] | `sm [@mel.as "sm"] | `xl [@mel.as "xl"] | `xs [@mel.as "xs"] ] [@mel.as "size"]) ->
    ?variant:([ `circle [@mel.as "circle"] | `square [@mel.as "square"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "colorSwatchPickerVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external indicator : slots -> string = "indicator" [@@mel.send]
  external item : slots -> string = "item" [@@mel.send]
  external swatch : slots -> string = "swatch" [@@mel.send]
end

(** HeroUI's [comboBoxVariants]. *)
module ComboBox : sig
  type options

  external options :
    ?full_width:(bool [@mel.as "fullWidth"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "comboBoxVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external input_group : slots -> string = "inputGroup" [@@mel.send]
  external popover : slots -> string = "popover" [@@mel.send]
  external trigger : slots -> string = "trigger" [@@mel.send]
  external value : slots -> string = "value" [@@mel.send]
end

(** HeroUI's [dateFieldVariants]. *)
module DateField : sig
  type options

  external options :
    ?full_width:(bool [@mel.as "fullWidth"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  external classes : options -> string = "dateFieldVariants"
  [@@mel.module "@heroui/styles"]
end

(** HeroUI's [datePickerVariants]. *)
module DatePicker : sig
  type options

  external options :
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "datePickerVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external popover : slots -> string = "popover" [@@mel.send]
  external trigger : slots -> string = "trigger" [@@mel.send]
  external trigger_indicator : slots -> string = "triggerIndicator" [@@mel.send]
end

(** HeroUI's [dateRangePickerVariants]. *)
module DateRangePicker : sig
  type options

  external options :
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "dateRangePickerVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external popover : slots -> string = "popover" [@@mel.send]
  external range_separator : slots -> string = "rangeSeparator" [@@mel.send]
  external trigger : slots -> string = "trigger" [@@mel.send]
  external trigger_indicator : slots -> string = "triggerIndicator" [@@mel.send]
end

(** HeroUI's [dateInputGroupVariants]. *)
module DateInputGroup : sig
  type options

  external options :
    ?full_width:(bool [@mel.as "fullWidth"]) ->
    ?variant:([ `primary [@mel.as "primary"] | `secondary [@mel.as "secondary"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "dateInputGroupVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external input : slots -> string = "input" [@@mel.send]
  external input_container : slots -> string = "inputContainer" [@@mel.send]
  external prefix : slots -> string = "prefix" [@@mel.send]
  external segment : slots -> string = "segment" [@@mel.send]
  external suffix : slots -> string = "suffix" [@@mel.send]
end

(** HeroUI's [descriptionVariants]. *)
module Description : sig
  type options

  external options :
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  external classes : options -> string = "descriptionVariants"
  [@@mel.module "@heroui/styles"]
end

(** HeroUI's [drawerVariants]. *)
module Drawer : sig
  type options

  external options :
    ?placement:([ `bottom [@mel.as "bottom"] | `left [@mel.as "left"] | `right [@mel.as "right"] | `top [@mel.as "top"] ] [@mel.as "placement"]) ->
    ?variant:([ `blur [@mel.as "blur"] | `opaque [@mel.as "opaque"] | `transparent [@mel.as "transparent"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "drawerVariants"
  [@@mel.module "@heroui/styles"]

  external backdrop : slots -> string = "backdrop" [@@mel.send]
  external body : slots -> string = "body" [@@mel.send]
  external close_trigger : slots -> string = "closeTrigger" [@@mel.send]
  external content : slots -> string = "content" [@@mel.send]
  external dialog : slots -> string = "dialog" [@@mel.send]
  external footer : slots -> string = "footer" [@@mel.send]
  external handle : slots -> string = "handle" [@@mel.send]
  external header : slots -> string = "header" [@@mel.send]
  external heading : slots -> string = "heading" [@@mel.send]
  external trigger : slots -> string = "trigger" [@@mel.send]
end

(** HeroUI's [disclosureVariants]. *)
module Disclosure : sig
  type options

  external options :
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "disclosureVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external body : slots -> string = "body" [@@mel.send]
  external body_inner : slots -> string = "bodyInner" [@@mel.send]
  external content : slots -> string = "content" [@@mel.send]
  external heading : slots -> string = "heading" [@@mel.send]
  external indicator : slots -> string = "indicator" [@@mel.send]
  external trigger : slots -> string = "trigger" [@@mel.send]
end

(** HeroUI's [disclosureGroupVariants]. *)
module DisclosureGroup : sig
  type options

  external options :
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "disclosureGroupVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
end

(** HeroUI's [dropdownVariants]. *)
module Dropdown : sig
  type options

  external options :
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "dropdownVariants"
  [@@mel.module "@heroui/styles"]

  external menu : slots -> string = "menu" [@@mel.send]
  external popover : slots -> string = "popover" [@@mel.send]
  external root : slots -> string = "root" [@@mel.send]
  external trigger : slots -> string = "trigger" [@@mel.send]
end

(** HeroUI's [emptyStateVariants]. *)
module EmptyState : sig
  type options

  external options :
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  external classes : options -> string = "emptyStateVariants"
  [@@mel.module "@heroui/styles"]
end

(** HeroUI's [errorMessageVariants]. *)
module ErrorMessage : sig
  type options

  external options :
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  external classes : options -> string = "errorMessageVariants"
  [@@mel.module "@heroui/styles"]
end

(** HeroUI's [fieldErrorVariants]. *)
module FieldError : sig
  type options

  external options :
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  external classes : options -> string = "fieldErrorVariants"
  [@@mel.module "@heroui/styles"]
end

(** HeroUI's [fieldsetVariants]. *)
module Fieldset : sig
  type options

  external options :
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "fieldsetVariants"
  [@@mel.module "@heroui/styles"]

  external actions : slots -> string = "actions" [@@mel.send]
  external base : slots -> string = "base" [@@mel.send]
  external description : slots -> string = "description" [@@mel.send]
  external field_group : slots -> string = "fieldGroup" [@@mel.send]
  external legend : slots -> string = "legend" [@@mel.send]
end

(** HeroUI's [headerVariants]. *)
module Header : sig
  type options

  external options :
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  external classes : options -> string = "headerVariants"
  [@@mel.module "@heroui/styles"]
end

(** HeroUI's [inputVariants]. *)
module Input : sig
  type options

  external options :
    ?full_width:(bool [@mel.as "fullWidth"]) ->
    ?variant:([ `primary [@mel.as "primary"] | `secondary [@mel.as "secondary"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  external classes : options -> string = "inputVariants"
  [@@mel.module "@heroui/styles"]
end

(** HeroUI's [inputGroupVariants]. *)
module InputGroup : sig
  type options

  external options :
    ?full_width:(bool [@mel.as "fullWidth"]) ->
    ?variant:([ `primary [@mel.as "primary"] | `secondary [@mel.as "secondary"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "inputGroupVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external input : slots -> string = "input" [@@mel.send]
  external prefix : slots -> string = "prefix" [@@mel.send]
  external suffix : slots -> string = "suffix" [@@mel.send]
end

(** HeroUI's [inputOTPVariants]. *)
module InputOTP : sig
  type options

  external options :
    ?variant:([ `primary [@mel.as "primary"] | `secondary [@mel.as "secondary"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "inputOTPVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external caret : slots -> string = "caret" [@@mel.send]
  external group : slots -> string = "group" [@@mel.send]
  external input : slots -> string = "input" [@@mel.send]
  external separator : slots -> string = "separator" [@@mel.send]
  external slot : slots -> string = "slot" [@@mel.send]
  external slot_value : slots -> string = "slotValue" [@@mel.send]
end

(** HeroUI's [kbdVariants]. *)
module Kbd : sig
  type options

  external options :
    ?variant:([ `default [@mel.as "default"] | `light [@mel.as "light"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "kbdVariants"
  [@@mel.module "@heroui/styles"]

  external abbr : slots -> string = "abbr" [@@mel.send]
  external base : slots -> string = "base" [@@mel.send]
  external content : slots -> string = "content" [@@mel.send]
end

(** HeroUI's [labelVariants]. *)
module Label : sig
  type options

  external options :
    ?is_disabled:(bool [@mel.as "isDisabled"]) ->
    ?is_invalid:(bool [@mel.as "isInvalid"]) ->
    ?is_required:(bool [@mel.as "isRequired"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  external classes : options -> string = "labelVariants"
  [@@mel.module "@heroui/styles"]
end

(** HeroUI's [linkVariants]. *)
module Link : sig
  type options

  external options :
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "linkVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external icon : slots -> string = "icon" [@@mel.send]
end

(** HeroUI's [listboxVariants]. *)
module Listbox : sig
  type options

  external options :
    ?variant:([ `danger [@mel.as "danger"] | `default [@mel.as "default"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  external classes : options -> string = "listboxVariants"
  [@@mel.module "@heroui/styles"]
end

(** HeroUI's [listboxItemVariants]. *)
module ListboxItem : sig
  type options

  external options :
    ?variant:([ `danger [@mel.as "danger"] | `default [@mel.as "default"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "listboxItemVariants"
  [@@mel.module "@heroui/styles"]

  external indicator : slots -> string = "indicator" [@@mel.send]
  external item : slots -> string = "item" [@@mel.send]
end

(** HeroUI's [listboxSectionVariants]. *)
module ListboxSection : sig
  type options

  external options :
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  external classes : options -> string = "listboxSectionVariants"
  [@@mel.module "@heroui/styles"]
end

(** HeroUI's [menuVariants]. *)
module Menu : sig
  type options

  external options :
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  external classes : options -> string = "menuVariants"
  [@@mel.module "@heroui/styles"]
end

(** HeroUI's [meterVariants]. *)
module Meter : sig
  type options

  external options :
    ?color:([ `accent [@mel.as "accent"] | `danger [@mel.as "danger"] | `default [@mel.as "default"] | `success [@mel.as "success"] | `warning [@mel.as "warning"] ] [@mel.as "color"]) ->
    ?size:([ `lg [@mel.as "lg"] | `md [@mel.as "md"] | `sm [@mel.as "sm"] ] [@mel.as "size"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "meterVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external fill : slots -> string = "fill" [@@mel.send]
  external output : slots -> string = "output" [@@mel.send]
  external track : slots -> string = "track" [@@mel.send]
end

(** HeroUI's [progressBarVariants]. *)
module ProgressBar : sig
  type options

  external options :
    ?color:([ `accent [@mel.as "accent"] | `danger [@mel.as "danger"] | `default [@mel.as "default"] | `success [@mel.as "success"] | `warning [@mel.as "warning"] ] [@mel.as "color"]) ->
    ?size:([ `lg [@mel.as "lg"] | `md [@mel.as "md"] | `sm [@mel.as "sm"] ] [@mel.as "size"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "progressBarVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external fill : slots -> string = "fill" [@@mel.send]
  external output : slots -> string = "output" [@@mel.send]
  external track : slots -> string = "track" [@@mel.send]
end

(** HeroUI's [progressCircleVariants]. *)
module ProgressCircle : sig
  type options

  external options :
    ?color:([ `accent [@mel.as "accent"] | `danger [@mel.as "danger"] | `default [@mel.as "default"] | `success [@mel.as "success"] | `warning [@mel.as "warning"] ] [@mel.as "color"]) ->
    ?size:([ `lg [@mel.as "lg"] | `md [@mel.as "md"] | `sm [@mel.as "sm"] ] [@mel.as "size"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "progressCircleVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external fill_circle : slots -> string = "fillCircle" [@@mel.send]
  external track : slots -> string = "track" [@@mel.send]
  external track_circle : slots -> string = "trackCircle" [@@mel.send]
end

(** HeroUI's [menuItemVariants]. *)
module MenuItem : sig
  type options

  external options :
    ?variant:([ `danger [@mel.as "danger"] | `default [@mel.as "default"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "menuItemVariants"
  [@@mel.module "@heroui/styles"]

  external indicator : slots -> string = "indicator" [@@mel.send]
  external item : slots -> string = "item" [@@mel.send]
  external submenu_indicator : slots -> string = "submenuIndicator" [@@mel.send]
end

(** HeroUI's [menuSectionVariants]. *)
module MenuSection : sig
  type options

  external options :
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  external classes : options -> string = "menuSectionVariants"
  [@@mel.module "@heroui/styles"]
end

(** HeroUI's [modalVariants]. *)
module Modal : sig
  type options

  external options :
    ?scroll:([ `inside [@mel.as "inside"] | `outside [@mel.as "outside"] ] [@mel.as "scroll"]) ->
    ?size:([ `cover [@mel.as "cover"] | `full [@mel.as "full"] | `lg [@mel.as "lg"] | `md [@mel.as "md"] | `sm [@mel.as "sm"] | `xs [@mel.as "xs"] ] [@mel.as "size"]) ->
    ?variant:([ `blur [@mel.as "blur"] | `opaque [@mel.as "opaque"] | `transparent [@mel.as "transparent"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "modalVariants"
  [@@mel.module "@heroui/styles"]

  external backdrop : slots -> string = "backdrop" [@@mel.send]
  external body : slots -> string = "body" [@@mel.send]
  external close_trigger : slots -> string = "closeTrigger" [@@mel.send]
  external container : slots -> string = "container" [@@mel.send]
  external dialog : slots -> string = "dialog" [@@mel.send]
  external footer : slots -> string = "footer" [@@mel.send]
  external header : slots -> string = "header" [@@mel.send]
  external heading : slots -> string = "heading" [@@mel.send]
  external icon : slots -> string = "icon" [@@mel.send]
  external trigger : slots -> string = "trigger" [@@mel.send]
end

(** HeroUI's [numberFieldVariants]. *)
module NumberField : sig
  type options

  external options :
    ?full_width:(bool [@mel.as "fullWidth"]) ->
    ?variant:([ `primary [@mel.as "primary"] | `secondary [@mel.as "secondary"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "numberFieldVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external decrement_button : slots -> string = "decrementButton" [@@mel.send]
  external group : slots -> string = "group" [@@mel.send]
  external increment_button : slots -> string = "incrementButton" [@@mel.send]
  external input : slots -> string = "input" [@@mel.send]
end

(** HeroUI's [paginationVariants]. *)
module Pagination : sig
  type options

  external options :
    ?size:([ `lg [@mel.as "lg"] | `md [@mel.as "md"] | `sm [@mel.as "sm"] ] [@mel.as "size"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "paginationVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external content : slots -> string = "content" [@@mel.send]
  external ellipsis : slots -> string = "ellipsis" [@@mel.send]
  external item : slots -> string = "item" [@@mel.send]
  external link : slots -> string = "link" [@@mel.send]
  external summary : slots -> string = "summary" [@@mel.send]
end

(** HeroUI's [popoverVariants]. *)
module Popover : sig
  type options

  external options :
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "popoverVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external dialog : slots -> string = "dialog" [@@mel.send]
  external heading : slots -> string = "heading" [@@mel.send]
  external trigger : slots -> string = "trigger" [@@mel.send]
end

(** HeroUI's [radioVariants]. *)
module Radio : sig
  type options

  external options :
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "radioVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external content : slots -> string = "content" [@@mel.send]
  external control : slots -> string = "control" [@@mel.send]
  external indicator : slots -> string = "indicator" [@@mel.send]
end

(** HeroUI's [radioGroupVariants]. *)
module RadioGroup : sig
  type options

  external options :
    ?variant:([ `primary [@mel.as "primary"] | `secondary [@mel.as "secondary"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  external classes : options -> string = "radioGroupVariants"
  [@@mel.module "@heroui/styles"]
end

(** HeroUI's [scrollShadowVariants]. *)
module ScrollShadow : sig
  type options

  external options :
    ?hide_scroll_bar:(bool [@mel.as "hideScrollBar"]) ->
    ?orientation:([ `horizontal [@mel.as "horizontal"] | `vertical [@mel.as "vertical"] ] [@mel.as "orientation"]) ->
    ?variant:([ `fade [@mel.as "fade"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "scrollShadowVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
end

(** HeroUI's [searchFieldVariants]. *)
module SearchField : sig
  type options

  external options :
    ?full_width:(bool [@mel.as "fullWidth"]) ->
    ?variant:([ `primary [@mel.as "primary"] | `secondary [@mel.as "secondary"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "searchFieldVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external clear_button : slots -> string = "clearButton" [@@mel.send]
  external group : slots -> string = "group" [@@mel.send]
  external input : slots -> string = "input" [@@mel.send]
  external search_icon : slots -> string = "searchIcon" [@@mel.send]
end

(** HeroUI's [selectVariants]. *)
module Select : sig
  type options

  external options :
    ?full_width:(bool [@mel.as "fullWidth"]) ->
    ?variant:([ `primary [@mel.as "primary"] | `secondary [@mel.as "secondary"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "selectVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external clear_button : slots -> string = "clearButton" [@@mel.send]
  external indicator : slots -> string = "indicator" [@@mel.send]
  external popover : slots -> string = "popover" [@@mel.send]
  external trigger : slots -> string = "trigger" [@@mel.send]
  external value : slots -> string = "value" [@@mel.send]
end

(** HeroUI's [separatorVariants]. *)
module Separator : sig
  type options

  external options :
    ?orientation:([ `horizontal [@mel.as "horizontal"] | `vertical [@mel.as "vertical"] ] [@mel.as "orientation"]) ->
    ?variant:([ `default [@mel.as "default"] | `secondary [@mel.as "secondary"] | `tertiary [@mel.as "tertiary"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  external classes : options -> string = "separatorVariants"
  [@@mel.module "@heroui/styles"]
end

(** HeroUI's [skeletonVariants]. *)
module Skeleton : sig
  type options

  external options :
    ?animation_type:([ `none [@mel.as "none"] | `pulse [@mel.as "pulse"] | `shimmer [@mel.as "shimmer"] ] [@mel.as "animationType"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "skeletonVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
end

(** HeroUI's [sliderVariants]. *)
module Slider : sig
  type options

  external options :
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "sliderVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external fill : slots -> string = "fill" [@@mel.send]
  external marks : slots -> string = "marks" [@@mel.send]
  external output : slots -> string = "output" [@@mel.send]
  external thumb : slots -> string = "thumb" [@@mel.send]
  external track : slots -> string = "track" [@@mel.send]
end

(** HeroUI's [spinnerVariants]. *)
module Spinner : sig
  type options

  external options :
    ?color:([ `accent [@mel.as "accent"] | `current [@mel.as "current"] | `danger [@mel.as "danger"] | `success [@mel.as "success"] | `warning [@mel.as "warning"] ] [@mel.as "color"]) ->
    ?size:([ `lg [@mel.as "lg"] | `md [@mel.as "md"] | `sm [@mel.as "sm"] | `xl [@mel.as "xl"] ] [@mel.as "size"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  external classes : options -> string = "spinnerVariants"
  [@@mel.module "@heroui/styles"]
end

(** HeroUI's [surfaceVariants]. *)
module Surface : sig
  type options

  external options :
    ?variant:([ `default [@mel.as "default"] | `secondary [@mel.as "secondary"] | `tertiary [@mel.as "tertiary"] | `transparent [@mel.as "transparent"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  external classes : options -> string = "surfaceVariants"
  [@@mel.module "@heroui/styles"]
end

(** HeroUI's [switchVariants]. *)
module Switch : sig
  type options

  external options :
    ?size:([ `lg [@mel.as "lg"] | `md [@mel.as "md"] | `sm [@mel.as "sm"] ] [@mel.as "size"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "switchVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external content : slots -> string = "content" [@@mel.send]
  external control : slots -> string = "control" [@@mel.send]
  external icon : slots -> string = "icon" [@@mel.send]
  external thumb : slots -> string = "thumb" [@@mel.send]
end

(** HeroUI's [switchGroupVariants]. *)
module SwitchGroup : sig
  type options

  external options :
    ?orientation:([ `horizontal [@mel.as "horizontal"] | `vertical [@mel.as "vertical"] ] [@mel.as "orientation"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "switchGroupVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external items : slots -> string = "items" [@@mel.send]
end

(** HeroUI's [tableVariants]. *)
module Table : sig
  type options

  external options :
    ?variant:([ `primary [@mel.as "primary"] | `secondary [@mel.as "secondary"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "tableVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external body : slots -> string = "body" [@@mel.send]
  external cell : slots -> string = "cell" [@@mel.send]
  external column : slots -> string = "column" [@@mel.send]
  external column_resizer : slots -> string = "columnResizer" [@@mel.send]
  external content : slots -> string = "content" [@@mel.send]
  external footer : slots -> string = "footer" [@@mel.send]
  external header : slots -> string = "header" [@@mel.send]
  external load_more : slots -> string = "loadMore" [@@mel.send]
  external load_more_content : slots -> string = "loadMoreContent" [@@mel.send]
  external resizable_container : slots -> string = "resizableContainer" [@@mel.send]
  external row : slots -> string = "row" [@@mel.send]
  external scroll_container : slots -> string = "scrollContainer" [@@mel.send]
  external sortable_column_header : slots -> string = "sortableColumnHeader" [@@mel.send]
  external sortable_column_indicator : slots -> string = "sortableColumnIndicator" [@@mel.send]
end

(** HeroUI's [tabsVariants]. *)
module Tabs : sig
  type options

  external options :
    ?align:([ `center [@mel.as "center"] | `end_ [@mel.as "end"] | `start [@mel.as "start"] ] [@mel.as "align"]) ->
    ?variant:([ `primary [@mel.as "primary"] | `secondary [@mel.as "secondary"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "tabsVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external scroll_next : slots -> string = "scrollNext" [@@mel.send]
  external scroll_prev : slots -> string = "scrollPrev" [@@mel.send]
  external scroller : slots -> string = "scroller" [@@mel.send]
  external separator : slots -> string = "separator" [@@mel.send]
  external tab : slots -> string = "tab" [@@mel.send]
  external tab_indicator : slots -> string = "tabIndicator" [@@mel.send]
  external tab_list : slots -> string = "tabList" [@@mel.send]
  external tab_list_container : slots -> string = "tabListContainer" [@@mel.send]
  external tab_panel : slots -> string = "tabPanel" [@@mel.send]
end

(** HeroUI's [tagVariants]. *)
module Tag : sig
  type options

  external options :
    ?size:([ `lg [@mel.as "lg"] | `md [@mel.as "md"] | `sm [@mel.as "sm"] ] [@mel.as "size"]) ->
    ?variant:([ `default [@mel.as "default"] | `surface [@mel.as "surface"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "tagVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external remove_button : slots -> string = "removeButton" [@@mel.send]
end

(** HeroUI's [tagGroupVariants]. *)
module TagGroup : sig
  type options

  external options :
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "tagGroupVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external list : slots -> string = "list" [@@mel.send]
end

(** HeroUI's [typographyVariants]. *)
module Typography : sig
  type options

  external options :
    ?align:([ `center [@mel.as "center"] | `end_ [@mel.as "end"] | `justify [@mel.as "justify"] | `start [@mel.as "start"] ] [@mel.as "align"]) ->
    ?color:([ `default [@mel.as "default"] | `muted [@mel.as "muted"] ] [@mel.as "color"]) ->
    ?truncate:(bool [@mel.as "truncate"]) ->
    ?type_:([ `body [@mel.as "body"] | `body_sm [@mel.as "body-sm"] | `body_xs [@mel.as "body-xs"] | `code [@mel.as "code"] | `h1 [@mel.as "h1"] | `h2 [@mel.as "h2"] | `h3 [@mel.as "h3"] | `h4 [@mel.as "h4"] | `h5 [@mel.as "h5"] | `h6 [@mel.as "h6"] ] [@mel.as "type"]) ->
    ?weight:([ `bold [@mel.as "bold"] | `medium [@mel.as "medium"] | `normal [@mel.as "normal"] | `semibold [@mel.as "semibold"] ] [@mel.as "weight"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "typographyVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external prose : slots -> string = "prose" [@@mel.send]
end

(** HeroUI's [textFieldVariants]. *)
module TextField : sig
  type options

  external options :
    ?full_width:(bool [@mel.as "fullWidth"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  external classes : options -> string = "textFieldVariants"
  [@@mel.module "@heroui/styles"]
end

(** HeroUI's [textAreaVariants]. *)
module TextArea : sig
  type options

  external options :
    ?full_width:(bool [@mel.as "fullWidth"]) ->
    ?variant:([ `primary [@mel.as "primary"] | `secondary [@mel.as "secondary"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  external classes : options -> string = "textAreaVariants"
  [@@mel.module "@heroui/styles"]
end

(** HeroUI's [timeFieldVariants]. *)
module TimeField : sig
  type options

  external options :
    ?full_width:(bool [@mel.as "fullWidth"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  external classes : options -> string = "timeFieldVariants"
  [@@mel.module "@heroui/styles"]
end

(** HeroUI's [toastVariants]. *)
module Toast : sig
  type options

  external options :
    ?placement:([ `bottom [@mel.as "bottom"] | `bottom_end [@mel.as "bottom end"] | `bottom_start [@mel.as "bottom start"] | `top [@mel.as "top"] | `top_end [@mel.as "top end"] | `top_start [@mel.as "top start"] ] [@mel.as "placement"]) ->
    ?variant:([ `accent [@mel.as "accent"] | `danger [@mel.as "danger"] | `default [@mel.as "default"] | `success [@mel.as "success"] | `warning [@mel.as "warning"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "toastVariants"
  [@@mel.module "@heroui/styles"]

  external action : slots -> string = "action" [@@mel.send]
  external close : slots -> string = "close" [@@mel.send]
  external content : slots -> string = "content" [@@mel.send]
  external description : slots -> string = "description" [@@mel.send]
  external indicator : slots -> string = "indicator" [@@mel.send]
  external region : slots -> string = "region" [@@mel.send]
  external title : slots -> string = "title" [@@mel.send]
  external toast : slots -> string = "toast" [@@mel.send]
end

(** HeroUI's [toggleButtonVariants]. *)
module ToggleButton : sig
  type options

  external options :
    ?is_icon_only:(bool [@mel.as "isIconOnly"]) ->
    ?size:([ `lg [@mel.as "lg"] | `md [@mel.as "md"] | `sm [@mel.as "sm"] ] [@mel.as "size"]) ->
    ?variant:([ `default [@mel.as "default"] | `ghost [@mel.as "ghost"] ] [@mel.as "variant"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  external classes : options -> string = "toggleButtonVariants"
  [@@mel.module "@heroui/styles"]
end

(** HeroUI's [toggleButtonGroupVariants]. *)
module ToggleButtonGroup : sig
  type options

  external options :
    ?full_width:(bool [@mel.as "fullWidth"]) ->
    ?is_detached:(bool [@mel.as "isDetached"]) ->
    ?orientation:([ `horizontal [@mel.as "horizontal"] | `vertical [@mel.as "vertical"] ] [@mel.as "orientation"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "toggleButtonGroupVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external separator : slots -> string = "separator" [@@mel.send]
end

(** HeroUI's [toolbarVariants]. *)
module Toolbar : sig
  type options

  external options :
    ?is_attached:(bool [@mel.as "isAttached"]) ->
    ?orientation:([ `horizontal [@mel.as "horizontal"] | `vertical [@mel.as "vertical"] ] [@mel.as "orientation"]) ->
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  external classes : options -> string = "toolbarVariants"
  [@@mel.module "@heroui/styles"]
end

(** HeroUI's [tooltipVariants]. *)
module Tooltip : sig
  type options

  external options :
    ?class_:(string [@mel.as "class"]) ->
    unit ->
    options = ""
  [@@mel.obj]

  type slots

  external slots : options -> slots = "tooltipVariants"
  [@@mel.module "@heroui/styles"]

  external base : slots -> string = "base" [@@mel.send]
  external trigger : slots -> string = "trigger" [@@mel.send]
end
