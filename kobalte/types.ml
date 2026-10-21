(* The types Kobalte's components and functions name, each a module.
   Generated from the declarations of @kobalte/core 0.13.14 by
   generate/kobalte.ts; never edited by hand. *)

(* Members of different JavaScript kinds, each as it is. *)
type ('a, 'b) either
type t_array_buffer
type t_big_int_to_locale_string_options
type t_blob
type t_date_time_format_part
type t_number_format_part
type t_readable_stream
type t_resolved_collator_options
type t_resolved_date_time_format_options
type t_resolved_number_format_options
type t_uint8_array
type t_accordion_context_value
type t_alert_dialog_portal_ref
type t_alert_dialog_portal_ref2
type t_alert_dialog_root_translations
type t_breadcrumbs_root_translations
type t_breadcrumbs_context_value
type t_checkbox_root_state
type t_checkbox_context_value
type t_collapsible_context_value
type t_color_area_root_translations
type t_color
type t_color_area_context_value
type t_color_channel_field_root_translations
type t_color_field_context_value
type 't t_context
type t_color_mode_context_type
type t_color_mode_storage_manager
type t_color_slider_root_translations
type t_color_slider_context_value
type t_color_swatch_root_translations
type t_color_wheel_context_value
type 'option t_combobox_control_state
type 't t_collection_node
type 't t_collection
type t_combobox_root_translations
type t_anchor_rect
type t_keyboard_delegate
type 'option t_combobox_base_item_component_props
type 'opt_group t_combobox_base_section_component_props
type t_combobox_context_value
type t_context_menu_context_value
type t_dialog_context_value
type t_file_field_context_value
type t_file
type t_file_field_root_translations
type t_file_rejection
type t_details
type t_hover_card_context_value
type t_collator_options
type t_collator
type t_date_time_format_options
type t_date_time_format
type t_i18n_create_default_locale
type t_filter
type t_number_format_options
type t_number_format
type t_locale
type t_i18n_use_locale
type t_image_context_value
type t_list_state
type t_listbox_context_value
type t_menubar_context_value
type t_get_value_label_params
type t_meter_context_value
type t_navigation_menu_context_value
type t_number_format_options2
type t_number_field_context_value
type t_pagination_root_item_component
type t_pagination_context_value
type t_popover_root_translations
type t_popover_context_value
type t_progress_context_value
type t_radio_group_context_value
type t_rating_item_state
type t_search_context_value
type t_segmented_control_context_value
type 't t_select_base_item_component_props
type 't t_select_base_section_component_props
type 'option t_select_value_state
type t_select_context_value
type t_get_value_label_params2
type t_slider_context_value
type t_switch_root_state
type t_switch_context_value
type t_tabs_context_value
type t_text_field_context_value
type t_time
type t_time_field_root_granularity
type t_time_field_root_translations
type t_toast_region_translations
type t_toast_root_translations
type t_swipe_event
type t_toast_toaster
type t_toast_context_value
type t_toggle_button_root_state
type t_toggle_group_context_value
type t_tooltip_context_value
type t_checkbox_data_set
type t_collapsible_data_set
type t_color_channel_range
type t_color_get_color_space_axes
type t_color_axes
type t_color_area_state
type t_color_area_context_value_on_drag
type t_color_field_context_value_on_blur
type ('t, 'e, 'e_handler) t_bound_event_handler
type t_context_id
type ('p, 'c) t_flow_props
type t_context_provider
type t_color_wheel_state
type t_color_wheel_context_value_on_drag
type t_combobox_data_set
type t_combobox_context_value_on_input_key_down
type t_context_menu_context_value_set_anchor_rect
type t_hover_card_data_set
type t_date_time_format_format_range
type t_selection_manager
type t_menubar_data_set
type t_meter_data_set
type t_navigation_menu_data_set
type t_number_field_context_value_on_input
type t_popover_data_set
type t_progress_data_set
type t_select_data_set
type t_slider_data_set
type t_slider_state
type t_collection_item_with_ref
type t_slider_context_value_on_slide_move
type t_switch_data_set
type t_single_select_list_state
type t_text_field_context_value_on_input
type t_swipe_event_detail
type t_toast_component_props
type t_show_toast_options
type ('t, 'u) t_toast_promise_component_props
type t_tooltip_data_set
type t_color_area_state_get_thumb_position
type t_color_area_state_channels
type t_color_area_state_get_thumb_percent
type t_color_area_state_set_thumb_percent
type t_color_area_state_set_thumb_value
type t_color_wheel_state_get_thumb_position
type t_multiple_selection_state
type t_swipe_event_detail_delta

module Either = struct
  type ('a, 'b) t = ('a, 'b) either

  external left : 'a -> ('a, 'b) t = "%identity"
  external right : 'b -> ('a, 'b) t = "%identity"
end

(* The standard library's ArrayBuffer, opaque. *)
module ArrayBuffer = struct
  type t = t_array_buffer
end

(* The standard library's BigIntToLocaleStringOptions, opaque. *)
module BigIntToLocaleStringOptions = struct
  type t = t_big_int_to_locale_string_options
end

(* The standard library's Blob, opaque. *)
module Blob = struct
  type t = t_blob
end

(* The standard library's DateTimeFormatPart, opaque. *)
module DateTimeFormatPart = struct
  type t = t_date_time_format_part
end

(* The standard library's NumberFormatPart, opaque. *)
module NumberFormatPart = struct
  type t = t_number_format_part
end

(* The standard library's ReadableStream, opaque. *)
module ReadableStream = struct
  type t = t_readable_stream
end

(* The standard library's ResolvedCollatorOptions, opaque. *)
module ResolvedCollatorOptions = struct
  type t = t_resolved_collator_options
end

(* The standard library's ResolvedDateTimeFormatOptions, opaque. *)
module ResolvedDateTimeFormatOptions = struct
  type t = t_resolved_date_time_format_options
end

(* The standard library's ResolvedNumberFormatOptions, opaque. *)
module ResolvedNumberFormatOptions = struct
  type t = t_resolved_number_format_options
end

(* The standard library's Uint8Array, opaque. *)
module Uint8Array = struct
  type t = t_uint8_array
end

module AccordionContextValue = struct
  type t = t_accordion_context_value
  external list_state : t -> t_list_state Solidtype.Solid.accessor = "listState" [@@mel.get]
  external generate_id : t -> string -> string = "generateId" [@@mel.send]
  external make : list_state:(t_list_state Solidtype.Solid.accessor [@mel.as "listState"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> unit -> t = "" [@@mel.obj]
end

module AlertDialog_Portal_Ref = struct
  type t = t_alert_dialog_portal_ref
  (** The `Element.shadowRoot` read-only property represents the shadow root hosted by the element.
      
      \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Element/shadowRoot) *)
  external shadow_root : t -> Dom.shadowRoot = "shadowRoot" [@@mel.get]
  external to_element : t -> Dom.element = "%identity"
end

module AlertDialog_Portal_Ref2 = struct
  type t = t_alert_dialog_portal_ref2
  (** The `Element.shadowRoot` read-only property represents the shadow root hosted by the element.
      
      \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Element/shadowRoot) *)
  external shadow_root : t -> Dom.shadowRoot = "shadowRoot" [@@mel.get]
  external to_html_div_element : t -> Dom.htmlDivElement = "%identity"
end

module AlertDialog_Root_Translations = struct
  type t = t_alert_dialog_root_translations
  external dismiss : t -> string = "dismiss" [@@mel.get]
  external make : dismiss:(string [@mel.as "dismiss"]) -> unit -> t = "" [@@mel.obj]
end

module Breadcrumbs_Root_Translations = struct
  type t = t_breadcrumbs_root_translations
  external breadcrumbs : t -> string = "breadcrumbs" [@@mel.get]
  external make : breadcrumbs:(string [@mel.as "breadcrumbs"]) -> unit -> t = "" [@@mel.obj]
end

module BreadcrumbsContextValue = struct
  type t = t_breadcrumbs_context_value
  external separator : t -> unit -> Solidtype.Jsx.element = "separator" [@@mel.send]
  external make : separator:((unit -> Solidtype.Jsx.element) [@mel.as "separator"]) -> unit -> t = "" [@@mel.obj]
end

module CheckboxRootState = struct
  type t = t_checkbox_root_state
  (** Whether the checkbox is checked or not. *)
  external checked : t -> bool Solidtype.Solid.accessor = "checked" [@@mel.get]
  (** Whether the checkbox is in an indeterminate state. *)
  external indeterminate : t -> bool Solidtype.Solid.accessor = "indeterminate" [@@mel.get]
  external make : checked:(bool Solidtype.Solid.accessor [@mel.as "checked"]) -> indeterminate:(bool Solidtype.Solid.accessor [@mel.as "indeterminate"]) -> unit -> t = "" [@@mel.obj]
end

module CheckboxContextValue = struct
  type t = t_checkbox_context_value
  external value : t -> string Solidtype.Solid.accessor = "value" [@@mel.get]
  external dataset : t -> t_checkbox_data_set Solidtype.Solid.accessor = "dataset" [@@mel.get]
  external checked : t -> bool Solidtype.Solid.accessor = "checked" [@@mel.get]
  external indeterminate : t -> bool Solidtype.Solid.accessor = "indeterminate" [@@mel.get]
  external input_ref : t -> Dom.htmlInputElement option Solidtype.Solid.accessor = "inputRef" [@@mel.get]
  external generate_id : t -> string -> string = "generateId" [@@mel.send]
  external toggle : t -> unit -> unit = "toggle" [@@mel.send]
  external set_is_checked : t -> bool -> unit = "setIsChecked" [@@mel.send]
  external set_is_focused : t -> bool -> unit = "setIsFocused" [@@mel.send]
  external set_input_ref : t -> Dom.htmlInputElement -> unit = "setInputRef" [@@mel.send]
  external make : value:(string Solidtype.Solid.accessor [@mel.as "value"]) -> dataset:(t_checkbox_data_set Solidtype.Solid.accessor [@mel.as "dataset"]) -> checked:(bool Solidtype.Solid.accessor [@mel.as "checked"]) -> indeterminate:(bool Solidtype.Solid.accessor [@mel.as "indeterminate"]) -> input_ref:(Dom.htmlInputElement option Solidtype.Solid.accessor [@mel.as "inputRef"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> toggle:((unit -> unit) [@mel.as "toggle"]) -> set_is_checked:((bool -> unit) [@mel.as "setIsChecked"]) -> set_is_focused:((bool -> unit) [@mel.as "setIsFocused"]) -> set_input_ref:((Dom.htmlInputElement -> unit) [@mel.as "setInputRef"]) -> unit -> t = "" [@@mel.obj]
end

module CollapsibleContextValue = struct
  type t = t_collapsible_context_value
  external dataset : t -> t_collapsible_data_set Solidtype.Solid.accessor = "dataset" [@@mel.get]
  external is_open : t -> bool Solidtype.Solid.accessor = "isOpen" [@@mel.get]
  external disabled : t -> bool Solidtype.Solid.accessor = "disabled" [@@mel.get]
  external should_mount : t -> bool Solidtype.Solid.accessor = "shouldMount" [@@mel.get]
  external content_id : t -> string option Solidtype.Solid.accessor = "contentId" [@@mel.get]
  external toggle : t -> unit -> unit = "toggle" [@@mel.send]
  external generate_id : t -> string -> string = "generateId" [@@mel.send]
  external register_content_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerContentId" [@@mel.get]
  let register_content_id o x0 = let r = (register_content_id_js o) x0 [@u] in fun () -> r () [@u]
  external make_js : dataset:(t_collapsible_data_set Solidtype.Solid.accessor [@mel.as "dataset"]) -> is_open:(bool Solidtype.Solid.accessor [@mel.as "isOpen"]) -> disabled:(bool Solidtype.Solid.accessor [@mel.as "disabled"]) -> should_mount:(bool Solidtype.Solid.accessor [@mel.as "shouldMount"]) -> content_id:(string option Solidtype.Solid.accessor [@mel.as "contentId"]) -> toggle:((unit -> unit) [@mel.as "toggle"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> register_content_id:((string -> (unit -> unit)) [@mel.as "registerContentId"]) -> unit -> t = "" [@@mel.obj]
  let make ~dataset ~is_open ~disabled ~should_mount ~content_id ~toggle ~generate_id ~register_content_id () = make_js ~dataset ~is_open ~disabled ~should_mount ~content_id ~toggle ~generate_id ~register_content_id:(fun x0 -> let r = register_content_id x0 in fun () -> r ()) ()
end

module ColorArea_Root_Translations = struct
  type t = t_color_area_root_translations
  external color_picker : t -> string = "colorPicker" [@@mel.get]
  external two_dimensional_slider : t -> string = "twoDimensionalSlider" [@@mel.get]
  external make : color_picker:(string [@mel.as "colorPicker"]) -> two_dimensional_slider:(string [@mel.as "twoDimensionalSlider"]) -> unit -> t = "" [@@mel.obj]
end

(** Represents a color value. *)
module Color = struct
  type t = t_color
  external to_format_js : t -> [ `rgb | `hsl | `hsb | `hex | `hexa | `rgba | `hsla | `hsba ] -> t_color = "toFormat" [@@mel.send]
  (** Converts the color to the given color format, and returns a new Color object.
      
      @raise Invalid_argument with Kobalte's message, where it throws. *)
  let to_format o x0 =
    match to_format_js o x0 with
    | v -> v
    | exception Js.Exn.Error e -> invalid_arg ("to_format: " ^ Option.value (Js.Exn.message e) ~default:"")
  external to_string : t -> ?format:[ `rgb | `hsl | `hsb | `hex | `hexa | `rgba | `hsla | `hsba | `css ] -> unit -> string = "toString" [@@mel.send]
  external clone : t -> unit -> t_color = "clone" [@@mel.send]
  external to_hex_int : t -> unit -> float = "toHexInt" [@@mel.send]
  external get_channel_value_js : t -> [ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] -> float = "getChannelValue" [@@mel.send]
  (** Returns the numeric value for a given channel.
      Throws an error if the channel is unsupported in the current color format.
      
      @raise Invalid_argument with Kobalte's message, where it throws. *)
  let get_channel_value o x0 =
    match get_channel_value_js o x0 with
    | v -> v
    | exception Js.Exn.Error e -> invalid_arg ("get_channel_value: " ^ Option.value (Js.Exn.message e) ~default:"")
  external with_channel_value_js : t -> [ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] -> float -> t_color = "withChannelValue" [@@mel.send]
  (** Sets the numeric value for a given channel, and returns a new Color object.
      Throws an error if the channel is unsupported in the current color format.
      
      @raise Invalid_argument with Kobalte's message, where it throws. *)
  let with_channel_value o x0 x1 =
    match with_channel_value_js o x0 x1 with
    | v -> v
    | exception Js.Exn.Error e -> invalid_arg ("with_channel_value: " ^ Option.value (Js.Exn.message e) ~default:"")
  external get_channel_range : t -> [ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] -> t_color_channel_range = "getChannelRange" [@@mel.send]
  external get_channel_name : t -> [ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] -> t_color_slider_root_translations -> string = "getChannelName" [@@mel.send]
  external get_channel_format_options : t -> [ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] -> t_number_format_options2 = "getChannelFormatOptions" [@@mel.send]
  external format_channel_value : t -> [ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] -> string = "formatChannelValue" [@@mel.send]
  external get_color_space : t -> unit -> [ `rgb | `hsl | `hsb ] = "getColorSpace" [@@mel.send]
  external get_color_space_axes : t -> t_color_get_color_space_axes -> t_color_axes = "getColorSpaceAxes" [@@mel.send]
  external get_color_channels : t -> unit -> ([ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] * [ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] * [ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ]) = "getColorChannels" [@@mel.send]
  external get_color_name : t -> t_color_slider_root_translations -> string = "getColorName" [@@mel.send]
  external get_hue_name : t -> t_color_slider_root_translations -> string = "getHueName" [@@mel.send]
end

module ColorAreaContextValue = struct
  type t = t_color_area_context_value
  external state : t -> t_color_area_state = "state" [@@mel.get]
  external x_name : t -> string option Solidtype.Solid.accessor = "xName" [@@mel.get]
  external y_name : t -> string option Solidtype.Solid.accessor = "yName" [@@mel.get]
  external on_drag_start : t -> ((float array -> unit) option) = "onDragStart" [@@mel.get]
  external on_drag : t -> ((t_color_area_context_value_on_drag -> unit) option) = "onDrag" [@@mel.get]
  external on_drag_end : t -> ((unit -> unit) option) = "onDragEnd" [@@mel.get]
  external translations : t -> t_color_area_root_translations Solidtype.Solid.accessor = "translations" [@@mel.get]
  external get_display_color : t -> unit -> t_color = "getDisplayColor" [@@mel.send]
  external on_step_key_down : t -> Dom.keyboardEvent -> unit = "onStepKeyDown" [@@mel.send]
  external thumb_ref : t -> Dom.htmlElement option Solidtype.Solid.accessor = "thumbRef" [@@mel.get]
  external set_thumb_ref : t -> Dom.htmlElement -> unit = "setThumbRef" [@@mel.send]
  external background_ref : t -> Dom.htmlElement option Solidtype.Solid.accessor = "backgroundRef" [@@mel.get]
  external set_background_ref : t -> Dom.htmlElement -> unit = "setBackgroundRef" [@@mel.send]
  external generate_id : t -> string -> string = "generateId" [@@mel.send]
  external make : state:(t_color_area_state [@mel.as "state"]) -> x_name:(string option Solidtype.Solid.accessor [@mel.as "xName"]) -> y_name:(string option Solidtype.Solid.accessor [@mel.as "yName"]) -> on_drag_start:(((float array -> unit) option) [@mel.as "onDragStart"]) -> on_drag:(((t_color_area_context_value_on_drag -> unit) option) [@mel.as "onDrag"]) -> on_drag_end:(((unit -> unit) option) [@mel.as "onDragEnd"]) -> translations:(t_color_area_root_translations Solidtype.Solid.accessor [@mel.as "translations"]) -> get_display_color:((unit -> t_color) [@mel.as "getDisplayColor"]) -> on_step_key_down:((Dom.keyboardEvent -> unit) [@mel.as "onStepKeyDown"]) -> thumb_ref:(Dom.htmlElement option Solidtype.Solid.accessor [@mel.as "thumbRef"]) -> set_thumb_ref:((Dom.htmlElement -> unit) [@mel.as "setThumbRef"]) -> background_ref:(Dom.htmlElement option Solidtype.Solid.accessor [@mel.as "backgroundRef"]) -> set_background_ref:((Dom.htmlElement -> unit) [@mel.as "setBackgroundRef"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> unit -> t = "" [@@mel.obj]
end

module ColorChannelField_Root_Translations = struct
  type t = t_color_channel_field_root_translations
  external empty : t -> string = "empty" [@@mel.get]
  external make : empty:(string [@mel.as "empty"]) -> unit -> t = "" [@@mel.obj]
end

module ColorFieldContextValue = struct
  type t = t_color_field_context_value
  external on_blur : t -> ((t_color_field_context_value_on_blur -> unit, (Dom.htmlInputElement, Dom.focusEvent, t_color_field_context_value_on_blur -> unit) t_bound_event_handler) either) = "onBlur" [@@mel.get]
  external make : on_blur:(((t_color_field_context_value_on_blur -> unit, (Dom.htmlInputElement, Dom.focusEvent, t_color_field_context_value_on_blur -> unit) t_bound_event_handler) either) [@mel.as "onBlur"]) -> unit -> t = "" [@@mel.obj]
end

module Context = struct
  type 't t = 't t_context
  external id : 't t -> t_context_id = "id" [@@mel.get]
  external provider : 't t -> (t_context_provider, Solidtype.Jsx.element) t_flow_props -> Solidtype.Jsx.element = "Provider" [@@mel.send]
  external default_value : 't t -> 't = "defaultValue" [@@mel.get]
  external make : id:(t_context_id [@mel.as "id"]) -> provider:(((t_context_provider, Solidtype.Jsx.element) t_flow_props -> Solidtype.Jsx.element) [@mel.as "Provider"]) -> default_value:('t [@mel.as "defaultValue"]) -> unit -> 't t = "" [@@mel.obj]
end

module ColorModeContextType = struct
  type t = t_color_mode_context_type
  external color_mode : t -> [ `light | `dark ] Solidtype.Solid.accessor = "colorMode" [@@mel.get]
  external set_color_mode : t -> [ `light | `dark | `system ] -> unit = "setColorMode" [@@mel.send]
  external toggle_color_mode : t -> unit -> unit = "toggleColorMode" [@@mel.send]
  external make : color_mode:([ `light | `dark ] Solidtype.Solid.accessor [@mel.as "colorMode"]) -> set_color_mode:(([ `light | `dark | `system ] -> unit) [@mel.as "setColorMode"]) -> toggle_color_mode:((unit -> unit) [@mel.as "toggleColorMode"]) -> unit -> t = "" [@@mel.obj]
end

module ColorModeStorageManager = struct
  type t = t_color_mode_storage_manager
  (** The type of storage. *)
  external type_ : t -> [ `localStorage | `cookie ] = "type" [@@mel.get]
  (** Whether it's an SSR environment. *)
  external ssr : t -> bool option = "ssr" [@@mel.get]
  (** Get the color mode from the storage. *)
  external get : t -> ?fallback:[ `light | `dark | `system ] -> unit -> [ `light | `dark | `system ] option = "get" [@@mel.send]
  (** Save the color mode in the storage. *)
  external set : t -> [ `light | `dark | `system ] -> unit = "set" [@@mel.send]
  external make : type_:([ `localStorage | `cookie ] [@mel.as "type"]) -> ?ssr:(bool [@mel.as "ssr"]) -> get:(([ `light | `dark | `system ] option -> [ `light | `dark | `system ] option) [@mel.as "get"]) -> set:(([ `light | `dark | `system ] -> unit) [@mel.as "set"]) -> unit -> t = "" [@@mel.obj]
end

module ColorSlider_Root_Translations = struct
  type t = t_color_slider_root_translations
  external hue : t -> string = "hue" [@@mel.get]
  external saturation : t -> string = "saturation" [@@mel.get]
  external lightness : t -> string = "lightness" [@@mel.get]
  external brightness : t -> string = "brightness" [@@mel.get]
  external red : t -> string = "red" [@@mel.get]
  external green : t -> string = "green" [@@mel.get]
  external blue : t -> string = "blue" [@@mel.get]
  external alpha : t -> string = "alpha" [@@mel.get]
  external color_name : t -> string -> string -> string -> string = "colorName" [@@mel.send]
  external transparent_color_name : t -> string -> string -> string -> string -> string = "transparentColorName" [@@mel.send]
  external dark : t -> string = "dark" [@@mel.get]
  external light : t -> string = "light" [@@mel.get]
  external pale : t -> string = "pale" [@@mel.get]
  external grayish : t -> string = "grayish" [@@mel.get]
  external vibrant : t -> string = "vibrant" [@@mel.get]
  external black : t -> string = "black" [@@mel.get]
  external white : t -> string = "white" [@@mel.get]
  external gray : t -> string = "gray" [@@mel.get]
  external pink : t -> string = "pink" [@@mel.get]
  external brown : t -> string = "brown" [@@mel.get]
  external orange : t -> string = "orange" [@@mel.get]
  external yellow : t -> string = "yellow" [@@mel.get]
  external cyan : t -> string = "cyan" [@@mel.get]
  external purple : t -> string = "purple" [@@mel.get]
  external magenta : t -> string = "magenta" [@@mel.get]
  external make : hue:(string [@mel.as "hue"]) -> saturation:(string [@mel.as "saturation"]) -> lightness:(string [@mel.as "lightness"]) -> brightness:(string [@mel.as "brightness"]) -> red:(string [@mel.as "red"]) -> green:(string [@mel.as "green"]) -> blue:(string [@mel.as "blue"]) -> alpha:(string [@mel.as "alpha"]) -> color_name:((string -> string -> string -> string) [@mel.as "colorName"]) -> transparent_color_name:((string -> string -> string -> string -> string) [@mel.as "transparentColorName"]) -> dark:(string [@mel.as "dark"]) -> light:(string [@mel.as "light"]) -> pale:(string [@mel.as "pale"]) -> grayish:(string [@mel.as "grayish"]) -> vibrant:(string [@mel.as "vibrant"]) -> black:(string [@mel.as "black"]) -> white:(string [@mel.as "white"]) -> gray:(string [@mel.as "gray"]) -> pink:(string [@mel.as "pink"]) -> brown:(string [@mel.as "brown"]) -> orange:(string [@mel.as "orange"]) -> yellow:(string [@mel.as "yellow"]) -> cyan:(string [@mel.as "cyan"]) -> purple:(string [@mel.as "purple"]) -> magenta:(string [@mel.as "magenta"]) -> unit -> t = "" [@@mel.obj]
end

module ColorSliderContextValue = struct
  type t = t_color_slider_context_value
  external value : t -> t_color Solidtype.Solid.accessor = "value" [@@mel.get]
  external channel : t -> [ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] Solidtype.Solid.accessor = "channel" [@@mel.get]
  external get_display_color : t -> unit -> t_color = "getDisplayColor" [@@mel.send]
  external translations : t -> t_color_slider_root_translations Solidtype.Solid.accessor = "translations" [@@mel.get]
  external make : value:(t_color Solidtype.Solid.accessor [@mel.as "value"]) -> channel:([ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] Solidtype.Solid.accessor [@mel.as "channel"]) -> get_display_color:((unit -> t_color) [@mel.as "getDisplayColor"]) -> translations:(t_color_slider_root_translations Solidtype.Solid.accessor [@mel.as "translations"]) -> unit -> t = "" [@@mel.obj]
end

module ColorSwatch_Root_Translations = struct
  type t = t_color_swatch_root_translations
  external role_description : t -> string = "roleDescription" [@@mel.get]
  external transparent : t -> string = "transparent" [@@mel.get]
  external make : role_description:(string [@mel.as "roleDescription"]) -> transparent:(string [@mel.as "transparent"]) -> unit -> t = "" [@@mel.obj]
end

module ColorWheelContextValue = struct
  type t = t_color_wheel_context_value
  external state : t -> t_color_wheel_state = "state" [@@mel.get]
  external outer_radius : t -> float option Solidtype.Solid.accessor = "outerRadius" [@@mel.get]
  external thickness : t -> float Solidtype.Solid.accessor = "thickness" [@@mel.get]
  external on_drag_start : t -> ((float array -> unit) option) = "onDragStart" [@@mel.get]
  external on_drag : t -> ((t_color_wheel_context_value_on_drag -> unit) option) = "onDrag" [@@mel.get]
  external on_drag_end : t -> ((unit -> unit) option) = "onDragEnd" [@@mel.get]
  external get_thumb_value_label : t -> unit -> string = "getThumbValueLabel" [@@mel.send]
  external get_value_label : t -> t_color -> string = "getValueLabel" [@@mel.send]
  external on_step_key_down : t -> Dom.keyboardEvent -> unit = "onStepKeyDown" [@@mel.send]
  external thumb_ref : t -> Dom.htmlElement option Solidtype.Solid.accessor = "thumbRef" [@@mel.get]
  external set_thumb_ref : t -> Dom.htmlElement -> unit = "setThumbRef" [@@mel.send]
  external track_ref : t -> Dom.htmlElement option Solidtype.Solid.accessor = "trackRef" [@@mel.get]
  external set_track_ref : t -> Dom.htmlElement -> unit = "setTrackRef" [@@mel.send]
  external generate_id : t -> string -> string = "generateId" [@@mel.send]
  external make : state:(t_color_wheel_state [@mel.as "state"]) -> outer_radius:(float option Solidtype.Solid.accessor [@mel.as "outerRadius"]) -> thickness:(float Solidtype.Solid.accessor [@mel.as "thickness"]) -> on_drag_start:(((float array -> unit) option) [@mel.as "onDragStart"]) -> on_drag:(((t_color_wheel_context_value_on_drag -> unit) option) [@mel.as "onDrag"]) -> on_drag_end:(((unit -> unit) option) [@mel.as "onDragEnd"]) -> get_thumb_value_label:((unit -> string) [@mel.as "getThumbValueLabel"]) -> get_value_label:((t_color -> string) [@mel.as "getValueLabel"]) -> on_step_key_down:((Dom.keyboardEvent -> unit) [@mel.as "onStepKeyDown"]) -> thumb_ref:(Dom.htmlElement option Solidtype.Solid.accessor [@mel.as "thumbRef"]) -> set_thumb_ref:((Dom.htmlElement -> unit) [@mel.as "setThumbRef"]) -> track_ref:(Dom.htmlElement option Solidtype.Solid.accessor [@mel.as "trackRef"]) -> set_track_ref:((Dom.htmlElement -> unit) [@mel.as "setTrackRef"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> unit -> t = "" [@@mel.obj]
end

module ComboboxControlState = struct
  type 'option t = 'option t_combobox_control_state
  (** The selected options. *)
  external selected_options : 'option t -> 'option array Solidtype.Solid.accessor = "selectedOptions" [@@mel.get]
  (** A function to remove an option from the selection. *)
  external remove : 'option t -> 'option -> unit = "remove" [@@mel.send]
  (** A function to clear the selection. *)
  external clear : 'option t -> unit -> unit = "clear" [@@mel.send]
  external make : selected_options:('option array Solidtype.Solid.accessor [@mel.as "selectedOptions"]) -> remove:(('option -> unit) [@mel.as "remove"]) -> clear:((unit -> unit) [@mel.as "clear"]) -> unit -> 'option t = "" [@@mel.obj]
end

module CollectionNode = struct
  type 't t = 't t_collection_node
  (** The type of item this node represents. *)
  external type_ : 't t -> [ `section | `item ] = "type" [@@mel.get]
  (** A unique key for the node. *)
  external key : 't t -> string = "key" [@@mel.get]
  (** The source object this node was created from. *)
  external raw_value : 't t -> 't = "rawValue" [@@mel.get]
  (** A string value for the node, used for features like typeahead. *)
  external text_value : 't t -> string = "textValue" [@@mel.get]
  (** Whether the node is disabled. *)
  external disabled : 't t -> bool = "disabled" [@@mel.get]
  (** The level of depth this node is at in the hierarchy. *)
  external level : 't t -> float = "level" [@@mel.get]
  (** The index of this node within its parent. *)
  external index : 't t -> float = "index" [@@mel.get]
  (** The key of the node before this node. *)
  external prev_key : 't t -> string option = "prevKey" [@@mel.get]
  (** The key of the node after this node. *)
  external next_key : 't t -> string option = "nextKey" [@@mel.get]
  external make : type_:([ `section | `item ] [@mel.as "type"]) -> key:(string [@mel.as "key"]) -> raw_value:('t [@mel.as "rawValue"]) -> text_value:(string [@mel.as "textValue"]) -> disabled:(bool [@mel.as "disabled"]) -> level:(float [@mel.as "level"]) -> index:(float [@mel.as "index"]) -> ?prev_key:(string [@mel.as "prevKey"]) -> ?next_key:(string [@mel.as "nextKey"]) -> unit -> 't t = "" [@@mel.obj]
end

(** A generic interface to access a readonly sequential
    collection of unique keyed items. *)
module Collection = struct
  type 't t = 't t_collection
  (** The number of items in the collection. *)
  external get_size : 't t -> unit -> float = "getSize" [@@mel.send]
  (** Iterate over all keys in the collection. *)
  external get_keys : 't t -> unit -> string array = "getKeys" [@@mel.send]
  (** Get an item by its key. *)
  external get_item : 't t -> string -> 't option = "getItem" [@@mel.send]
  (** Get an item by the index of its key. *)
  external at : 't t -> float -> 't option = "at" [@@mel.send]
  (** Get the key that comes before the given key in the collection. *)
  external get_key_before : 't t -> string -> string option = "getKeyBefore" [@@mel.send]
  (** Get the key that comes after the given key in the collection. *)
  external get_key_after : 't t -> string -> string option = "getKeyAfter" [@@mel.send]
  (** Get the first key in the collection. *)
  external get_first_key : 't t -> unit -> string option = "getFirstKey" [@@mel.send]
  (** Get the last key in the collection. *)
  external get_last_key : 't t -> unit -> string option = "getLastKey" [@@mel.send]
  external make : get_size:((unit -> float) [@mel.as "getSize"]) -> get_keys:((unit -> string array) [@mel.as "getKeys"]) -> get_item:((string -> 't option) [@mel.as "getItem"]) -> at:((float -> 't option) [@mel.as "at"]) -> get_key_before:((string -> string option) [@mel.as "getKeyBefore"]) -> get_key_after:((string -> string option) [@mel.as "getKeyAfter"]) -> get_first_key:((unit -> string option) [@mel.as "getFirstKey"]) -> get_last_key:((unit -> string option) [@mel.as "getLastKey"]) -> unit -> 't t = "" [@@mel.obj]
end

module Combobox_Root_Translations = struct
  type t = t_combobox_root_translations
  external focus_announcement : t -> string -> bool -> string = "focusAnnouncement" [@@mel.send]
  external count_announcement : t -> float -> string option = "countAnnouncement" [@@mel.send]
  external selected_announcement : t -> string -> string = "selectedAnnouncement" [@@mel.send]
  external trigger_label : t -> string = "triggerLabel" [@@mel.get]
  external listbox_label : t -> string = "listboxLabel" [@@mel.get]
  external make : focus_announcement:((string -> bool -> string) [@mel.as "focusAnnouncement"]) -> count_announcement:((float -> string option) [@mel.as "countAnnouncement"]) -> selected_announcement:((string -> string) [@mel.as "selectedAnnouncement"]) -> trigger_label:(string [@mel.as "triggerLabel"]) -> listbox_label:(string [@mel.as "listboxLabel"]) -> unit -> t = "" [@@mel.obj]
end

module AnchorRect = struct
  type t = t_anchor_rect
  external x : t -> float option = "x" [@@mel.get]
  external y : t -> float option = "y" [@@mel.get]
  external width : t -> float option = "width" [@@mel.get]
  external height : t -> float option = "height" [@@mel.get]
  external make : ?x:(float [@mel.as "x"]) -> ?y:(float [@mel.as "y"]) -> ?width:(float [@mel.as "width"]) -> ?height:(float [@mel.as "height"]) -> unit -> t = "" [@@mel.obj]
end

module KeyboardDelegate = struct
  type t = t_keyboard_delegate
  (** Returns the key visually below the given one, or `undefined` for none. *)
  external get_key_below : t -> (string -> string option) option = "getKeyBelow" [@@mel.get]
  (** Returns the key visually above the given one, or `undefined` for none. *)
  external get_key_above : t -> (string -> string option) option = "getKeyAbove" [@@mel.get]
  (** Returns the key visually to the left of the given one, or `undefined` for none. *)
  external get_key_left_of : t -> (string -> string option) option = "getKeyLeftOf" [@@mel.get]
  (** Returns the key visually to the right of the given one, or `undefined` for none. *)
  external get_key_right_of : t -> (string -> string option) option = "getKeyRightOf" [@@mel.get]
  (** Returns the key visually one page below the given one, or `undefined` for none. *)
  external get_key_page_below : t -> (string -> string option) option = "getKeyPageBelow" [@@mel.get]
  (** Returns the key visually one page above the given one, or `undefined` for none. *)
  external get_key_page_above : t -> (string -> string option) option = "getKeyPageAbove" [@@mel.get]
  (** Returns the first key, or `undefined` for none. *)
  external get_first_key : t -> (string option -> bool option -> string option) option = "getFirstKey" [@@mel.get]
  (** Returns the last key, or `undefined` for none. *)
  external get_last_key : t -> (string option -> bool option -> string option) option = "getLastKey" [@@mel.get]
  (** Returns the next key after `fromKey` that matches the given search string, or `undefined` for none. *)
  external get_key_for_search : t -> (string -> string option -> string option) option = "getKeyForSearch" [@@mel.get]
  external make : ?get_key_below:((string -> string option) [@mel.as "getKeyBelow"]) -> ?get_key_above:((string -> string option) [@mel.as "getKeyAbove"]) -> ?get_key_left_of:((string -> string option) [@mel.as "getKeyLeftOf"]) -> ?get_key_right_of:((string -> string option) [@mel.as "getKeyRightOf"]) -> ?get_key_page_below:((string -> string option) [@mel.as "getKeyPageBelow"]) -> ?get_key_page_above:((string -> string option) [@mel.as "getKeyPageAbove"]) -> ?get_first_key:((string option -> bool option -> string option) [@mel.as "getFirstKey"]) -> ?get_last_key:((string option -> bool option -> string option) [@mel.as "getLastKey"]) -> ?get_key_for_search:((string -> string option -> string option) [@mel.as "getKeyForSearch"]) -> unit -> t = "" [@@mel.obj]
end

module ComboboxBaseItemComponentProps = struct
  type 'option t = 'option t_combobox_base_item_component_props
  (** The item to render. *)
  external item : 'option t -> 'option t_collection_node = "item" [@@mel.get]
  external make : item:('option t_collection_node [@mel.as "item"]) -> unit -> 'option t = "" [@@mel.obj]
end

module ComboboxBaseSectionComponentProps = struct
  type 'opt_group t = 'opt_group t_combobox_base_section_component_props
  (** The section to render. *)
  external section : 'opt_group t -> 'opt_group t_collection_node = "section" [@@mel.get]
  external make : section:('opt_group t_collection_node [@mel.as "section"]) -> unit -> 'opt_group t = "" [@@mel.obj]
end

module ComboboxContextValue = struct
  type t = t_combobox_context_value
  external dataset : t -> t_combobox_data_set Solidtype.Solid.accessor = "dataset" [@@mel.get]
  external is_open : t -> bool Solidtype.Solid.accessor = "isOpen" [@@mel.get]
  external is_disabled : t -> bool Solidtype.Solid.accessor = "isDisabled" [@@mel.get]
  external is_multiple : t -> bool Solidtype.Solid.accessor = "isMultiple" [@@mel.get]
  external is_virtualized : t -> bool Solidtype.Solid.accessor = "isVirtualized" [@@mel.get]
  external is_modal : t -> bool Solidtype.Solid.accessor = "isModal" [@@mel.get]
  external prevent_scroll : t -> bool Solidtype.Solid.accessor = "preventScroll" [@@mel.get]
  external is_input_focused : t -> bool Solidtype.Solid.accessor = "isInputFocused" [@@mel.get]
  external allows_empty_collection : t -> bool Solidtype.Solid.accessor = "allowsEmptyCollection" [@@mel.get]
  external should_focus_wrap : t -> bool Solidtype.Solid.accessor = "shouldFocusWrap" [@@mel.get]
  external remove_on_backspace : t -> bool Solidtype.Solid.accessor = "removeOnBackspace" [@@mel.get]
  external content_present : t -> bool Solidtype.Solid.accessor = "contentPresent" [@@mel.get]
  external auto_focus : t -> ([ `first | `last ], bool) either Solidtype.Solid.accessor = "autoFocus" [@@mel.get]
  external active_descendant : t -> string option Solidtype.Solid.accessor = "activeDescendant" [@@mel.get]
  external input_value : t -> string option Solidtype.Solid.accessor = "inputValue" [@@mel.get]
  external trigger_mode : t -> [ `focus | `input | `manual ] Solidtype.Solid.accessor = "triggerMode" [@@mel.get]
  external control_ref : t -> Dom.htmlElement option Solidtype.Solid.accessor = "controlRef" [@@mel.get]
  external input_ref : t -> Dom.htmlInputElement option Solidtype.Solid.accessor = "inputRef" [@@mel.get]
  external trigger_ref : t -> Dom.htmlElement option Solidtype.Solid.accessor = "triggerRef" [@@mel.get]
  external content_ref : t -> Dom.htmlElement option Solidtype.Solid.accessor = "contentRef" [@@mel.get]
  external listbox_id : t -> string option Solidtype.Solid.accessor = "listboxId" [@@mel.get]
  external trigger_aria_label : t -> string option Solidtype.Solid.accessor = "triggerAriaLabel" [@@mel.get]
  external listbox_aria_label : t -> string option Solidtype.Solid.accessor = "listboxAriaLabel" [@@mel.get]
  external list_state : t -> t_list_state Solidtype.Solid.accessor = "listState" [@@mel.get]
  external keyboard_delegate : t -> t_keyboard_delegate Solidtype.Solid.accessor = "keyboardDelegate" [@@mel.get]
  external reset_input_value : t -> string Js.Set.t -> unit = "resetInputValue" [@@mel.send]
  external set_is_input_focused : t -> bool -> unit = "setIsInputFocused" [@@mel.send]
  external set_input_value : t -> string -> unit = "setInputValue" [@@mel.send]
  external set_control_ref : t -> Dom.htmlElement -> unit = "setControlRef" [@@mel.send]
  external set_input_ref : t -> Dom.htmlInputElement -> unit = "setInputRef" [@@mel.send]
  external set_trigger_ref : t -> Dom.htmlElement -> unit = "setTriggerRef" [@@mel.send]
  external set_content_ref : t -> Dom.htmlElement -> unit = "setContentRef" [@@mel.send]
  external set_listbox_ref : t -> Dom.htmlElement -> unit = "setListboxRef" [@@mel.send]
  external open_ : t -> ([ `first | `last ], bool) either -> ?trigger_mode:[ `focus | `input | `manual ] -> unit -> unit = "open" [@@mel.send]
  external close : t -> unit -> unit = "close" [@@mel.send]
  external toggle : t -> ([ `first | `last ], bool) either -> ?trigger_mode:[ `focus | `input | `manual ] -> unit -> unit = "toggle" [@@mel.send]
  external placeholder : t -> Solidtype.Jsx.element Solidtype.Solid.accessor = "placeholder" [@@mel.get]
  external render_item : t -> _ t_collection_node -> Solidtype.Jsx.element = "renderItem" [@@mel.send]
  external render_section : t -> _ t_collection_node -> Solidtype.Jsx.element = "renderSection" [@@mel.send]
  external on_input_key_down : t -> ((t_combobox_context_value_on_input_key_down -> unit, (Dom.htmlInputElement, Dom.keyboardEvent, t_combobox_context_value_on_input_key_down -> unit) t_bound_event_handler) either) = "onInputKeyDown" [@@mel.get]
  external generate_id : t -> string -> string = "generateId" [@@mel.send]
  external register_listbox_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerListboxId" [@@mel.get]
  let register_listbox_id o x0 = let r = (register_listbox_id_js o) x0 [@u] in fun () -> r () [@u]
  external make_js : dataset:(t_combobox_data_set Solidtype.Solid.accessor [@mel.as "dataset"]) -> is_open:(bool Solidtype.Solid.accessor [@mel.as "isOpen"]) -> is_disabled:(bool Solidtype.Solid.accessor [@mel.as "isDisabled"]) -> is_multiple:(bool Solidtype.Solid.accessor [@mel.as "isMultiple"]) -> is_virtualized:(bool Solidtype.Solid.accessor [@mel.as "isVirtualized"]) -> is_modal:(bool Solidtype.Solid.accessor [@mel.as "isModal"]) -> prevent_scroll:(bool Solidtype.Solid.accessor [@mel.as "preventScroll"]) -> is_input_focused:(bool Solidtype.Solid.accessor [@mel.as "isInputFocused"]) -> allows_empty_collection:(bool Solidtype.Solid.accessor [@mel.as "allowsEmptyCollection"]) -> should_focus_wrap:(bool Solidtype.Solid.accessor [@mel.as "shouldFocusWrap"]) -> remove_on_backspace:(bool Solidtype.Solid.accessor [@mel.as "removeOnBackspace"]) -> content_present:(bool Solidtype.Solid.accessor [@mel.as "contentPresent"]) -> auto_focus:(([ `first | `last ], bool) either Solidtype.Solid.accessor [@mel.as "autoFocus"]) -> active_descendant:(string option Solidtype.Solid.accessor [@mel.as "activeDescendant"]) -> input_value:(string option Solidtype.Solid.accessor [@mel.as "inputValue"]) -> trigger_mode:([ `focus | `input | `manual ] Solidtype.Solid.accessor [@mel.as "triggerMode"]) -> control_ref:(Dom.htmlElement option Solidtype.Solid.accessor [@mel.as "controlRef"]) -> input_ref:(Dom.htmlInputElement option Solidtype.Solid.accessor [@mel.as "inputRef"]) -> trigger_ref:(Dom.htmlElement option Solidtype.Solid.accessor [@mel.as "triggerRef"]) -> content_ref:(Dom.htmlElement option Solidtype.Solid.accessor [@mel.as "contentRef"]) -> listbox_id:(string option Solidtype.Solid.accessor [@mel.as "listboxId"]) -> trigger_aria_label:(string option Solidtype.Solid.accessor [@mel.as "triggerAriaLabel"]) -> listbox_aria_label:(string option Solidtype.Solid.accessor [@mel.as "listboxAriaLabel"]) -> list_state:(t_list_state Solidtype.Solid.accessor [@mel.as "listState"]) -> keyboard_delegate:(t_keyboard_delegate Solidtype.Solid.accessor [@mel.as "keyboardDelegate"]) -> reset_input_value:((string Js.Set.t -> unit) [@mel.as "resetInputValue"]) -> set_is_input_focused:((bool -> unit) [@mel.as "setIsInputFocused"]) -> set_input_value:((string -> unit) [@mel.as "setInputValue"]) -> set_control_ref:((Dom.htmlElement -> unit) [@mel.as "setControlRef"]) -> set_input_ref:((Dom.htmlInputElement -> unit) [@mel.as "setInputRef"]) -> set_trigger_ref:((Dom.htmlElement -> unit) [@mel.as "setTriggerRef"]) -> set_content_ref:((Dom.htmlElement -> unit) [@mel.as "setContentRef"]) -> set_listbox_ref:((Dom.htmlElement -> unit) [@mel.as "setListboxRef"]) -> open_:((([ `first | `last ], bool) either -> [ `focus | `input | `manual ] option -> unit) [@mel.as "open"]) -> close:((unit -> unit) [@mel.as "close"]) -> toggle:((([ `first | `last ], bool) either -> [ `focus | `input | `manual ] option -> unit) [@mel.as "toggle"]) -> placeholder:(Solidtype.Jsx.element Solidtype.Solid.accessor [@mel.as "placeholder"]) -> render_item:((_ t_collection_node -> Solidtype.Jsx.element) [@mel.as "renderItem"]) -> render_section:((_ t_collection_node -> Solidtype.Jsx.element) [@mel.as "renderSection"]) -> on_input_key_down:(((t_combobox_context_value_on_input_key_down -> unit, (Dom.htmlInputElement, Dom.keyboardEvent, t_combobox_context_value_on_input_key_down -> unit) t_bound_event_handler) either) [@mel.as "onInputKeyDown"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> register_listbox_id:((string -> (unit -> unit)) [@mel.as "registerListboxId"]) -> unit -> t = "" [@@mel.obj]
  let make ~dataset ~is_open ~is_disabled ~is_multiple ~is_virtualized ~is_modal ~prevent_scroll ~is_input_focused ~allows_empty_collection ~should_focus_wrap ~remove_on_backspace ~content_present ~auto_focus ~active_descendant ~input_value ~trigger_mode ~control_ref ~input_ref ~trigger_ref ~content_ref ~listbox_id ~trigger_aria_label ~listbox_aria_label ~list_state ~keyboard_delegate ~reset_input_value ~set_is_input_focused ~set_input_value ~set_control_ref ~set_input_ref ~set_trigger_ref ~set_content_ref ~set_listbox_ref ~open_ ~close ~toggle ~placeholder ~render_item ~render_section ~on_input_key_down ~generate_id ~register_listbox_id () = make_js ~dataset ~is_open ~is_disabled ~is_multiple ~is_virtualized ~is_modal ~prevent_scroll ~is_input_focused ~allows_empty_collection ~should_focus_wrap ~remove_on_backspace ~content_present ~auto_focus ~active_descendant ~input_value ~trigger_mode ~control_ref ~input_ref ~trigger_ref ~content_ref ~listbox_id ~trigger_aria_label ~listbox_aria_label ~list_state ~keyboard_delegate ~reset_input_value ~set_is_input_focused ~set_input_value ~set_control_ref ~set_input_ref ~set_trigger_ref ~set_content_ref ~set_listbox_ref ~open_ ~close ~toggle ~placeholder ~render_item ~render_section ~on_input_key_down ~generate_id ~register_listbox_id:(fun x0 -> let r = register_listbox_id x0 in fun () -> r ()) ()
end

module ContextMenuContextValue = struct
  type t = t_context_menu_context_value
  external set_anchor_rect : t -> t_context_menu_context_value_set_anchor_rect Solidtype.Solid.setter = "setAnchorRect" [@@mel.get]
  external make : set_anchor_rect:(t_context_menu_context_value_set_anchor_rect Solidtype.Solid.setter [@mel.as "setAnchorRect"]) -> unit -> t = "" [@@mel.obj]
end

module DialogContextValue = struct
  type t = t_dialog_context_value
  external translations : t -> t_alert_dialog_root_translations Solidtype.Solid.accessor = "translations" [@@mel.get]
  external is_open : t -> bool Solidtype.Solid.accessor = "isOpen" [@@mel.get]
  external modal : t -> bool Solidtype.Solid.accessor = "modal" [@@mel.get]
  external prevent_scroll : t -> bool Solidtype.Solid.accessor = "preventScroll" [@@mel.get]
  external content_id : t -> string option Solidtype.Solid.accessor = "contentId" [@@mel.get]
  external title_id : t -> string option Solidtype.Solid.accessor = "titleId" [@@mel.get]
  external description_id : t -> string option Solidtype.Solid.accessor = "descriptionId" [@@mel.get]
  external trigger_ref : t -> Dom.htmlElement option Solidtype.Solid.accessor = "triggerRef" [@@mel.get]
  external overlay_ref : t -> Dom.htmlElement option Solidtype.Solid.accessor = "overlayRef" [@@mel.get]
  external set_overlay_ref : t -> Dom.htmlElement option Solidtype.Solid.setter = "setOverlayRef" [@@mel.get]
  external content_ref : t -> Dom.htmlElement option Solidtype.Solid.accessor = "contentRef" [@@mel.get]
  external set_content_ref : t -> Dom.htmlElement option Solidtype.Solid.setter = "setContentRef" [@@mel.get]
  external overlay_present : t -> bool Solidtype.Solid.accessor = "overlayPresent" [@@mel.get]
  external content_present : t -> bool Solidtype.Solid.accessor = "contentPresent" [@@mel.get]
  external close : t -> unit -> unit = "close" [@@mel.send]
  external toggle : t -> unit -> unit = "toggle" [@@mel.send]
  external set_trigger_ref : t -> Dom.htmlElement option Solidtype.Solid.setter = "setTriggerRef" [@@mel.get]
  external generate_id : t -> string -> string = "generateId" [@@mel.send]
  external register_content_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerContentId" [@@mel.get]
  let register_content_id o x0 = let r = (register_content_id_js o) x0 [@u] in fun () -> r () [@u]
  external register_title_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerTitleId" [@@mel.get]
  let register_title_id o x0 = let r = (register_title_id_js o) x0 [@u] in fun () -> r () [@u]
  external register_description_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerDescriptionId" [@@mel.get]
  let register_description_id o x0 = let r = (register_description_id_js o) x0 [@u] in fun () -> r () [@u]
  external make_js : translations:(t_alert_dialog_root_translations Solidtype.Solid.accessor [@mel.as "translations"]) -> is_open:(bool Solidtype.Solid.accessor [@mel.as "isOpen"]) -> modal:(bool Solidtype.Solid.accessor [@mel.as "modal"]) -> prevent_scroll:(bool Solidtype.Solid.accessor [@mel.as "preventScroll"]) -> content_id:(string option Solidtype.Solid.accessor [@mel.as "contentId"]) -> title_id:(string option Solidtype.Solid.accessor [@mel.as "titleId"]) -> description_id:(string option Solidtype.Solid.accessor [@mel.as "descriptionId"]) -> trigger_ref:(Dom.htmlElement option Solidtype.Solid.accessor [@mel.as "triggerRef"]) -> overlay_ref:(Dom.htmlElement option Solidtype.Solid.accessor [@mel.as "overlayRef"]) -> set_overlay_ref:(Dom.htmlElement option Solidtype.Solid.setter [@mel.as "setOverlayRef"]) -> content_ref:(Dom.htmlElement option Solidtype.Solid.accessor [@mel.as "contentRef"]) -> set_content_ref:(Dom.htmlElement option Solidtype.Solid.setter [@mel.as "setContentRef"]) -> overlay_present:(bool Solidtype.Solid.accessor [@mel.as "overlayPresent"]) -> content_present:(bool Solidtype.Solid.accessor [@mel.as "contentPresent"]) -> close:((unit -> unit) [@mel.as "close"]) -> toggle:((unit -> unit) [@mel.as "toggle"]) -> set_trigger_ref:(Dom.htmlElement option Solidtype.Solid.setter [@mel.as "setTriggerRef"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> register_content_id:((string -> (unit -> unit)) [@mel.as "registerContentId"]) -> register_title_id:((string -> (unit -> unit)) [@mel.as "registerTitleId"]) -> register_description_id:((string -> (unit -> unit)) [@mel.as "registerDescriptionId"]) -> unit -> t = "" [@@mel.obj]
  let make ~translations ~is_open ~modal ~prevent_scroll ~content_id ~title_id ~description_id ~trigger_ref ~overlay_ref ~set_overlay_ref ~content_ref ~set_content_ref ~overlay_present ~content_present ~close ~toggle ~set_trigger_ref ~generate_id ~register_content_id ~register_title_id ~register_description_id () = make_js ~translations ~is_open ~modal ~prevent_scroll ~content_id ~title_id ~description_id ~trigger_ref ~overlay_ref ~set_overlay_ref ~content_ref ~set_content_ref ~overlay_present ~content_present ~close ~toggle ~set_trigger_ref ~generate_id ~register_content_id:(fun x0 -> let r = register_content_id x0 in fun () -> r ()) ~register_title_id:(fun x0 -> let r = register_title_id x0 in fun () -> r ()) ~register_description_id:(fun x0 -> let r = register_description_id x0 in fun () -> r ()) ()
end

module FileFieldContextValue = struct
  type t = t_file_field_context_value
  external translations : t -> t_file_field_root_translations Solidtype.Solid.accessor = "translations" [@@mel.get]
  external input_id : t -> string Solidtype.Solid.accessor = "inputId" [@@mel.get]
  external file_input_ref : t -> Dom.htmlInputElement option Solidtype.Solid.accessor = "fileInputRef" [@@mel.get]
  external set_file_input_ref : t -> Dom.htmlInputElement option Solidtype.Solid.setter = "setFileInputRef" [@@mel.get]
  external dropzone_ref : t -> Dom.htmlElement option Solidtype.Solid.accessor = "dropzoneRef" [@@mel.get]
  external set_dropzone_ref : t -> Dom.htmlElement option Solidtype.Solid.setter = "setDropzoneRef" [@@mel.get]
  external disabled : t -> bool option Solidtype.Solid.accessor = "disabled" [@@mel.get]
  external multiple : t -> bool option Solidtype.Solid.accessor = "multiple" [@@mel.get]
  external accept : t -> string option Solidtype.Solid.accessor = "accept" [@@mel.get]
  external allow_drag_and_drop : t -> bool option Solidtype.Solid.accessor = "allowDragAndDrop" [@@mel.get]
  external process_files : t -> t_file array -> unit = "processFiles" [@@mel.send]
  external accepted_files : t -> t_file array = "acceptedFiles" [@@mel.get]
  external rejected_files : t -> t_file_rejection array = "rejectedFiles" [@@mel.get]
  external remove_file : t -> t_file -> unit = "removeFile" [@@mel.send]
  external make : translations:(t_file_field_root_translations Solidtype.Solid.accessor [@mel.as "translations"]) -> input_id:(string Solidtype.Solid.accessor [@mel.as "inputId"]) -> file_input_ref:(Dom.htmlInputElement option Solidtype.Solid.accessor [@mel.as "fileInputRef"]) -> set_file_input_ref:(Dom.htmlInputElement option Solidtype.Solid.setter [@mel.as "setFileInputRef"]) -> dropzone_ref:(Dom.htmlElement option Solidtype.Solid.accessor [@mel.as "dropzoneRef"]) -> set_dropzone_ref:(Dom.htmlElement option Solidtype.Solid.setter [@mel.as "setDropzoneRef"]) -> disabled:(bool option Solidtype.Solid.accessor [@mel.as "disabled"]) -> multiple:(bool option Solidtype.Solid.accessor [@mel.as "multiple"]) -> accept:(string option Solidtype.Solid.accessor [@mel.as "accept"]) -> allow_drag_and_drop:(bool option Solidtype.Solid.accessor [@mel.as "allowDragAndDrop"]) -> process_files:((t_file array -> unit) [@mel.as "processFiles"]) -> accepted_files:(t_file array [@mel.as "acceptedFiles"]) -> rejected_files:(t_file_rejection array [@mel.as "rejectedFiles"]) -> remove_file:((t_file -> unit) [@mel.as "removeFile"]) -> unit -> t = "" [@@mel.obj]
end

(** The **`File`** interface provides information about files and allows JavaScript in a web page to access their content.
    
    \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/File) *)
module File = struct
  type t = t_file
  (** The **`lastModified`** read-only property of the File interface provides the last modified date of the file as the number of milliseconds since the Unix epoch (January 1, 1970 at midnight).
      
      \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/File/lastModified) *)
  external last_modified : t -> float = "lastModified" [@@mel.get]
  (** The **`name`** read-only property of the File interface returns the name of the file represented by a File object.
      
      \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/File/name) *)
  external name : t -> string = "name" [@@mel.get]
  (** The **`webkitRelativePath`** read-only property of the File interface contains a string which specifies the file's path relative to the directory selected by the user in an input element with its `webkitdirectory` attribute set.
      
      \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/File/webkitRelativePath) *)
  external webkit_relative_path : t -> string = "webkitRelativePath" [@@mel.get]
  (** The **`size`** read-only property of the Blob interface returns the size of the Blob or File in bytes.
      
      \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Blob/size) *)
  external size : t -> float = "size" [@@mel.get]
  (** The **`type`** read-only property of the Blob interface returns the MIME type of the file.
      
      \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Blob/type) *)
  external type_ : t -> string = "type" [@@mel.get]
  external array_buffer : t -> unit -> t_array_buffer Js.Promise.t = "arrayBuffer" [@@mel.send]
  external bytes : t -> unit -> t_uint8_array Js.Promise.t = "bytes" [@@mel.send]
  external slice : t -> ?start:float -> ?end_:float -> ?content_type:string -> unit -> t_blob = "slice" [@@mel.send]
  external stream : t -> unit -> t_readable_stream = "stream" [@@mel.send]
  external text : t -> unit -> string Js.Promise.t = "text" [@@mel.send]
end

module FileField_Root_Translations = struct
  type t = t_file_field_root_translations
  external bytes : t -> string = "bytes" [@@mel.get]
  external kb : t -> string = "kb" [@@mel.get]
  external mb : t -> string = "mb" [@@mel.get]
  external gb : t -> string = "gb" [@@mel.get]
  external tb : t -> string = "tb" [@@mel.get]
  external make : bytes:(string [@mel.as "bytes"]) -> kb:(string [@mel.as "kb"]) -> mb:(string [@mel.as "mb"]) -> gb:(string [@mel.as "gb"]) -> tb:(string [@mel.as "tb"]) -> unit -> t = "" [@@mel.obj]
end

module FileRejection = struct
  type t = t_file_rejection
  external file : t -> t_file = "file" [@@mel.get]
  external errors : t -> [ `TOO_MANY_FILES | `FILE_INVALID_TYPE | `FILE_TOO_LARGE | `FILE_TOO_SMALL ] array = "errors" [@@mel.get]
  external make : file:(t_file [@mel.as "file"]) -> errors:([ `TOO_MANY_FILES | `FILE_INVALID_TYPE | `FILE_TOO_LARGE | `FILE_TOO_SMALL ] array [@mel.as "errors"]) -> unit -> t = "" [@@mel.obj]
end

module Details = struct
  type t = t_details
  external accepted_files : t -> t_file array = "acceptedFiles" [@@mel.get]
  external rejected_files : t -> t_file_rejection array = "rejectedFiles" [@@mel.get]
  external make : accepted_files:(t_file array [@mel.as "acceptedFiles"]) -> rejected_files:(t_file_rejection array [@mel.as "rejectedFiles"]) -> unit -> t = "" [@@mel.obj]
end

module HoverCardContextValue = struct
  type t = t_hover_card_context_value
  external dataset : t -> t_hover_card_data_set Solidtype.Solid.accessor = "dataset" [@@mel.get]
  external is_open : t -> bool Solidtype.Solid.accessor = "isOpen" [@@mel.get]
  external content_present : t -> bool Solidtype.Solid.accessor = "contentPresent" [@@mel.get]
  external open_with_delay : t -> unit -> unit = "openWithDelay" [@@mel.send]
  external close_with_delay : t -> unit -> unit = "closeWithDelay" [@@mel.send]
  external cancel_opening : t -> unit -> unit = "cancelOpening" [@@mel.send]
  external cancel_closing : t -> unit -> unit = "cancelClosing" [@@mel.send]
  external close : t -> unit -> unit = "close" [@@mel.send]
  external is_target_on_hover_card : t -> Dom.node Js.Nullable.t -> bool = "isTargetOnHoverCard" [@@mel.send]
  external set_trigger_ref : t -> Dom.htmlElement -> unit = "setTriggerRef" [@@mel.send]
  external set_content_ref : t -> Dom.htmlElement -> unit = "setContentRef" [@@mel.send]
  external make : dataset:(t_hover_card_data_set Solidtype.Solid.accessor [@mel.as "dataset"]) -> is_open:(bool Solidtype.Solid.accessor [@mel.as "isOpen"]) -> content_present:(bool Solidtype.Solid.accessor [@mel.as "contentPresent"]) -> open_with_delay:((unit -> unit) [@mel.as "openWithDelay"]) -> close_with_delay:((unit -> unit) [@mel.as "closeWithDelay"]) -> cancel_opening:((unit -> unit) [@mel.as "cancelOpening"]) -> cancel_closing:((unit -> unit) [@mel.as "cancelClosing"]) -> close:((unit -> unit) [@mel.as "close"]) -> is_target_on_hover_card:((Dom.node Js.Nullable.t -> bool) [@mel.as "isTargetOnHoverCard"]) -> set_trigger_ref:((Dom.htmlElement -> unit) [@mel.as "setTriggerRef"]) -> set_content_ref:((Dom.htmlElement -> unit) [@mel.as "setContentRef"]) -> unit -> t = "" [@@mel.obj]
end

module CollatorOptions = struct
  type t = t_collator_options
  external usage : t -> [ `search | `sort ] option = "usage" [@@mel.get]
  external locale_matcher : t -> string option = "localeMatcher" [@@mel.get]
  external numeric : t -> bool option = "numeric" [@@mel.get]
  external case_first : t -> string option = "caseFirst" [@@mel.get]
  external sensitivity : t -> [ `base | `accent | `case | `variant ] option = "sensitivity" [@@mel.get]
  external collation : t -> [ `big5han | `compat | `dict | `direct | `ducet | `emoji | `eor | `gb2312 | `phonebk | `phonetic | `pinyin | `reformed | `searchjl | `stroke | `trad | `unihan | `zhuyin ] option = "collation" [@@mel.get]
  external ignore_punctuation : t -> bool option = "ignorePunctuation" [@@mel.get]
  external make : ?usage:([ `search | `sort ] [@mel.as "usage"]) -> ?locale_matcher:(string [@mel.as "localeMatcher"]) -> ?numeric:(bool [@mel.as "numeric"]) -> ?case_first:(string [@mel.as "caseFirst"]) -> ?sensitivity:([ `base | `accent | `case | `variant ] [@mel.as "sensitivity"]) -> ?collation:([ `big5han | `compat | `dict | `direct | `ducet | `emoji | `eor | `gb2312 | `phonebk | `phonetic | `pinyin | `reformed | `searchjl | `stroke | `trad | `unihan | `zhuyin ] [@mel.as "collation"]) -> ?ignore_punctuation:(bool [@mel.as "ignorePunctuation"]) -> unit -> t = "" [@@mel.obj]
end

module Collator = struct
  type t = t_collator
  external compare : t -> string -> string -> float = "compare" [@@mel.send]
  external resolved_options : t -> unit -> t_resolved_collator_options = "resolvedOptions" [@@mel.send]
end

module DateTimeFormatOptions = struct
  type t = t_date_time_format_options
  external locale_matcher : t -> string option = "localeMatcher" [@@mel.get]
  external weekday : t -> [ `long | `short | `narrow ] option = "weekday" [@@mel.get]
  external era : t -> [ `long | `short | `narrow ] option = "era" [@@mel.get]
  external year : t -> string option = "year" [@@mel.get]
  external month : t -> string option = "month" [@@mel.get]
  external day : t -> string option = "day" [@@mel.get]
  external hour : t -> string option = "hour" [@@mel.get]
  external minute : t -> string option = "minute" [@@mel.get]
  external second : t -> string option = "second" [@@mel.get]
  external time_zone_name : t -> [ `long | `short | `shortOffset | `longOffset | `shortGeneric | `longGeneric ] option = "timeZoneName" [@@mel.get]
  external format_matcher : t -> string option = "formatMatcher" [@@mel.get]
  external hour12 : t -> bool option = "hour12" [@@mel.get]
  external time_zone : t -> string option = "timeZone" [@@mel.get]
  external calendar : t -> string option = "calendar" [@@mel.get]
  external day_period : t -> [ `long | `short | `narrow ] option = "dayPeriod" [@@mel.get]
  external numbering_system : t -> string option = "numberingSystem" [@@mel.get]
  external date_style : t -> [ `long | `short | `full | `medium ] option = "dateStyle" [@@mel.get]
  external time_style : t -> [ `long | `short | `full | `medium ] option = "timeStyle" [@@mel.get]
  external hour_cycle : t -> [ `h11 | `h12 | `h23 | `h24 ] option = "hourCycle" [@@mel.get]
  external fractional_second_digits : t -> float option = "fractionalSecondDigits" [@@mel.get]
  external make : ?locale_matcher:(string [@mel.as "localeMatcher"]) -> ?weekday:([ `long | `short | `narrow ] [@mel.as "weekday"]) -> ?era:([ `long | `short | `narrow ] [@mel.as "era"]) -> ?year:(string [@mel.as "year"]) -> ?month:(string [@mel.as "month"]) -> ?day:(string [@mel.as "day"]) -> ?hour:(string [@mel.as "hour"]) -> ?minute:(string [@mel.as "minute"]) -> ?second:(string [@mel.as "second"]) -> ?time_zone_name:([ `long | `short | `shortOffset | `longOffset | `shortGeneric | `longGeneric ] [@mel.as "timeZoneName"]) -> ?format_matcher:(string [@mel.as "formatMatcher"]) -> ?hour12:(bool [@mel.as "hour12"]) -> ?time_zone:(string [@mel.as "timeZone"]) -> ?calendar:(string [@mel.as "calendar"]) -> ?day_period:([ `long | `short | `narrow ] [@mel.as "dayPeriod"]) -> ?numbering_system:(string [@mel.as "numberingSystem"]) -> ?date_style:([ `long | `short | `full | `medium ] [@mel.as "dateStyle"]) -> ?time_style:([ `long | `short | `full | `medium ] [@mel.as "timeStyle"]) -> ?hour_cycle:([ `h11 | `h12 | `h23 | `h24 ] [@mel.as "hourCycle"]) -> ?fractional_second_digits:(float [@mel.as "fractionalSecondDigits"]) -> unit -> t = "" [@@mel.obj]
end

module DateTimeFormat = struct
  type t = t_date_time_format
  external format : t -> ?date:(float, Js.Date.t) either -> unit -> string = "format" [@@mel.send]
  external resolved_options : t -> unit -> t_resolved_date_time_format_options = "resolvedOptions" [@@mel.send]
  external format_to_parts : t -> ?date:(float, Js.Date.t) either -> unit -> t_date_time_format_part array = "formatToParts" [@@mel.send]
end

module I18n_CreateDefaultLocale = struct
  type t = t_i18n_create_default_locale
  external locale : t -> unit -> string = "locale" [@@mel.send]
  external direction : t -> unit -> [ `rtl | `ltr ] = "direction" [@@mel.send]
  external make : locale:((unit -> string) [@mel.as "locale"]) -> direction:((unit -> [ `rtl | `ltr ]) [@mel.as "direction"]) -> unit -> t = "" [@@mel.obj]
end

module Filter = struct
  type t = t_filter
  external starts_with : t -> string -> string -> bool = "startsWith" [@@mel.send]
  external ends_with : t -> string -> string -> bool = "endsWith" [@@mel.send]
  external contains : t -> string -> string -> bool = "contains" [@@mel.send]
end

module NumberFormatOptions = struct
  type t = t_number_format_options
  (** Overrides default numbering system for the current locale. *)
  external numbering_system : t -> string option = "numberingSystem" [@@mel.get]
  external locale_matcher : t -> string option = "localeMatcher" [@@mel.get]
  external style : t -> [ `decimal | `percent | `currency | `unit ] option = "style" [@@mel.get]
  external currency : t -> string option = "currency" [@@mel.get]
  external currency_display : t -> [ `symbol | `code | `name | `narrowSymbol ] option = "currencyDisplay" [@@mel.get]
  external use_grouping : t -> (string, bool) either option = "useGrouping" [@@mel.get]
  external minimum_integer_digits : t -> float option = "minimumIntegerDigits" [@@mel.get]
  external minimum_fraction_digits : t -> float option = "minimumFractionDigits" [@@mel.get]
  external maximum_fraction_digits : t -> float option = "maximumFractionDigits" [@@mel.get]
  external minimum_significant_digits : t -> float option = "minimumSignificantDigits" [@@mel.get]
  external maximum_significant_digits : t -> float option = "maximumSignificantDigits" [@@mel.get]
  external compact_display : t -> [ `long | `short ] option = "compactDisplay" [@@mel.get]
  external notation : t -> [ `standard | `scientific | `engineering | `compact ] option = "notation" [@@mel.get]
  external sign_display : t -> [ `auto | `always | `never | `exceptZero | `negative ] option = "signDisplay" [@@mel.get]
  external unit : t -> string option = "unit" [@@mel.get]
  external unit_display : t -> [ `long | `short | `narrow ] option = "unitDisplay" [@@mel.get]
  external currency_sign : t -> [ `standard | `accounting ] option = "currencySign" [@@mel.get]
  external rounding_priority : t -> [ `auto | `morePrecision | `lessPrecision ] option = "roundingPriority" [@@mel.get]
  external rounding_increment : t -> float option = "roundingIncrement" [@@mel.get]
  external rounding_mode : t -> [ `ceil | `floor | `expand | `trunc | `halfCeil | `halfFloor | `halfExpand | `halfTrunc | `halfEven ] option = "roundingMode" [@@mel.get]
  external trailing_zero_display : t -> [ `auto | `stripIfInteger ] option = "trailingZeroDisplay" [@@mel.get]
  external make : ?numbering_system:(string [@mel.as "numberingSystem"]) -> ?locale_matcher:(string [@mel.as "localeMatcher"]) -> ?style:([ `decimal | `percent | `currency | `unit ] [@mel.as "style"]) -> ?currency:(string [@mel.as "currency"]) -> ?currency_display:([ `symbol | `code | `name | `narrowSymbol ] [@mel.as "currencyDisplay"]) -> ?use_grouping:((string, bool) either [@mel.as "useGrouping"]) -> ?minimum_integer_digits:(float [@mel.as "minimumIntegerDigits"]) -> ?minimum_fraction_digits:(float [@mel.as "minimumFractionDigits"]) -> ?maximum_fraction_digits:(float [@mel.as "maximumFractionDigits"]) -> ?minimum_significant_digits:(float [@mel.as "minimumSignificantDigits"]) -> ?maximum_significant_digits:(float [@mel.as "maximumSignificantDigits"]) -> ?compact_display:([ `long | `short ] [@mel.as "compactDisplay"]) -> ?notation:([ `standard | `scientific | `engineering | `compact ] [@mel.as "notation"]) -> ?sign_display:([ `auto | `always | `never | `exceptZero | `negative ] [@mel.as "signDisplay"]) -> ?unit:(string [@mel.as "unit"]) -> ?unit_display:([ `long | `short | `narrow ] [@mel.as "unitDisplay"]) -> ?currency_sign:([ `standard | `accounting ] [@mel.as "currencySign"]) -> ?rounding_priority:([ `auto | `morePrecision | `lessPrecision ] [@mel.as "roundingPriority"]) -> ?rounding_increment:(float [@mel.as "roundingIncrement"]) -> ?rounding_mode:([ `ceil | `floor | `expand | `trunc | `halfCeil | `halfFloor | `halfExpand | `halfTrunc | `halfEven ] [@mel.as "roundingMode"]) -> ?trailing_zero_display:([ `auto | `stripIfInteger ] [@mel.as "trailingZeroDisplay"]) -> unit -> t = "" [@@mel.obj]
end

module NumberFormat = struct
  type t = t_number_format
  external format : t -> float -> string = "format" [@@mel.send]
  external resolved_options : t -> unit -> t_resolved_number_format_options = "resolvedOptions" [@@mel.send]
  external format_to_parts : t -> ?number:(float, t_date_time_format_format_range) either -> unit -> t_number_format_part array = "formatToParts" [@@mel.send]
end

module Locale = struct
  type t = t_locale
  (** The \[BCP47\](https://www.ietf.org/rfc/bcp/bcp47.txt) language code for the locale. *)
  external locale : t -> string = "locale" [@@mel.get]
  (** The writing direction for the locale. *)
  external direction : t -> [ `rtl | `ltr ] = "direction" [@@mel.get]
  external make : locale:(string [@mel.as "locale"]) -> direction:([ `rtl | `ltr ] [@mel.as "direction"]) -> unit -> t = "" [@@mel.obj]
end

module I18n_UseLocale = struct
  type t = t_i18n_use_locale
  external locale : t -> unit -> string = "locale" [@@mel.send]
  external direction : t -> unit -> [ `rtl | `ltr ] = "direction" [@@mel.send]
  external make : locale:((unit -> string) [@mel.as "locale"]) -> direction:((unit -> [ `rtl | `ltr ]) [@mel.as "direction"]) -> unit -> t = "" [@@mel.obj]
end

module ImageContextValue = struct
  type t = t_image_context_value
  external fallback_delay : t -> float option Solidtype.Solid.accessor = "fallbackDelay" [@@mel.get]
  external image_loading_status : t -> [ `idle | `loading | `loaded | `error ] Solidtype.Solid.accessor = "imageLoadingStatus" [@@mel.get]
  external on_image_loading_status_change : t -> [ `idle | `loading | `loaded | `error ] -> unit = "onImageLoadingStatusChange" [@@mel.send]
  external make : fallback_delay:(float option Solidtype.Solid.accessor [@mel.as "fallbackDelay"]) -> image_loading_status:([ `idle | `loading | `loaded | `error ] Solidtype.Solid.accessor [@mel.as "imageLoadingStatus"]) -> on_image_loading_status_change:(([ `idle | `loading | `loaded | `error ] -> unit) [@mel.as "onImageLoadingStatusChange"]) -> unit -> t = "" [@@mel.obj]
end

module ListState = struct
  type t = t_list_state
  (** A collection of items in the list. *)
  external collection : t -> _ t_collection_node t_collection Solidtype.Solid.accessor = "collection" [@@mel.get]
  (** A selection manager to read and update multiple selection state. *)
  external selection_manager : t -> t_selection_manager Solidtype.Solid.accessor = "selectionManager" [@@mel.get]
  external make : collection:(_ t_collection_node t_collection Solidtype.Solid.accessor [@mel.as "collection"]) -> selection_manager:(t_selection_manager Solidtype.Solid.accessor [@mel.as "selectionManager"]) -> unit -> t = "" [@@mel.obj]
end

module ListboxContextValue = struct
  type t = t_listbox_context_value
  external list_state : t -> t_list_state Solidtype.Solid.accessor = "listState" [@@mel.get]
  external generate_id : t -> string -> string = "generateId" [@@mel.send]
  external should_use_virtual_focus : t -> bool option Solidtype.Solid.accessor = "shouldUseVirtualFocus" [@@mel.get]
  external should_select_on_press_up : t -> bool option Solidtype.Solid.accessor = "shouldSelectOnPressUp" [@@mel.get]
  external should_focus_on_hover : t -> bool option Solidtype.Solid.accessor = "shouldFocusOnHover" [@@mel.get]
  external is_virtualized : t -> bool option Solidtype.Solid.accessor = "isVirtualized" [@@mel.get]
  external make : list_state:(t_list_state Solidtype.Solid.accessor [@mel.as "listState"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> should_use_virtual_focus:(bool option Solidtype.Solid.accessor [@mel.as "shouldUseVirtualFocus"]) -> should_select_on_press_up:(bool option Solidtype.Solid.accessor [@mel.as "shouldSelectOnPressUp"]) -> should_focus_on_hover:(bool option Solidtype.Solid.accessor [@mel.as "shouldFocusOnHover"]) -> is_virtualized:(bool option Solidtype.Solid.accessor [@mel.as "isVirtualized"]) -> unit -> t = "" [@@mel.obj]
end

module MenubarContextValue = struct
  type t = t_menubar_context_value
  external dataset : t -> t_menubar_data_set Solidtype.Solid.accessor = "dataset" [@@mel.get]
  external value : t -> string Js.Nullable.t Solidtype.Solid.accessor = "value" [@@mel.get]
  external set_value : t -> ((string, string Js.Nullable.t -> string option) either Js.Nullable.t) -> unit = "setValue" [@@mel.send]
  external menus : t -> string Js.Set.t Solidtype.Solid.accessor = "menus" [@@mel.get]
  external menu_refs : t -> Dom.htmlElement array Solidtype.Solid.accessor = "menuRefs" [@@mel.get]
  external menu_ref_map : t -> (string, Dom.htmlElement array) Js.Map.t Solidtype.Solid.accessor = "menuRefMap" [@@mel.get]
  external last_value : t -> string option Solidtype.Solid.accessor = "lastValue" [@@mel.get]
  external set_last_value : t -> (((string, string option -> string option) either) option) -> unit = "setLastValue" [@@mel.send]
  external register_menu : t -> string -> Dom.htmlElement array -> unit = "registerMenu" [@@mel.send]
  external unregister_menu : t -> string -> unit = "unregisterMenu" [@@mel.send]
  external next_menu : t -> unit -> unit = "nextMenu" [@@mel.send]
  external previous_menu : t -> unit -> unit = "previousMenu" [@@mel.send]
  external close_menu : t -> unit -> unit = "closeMenu" [@@mel.send]
  external set_auto_focus_menu : t -> bool Solidtype.Solid.setter = "setAutoFocusMenu" [@@mel.get]
  external auto_focus_menu : t -> bool Solidtype.Solid.accessor = "autoFocusMenu" [@@mel.get]
  external generate_id : t -> string -> string = "generateId" [@@mel.send]
  external orientation : t -> [ `horizontal | `vertical ] Solidtype.Solid.accessor = "orientation" [@@mel.get]
  external make : dataset:(t_menubar_data_set Solidtype.Solid.accessor [@mel.as "dataset"]) -> value:(string Js.Nullable.t Solidtype.Solid.accessor [@mel.as "value"]) -> set_value:((((string, string Js.Nullable.t -> string option) either Js.Nullable.t) -> unit) [@mel.as "setValue"]) -> menus:(string Js.Set.t Solidtype.Solid.accessor [@mel.as "menus"]) -> menu_refs:(Dom.htmlElement array Solidtype.Solid.accessor [@mel.as "menuRefs"]) -> menu_ref_map:((string, Dom.htmlElement array) Js.Map.t Solidtype.Solid.accessor [@mel.as "menuRefMap"]) -> last_value:(string option Solidtype.Solid.accessor [@mel.as "lastValue"]) -> set_last_value:(((((string, string option -> string option) either) option) -> unit) [@mel.as "setLastValue"]) -> register_menu:((string -> Dom.htmlElement array -> unit) [@mel.as "registerMenu"]) -> unregister_menu:((string -> unit) [@mel.as "unregisterMenu"]) -> next_menu:((unit -> unit) [@mel.as "nextMenu"]) -> previous_menu:((unit -> unit) [@mel.as "previousMenu"]) -> close_menu:((unit -> unit) [@mel.as "closeMenu"]) -> set_auto_focus_menu:(bool Solidtype.Solid.setter [@mel.as "setAutoFocusMenu"]) -> auto_focus_menu:(bool Solidtype.Solid.accessor [@mel.as "autoFocusMenu"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> orientation:([ `horizontal | `vertical ] Solidtype.Solid.accessor [@mel.as "orientation"]) -> unit -> t = "" [@@mel.obj]
end

module GetValueLabelParams = struct
  type t = t_get_value_label_params
  external value : t -> float = "value" [@@mel.get]
  external min : t -> float = "min" [@@mel.get]
  external max : t -> float = "max" [@@mel.get]
  external make : value:(float [@mel.as "value"]) -> min:(float [@mel.as "min"]) -> max:(float [@mel.as "max"]) -> unit -> t = "" [@@mel.obj]
end

module MeterContextValue = struct
  type t = t_meter_context_value
  external dataset : t -> t_meter_data_set Solidtype.Solid.accessor = "dataset" [@@mel.get]
  external value : t -> float Solidtype.Solid.accessor = "value" [@@mel.get]
  external value_percent : t -> float Solidtype.Solid.accessor = "valuePercent" [@@mel.get]
  external value_label : t -> string option Solidtype.Solid.accessor = "valueLabel" [@@mel.get]
  external meter_fill_width : t -> string option Solidtype.Solid.accessor = "meterFillWidth" [@@mel.get]
  external label_id : t -> string option Solidtype.Solid.accessor = "labelId" [@@mel.get]
  external generate_id : t -> string -> string = "generateId" [@@mel.send]
  external register_label_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerLabelId" [@@mel.get]
  let register_label_id o x0 = let r = (register_label_id_js o) x0 [@u] in fun () -> r () [@u]
  external make_js : dataset:(t_meter_data_set Solidtype.Solid.accessor [@mel.as "dataset"]) -> value:(float Solidtype.Solid.accessor [@mel.as "value"]) -> value_percent:(float Solidtype.Solid.accessor [@mel.as "valuePercent"]) -> value_label:(string option Solidtype.Solid.accessor [@mel.as "valueLabel"]) -> meter_fill_width:(string option Solidtype.Solid.accessor [@mel.as "meterFillWidth"]) -> label_id:(string option Solidtype.Solid.accessor [@mel.as "labelId"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> register_label_id:((string -> (unit -> unit)) [@mel.as "registerLabelId"]) -> unit -> t = "" [@@mel.obj]
  let make ~dataset ~value ~value_percent ~value_label ~meter_fill_width ~label_id ~generate_id ~register_label_id () = make_js ~dataset ~value ~value_percent ~value_label ~meter_fill_width ~label_id ~generate_id ~register_label_id:(fun x0 -> let r = register_label_id x0 in fun () -> r ()) ()
end

module NavigationMenuContextValue = struct
  type t = t_navigation_menu_context_value
  external dataset : t -> t_navigation_menu_data_set Solidtype.Solid.accessor = "dataset" [@@mel.get]
  external delay_duration : t -> float Solidtype.Solid.accessor = "delayDuration" [@@mel.get]
  external skip_delay_duration : t -> float Solidtype.Solid.accessor = "skipDelayDuration" [@@mel.get]
  external auto_focus_menu : t -> bool Solidtype.Solid.accessor = "autoFocusMenu" [@@mel.get]
  external set_auto_focus_menu : t -> bool Solidtype.Solid.setter = "setAutoFocusMenu" [@@mel.get]
  external start_leave_timer : t -> unit -> unit = "startLeaveTimer" [@@mel.send]
  external cancel_leave_timer : t -> unit -> unit = "cancelLeaveTimer" [@@mel.send]
  external root_ref : t -> Dom.htmlElement option Solidtype.Solid.accessor = "rootRef" [@@mel.get]
  external set_root_ref : t -> Dom.htmlElement Solidtype.Solid.setter = "setRootRef" [@@mel.get]
  external viewport_ref : t -> Dom.htmlElement option Solidtype.Solid.accessor = "viewportRef" [@@mel.get]
  external set_viewport_ref : t -> Dom.htmlElement Solidtype.Solid.setter = "setViewportRef" [@@mel.get]
  external viewport_present : t -> bool Solidtype.Solid.accessor = "viewportPresent" [@@mel.get]
  external current_placement : t -> string Solidtype.Solid.accessor = "currentPlacement" [@@mel.get]
  external previous_menu : t -> string option Solidtype.Solid.accessor = "previousMenu" [@@mel.get]
  external set_previous_menu : t -> string option Solidtype.Solid.setter = "setPreviousMenu" [@@mel.get]
  external make : dataset:(t_navigation_menu_data_set Solidtype.Solid.accessor [@mel.as "dataset"]) -> delay_duration:(float Solidtype.Solid.accessor [@mel.as "delayDuration"]) -> skip_delay_duration:(float Solidtype.Solid.accessor [@mel.as "skipDelayDuration"]) -> auto_focus_menu:(bool Solidtype.Solid.accessor [@mel.as "autoFocusMenu"]) -> set_auto_focus_menu:(bool Solidtype.Solid.setter [@mel.as "setAutoFocusMenu"]) -> start_leave_timer:((unit -> unit) [@mel.as "startLeaveTimer"]) -> cancel_leave_timer:((unit -> unit) [@mel.as "cancelLeaveTimer"]) -> root_ref:(Dom.htmlElement option Solidtype.Solid.accessor [@mel.as "rootRef"]) -> set_root_ref:(Dom.htmlElement Solidtype.Solid.setter [@mel.as "setRootRef"]) -> viewport_ref:(Dom.htmlElement option Solidtype.Solid.accessor [@mel.as "viewportRef"]) -> set_viewport_ref:(Dom.htmlElement Solidtype.Solid.setter [@mel.as "setViewportRef"]) -> viewport_present:(bool Solidtype.Solid.accessor [@mel.as "viewportPresent"]) -> current_placement:(string Solidtype.Solid.accessor [@mel.as "currentPlacement"]) -> previous_menu:(string option Solidtype.Solid.accessor [@mel.as "previousMenu"]) -> set_previous_menu:(string option Solidtype.Solid.setter [@mel.as "setPreviousMenu"]) -> unit -> t = "" [@@mel.obj]
end

module NumberFormatOptions2 = struct
  type t = t_number_format_options2
  external locale_matcher : t -> string option = "localeMatcher" [@@mel.get]
  external style : t -> [ `decimal | `percent | `currency | `unit ] option = "style" [@@mel.get]
  external currency : t -> string option = "currency" [@@mel.get]
  external currency_display : t -> [ `symbol | `code | `name | `narrowSymbol ] option = "currencyDisplay" [@@mel.get]
  external use_grouping : t -> (string, bool) either option = "useGrouping" [@@mel.get]
  external minimum_integer_digits : t -> float option = "minimumIntegerDigits" [@@mel.get]
  external minimum_fraction_digits : t -> float option = "minimumFractionDigits" [@@mel.get]
  external maximum_fraction_digits : t -> float option = "maximumFractionDigits" [@@mel.get]
  external minimum_significant_digits : t -> float option = "minimumSignificantDigits" [@@mel.get]
  external maximum_significant_digits : t -> float option = "maximumSignificantDigits" [@@mel.get]
  external numbering_system : t -> string option = "numberingSystem" [@@mel.get]
  external compact_display : t -> [ `long | `short ] option = "compactDisplay" [@@mel.get]
  external notation : t -> [ `standard | `scientific | `engineering | `compact ] option = "notation" [@@mel.get]
  external sign_display : t -> [ `auto | `always | `never | `exceptZero | `negative ] option = "signDisplay" [@@mel.get]
  external unit : t -> string option = "unit" [@@mel.get]
  external unit_display : t -> [ `long | `short | `narrow ] option = "unitDisplay" [@@mel.get]
  external currency_sign : t -> [ `standard | `accounting ] option = "currencySign" [@@mel.get]
  external rounding_priority : t -> [ `auto | `morePrecision | `lessPrecision ] option = "roundingPriority" [@@mel.get]
  external rounding_increment : t -> float option = "roundingIncrement" [@@mel.get]
  external rounding_mode : t -> [ `ceil | `floor | `expand | `trunc | `halfCeil | `halfFloor | `halfExpand | `halfTrunc | `halfEven ] option = "roundingMode" [@@mel.get]
  external trailing_zero_display : t -> [ `auto | `stripIfInteger ] option = "trailingZeroDisplay" [@@mel.get]
  external make : ?locale_matcher:(string [@mel.as "localeMatcher"]) -> ?style:([ `decimal | `percent | `currency | `unit ] [@mel.as "style"]) -> ?currency:(string [@mel.as "currency"]) -> ?currency_display:([ `symbol | `code | `name | `narrowSymbol ] [@mel.as "currencyDisplay"]) -> ?use_grouping:((string, bool) either [@mel.as "useGrouping"]) -> ?minimum_integer_digits:(float [@mel.as "minimumIntegerDigits"]) -> ?minimum_fraction_digits:(float [@mel.as "minimumFractionDigits"]) -> ?maximum_fraction_digits:(float [@mel.as "maximumFractionDigits"]) -> ?minimum_significant_digits:(float [@mel.as "minimumSignificantDigits"]) -> ?maximum_significant_digits:(float [@mel.as "maximumSignificantDigits"]) -> ?numbering_system:(string [@mel.as "numberingSystem"]) -> ?compact_display:([ `long | `short ] [@mel.as "compactDisplay"]) -> ?notation:([ `standard | `scientific | `engineering | `compact ] [@mel.as "notation"]) -> ?sign_display:([ `auto | `always | `never | `exceptZero | `negative ] [@mel.as "signDisplay"]) -> ?unit:(string [@mel.as "unit"]) -> ?unit_display:([ `long | `short | `narrow ] [@mel.as "unitDisplay"]) -> ?currency_sign:([ `standard | `accounting ] [@mel.as "currencySign"]) -> ?rounding_priority:([ `auto | `morePrecision | `lessPrecision ] [@mel.as "roundingPriority"]) -> ?rounding_increment:(float [@mel.as "roundingIncrement"]) -> ?rounding_mode:([ `ceil | `floor | `expand | `trunc | `halfCeil | `halfFloor | `halfExpand | `halfTrunc | `halfEven ] [@mel.as "roundingMode"]) -> ?trailing_zero_display:([ `auto | `stripIfInteger ] [@mel.as "trailingZeroDisplay"]) -> unit -> t = "" [@@mel.obj]
end

module NumberFieldContextValue = struct
  type t = t_number_field_context_value
  external value : t -> (string, float) either option Solidtype.Solid.accessor = "value" [@@mel.get]
  external set_value : t -> (string, float) either -> unit = "setValue" [@@mel.send]
  external raw_value : t -> float Solidtype.Solid.accessor = "rawValue" [@@mel.get]
  external generate_id : t -> string -> string = "generateId" [@@mel.send]
  external format_number : t -> float -> string = "formatNumber" [@@mel.send]
  external format : t -> unit -> unit = "format" [@@mel.send]
  external on_input : t -> ((t_number_field_context_value_on_input -> unit, (Dom.htmlInputElement, Dom.inputEvent, t_number_field_context_value_on_input -> unit) t_bound_event_handler) either) = "onInput" [@@mel.get]
  external text_value : t -> string option Solidtype.Solid.accessor = "textValue" [@@mel.get]
  external min_value : t -> float Solidtype.Solid.accessor = "minValue" [@@mel.get]
  external max_value : t -> float Solidtype.Solid.accessor = "maxValue" [@@mel.get]
  external step : t -> float Solidtype.Solid.accessor = "step" [@@mel.get]
  external large_step : t -> float Solidtype.Solid.accessor = "largeStep" [@@mel.get]
  external change_on_wheel : t -> bool Solidtype.Solid.accessor = "changeOnWheel" [@@mel.get]
  external translations : t -> t_color_channel_field_root_translations option Solidtype.Solid.accessor = "translations" [@@mel.get]
  external input_ref : t -> Dom.htmlInputElement option Solidtype.Solid.accessor = "inputRef" [@@mel.get]
  external set_input_ref : t -> Dom.htmlInputElement -> unit = "setInputRef" [@@mel.send]
  external hidden_input_ref : t -> Dom.htmlInputElement option Solidtype.Solid.accessor = "hiddenInputRef" [@@mel.get]
  external set_hidden_input_ref : t -> Dom.htmlInputElement -> unit = "setHiddenInputRef" [@@mel.send]
  external vary_value : t -> float -> unit = "varyValue" [@@mel.send]
  external make : value:((string, float) either option Solidtype.Solid.accessor [@mel.as "value"]) -> set_value:(((string, float) either -> unit) [@mel.as "setValue"]) -> raw_value:(float Solidtype.Solid.accessor [@mel.as "rawValue"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> format_number:((float -> string) [@mel.as "formatNumber"]) -> format:((unit -> unit) [@mel.as "format"]) -> on_input:(((t_number_field_context_value_on_input -> unit, (Dom.htmlInputElement, Dom.inputEvent, t_number_field_context_value_on_input -> unit) t_bound_event_handler) either) [@mel.as "onInput"]) -> text_value:(string option Solidtype.Solid.accessor [@mel.as "textValue"]) -> min_value:(float Solidtype.Solid.accessor [@mel.as "minValue"]) -> max_value:(float Solidtype.Solid.accessor [@mel.as "maxValue"]) -> step:(float Solidtype.Solid.accessor [@mel.as "step"]) -> large_step:(float Solidtype.Solid.accessor [@mel.as "largeStep"]) -> change_on_wheel:(bool Solidtype.Solid.accessor [@mel.as "changeOnWheel"]) -> translations:(t_color_channel_field_root_translations option Solidtype.Solid.accessor [@mel.as "translations"]) -> input_ref:(Dom.htmlInputElement option Solidtype.Solid.accessor [@mel.as "inputRef"]) -> set_input_ref:((Dom.htmlInputElement -> unit) [@mel.as "setInputRef"]) -> hidden_input_ref:(Dom.htmlInputElement option Solidtype.Solid.accessor [@mel.as "hiddenInputRef"]) -> set_hidden_input_ref:((Dom.htmlInputElement -> unit) [@mel.as "setHiddenInputRef"]) -> vary_value:((float -> unit) [@mel.as "varyValue"]) -> unit -> t = "" [@@mel.obj]
end

module Pagination_Root_ItemComponent = struct
  type t = t_pagination_root_item_component
  external page : t -> float = "page" [@@mel.get]
  external make : page:(float [@mel.as "page"]) -> unit -> t = "" [@@mel.obj]
end

module PaginationContextValue = struct
  type t = t_pagination_context_value
  external count : t -> float Solidtype.Solid.accessor = "count" [@@mel.get]
  external sibling_count : t -> float Solidtype.Solid.accessor = "siblingCount" [@@mel.get]
  external show_first : t -> bool Solidtype.Solid.accessor = "showFirst" [@@mel.get]
  external show_last : t -> bool Solidtype.Solid.accessor = "showLast" [@@mel.get]
  external fixed_items : t -> (string, bool) either Solidtype.Solid.accessor = "fixedItems" [@@mel.get]
  external is_disabled : t -> bool Solidtype.Solid.accessor = "isDisabled" [@@mel.get]
  external render_item : t -> float -> Solidtype.Jsx.element = "renderItem" [@@mel.send]
  external render_ellipsis : t -> unit -> Solidtype.Jsx.element = "renderEllipsis" [@@mel.send]
  external page : t -> float Solidtype.Solid.accessor = "page" [@@mel.get]
  external set_page : t -> float Solidtype.Solid.setter = "setPage" [@@mel.get]
  external make : count:(float Solidtype.Solid.accessor [@mel.as "count"]) -> sibling_count:(float Solidtype.Solid.accessor [@mel.as "siblingCount"]) -> show_first:(bool Solidtype.Solid.accessor [@mel.as "showFirst"]) -> show_last:(bool Solidtype.Solid.accessor [@mel.as "showLast"]) -> fixed_items:((string, bool) either Solidtype.Solid.accessor [@mel.as "fixedItems"]) -> is_disabled:(bool Solidtype.Solid.accessor [@mel.as "isDisabled"]) -> render_item:((float -> Solidtype.Jsx.element) [@mel.as "renderItem"]) -> render_ellipsis:((unit -> Solidtype.Jsx.element) [@mel.as "renderEllipsis"]) -> page:(float Solidtype.Solid.accessor [@mel.as "page"]) -> set_page:(float Solidtype.Solid.setter [@mel.as "setPage"]) -> unit -> t = "" [@@mel.obj]
end

module Popover_Root_Translations = struct
  type t = t_popover_root_translations
  external dismiss : t -> string = "dismiss" [@@mel.get]
  external make : dismiss:(string [@mel.as "dismiss"]) -> unit -> t = "" [@@mel.obj]
end

module PopoverContextValue = struct
  type t = t_popover_context_value
  external translations : t -> t_popover_root_translations Solidtype.Solid.accessor = "translations" [@@mel.get]
  external dataset : t -> t_popover_data_set Solidtype.Solid.accessor = "dataset" [@@mel.get]
  external is_open : t -> bool Solidtype.Solid.accessor = "isOpen" [@@mel.get]
  external is_modal : t -> bool Solidtype.Solid.accessor = "isModal" [@@mel.get]
  external prevent_scroll : t -> bool Solidtype.Solid.accessor = "preventScroll" [@@mel.get]
  external content_present : t -> bool Solidtype.Solid.accessor = "contentPresent" [@@mel.get]
  external trigger_ref : t -> Dom.htmlElement option Solidtype.Solid.accessor = "triggerRef" [@@mel.get]
  external content_id : t -> string option Solidtype.Solid.accessor = "contentId" [@@mel.get]
  external title_id : t -> string option Solidtype.Solid.accessor = "titleId" [@@mel.get]
  external description_id : t -> string option Solidtype.Solid.accessor = "descriptionId" [@@mel.get]
  external set_default_anchor_ref : t -> Dom.htmlElement -> unit = "setDefaultAnchorRef" [@@mel.send]
  external set_trigger_ref : t -> Dom.htmlElement -> unit = "setTriggerRef" [@@mel.send]
  external set_content_ref : t -> Dom.htmlElement -> unit = "setContentRef" [@@mel.send]
  external close : t -> unit -> unit = "close" [@@mel.send]
  external toggle : t -> unit -> unit = "toggle" [@@mel.send]
  external generate_id : t -> string -> string = "generateId" [@@mel.send]
  external register_content_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerContentId" [@@mel.get]
  let register_content_id o x0 = let r = (register_content_id_js o) x0 [@u] in fun () -> r () [@u]
  external register_title_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerTitleId" [@@mel.get]
  let register_title_id o x0 = let r = (register_title_id_js o) x0 [@u] in fun () -> r () [@u]
  external register_description_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerDescriptionId" [@@mel.get]
  let register_description_id o x0 = let r = (register_description_id_js o) x0 [@u] in fun () -> r () [@u]
  external make_js : translations:(t_popover_root_translations Solidtype.Solid.accessor [@mel.as "translations"]) -> dataset:(t_popover_data_set Solidtype.Solid.accessor [@mel.as "dataset"]) -> is_open:(bool Solidtype.Solid.accessor [@mel.as "isOpen"]) -> is_modal:(bool Solidtype.Solid.accessor [@mel.as "isModal"]) -> prevent_scroll:(bool Solidtype.Solid.accessor [@mel.as "preventScroll"]) -> content_present:(bool Solidtype.Solid.accessor [@mel.as "contentPresent"]) -> trigger_ref:(Dom.htmlElement option Solidtype.Solid.accessor [@mel.as "triggerRef"]) -> content_id:(string option Solidtype.Solid.accessor [@mel.as "contentId"]) -> title_id:(string option Solidtype.Solid.accessor [@mel.as "titleId"]) -> description_id:(string option Solidtype.Solid.accessor [@mel.as "descriptionId"]) -> set_default_anchor_ref:((Dom.htmlElement -> unit) [@mel.as "setDefaultAnchorRef"]) -> set_trigger_ref:((Dom.htmlElement -> unit) [@mel.as "setTriggerRef"]) -> set_content_ref:((Dom.htmlElement -> unit) [@mel.as "setContentRef"]) -> close:((unit -> unit) [@mel.as "close"]) -> toggle:((unit -> unit) [@mel.as "toggle"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> register_content_id:((string -> (unit -> unit)) [@mel.as "registerContentId"]) -> register_title_id:((string -> (unit -> unit)) [@mel.as "registerTitleId"]) -> register_description_id:((string -> (unit -> unit)) [@mel.as "registerDescriptionId"]) -> unit -> t = "" [@@mel.obj]
  let make ~translations ~dataset ~is_open ~is_modal ~prevent_scroll ~content_present ~trigger_ref ~content_id ~title_id ~description_id ~set_default_anchor_ref ~set_trigger_ref ~set_content_ref ~close ~toggle ~generate_id ~register_content_id ~register_title_id ~register_description_id () = make_js ~translations ~dataset ~is_open ~is_modal ~prevent_scroll ~content_present ~trigger_ref ~content_id ~title_id ~description_id ~set_default_anchor_ref ~set_trigger_ref ~set_content_ref ~close ~toggle ~generate_id ~register_content_id:(fun x0 -> let r = register_content_id x0 in fun () -> r ()) ~register_title_id:(fun x0 -> let r = register_title_id x0 in fun () -> r ()) ~register_description_id:(fun x0 -> let r = register_description_id x0 in fun () -> r ()) ()
end

module ProgressContextValue = struct
  type t = t_progress_context_value
  external dataset : t -> t_progress_data_set Solidtype.Solid.accessor = "dataset" [@@mel.get]
  external progress_fill_width : t -> string option Solidtype.Solid.accessor = "progressFillWidth" [@@mel.get]
  external value : t -> float Solidtype.Solid.accessor = "value" [@@mel.get]
  external value_percent : t -> float Solidtype.Solid.accessor = "valuePercent" [@@mel.get]
  external value_label : t -> string option Solidtype.Solid.accessor = "valueLabel" [@@mel.get]
  external label_id : t -> string option Solidtype.Solid.accessor = "labelId" [@@mel.get]
  external generate_id : t -> string -> string = "generateId" [@@mel.send]
  external register_label_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerLabelId" [@@mel.get]
  let register_label_id o x0 = let r = (register_label_id_js o) x0 [@u] in fun () -> r () [@u]
  external make_js : dataset:(t_progress_data_set Solidtype.Solid.accessor [@mel.as "dataset"]) -> progress_fill_width:(string option Solidtype.Solid.accessor [@mel.as "progressFillWidth"]) -> value:(float Solidtype.Solid.accessor [@mel.as "value"]) -> value_percent:(float Solidtype.Solid.accessor [@mel.as "valuePercent"]) -> value_label:(string option Solidtype.Solid.accessor [@mel.as "valueLabel"]) -> label_id:(string option Solidtype.Solid.accessor [@mel.as "labelId"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> register_label_id:((string -> (unit -> unit)) [@mel.as "registerLabelId"]) -> unit -> t = "" [@@mel.obj]
  let make ~dataset ~progress_fill_width ~value ~value_percent ~value_label ~label_id ~generate_id ~register_label_id () = make_js ~dataset ~progress_fill_width ~value ~value_percent ~value_label ~label_id ~generate_id ~register_label_id:(fun x0 -> let r = register_label_id x0 in fun () -> r ()) ()
end

module RadioGroupContextValue = struct
  type t = t_radio_group_context_value
  external aria_described_by : t -> string option Solidtype.Solid.accessor = "ariaDescribedBy" [@@mel.get]
  external is_default_value : t -> string -> bool = "isDefaultValue" [@@mel.send]
  external is_selected_value : t -> string -> bool = "isSelectedValue" [@@mel.send]
  external set_selected_value : t -> string -> unit = "setSelectedValue" [@@mel.send]
  external make : aria_described_by:(string option Solidtype.Solid.accessor [@mel.as "ariaDescribedBy"]) -> is_default_value:((string -> bool) [@mel.as "isDefaultValue"]) -> is_selected_value:((string -> bool) [@mel.as "isSelectedValue"]) -> set_selected_value:((string -> unit) [@mel.as "setSelectedValue"]) -> unit -> t = "" [@@mel.obj]
end

module RatingItemState = struct
  type t = t_rating_item_state
  external half : t -> bool Solidtype.Solid.accessor = "half" [@@mel.get]
  external highlighted : t -> bool Solidtype.Solid.accessor = "highlighted" [@@mel.get]
  external make : half:(bool Solidtype.Solid.accessor [@mel.as "half"]) -> highlighted:(bool Solidtype.Solid.accessor [@mel.as "highlighted"]) -> unit -> t = "" [@@mel.obj]
end

module SearchContextValue = struct
  type t = t_search_context_value
  (** No results found *)
  external no_result : t -> bool Solidtype.Solid.accessor = "noResult" [@@mel.get]
  (** Are we currently loading suggestions? *)
  external is_loading_suggestions : t -> bool Solidtype.Solid.accessor = "isLoadingSuggestions" [@@mel.get]
  external make : no_result:(bool Solidtype.Solid.accessor [@mel.as "noResult"]) -> is_loading_suggestions:(bool Solidtype.Solid.accessor [@mel.as "isLoadingSuggestions"]) -> unit -> t = "" [@@mel.obj]
end

module SegmentedControlContextValue = struct
  type t = t_segmented_control_context_value
  external value : t -> string option Solidtype.Solid.accessor = "value" [@@mel.get]
  external default_value : t -> string option Solidtype.Solid.accessor = "defaultValue" [@@mel.get]
  external orientation : t -> [ `horizontal | `vertical ] option Solidtype.Solid.accessor = "orientation" [@@mel.get]
  external root : t -> Dom.htmlElement option Solidtype.Solid.accessor = "root" [@@mel.get]
  external selected_item : t -> Dom.htmlElement option Solidtype.Solid.accessor = "selectedItem" [@@mel.get]
  external set_selected_item : t -> Dom.htmlElement option Solidtype.Solid.setter = "setSelectedItem" [@@mel.get]
  external make : value:(string option Solidtype.Solid.accessor [@mel.as "value"]) -> default_value:(string option Solidtype.Solid.accessor [@mel.as "defaultValue"]) -> orientation:([ `horizontal | `vertical ] option Solidtype.Solid.accessor [@mel.as "orientation"]) -> root:(Dom.htmlElement option Solidtype.Solid.accessor [@mel.as "root"]) -> selected_item:(Dom.htmlElement option Solidtype.Solid.accessor [@mel.as "selectedItem"]) -> set_selected_item:(Dom.htmlElement option Solidtype.Solid.setter [@mel.as "setSelectedItem"]) -> unit -> t = "" [@@mel.obj]
end

module SelectBaseItemComponentProps = struct
  type 't t = 't t_select_base_item_component_props
  (** The item to render. *)
  external item : 't t -> 't t_collection_node = "item" [@@mel.get]
  external make : item:('t t_collection_node [@mel.as "item"]) -> unit -> 't t = "" [@@mel.obj]
end

module SelectBaseSectionComponentProps = struct
  type 't t = 't t_select_base_section_component_props
  (** The section to render. *)
  external section : 't t -> 't t_collection_node = "section" [@@mel.get]
  external make : section:('t t_collection_node [@mel.as "section"]) -> unit -> 't t = "" [@@mel.obj]
end

module SelectValueState = struct
  type 'option t = 'option t_select_value_state
  (** The first (or only, in case of single select) selected option. *)
  external selected_option : 'option t -> 'option Solidtype.Solid.accessor = "selectedOption" [@@mel.get]
  (** An array of selected options. It will contain only one value in case of single select. *)
  external selected_options : 'option t -> 'option array Solidtype.Solid.accessor = "selectedOptions" [@@mel.get]
  (** A function to remove an option from the selection. *)
  external remove : 'option t -> 'option -> unit = "remove" [@@mel.send]
  (** A function to clear the selection. *)
  external clear : 'option t -> unit -> unit = "clear" [@@mel.send]
  external make : selected_option:('option Solidtype.Solid.accessor [@mel.as "selectedOption"]) -> selected_options:('option array Solidtype.Solid.accessor [@mel.as "selectedOptions"]) -> remove:(('option -> unit) [@mel.as "remove"]) -> clear:((unit -> unit) [@mel.as "clear"]) -> unit -> 'option t = "" [@@mel.obj]
end

module SelectContextValue = struct
  type t = t_select_context_value
  external dataset : t -> t_select_data_set Solidtype.Solid.accessor = "dataset" [@@mel.get]
  external is_open : t -> bool Solidtype.Solid.accessor = "isOpen" [@@mel.get]
  external is_disabled : t -> bool Solidtype.Solid.accessor = "isDisabled" [@@mel.get]
  external is_multiple : t -> bool Solidtype.Solid.accessor = "isMultiple" [@@mel.get]
  external is_virtualized : t -> bool Solidtype.Solid.accessor = "isVirtualized" [@@mel.get]
  external is_modal : t -> bool Solidtype.Solid.accessor = "isModal" [@@mel.get]
  external prevent_scroll : t -> bool Solidtype.Solid.accessor = "preventScroll" [@@mel.get]
  external disallow_type_ahead : t -> bool Solidtype.Solid.accessor = "disallowTypeAhead" [@@mel.get]
  external should_focus_wrap : t -> bool Solidtype.Solid.accessor = "shouldFocusWrap" [@@mel.get]
  external content_present : t -> bool Solidtype.Solid.accessor = "contentPresent" [@@mel.get]
  external auto_focus : t -> ([ `first | `last ], bool) either Solidtype.Solid.accessor = "autoFocus" [@@mel.get]
  external trigger_ref : t -> Dom.htmlElement option Solidtype.Solid.accessor = "triggerRef" [@@mel.get]
  external trigger_id : t -> string option Solidtype.Solid.accessor = "triggerId" [@@mel.get]
  external value_id : t -> string option Solidtype.Solid.accessor = "valueId" [@@mel.get]
  external listbox_id : t -> string option Solidtype.Solid.accessor = "listboxId" [@@mel.get]
  external listbox_aria_labelled_by : t -> string option Solidtype.Solid.accessor = "listboxAriaLabelledBy" [@@mel.get]
  external list_state : t -> t_list_state Solidtype.Solid.accessor = "listState" [@@mel.get]
  external keyboard_delegate : t -> t_keyboard_delegate Solidtype.Solid.accessor = "keyboardDelegate" [@@mel.get]
  external set_listbox_aria_labelled_by : t -> string option Solidtype.Solid.setter = "setListboxAriaLabelledBy" [@@mel.get]
  external set_trigger_ref : t -> Dom.htmlElement -> unit = "setTriggerRef" [@@mel.send]
  external set_content_ref : t -> Dom.htmlElement -> unit = "setContentRef" [@@mel.send]
  external set_listbox_ref : t -> Dom.htmlElement -> unit = "setListboxRef" [@@mel.send]
  external open_ : t -> ([ `first | `last ], bool) either -> unit = "open" [@@mel.send]
  external close : t -> unit -> unit = "close" [@@mel.send]
  external toggle : t -> ([ `first | `last ], bool) either -> unit = "toggle" [@@mel.send]
  external placeholder : t -> Solidtype.Jsx.element Solidtype.Solid.accessor = "placeholder" [@@mel.get]
  external render_item : t -> _ t_collection_node -> Solidtype.Jsx.element = "renderItem" [@@mel.send]
  external render_section : t -> _ t_collection_node -> Solidtype.Jsx.element = "renderSection" [@@mel.send]
  external generate_id : t -> string -> string = "generateId" [@@mel.send]
  external register_trigger_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerTriggerId" [@@mel.get]
  let register_trigger_id o x0 = let r = (register_trigger_id_js o) x0 [@u] in fun () -> r () [@u]
  external register_value_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerValueId" [@@mel.get]
  let register_value_id o x0 = let r = (register_value_id_js o) x0 [@u] in fun () -> r () [@u]
  external register_listbox_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerListboxId" [@@mel.get]
  let register_listbox_id o x0 = let r = (register_listbox_id_js o) x0 [@u] in fun () -> r () [@u]
  external make_js : dataset:(t_select_data_set Solidtype.Solid.accessor [@mel.as "dataset"]) -> is_open:(bool Solidtype.Solid.accessor [@mel.as "isOpen"]) -> is_disabled:(bool Solidtype.Solid.accessor [@mel.as "isDisabled"]) -> is_multiple:(bool Solidtype.Solid.accessor [@mel.as "isMultiple"]) -> is_virtualized:(bool Solidtype.Solid.accessor [@mel.as "isVirtualized"]) -> is_modal:(bool Solidtype.Solid.accessor [@mel.as "isModal"]) -> prevent_scroll:(bool Solidtype.Solid.accessor [@mel.as "preventScroll"]) -> disallow_type_ahead:(bool Solidtype.Solid.accessor [@mel.as "disallowTypeAhead"]) -> should_focus_wrap:(bool Solidtype.Solid.accessor [@mel.as "shouldFocusWrap"]) -> content_present:(bool Solidtype.Solid.accessor [@mel.as "contentPresent"]) -> auto_focus:(([ `first | `last ], bool) either Solidtype.Solid.accessor [@mel.as "autoFocus"]) -> trigger_ref:(Dom.htmlElement option Solidtype.Solid.accessor [@mel.as "triggerRef"]) -> trigger_id:(string option Solidtype.Solid.accessor [@mel.as "triggerId"]) -> value_id:(string option Solidtype.Solid.accessor [@mel.as "valueId"]) -> listbox_id:(string option Solidtype.Solid.accessor [@mel.as "listboxId"]) -> listbox_aria_labelled_by:(string option Solidtype.Solid.accessor [@mel.as "listboxAriaLabelledBy"]) -> list_state:(t_list_state Solidtype.Solid.accessor [@mel.as "listState"]) -> keyboard_delegate:(t_keyboard_delegate Solidtype.Solid.accessor [@mel.as "keyboardDelegate"]) -> set_listbox_aria_labelled_by:(string option Solidtype.Solid.setter [@mel.as "setListboxAriaLabelledBy"]) -> set_trigger_ref:((Dom.htmlElement -> unit) [@mel.as "setTriggerRef"]) -> set_content_ref:((Dom.htmlElement -> unit) [@mel.as "setContentRef"]) -> set_listbox_ref:((Dom.htmlElement -> unit) [@mel.as "setListboxRef"]) -> open_:((([ `first | `last ], bool) either -> unit) [@mel.as "open"]) -> close:((unit -> unit) [@mel.as "close"]) -> toggle:((([ `first | `last ], bool) either -> unit) [@mel.as "toggle"]) -> placeholder:(Solidtype.Jsx.element Solidtype.Solid.accessor [@mel.as "placeholder"]) -> render_item:((_ t_collection_node -> Solidtype.Jsx.element) [@mel.as "renderItem"]) -> render_section:((_ t_collection_node -> Solidtype.Jsx.element) [@mel.as "renderSection"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> register_trigger_id:((string -> (unit -> unit)) [@mel.as "registerTriggerId"]) -> register_value_id:((string -> (unit -> unit)) [@mel.as "registerValueId"]) -> register_listbox_id:((string -> (unit -> unit)) [@mel.as "registerListboxId"]) -> unit -> t = "" [@@mel.obj]
  let make ~dataset ~is_open ~is_disabled ~is_multiple ~is_virtualized ~is_modal ~prevent_scroll ~disallow_type_ahead ~should_focus_wrap ~content_present ~auto_focus ~trigger_ref ~trigger_id ~value_id ~listbox_id ~listbox_aria_labelled_by ~list_state ~keyboard_delegate ~set_listbox_aria_labelled_by ~set_trigger_ref ~set_content_ref ~set_listbox_ref ~open_ ~close ~toggle ~placeholder ~render_item ~render_section ~generate_id ~register_trigger_id ~register_value_id ~register_listbox_id () = make_js ~dataset ~is_open ~is_disabled ~is_multiple ~is_virtualized ~is_modal ~prevent_scroll ~disallow_type_ahead ~should_focus_wrap ~content_present ~auto_focus ~trigger_ref ~trigger_id ~value_id ~listbox_id ~listbox_aria_labelled_by ~list_state ~keyboard_delegate ~set_listbox_aria_labelled_by ~set_trigger_ref ~set_content_ref ~set_listbox_ref ~open_ ~close ~toggle ~placeholder ~render_item ~render_section ~generate_id ~register_trigger_id:(fun x0 -> let r = register_trigger_id x0 in fun () -> r ()) ~register_value_id:(fun x0 -> let r = register_value_id x0 in fun () -> r ()) ~register_listbox_id:(fun x0 -> let r = register_listbox_id x0 in fun () -> r ()) ()
end

module GetValueLabelParams2 = struct
  type t = t_get_value_label_params2
  external values : t -> float array = "values" [@@mel.get]
  external min : t -> float = "min" [@@mel.get]
  external max : t -> float = "max" [@@mel.get]
  external make : values:(float array [@mel.as "values"]) -> min:(float [@mel.as "min"]) -> max:(float [@mel.as "max"]) -> unit -> t = "" [@@mel.obj]
end

module SliderContextValue = struct
  type t = t_slider_context_value
  external dataset : t -> t_slider_data_set Solidtype.Solid.accessor = "dataset" [@@mel.get]
  external state : t -> t_slider_state = "state" [@@mel.get]
  external thumbs : t -> t_collection_item_with_ref array Solidtype.Solid.accessor = "thumbs" [@@mel.get]
  external set_thumbs : t -> t_collection_item_with_ref array Solidtype.Solid.setter = "setThumbs" [@@mel.get]
  external on_slide_start : t -> ((float -> float -> unit) option) = "onSlideStart" [@@mel.get]
  external on_slide_move : t -> ((t_slider_context_value_on_slide_move -> unit) option) = "onSlideMove" [@@mel.get]
  external on_slide_end : t -> ((unit -> unit) option) = "onSlideEnd" [@@mel.get]
  external on_step_key_down : t -> Dom.keyboardEvent -> float -> unit = "onStepKeyDown" [@@mel.send]
  external is_sliding_from_left : t -> unit -> bool = "isSlidingFromLeft" [@@mel.send]
  external is_sliding_from_bottom : t -> unit -> bool = "isSlidingFromBottom" [@@mel.send]
  external track_ref : t -> Dom.htmlElement option Solidtype.Solid.accessor = "trackRef" [@@mel.get]
  external start_edge : t -> [ `top | `bottom | `left | `right ] Solidtype.Solid.accessor = "startEdge" [@@mel.get]
  external end_edge : t -> [ `top | `bottom | `left | `right ] Solidtype.Solid.accessor = "endEdge" [@@mel.get]
  external min_value : t -> float Solidtype.Solid.accessor = "minValue" [@@mel.get]
  external max_value : t -> float Solidtype.Solid.accessor = "maxValue" [@@mel.get]
  external inverted : t -> bool Solidtype.Solid.accessor = "inverted" [@@mel.get]
  external register_track : t -> Dom.htmlElement -> unit = "registerTrack" [@@mel.send]
  external generate_id : t -> string -> string = "generateId" [@@mel.send]
  external get_value_label : t -> ((t_get_value_label_params2 -> string) option) = "getValueLabel" [@@mel.get]
  external make : dataset:(t_slider_data_set Solidtype.Solid.accessor [@mel.as "dataset"]) -> state:(t_slider_state [@mel.as "state"]) -> thumbs:(t_collection_item_with_ref array Solidtype.Solid.accessor [@mel.as "thumbs"]) -> set_thumbs:(t_collection_item_with_ref array Solidtype.Solid.setter [@mel.as "setThumbs"]) -> on_slide_start:(((float -> float -> unit) option) [@mel.as "onSlideStart"]) -> on_slide_move:(((t_slider_context_value_on_slide_move -> unit) option) [@mel.as "onSlideMove"]) -> on_slide_end:(((unit -> unit) option) [@mel.as "onSlideEnd"]) -> on_step_key_down:((Dom.keyboardEvent -> float -> unit) [@mel.as "onStepKeyDown"]) -> is_sliding_from_left:((unit -> bool) [@mel.as "isSlidingFromLeft"]) -> is_sliding_from_bottom:((unit -> bool) [@mel.as "isSlidingFromBottom"]) -> track_ref:(Dom.htmlElement option Solidtype.Solid.accessor [@mel.as "trackRef"]) -> start_edge:([ `top | `bottom | `left | `right ] Solidtype.Solid.accessor [@mel.as "startEdge"]) -> end_edge:([ `top | `bottom | `left | `right ] Solidtype.Solid.accessor [@mel.as "endEdge"]) -> min_value:(float Solidtype.Solid.accessor [@mel.as "minValue"]) -> max_value:(float Solidtype.Solid.accessor [@mel.as "maxValue"]) -> inverted:(bool Solidtype.Solid.accessor [@mel.as "inverted"]) -> register_track:((Dom.htmlElement -> unit) [@mel.as "registerTrack"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> get_value_label:(((t_get_value_label_params2 -> string) option) [@mel.as "getValueLabel"]) -> unit -> t = "" [@@mel.obj]
end

module SwitchRootState = struct
  type t = t_switch_root_state
  (** Whether the switch is checked or not. *)
  external checked : t -> bool Solidtype.Solid.accessor = "checked" [@@mel.get]
  external make : checked:(bool Solidtype.Solid.accessor [@mel.as "checked"]) -> unit -> t = "" [@@mel.obj]
end

module SwitchContextValue = struct
  type t = t_switch_context_value
  external value : t -> string Solidtype.Solid.accessor = "value" [@@mel.get]
  external dataset : t -> t_switch_data_set Solidtype.Solid.accessor = "dataset" [@@mel.get]
  external checked : t -> bool Solidtype.Solid.accessor = "checked" [@@mel.get]
  external input_ref : t -> Dom.htmlInputElement option Solidtype.Solid.accessor = "inputRef" [@@mel.get]
  external generate_id : t -> string -> string = "generateId" [@@mel.send]
  external toggle : t -> unit -> unit = "toggle" [@@mel.send]
  external set_is_checked : t -> bool -> unit = "setIsChecked" [@@mel.send]
  external set_is_focused : t -> bool -> unit = "setIsFocused" [@@mel.send]
  external set_input_ref : t -> Dom.htmlInputElement -> unit = "setInputRef" [@@mel.send]
  external make : value:(string Solidtype.Solid.accessor [@mel.as "value"]) -> dataset:(t_switch_data_set Solidtype.Solid.accessor [@mel.as "dataset"]) -> checked:(bool Solidtype.Solid.accessor [@mel.as "checked"]) -> input_ref:(Dom.htmlInputElement option Solidtype.Solid.accessor [@mel.as "inputRef"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> toggle:((unit -> unit) [@mel.as "toggle"]) -> set_is_checked:((bool -> unit) [@mel.as "setIsChecked"]) -> set_is_focused:((bool -> unit) [@mel.as "setIsFocused"]) -> set_input_ref:((Dom.htmlInputElement -> unit) [@mel.as "setInputRef"]) -> unit -> t = "" [@@mel.obj]
end

module TabsContextValue = struct
  type t = t_tabs_context_value
  external is_disabled : t -> bool Solidtype.Solid.accessor = "isDisabled" [@@mel.get]
  external orientation : t -> [ `horizontal | `vertical ] Solidtype.Solid.accessor = "orientation" [@@mel.get]
  external activation_mode : t -> [ `manual | `automatic ] Solidtype.Solid.accessor = "activationMode" [@@mel.get]
  external trigger_ids_map : t -> (string, string) Js.Map.t Solidtype.Solid.accessor = "triggerIdsMap" [@@mel.get]
  external content_ids_map : t -> (string, string) Js.Map.t Solidtype.Solid.accessor = "contentIdsMap" [@@mel.get]
  external list_state : t -> t_single_select_list_state Solidtype.Solid.accessor = "listState" [@@mel.get]
  external selected_tab : t -> Dom.htmlElement option Solidtype.Solid.accessor = "selectedTab" [@@mel.get]
  external set_selected_tab : t -> Dom.htmlElement option Solidtype.Solid.setter = "setSelectedTab" [@@mel.get]
  external generate_trigger_id : t -> string -> string = "generateTriggerId" [@@mel.send]
  external generate_content_id : t -> string -> string = "generateContentId" [@@mel.send]
  external make : is_disabled:(bool Solidtype.Solid.accessor [@mel.as "isDisabled"]) -> orientation:([ `horizontal | `vertical ] Solidtype.Solid.accessor [@mel.as "orientation"]) -> activation_mode:([ `manual | `automatic ] Solidtype.Solid.accessor [@mel.as "activationMode"]) -> trigger_ids_map:((string, string) Js.Map.t Solidtype.Solid.accessor [@mel.as "triggerIdsMap"]) -> content_ids_map:((string, string) Js.Map.t Solidtype.Solid.accessor [@mel.as "contentIdsMap"]) -> list_state:(t_single_select_list_state Solidtype.Solid.accessor [@mel.as "listState"]) -> selected_tab:(Dom.htmlElement option Solidtype.Solid.accessor [@mel.as "selectedTab"]) -> set_selected_tab:(Dom.htmlElement option Solidtype.Solid.setter [@mel.as "setSelectedTab"]) -> generate_trigger_id:((string -> string) [@mel.as "generateTriggerId"]) -> generate_content_id:((string -> string) [@mel.as "generateContentId"]) -> unit -> t = "" [@@mel.obj]
end

module TextFieldContextValue = struct
  type t = t_text_field_context_value
  external value : t -> string option Solidtype.Solid.accessor = "value" [@@mel.get]
  external generate_id : t -> string -> string = "generateId" [@@mel.send]
  external on_input : t -> ((t_text_field_context_value_on_input -> unit, ((Dom.htmlInputElement, Dom.htmlTextAreaElement) either, Dom.inputEvent, t_text_field_context_value_on_input -> unit) t_bound_event_handler) either) = "onInput" [@@mel.get]
  external make : value:(string option Solidtype.Solid.accessor [@mel.as "value"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> on_input:(((t_text_field_context_value_on_input -> unit, ((Dom.htmlInputElement, Dom.htmlTextAreaElement) either, Dom.inputEvent, t_text_field_context_value_on_input -> unit) t_bound_event_handler) either) [@mel.as "onInput"]) -> unit -> t = "" [@@mel.obj]
end

module Time = struct
  type t = t_time
  external hour : t -> float option = "hour" [@@mel.get]
  external minute : t -> float option = "minute" [@@mel.get]
  external second : t -> float option = "second" [@@mel.get]
  external make : ?hour:(float [@mel.as "hour"]) -> ?minute:(float [@mel.as "minute"]) -> ?second:(float [@mel.as "second"]) -> unit -> t = "" [@@mel.obj]
end

module TimeField_Root_Granularity = struct
  type t = t_time_field_root_granularity
  external hour : t -> bool = "hour" [@@mel.get]
  external minute : t -> bool = "minute" [@@mel.get]
  external second : t -> bool = "second" [@@mel.get]
  external make : hour:(bool [@mel.as "hour"]) -> minute:(bool [@mel.as "minute"]) -> second:(bool [@mel.as "second"]) -> unit -> t = "" [@@mel.obj]
end

module TimeField_Root_Translations = struct
  type t = t_time_field_root_translations
  external hour : t -> string = "hour" [@@mel.get]
  external minute : t -> string = "minute" [@@mel.get]
  external second : t -> string = "second" [@@mel.get]
  external am : t -> string = "am" [@@mel.get]
  external pm : t -> string = "pm" [@@mel.get]
  external day_period : t -> string = "dayPeriod" [@@mel.get]
  external time_zone_name : t -> string = "timeZoneName" [@@mel.get]
  external selected_time_description : t -> string -> string = "selectedTimeDescription" [@@mel.send]
  external make : hour:(string [@mel.as "hour"]) -> minute:(string [@mel.as "minute"]) -> second:(string [@mel.as "second"]) -> am:(string [@mel.as "am"]) -> pm:(string [@mel.as "pm"]) -> day_period:(string [@mel.as "dayPeriod"]) -> time_zone_name:(string [@mel.as "timeZoneName"]) -> selected_time_description:((string -> string) [@mel.as "selectedTimeDescription"]) -> unit -> t = "" [@@mel.obj]
end

module Toast_Region_Translations = struct
  type t = t_toast_region_translations
  external notifications : t -> string -> string = "notifications" [@@mel.send]
  external make : notifications:((string -> string) [@mel.as "notifications"]) -> unit -> t = "" [@@mel.obj]
end

module Toast_Root_Translations = struct
  type t = t_toast_root_translations
  external close : t -> string = "close" [@@mel.get]
  external make : close:(string [@mel.as "close"]) -> unit -> t = "" [@@mel.obj]
end

module SwipeEvent = struct
  type t = t_swipe_event
  external current_target : t -> Dom.eventTarget = "currentTarget" [@@mel.get]
  (** The **`type`** read-only property of the Event interface returns a string containing the event's type.
      
      \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Event/type) *)
  external type_ : t -> string = "type" [@@mel.get]
  (** The read-only **`detail`** property of the CustomEvent interface returns any data passed when initializing the event.
      
      \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/CustomEvent/detail) *)
  external detail : t -> t_swipe_event_detail = "detail" [@@mel.get]
  external init_custom_event : t -> string -> ?bubbles:bool -> ?cancelable:bool -> ?detail:t_swipe_event_detail -> unit -> unit = "initCustomEvent" [@@mel.send]
  (** The **`bubbles`** read-only property of the Event interface indicates whether the event bubbles up through the DOM tree or not.
      
      \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Event/bubbles) *)
  external bubbles : t -> bool = "bubbles" [@@mel.get]
  (** The **`cancelBubble`** property of the Event interface is deprecated. *)
  external cancel_bubble : t -> bool = "cancelBubble" [@@mel.get]
  (** The **`cancelable`** read-only property of the Event interface indicates whether the event can be canceled, and therefore prevented as if the event never happened.
      
      \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Event/cancelable) *)
  external cancelable : t -> bool = "cancelable" [@@mel.get]
  (** The read-only **`composed`** property of the or not the event will propagate across the shadow DOM boundary into the standard DOM.
      
      \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Event/composed) *)
  external composed : t -> bool = "composed" [@@mel.get]
  (** The **`defaultPrevented`** read-only property of the Event interface returns a boolean value indicating whether or not the call to Event.preventDefault() canceled the event.
      
      \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Event/defaultPrevented) *)
  external default_prevented : t -> bool = "defaultPrevented" [@@mel.get]
  (** The **`eventPhase`** read-only property of the being evaluated.
      
      \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Event/eventPhase) *)
  external event_phase : t -> float = "eventPhase" [@@mel.get]
  (** The **`isTrusted`** read-only property of the when the event was generated by the user agent (including via user actions and programmatic methods such as HTMLElement.focus()), and `false` when the event was dispatched via The only exception is the `click` event, which initializes the `isTrusted` property to `false` in user agents.
      
      \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Event/isTrusted) *)
  external is_trusted : t -> bool = "isTrusted" [@@mel.get]
  (** The Event property **`returnValue`** indicates whether the default action for this event has been prevented or not. *)
  external return_value : t -> bool = "returnValue" [@@mel.get]
  (** The deprecated **`Event.srcElement`** is an alias for the Event.target property. *)
  external src_element : t -> Dom.eventTarget Js.Nullable.t = "srcElement" [@@mel.get]
  (** The read-only **`target`** property of the dispatched.
      
      \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Event/target) *)
  external target : t -> Dom.eventTarget Js.Nullable.t = "target" [@@mel.get]
  (** The **`timeStamp`** read-only property of the Event interface returns the time (in milliseconds) at which the event was created.
      
      \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Event/timeStamp) *)
  external time_stamp : t -> float = "timeStamp" [@@mel.get]
  external composed_path : t -> unit -> Dom.eventTarget array = "composedPath" [@@mel.send]
  external init_event : t -> string -> ?bubbles:bool -> ?cancelable:bool -> unit -> unit = "initEvent" [@@mel.send]
  external prevent_default : t -> unit -> unit = "preventDefault" [@@mel.send]
  external stop_immediate_propagation : t -> unit -> unit = "stopImmediatePropagation" [@@mel.send]
  external stop_propagation : t -> unit -> unit = "stopPropagation" [@@mel.send]
  external none : t -> float = "NONE" [@@mel.get]
  external capturing_phase : t -> float = "CAPTURING_PHASE" [@@mel.get]
  external at_target : t -> float = "AT_TARGET" [@@mel.get]
  external bubbling_phase : t -> float = "BUBBLING_PHASE" [@@mel.get]
end

module Toast_Toaster = struct
  type t = t_toast_toaster
  external show : t -> (t_toast_component_props -> Solidtype.Jsx.element) -> ?options:t_show_toast_options -> unit -> float = "show" [@@mel.send]
  external update : t -> float -> (t_toast_component_props -> Solidtype.Jsx.element) -> unit = "update" [@@mel.send]
  external promise : t -> (('t Js.Promise.t, unit -> 't Js.Promise.t) either) -> (('t, 'u) t_toast_promise_component_props -> Solidtype.Jsx.element) -> ?options:t_show_toast_options -> unit -> float = "promise" [@@mel.send]
  external dismiss : t -> float -> float = "dismiss" [@@mel.send]
  external clear : t -> unit -> unit = "clear" [@@mel.send]
  external make : show:(((t_toast_component_props -> Solidtype.Jsx.element) -> t_show_toast_options option -> float) [@mel.as "show"]) -> update:((float -> (t_toast_component_props -> Solidtype.Jsx.element) -> unit) [@mel.as "update"]) -> promise:(((('t Js.Promise.t, unit -> 't Js.Promise.t) either) -> (('t, 'u) t_toast_promise_component_props -> Solidtype.Jsx.element) -> t_show_toast_options option -> float) [@mel.as "promise"]) -> dismiss:((float -> float) [@mel.as "dismiss"]) -> clear:((unit -> unit) [@mel.as "clear"]) -> unit -> t = "" [@@mel.obj]
end

module ToastContextValue = struct
  type t = t_toast_context_value
  external translations : t -> t_toast_root_translations Solidtype.Solid.accessor = "translations" [@@mel.get]
  external close : t -> unit -> unit = "close" [@@mel.send]
  external duration : t -> float Solidtype.Solid.accessor = "duration" [@@mel.get]
  external is_persistent : t -> bool Solidtype.Solid.accessor = "isPersistent" [@@mel.get]
  external close_timer_start_time : t -> float Solidtype.Solid.accessor = "closeTimerStartTime" [@@mel.get]
  external generate_id : t -> string -> string = "generateId" [@@mel.send]
  external register_title_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerTitleId" [@@mel.get]
  let register_title_id o x0 = let r = (register_title_id_js o) x0 [@u] in fun () -> r () [@u]
  external register_description_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerDescriptionId" [@@mel.get]
  let register_description_id o x0 = let r = (register_description_id_js o) x0 [@u] in fun () -> r () [@u]
  external make_js : translations:(t_toast_root_translations Solidtype.Solid.accessor [@mel.as "translations"]) -> close:((unit -> unit) [@mel.as "close"]) -> duration:(float Solidtype.Solid.accessor [@mel.as "duration"]) -> is_persistent:(bool Solidtype.Solid.accessor [@mel.as "isPersistent"]) -> close_timer_start_time:(float Solidtype.Solid.accessor [@mel.as "closeTimerStartTime"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> register_title_id:((string -> (unit -> unit)) [@mel.as "registerTitleId"]) -> register_description_id:((string -> (unit -> unit)) [@mel.as "registerDescriptionId"]) -> unit -> t = "" [@@mel.obj]
  let make ~translations ~close ~duration ~is_persistent ~close_timer_start_time ~generate_id ~register_title_id ~register_description_id () = make_js ~translations ~close ~duration ~is_persistent ~close_timer_start_time ~generate_id ~register_title_id:(fun x0 -> let r = register_title_id x0 in fun () -> r ()) ~register_description_id:(fun x0 -> let r = register_description_id x0 in fun () -> r ()) ()
end

module ToggleButtonRootState = struct
  type t = t_toggle_button_root_state
  (** Whether the toggle button is on (pressed) or off (not pressed). *)
  external pressed : t -> bool Solidtype.Solid.accessor = "pressed" [@@mel.get]
  external make : pressed:(bool Solidtype.Solid.accessor [@mel.as "pressed"]) -> unit -> t = "" [@@mel.obj]
end

module ToggleGroupContextValue = struct
  type t = t_toggle_group_context_value
  external is_multiple : t -> bool Solidtype.Solid.accessor = "isMultiple" [@@mel.get]
  external is_disabled : t -> bool Solidtype.Solid.accessor = "isDisabled" [@@mel.get]
  external list_state : t -> t_list_state Solidtype.Solid.accessor = "listState" [@@mel.get]
  external generate_id : t -> string -> string = "generateId" [@@mel.send]
  external orientation : t -> [ `horizontal | `vertical ] Solidtype.Solid.accessor = "orientation" [@@mel.get]
  external make : is_multiple:(bool Solidtype.Solid.accessor [@mel.as "isMultiple"]) -> is_disabled:(bool Solidtype.Solid.accessor [@mel.as "isDisabled"]) -> list_state:(t_list_state Solidtype.Solid.accessor [@mel.as "listState"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> orientation:([ `horizontal | `vertical ] Solidtype.Solid.accessor [@mel.as "orientation"]) -> unit -> t = "" [@@mel.obj]
end

module TooltipContextValue = struct
  type t = t_tooltip_context_value
  external dataset : t -> t_tooltip_data_set Solidtype.Solid.accessor = "dataset" [@@mel.get]
  external is_open : t -> bool Solidtype.Solid.accessor = "isOpen" [@@mel.get]
  external is_disabled : t -> bool Solidtype.Solid.accessor = "isDisabled" [@@mel.get]
  external trigger_on_focus_only : t -> bool Solidtype.Solid.accessor = "triggerOnFocusOnly" [@@mel.get]
  external content_id : t -> string option Solidtype.Solid.accessor = "contentId" [@@mel.get]
  external content_present : t -> bool Solidtype.Solid.accessor = "contentPresent" [@@mel.get]
  external open_tooltip : t -> ?immediate:bool -> unit -> unit = "openTooltip" [@@mel.send]
  external hide_tooltip : t -> ?immediate:bool -> unit -> unit = "hideTooltip" [@@mel.send]
  external cancel_opening : t -> unit -> unit = "cancelOpening" [@@mel.send]
  external generate_id : t -> string -> string = "generateId" [@@mel.send]
  external register_content_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerContentId" [@@mel.get]
  let register_content_id o x0 = let r = (register_content_id_js o) x0 [@u] in fun () -> r () [@u]
  external is_target_on_tooltip : t -> Dom.node Js.Nullable.t -> bool = "isTargetOnTooltip" [@@mel.send]
  external set_trigger_ref : t -> Dom.htmlElement -> unit = "setTriggerRef" [@@mel.send]
  external set_content_ref : t -> Dom.htmlElement -> unit = "setContentRef" [@@mel.send]
  external make_js : dataset:(t_tooltip_data_set Solidtype.Solid.accessor [@mel.as "dataset"]) -> is_open:(bool Solidtype.Solid.accessor [@mel.as "isOpen"]) -> is_disabled:(bool Solidtype.Solid.accessor [@mel.as "isDisabled"]) -> trigger_on_focus_only:(bool Solidtype.Solid.accessor [@mel.as "triggerOnFocusOnly"]) -> content_id:(string option Solidtype.Solid.accessor [@mel.as "contentId"]) -> content_present:(bool Solidtype.Solid.accessor [@mel.as "contentPresent"]) -> open_tooltip:((bool option -> unit) [@mel.as "openTooltip"]) -> hide_tooltip:((bool option -> unit) [@mel.as "hideTooltip"]) -> cancel_opening:((unit -> unit) [@mel.as "cancelOpening"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> register_content_id:((string -> (unit -> unit)) [@mel.as "registerContentId"]) -> is_target_on_tooltip:((Dom.node Js.Nullable.t -> bool) [@mel.as "isTargetOnTooltip"]) -> set_trigger_ref:((Dom.htmlElement -> unit) [@mel.as "setTriggerRef"]) -> set_content_ref:((Dom.htmlElement -> unit) [@mel.as "setContentRef"]) -> unit -> t = "" [@@mel.obj]
  let make ~dataset ~is_open ~is_disabled ~trigger_on_focus_only ~content_id ~content_present ~open_tooltip ~hide_tooltip ~cancel_opening ~generate_id ~register_content_id ~is_target_on_tooltip ~set_trigger_ref ~set_content_ref () = make_js ~dataset ~is_open ~is_disabled ~trigger_on_focus_only ~content_id ~content_present ~open_tooltip ~hide_tooltip ~cancel_opening ~generate_id ~register_content_id:(fun x0 -> let r = register_content_id x0 in fun () -> r ()) ~is_target_on_tooltip ~set_trigger_ref ~set_content_ref ()
end

module CheckboxDataSet = struct
  type t = t_checkbox_data_set
end

module CollapsibleDataSet = struct
  type t = t_collapsible_data_set
end

module ColorChannelRange = struct
  type t = t_color_channel_range
  (** The minimum value of the color channel. *)
  external min_value : t -> float = "minValue" [@@mel.get]
  (** The maximum value of the color channel. *)
  external max_value : t -> float = "maxValue" [@@mel.get]
  (** The step value of the color channel, used when incrementing and decrementing. *)
  external step : t -> float = "step" [@@mel.get]
  (** The page step value of the color channel, used when incrementing and decrementing. *)
  external page_size : t -> float = "pageSize" [@@mel.get]
  external make : min_value:(float [@mel.as "minValue"]) -> max_value:(float [@mel.as "maxValue"]) -> step:(float [@mel.as "step"]) -> page_size:(float [@mel.as "pageSize"]) -> unit -> t = "" [@@mel.obj]
end

module Color_GetColorSpaceAxes = struct
  type t = t_color_get_color_space_axes
  external x_channel : t -> [ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] option = "xChannel" [@@mel.get]
  external y_channel : t -> [ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] option = "yChannel" [@@mel.get]
  external make : ?x_channel:([ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] [@mel.as "xChannel"]) -> ?y_channel:([ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] [@mel.as "yChannel"]) -> unit -> t = "" [@@mel.obj]
end

module ColorAxes = struct
  type t = t_color_axes
  external x_channel : t -> [ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] = "xChannel" [@@mel.get]
  external y_channel : t -> [ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] = "yChannel" [@@mel.get]
  external z_channel : t -> [ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] = "zChannel" [@@mel.get]
  external make : x_channel:([ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] [@mel.as "xChannel"]) -> y_channel:([ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] [@mel.as "yChannel"]) -> z_channel:([ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] [@mel.as "zChannel"]) -> unit -> t = "" [@@mel.obj]
end

module ColorAreaState = struct
  type t = t_color_area_state
  external value : t -> t_color Solidtype.Solid.accessor = "value" [@@mel.get]
  external set_value : t -> t_color -> unit = "setValue" [@@mel.send]
  external x_value : t -> float Solidtype.Solid.accessor = "xValue" [@@mel.get]
  external y_value : t -> float Solidtype.Solid.accessor = "yValue" [@@mel.get]
  external set_x_value : t -> float -> unit = "setXValue" [@@mel.send]
  external set_y_value : t -> float -> unit = "setYValue" [@@mel.send]
  external x_step : t -> float Solidtype.Solid.accessor = "xStep" [@@mel.get]
  external y_step : t -> float Solidtype.Solid.accessor = "yStep" [@@mel.get]
  external x_page_size : t -> float Solidtype.Solid.accessor = "xPageSize" [@@mel.get]
  external y_page_size : t -> float Solidtype.Solid.accessor = "yPageSize" [@@mel.get]
  external x_max_value : t -> float Solidtype.Solid.accessor = "xMaxValue" [@@mel.get]
  external y_max_value : t -> float Solidtype.Solid.accessor = "yMaxValue" [@@mel.get]
  external x_min_value : t -> float Solidtype.Solid.accessor = "xMinValue" [@@mel.get]
  external y_min_value : t -> float Solidtype.Solid.accessor = "yMinValue" [@@mel.get]
  external increment_x : t -> float -> unit = "incrementX" [@@mel.send]
  external increment_y : t -> float -> unit = "incrementY" [@@mel.send]
  external decrement_x : t -> float -> unit = "decrementX" [@@mel.send]
  external decrement_y : t -> float -> unit = "decrementY" [@@mel.send]
  external get_thumb_position : t -> unit -> t_color_area_state_get_thumb_position = "getThumbPosition" [@@mel.send]
  external is_dragging : t -> bool Solidtype.Solid.accessor = "isDragging" [@@mel.get]
  external set_is_dragging : t -> bool -> unit = "setIsDragging" [@@mel.send]
  external channels : t -> t_color_area_state_channels Solidtype.Solid.accessor = "channels" [@@mel.get]
  external reset_value : t -> unit -> unit = "resetValue" [@@mel.send]
  external get_thumb_percent : t -> unit -> t_color_area_state_get_thumb_percent = "getThumbPercent" [@@mel.send]
  external set_thumb_percent : t -> t_color_area_state_set_thumb_percent -> unit = "setThumbPercent" [@@mel.send]
  external set_thumb_value : t -> t_color_area_state_set_thumb_value -> unit = "setThumbValue" [@@mel.send]
  external is_disabled : t -> bool Solidtype.Solid.accessor = "isDisabled" [@@mel.get]
  external make : value:(t_color Solidtype.Solid.accessor [@mel.as "value"]) -> set_value:((t_color -> unit) [@mel.as "setValue"]) -> x_value:(float Solidtype.Solid.accessor [@mel.as "xValue"]) -> y_value:(float Solidtype.Solid.accessor [@mel.as "yValue"]) -> set_x_value:((float -> unit) [@mel.as "setXValue"]) -> set_y_value:((float -> unit) [@mel.as "setYValue"]) -> x_step:(float Solidtype.Solid.accessor [@mel.as "xStep"]) -> y_step:(float Solidtype.Solid.accessor [@mel.as "yStep"]) -> x_page_size:(float Solidtype.Solid.accessor [@mel.as "xPageSize"]) -> y_page_size:(float Solidtype.Solid.accessor [@mel.as "yPageSize"]) -> x_max_value:(float Solidtype.Solid.accessor [@mel.as "xMaxValue"]) -> y_max_value:(float Solidtype.Solid.accessor [@mel.as "yMaxValue"]) -> x_min_value:(float Solidtype.Solid.accessor [@mel.as "xMinValue"]) -> y_min_value:(float Solidtype.Solid.accessor [@mel.as "yMinValue"]) -> increment_x:((float -> unit) [@mel.as "incrementX"]) -> increment_y:((float -> unit) [@mel.as "incrementY"]) -> decrement_x:((float -> unit) [@mel.as "decrementX"]) -> decrement_y:((float -> unit) [@mel.as "decrementY"]) -> get_thumb_position:((unit -> t_color_area_state_get_thumb_position) [@mel.as "getThumbPosition"]) -> is_dragging:(bool Solidtype.Solid.accessor [@mel.as "isDragging"]) -> set_is_dragging:((bool -> unit) [@mel.as "setIsDragging"]) -> channels:(t_color_area_state_channels Solidtype.Solid.accessor [@mel.as "channels"]) -> reset_value:((unit -> unit) [@mel.as "resetValue"]) -> get_thumb_percent:((unit -> t_color_area_state_get_thumb_percent) [@mel.as "getThumbPercent"]) -> set_thumb_percent:((t_color_area_state_set_thumb_percent -> unit) [@mel.as "setThumbPercent"]) -> set_thumb_value:((t_color_area_state_set_thumb_value -> unit) [@mel.as "setThumbValue"]) -> is_disabled:(bool Solidtype.Solid.accessor [@mel.as "isDisabled"]) -> unit -> t = "" [@@mel.obj]
end

module ColorAreaContextValue_OnDrag = struct
  type t = t_color_area_context_value_on_drag
  external delta_x : t -> float = "deltaX" [@@mel.get]
  external delta_y : t -> float = "deltaY" [@@mel.get]
  external make : delta_x:(float [@mel.as "deltaX"]) -> delta_y:(float [@mel.as "deltaY"]) -> unit -> t = "" [@@mel.obj]
end

module ColorFieldContextValue_OnBlur = struct
  type t = t_color_field_context_value_on_blur
  (** The **`currentTarget`** read-only property of the Event interface identifies the element to which the event handler has been attached.
      
      \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Event/currentTarget) *)
  external current_target : t -> Dom.eventTarget = "currentTarget" [@@mel.get]
  (** The read-only **`target`** property of the dispatched.
      
      \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Event/target) *)
  external target : t -> Dom.eventTarget = "target" [@@mel.get]
  external to_focus_event : t -> Dom.focusEvent = "%identity"
end

module BoundEventHandler = struct
  type ('t, 'e, 'e_handler) t = ('t, 'e, 'e_handler) t_bound_event_handler
end

module Context_Id = struct
  type t = t_context_id
  external to_string : t -> unit -> string = "toString" [@@mel.send]
  external value_of : t -> unit -> t_context_id = "valueOf" [@@mel.send]
  (** Expose the \[\[Description\]\] internal slot of a symbol directly. *)
  external description : t -> string option = "description" [@@mel.get]
end

(** Extend props to require a `children` prop with the specified type.
    Use this for components where you need a specific child type,
    typically a function that receives specific argument types.
    Note that all JSX <Elements> are of the type `JSX.Element`. *)
module FlowProps = struct
  type ('p, 'c) t = ('p, 'c) t_flow_props
  external children : ('p, 'c) t -> Solidtype.Jsx.element = "children" [@@mel.get]
  external make : value:('t [@mel.as "value"]) -> children:(Solidtype.Jsx.element [@mel.as "children"]) -> unit -> ('p, 'c) t = "" [@@mel.obj]
end

module Context_Provider = struct
  type t = t_context_provider
  external make : value:('t [@mel.as "value"]) -> unit -> t = "" [@@mel.obj]
end

module ColorWheelState = struct
  type t = t_color_wheel_state
  external value : t -> t_color Solidtype.Solid.accessor = "value" [@@mel.get]
  external set_value : t -> t_color -> unit = "setValue" [@@mel.send]
  external hue : t -> float Solidtype.Solid.accessor = "hue" [@@mel.get]
  external set_hue : t -> float -> unit = "setHue" [@@mel.send]
  external step : t -> float Solidtype.Solid.accessor = "step" [@@mel.get]
  external page_size : t -> float Solidtype.Solid.accessor = "pageSize" [@@mel.get]
  external max_value : t -> float Solidtype.Solid.accessor = "maxValue" [@@mel.get]
  external min_value : t -> float Solidtype.Solid.accessor = "minValue" [@@mel.get]
  external increment : t -> float -> unit = "increment" [@@mel.send]
  external decrement : t -> float -> unit = "decrement" [@@mel.send]
  external get_thumb_position : t -> unit -> t_color_wheel_state_get_thumb_position = "getThumbPosition" [@@mel.send]
  external set_thumb_value : t -> float -> float -> float -> unit = "setThumbValue" [@@mel.send]
  external is_dragging : t -> bool Solidtype.Solid.accessor = "isDragging" [@@mel.get]
  external set_is_dragging : t -> bool -> unit = "setIsDragging" [@@mel.send]
  external reset_value : t -> unit -> unit = "resetValue" [@@mel.send]
  external is_disabled : t -> bool Solidtype.Solid.accessor = "isDisabled" [@@mel.get]
  external make : value:(t_color Solidtype.Solid.accessor [@mel.as "value"]) -> set_value:((t_color -> unit) [@mel.as "setValue"]) -> hue:(float Solidtype.Solid.accessor [@mel.as "hue"]) -> set_hue:((float -> unit) [@mel.as "setHue"]) -> step:(float Solidtype.Solid.accessor [@mel.as "step"]) -> page_size:(float Solidtype.Solid.accessor [@mel.as "pageSize"]) -> max_value:(float Solidtype.Solid.accessor [@mel.as "maxValue"]) -> min_value:(float Solidtype.Solid.accessor [@mel.as "minValue"]) -> increment:((float -> unit) [@mel.as "increment"]) -> decrement:((float -> unit) [@mel.as "decrement"]) -> get_thumb_position:((unit -> t_color_wheel_state_get_thumb_position) [@mel.as "getThumbPosition"]) -> set_thumb_value:((float -> float -> float -> unit) [@mel.as "setThumbValue"]) -> is_dragging:(bool Solidtype.Solid.accessor [@mel.as "isDragging"]) -> set_is_dragging:((bool -> unit) [@mel.as "setIsDragging"]) -> reset_value:((unit -> unit) [@mel.as "resetValue"]) -> is_disabled:(bool Solidtype.Solid.accessor [@mel.as "isDisabled"]) -> unit -> t = "" [@@mel.obj]
end

module ColorWheelContextValue_OnDrag = struct
  type t = t_color_wheel_context_value_on_drag
  external delta_x : t -> float = "deltaX" [@@mel.get]
  external delta_y : t -> float = "deltaY" [@@mel.get]
  external make : delta_x:(float [@mel.as "deltaX"]) -> delta_y:(float [@mel.as "deltaY"]) -> unit -> t = "" [@@mel.obj]
end

module ComboboxDataSet = struct
  type t = t_combobox_data_set
end

module ComboboxContextValue_OnInputKeyDown = struct
  type t = t_combobox_context_value_on_input_key_down
  (** The **`currentTarget`** read-only property of the Event interface identifies the element to which the event handler has been attached.
      
      \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Event/currentTarget) *)
  external current_target : t -> Dom.eventTarget = "currentTarget" [@@mel.get]
  (** The read-only **`target`** property of the dispatched.
      
      \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Event/target) *)
  external target : t -> Dom.eventTarget = "target" [@@mel.get]
  external to_keyboard_event : t -> Dom.keyboardEvent = "%identity"
end

module ContextMenuContextValue_SetAnchorRect = struct
  type t = t_context_menu_context_value_set_anchor_rect
  external x : t -> float = "x" [@@mel.get]
  external y : t -> float = "y" [@@mel.get]
  external make : x:(float [@mel.as "x"]) -> y:(float [@mel.as "y"]) -> unit -> t = "" [@@mel.obj]
end

module HoverCardDataSet = struct
  type t = t_hover_card_data_set
end

module DateTimeFormat_FormatRange = struct
  type t = t_date_time_format_format_range
  external to_string : t -> ?radix:float -> unit -> string = "toString" [@@mel.send]
  external value_of : t -> unit -> t_date_time_format_format_range = "valueOf" [@@mel.send]
end

(** An interface for reading and updating multiple selection state. *)
module SelectionManager = struct
  type t = t_selection_manager
  external selection_mode : t -> unit -> [ `none | `single | `multiple ] = "selectionMode" [@@mel.send]
  external disallow_empty_selection : t -> unit -> bool = "disallowEmptySelection" [@@mel.send]
  external selection_behavior : t -> unit -> [ `toggle | `replace ] = "selectionBehavior" [@@mel.send]
  external set_selection_behavior : t -> [ `toggle | `replace ] -> unit = "setSelectionBehavior" [@@mel.send]
  external is_focused : t -> unit -> bool = "isFocused" [@@mel.send]
  external set_focused : t -> bool -> unit = "setFocused" [@@mel.send]
  external focused_key : t -> unit -> string option = "focusedKey" [@@mel.send]
  external set_focused_key : t -> ?key:string -> unit -> unit = "setFocusedKey" [@@mel.send]
  external selected_keys : t -> unit -> string Js.Set.t = "selectedKeys" [@@mel.send]
  external is_selected : t -> string -> bool = "isSelected" [@@mel.send]
  external is_empty : t -> unit -> bool = "isEmpty" [@@mel.send]
  external is_select_all : t -> unit -> bool = "isSelectAll" [@@mel.send]
  external first_selected_key : t -> unit -> string option = "firstSelectedKey" [@@mel.send]
  external last_selected_key : t -> unit -> string option = "lastSelectedKey" [@@mel.send]
  external extend_selection : t -> string -> unit = "extendSelection" [@@mel.send]
  external toggle_selection : t -> string -> unit = "toggleSelection" [@@mel.send]
  external replace_selection : t -> string -> unit = "replaceSelection" [@@mel.send]
  external set_selected_keys : t -> string array -> unit = "setSelectedKeys" [@@mel.send]
  external select_all : t -> unit -> unit = "selectAll" [@@mel.send]
  external clear_selection : t -> unit -> unit = "clearSelection" [@@mel.send]
  external toggle_select_all : t -> unit -> unit = "toggleSelectAll" [@@mel.send]
  external select : t -> string -> ?e:Dom.pointerEvent -> unit -> unit = "select" [@@mel.send]
  external is_selection_equal : t -> string Js.Set.t -> bool = "isSelectionEqual" [@@mel.send]
  external can_select_item : t -> string -> bool = "canSelectItem" [@@mel.send]
  external is_disabled : t -> string -> bool = "isDisabled" [@@mel.send]
  external make : _ t_collection_node t_collection Solidtype.Solid.accessor -> t_multiple_selection_state -> t = "SelectionManager" [@@mel.new] [@@mel.module "@kobalte/core"]
end

module MenubarDataSet = struct
  type t = t_menubar_data_set
end

module MeterDataSet = struct
  type t = t_meter_data_set
end

module NavigationMenuDataSet = struct
  type t = t_navigation_menu_data_set
end

module NumberFieldContextValue_OnInput = struct
  type t = t_number_field_context_value_on_input
  (** The **`currentTarget`** read-only property of the Event interface identifies the element to which the event handler has been attached.
      
      \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Event/currentTarget) *)
  external current_target : t -> Dom.eventTarget = "currentTarget" [@@mel.get]
  (** The read-only **`target`** property of the dispatched.
      
      \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Event/target) *)
  external target : t -> Dom.eventTarget = "target" [@@mel.get]
  external to_input_event : t -> Dom.inputEvent = "%identity"
end

module PopoverDataSet = struct
  type t = t_popover_data_set
end

module ProgressDataSet = struct
  type t = t_progress_data_set
end

module SelectDataSet = struct
  type t = t_select_data_set
end

module SliderDataSet = struct
  type t = t_slider_data_set
end

module SliderState = struct
  type t = t_slider_state
  external values : t -> float array Solidtype.Solid.accessor = "values" [@@mel.get]
  external get_thumb_value : t -> float -> float = "getThumbValue" [@@mel.send]
  external set_thumb_value : t -> float -> float -> unit = "setThumbValue" [@@mel.send]
  external get_thumb_percent : t -> float -> float = "getThumbPercent" [@@mel.send]
  external set_thumb_percent : t -> float -> float -> unit = "setThumbPercent" [@@mel.send]
  external is_thumb_dragging : t -> float -> bool = "isThumbDragging" [@@mel.send]
  external set_thumb_dragging : t -> float -> bool -> unit = "setThumbDragging" [@@mel.send]
  external focused_thumb : t -> float option Solidtype.Solid.accessor = "focusedThumb" [@@mel.get]
  external set_focused_thumb : t -> float option -> unit = "setFocusedThumb" [@@mel.send]
  external get_value_percent : t -> float -> float = "getValuePercent" [@@mel.send]
  external get_thumb_value_label : t -> float -> string = "getThumbValueLabel" [@@mel.send]
  external get_formatted_value : t -> float -> string = "getFormattedValue" [@@mel.send]
  external get_thumb_min_value : t -> float -> float = "getThumbMinValue" [@@mel.send]
  external get_thumb_max_value : t -> float -> float = "getThumbMaxValue" [@@mel.send]
  external get_percent_value : t -> float -> float = "getPercentValue" [@@mel.send]
  external is_thumb_editable : t -> float -> bool = "isThumbEditable" [@@mel.send]
  external set_thumb_editable : t -> float -> bool -> unit = "setThumbEditable" [@@mel.send]
  external increment_thumb : t -> float -> ?step_size:float -> unit -> unit = "incrementThumb" [@@mel.send]
  external decrement_thumb : t -> float -> ?step_size:float -> unit -> unit = "decrementThumb" [@@mel.send]
  external step : t -> float Solidtype.Solid.accessor = "step" [@@mel.get]
  external page_size : t -> float Solidtype.Solid.accessor = "pageSize" [@@mel.get]
  external orientation : t -> [ `horizontal | `vertical ] Solidtype.Solid.accessor = "orientation" [@@mel.get]
  external is_disabled : t -> bool Solidtype.Solid.accessor = "isDisabled" [@@mel.get]
  external set_values : t -> ((float array, float array -> float array) either) -> unit = "setValues" [@@mel.send]
  external reset_values : t -> unit -> unit = "resetValues" [@@mel.send]
end

module CollectionItemWithRef = struct
  type t = t_collection_item_with_ref
  (** The type of the item. *)
  external type_ : t -> [ `section | `item ] = "type" [@@mel.get]
  (** A unique key for the item. *)
  external key : t -> string = "key" [@@mel.get]
  (** A string value for the item, used for features like typeahead. *)
  external text_value : t -> string = "textValue" [@@mel.get]
  (** Whether the item is disabled. *)
  external disabled : t -> bool = "disabled" [@@mel.get]
  external ref : t -> Dom.element option Solidtype.Solid.accessor = "ref" [@@mel.get]
  external make : type_:([ `section | `item ] [@mel.as "type"]) -> key:(string [@mel.as "key"]) -> text_value:(string [@mel.as "textValue"]) -> disabled:(bool [@mel.as "disabled"]) -> ref:(Dom.element option Solidtype.Solid.accessor [@mel.as "ref"]) -> unit -> t = "" [@@mel.obj]
end

module SliderContextValue_OnSlideMove = struct
  type t = t_slider_context_value_on_slide_move
  external delta_x : t -> float = "deltaX" [@@mel.get]
  external delta_y : t -> float = "deltaY" [@@mel.get]
  external make : delta_x:(float [@mel.as "deltaX"]) -> delta_y:(float [@mel.as "deltaY"]) -> unit -> t = "" [@@mel.obj]
end

module SwitchDataSet = struct
  type t = t_switch_data_set
end

module SingleSelectListState = struct
  type t = t_single_select_list_state
  (** The value of the currently selected item. *)
  external selected_item : t -> _ t_collection_node option Solidtype.Solid.accessor = "selectedItem" [@@mel.get]
  (** The key for the currently selected item. *)
  external selected_key : t -> string option Solidtype.Solid.accessor = "selectedKey" [@@mel.get]
  external set_selected_key : t -> string -> unit = "setSelectedKey" [@@mel.send]
  (** A collection of items in the list. *)
  external collection : t -> _ t_collection_node t_collection Solidtype.Solid.accessor = "collection" [@@mel.get]
  (** A selection manager to read and update multiple selection state. *)
  external selection_manager : t -> t_selection_manager Solidtype.Solid.accessor = "selectionManager" [@@mel.get]
end

module TextFieldContextValue_OnInput = struct
  type t = t_text_field_context_value_on_input
  (** The **`currentTarget`** read-only property of the Event interface identifies the element to which the event handler has been attached.
      
      \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Event/currentTarget) *)
  external current_target : t -> Dom.eventTarget = "currentTarget" [@@mel.get]
  (** The read-only **`target`** property of the dispatched.
      
      \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Event/target) *)
  external target : t -> Dom.eventTarget = "target" [@@mel.get]
  external to_input_event : t -> Dom.inputEvent = "%identity"
end

module SwipeEvent_Detail = struct
  type t = t_swipe_event_detail
  external original_event : t -> Dom.pointerEvent = "originalEvent" [@@mel.get]
  external delta : t -> t_swipe_event_detail_delta = "delta" [@@mel.get]
  external make : original_event:(Dom.pointerEvent [@mel.as "originalEvent"]) -> delta:(t_swipe_event_detail_delta [@mel.as "delta"]) -> unit -> t = "" [@@mel.obj]
end

module ToastComponentProps = struct
  type t = t_toast_component_props
  (** A unique id for the toast. *)
  external toast_id : t -> float = "toastId" [@@mel.get]
  external make : toast_id:(float [@mel.as "toastId"]) -> unit -> t = "" [@@mel.obj]
end

module ShowToastOptions = struct
  type t = t_show_toast_options
  (** The id of the `<Toast.Region/>` to display the toast in. *)
  external region : t -> string option = "region" [@@mel.get]
  external make : ?region:(string [@mel.as "region"]) -> unit -> t = "" [@@mel.obj]
end

module ToastPromiseComponentProps = struct
  type ('t, 'u) t = ('t, 'u) t_toast_promise_component_props
  (** The state of the promise. *)
  external state : ('t, 'u) t -> [ `pending | `fulfilled | `rejected ] = "state" [@@mel.get]
  (** The resolved data of the promise when fulfilled. *)
  external data : ('t, 'u) t -> 't option = "data" [@@mel.get]
  (** The error of the promise when rejected. *)
  external error : ('t, 'u) t -> 'u option = "error" [@@mel.get]
  (** A unique id for the toast. *)
  external toast_id : ('t, 'u) t -> float = "toastId" [@@mel.get]
  external make : state:([ `pending | `fulfilled | `rejected ] [@mel.as "state"]) -> ?data:('t [@mel.as "data"]) -> ?error:('u [@mel.as "error"]) -> toast_id:(float [@mel.as "toastId"]) -> unit -> ('t, 'u) t = "" [@@mel.obj]
end

module TooltipDataSet = struct
  type t = t_tooltip_data_set
end

module ColorAreaState_GetThumbPosition = struct
  type t = t_color_area_state_get_thumb_position
  external x : t -> float = "x" [@@mel.get]
  external y : t -> float = "y" [@@mel.get]
  external make : x:(float [@mel.as "x"]) -> y:(float [@mel.as "y"]) -> unit -> t = "" [@@mel.obj]
end

module ColorAreaState_Channels = struct
  type t = t_color_area_state_channels
  external x_channel : t -> [ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] = "xChannel" [@@mel.get]
  external y_channel : t -> [ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] = "yChannel" [@@mel.get]
  external z_channel : t -> [ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] = "zChannel" [@@mel.get]
  external make : x_channel:([ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] [@mel.as "xChannel"]) -> y_channel:([ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] [@mel.as "yChannel"]) -> z_channel:([ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] [@mel.as "zChannel"]) -> unit -> t = "" [@@mel.obj]
end

module ColorAreaState_GetThumbPercent = struct
  type t = t_color_area_state_get_thumb_percent
  external x : t -> float = "x" [@@mel.get]
  external y : t -> float = "y" [@@mel.get]
  external make : x:(float [@mel.as "x"]) -> y:(float [@mel.as "y"]) -> unit -> t = "" [@@mel.obj]
end

module ColorAreaState_SetThumbPercent = struct
  type t = t_color_area_state_set_thumb_percent
  external x : t -> float = "x" [@@mel.get]
  external y : t -> float = "y" [@@mel.get]
  external make : x:(float [@mel.as "x"]) -> y:(float [@mel.as "y"]) -> unit -> t = "" [@@mel.obj]
end

module ColorAreaState_SetThumbValue = struct
  type t = t_color_area_state_set_thumb_value
  external x : t -> float = "x" [@@mel.get]
  external y : t -> float = "y" [@@mel.get]
  external make : x:(float [@mel.as "x"]) -> y:(float [@mel.as "y"]) -> unit -> t = "" [@@mel.obj]
end

module ColorWheelState_GetThumbPosition = struct
  type t = t_color_wheel_state_get_thumb_position
  external x : t -> float = "x" [@@mel.get]
  external y : t -> float = "y" [@@mel.get]
  external make : x:(float [@mel.as "x"]) -> y:(float [@mel.as "y"]) -> unit -> t = "" [@@mel.obj]
end

module MultipleSelectionState = struct
  type t = t_multiple_selection_state
  (** The type of selection that is allowed in the collection. *)
  external selection_mode : t -> [ `none | `single | `multiple ] Solidtype.Solid.accessor = "selectionMode" [@@mel.get]
  (** The selection behavior for the collection. *)
  external selection_behavior : t -> [ `toggle | `replace ] Solidtype.Solid.accessor = "selectionBehavior" [@@mel.get]
  external set_selection_behavior : t -> [ `toggle | `replace ] -> unit = "setSelectionBehavior" [@@mel.send]
  (** Whether the collection allows empty selection. *)
  external disallow_empty_selection : t -> bool Solidtype.Solid.accessor = "disallowEmptySelection" [@@mel.get]
  (** The currently selected keys in the collection. *)
  external selected_keys : t -> string Js.Set.t Solidtype.Solid.accessor = "selectedKeys" [@@mel.get]
  external set_selected_keys : t -> string Js.Set.t -> unit = "setSelectedKeys" [@@mel.send]
  (** Whether the collection is currently focused. *)
  external is_focused : t -> bool Solidtype.Solid.accessor = "isFocused" [@@mel.get]
  (** The current focused key in the collection. *)
  external focused_key : t -> string option Solidtype.Solid.accessor = "focusedKey" [@@mel.get]
  external set_focused : t -> bool -> unit = "setFocused" [@@mel.send]
  external set_focused_key : t -> ?key:string -> unit -> unit = "setFocusedKey" [@@mel.send]
end

module SwipeEvent_Detail_Delta = struct
  type t = t_swipe_event_detail_delta
  external x : t -> float = "x" [@@mel.get]
  external y : t -> float = "y" [@@mel.get]
  external make : x:(float [@mel.as "x"]) -> y:(float [@mel.as "y"]) -> unit -> t = "" [@@mel.obj]
end
