(* Every Kobalte component, part by part, its hooks and utilities, and the
   types they name. Generated from the declarations of @kobalte/core 0.13.14
   by generate/kobalte.ts; never edited by hand.

   A part's props check takes its own props, then its children, then the
   attributes of the element it renders, which it passes on. Each check is
   external, since the compiler checks it and Melange writes none of it. *)

module Types = struct
  (* Members of different JavaScript kinds, each as it is. *)
  type ('a, 'b) either
  type t_array_buffer
  type t_array_iterator
  type t_array_like
  type t_big_int64_array
  type t_big_int_to_locale_string_options
  type t_big_uint64_array
  type t_blob
  type t_data_view
  type t_date_time_format_part
  type t_error
  type t_float16_array
  type t_float32_array
  type t_float64_array
  type t_form_data
  type t_int16_array
  type t_int32_array
  type t_int8_array
  type t_number_format_part
  type t_readable_stream
  type t_request
  type t_resolved_collator_options
  type t_resolved_date_time_format_options
  type t_resolved_number_format_options
  type t_response
  type t_shared_array_buffer
  type t_url
  type t_uint16_array
  type t_uint32_array
  type t_uint8_array
  type t_uint8_clamped_array
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
  type t_constructor_options
  type t_image
  type t_hover_card_data_set
  type t_number_format_format_to_parts
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
  type t_resize_options
  type t_modulate_options
  type t_image_jpeg
  type t_image_png
  type t_image_webp
  type t_image_heic
  type t_image_avif
  type 't_array_buffer t_buffer
  type t_bun_file
  type t_s3_file
  type t_metadata
  type t_multiple_selection_state
  type t_swipe_event_detail_delta
  type t_buffer_to_json
  type t_buffer_to_base64
  type t_buffer_set_from_base64
  type t_buffer_set_from_hex
  type t_bun_file_writer
  type t_file_sink
  type t_bun_file_write
  type t_stats
  type t_s3_options
  type t_network_sink
  type t_archive
  type t_s3_file_presign_options
  type t_s3_stats
  type t_file_sink_start
  type t_archive_extract_options
  type t_archive_options

  module Either = struct
    type ('a, 'b) t = ('a, 'b) either

    external left : 'a -> ('a, 'b) t = "%identity"
    external right : 'b -> ('a, 'b) t = "%identity"
  end

  (* The standard library's ArrayBuffer, opaque. *)
  module ArrayBuffer = struct
    type t = t_array_buffer
  end

  (* The standard library's ArrayIterator, opaque. *)
  module ArrayIterator = struct
    type t = t_array_iterator
  end

  (* The standard library's ArrayLike, opaque. *)
  module ArrayLike = struct
    type t = t_array_like
  end

  (* The standard library's BigInt64Array, opaque. *)
  module BigInt64Array = struct
    type t = t_big_int64_array
  end

  (* The standard library's BigIntToLocaleStringOptions, opaque. *)
  module BigIntToLocaleStringOptions = struct
    type t = t_big_int_to_locale_string_options
  end

  (* The standard library's BigUint64Array, opaque. *)
  module BigUint64Array = struct
    type t = t_big_uint64_array
  end

  (* The standard library's Blob, opaque. *)
  module Blob = struct
    type t = t_blob
  end

  (* The standard library's DataView, opaque. *)
  module DataView = struct
    type t = t_data_view
  end

  (* The standard library's DateTimeFormatPart, opaque. *)
  module DateTimeFormatPart = struct
    type t = t_date_time_format_part
  end

  (* The standard library's Error, opaque. *)
  module Error = struct
    type t = t_error
  end

  (* The standard library's Float16Array, opaque. *)
  module Float16Array = struct
    type t = t_float16_array
  end

  (* The standard library's Float32Array, opaque. *)
  module Float32Array = struct
    type t = t_float32_array
  end

  (* The standard library's Float64Array, opaque. *)
  module Float64Array = struct
    type t = t_float64_array
  end

  (* The standard library's FormData, opaque. *)
  module FormData = struct
    type t = t_form_data
  end

  (* The standard library's Int16Array, opaque. *)
  module Int16Array = struct
    type t = t_int16_array
  end

  (* The standard library's Int32Array, opaque. *)
  module Int32Array = struct
    type t = t_int32_array
  end

  (* The standard library's Int8Array, opaque. *)
  module Int8Array = struct
    type t = t_int8_array
  end

  (* The standard library's NumberFormatPart, opaque. *)
  module NumberFormatPart = struct
    type t = t_number_format_part
  end

  (* The standard library's ReadableStream, opaque. *)
  module ReadableStream = struct
    type t = t_readable_stream
  end

  (* The standard library's Request, opaque. *)
  module Request = struct
    type t = t_request
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

  (* The standard library's Response, opaque. *)
  module Response = struct
    type t = t_response
  end

  (* The standard library's SharedArrayBuffer, opaque. *)
  module SharedArrayBuffer = struct
    type t = t_shared_array_buffer
  end

  (* The standard library's URL, opaque. *)
  module URL = struct
    type t = t_url
  end

  (* The standard library's Uint16Array, opaque. *)
  module Uint16Array = struct
    type t = t_uint16_array
  end

  (* The standard library's Uint32Array, opaque. *)
  module Uint32Array = struct
    type t = t_uint32_array
  end

  (* The standard library's Uint8Array, opaque. *)
  module Uint8Array = struct
    type t = t_uint8_array
  end

  (* The standard library's Uint8ClampedArray, opaque. *)
  module Uint8ClampedArray = struct
    type t = t_uint8_clamped_array
  end

  module AccordionContextValue = struct
    type t = t_accordion_context_value
    external list_state : t -> t_list_state Solid.accessor = "listState" [@@mel.get]
    external generate_id_js : t -> ((string -> string) [@u]) = "generateId" [@@mel.get]
    let generate_id o x0 = (generate_id_js o) x0 [@u]
    external make : list_state:(t_list_state Solid.accessor [@mel.as "listState"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> unit -> t = "" [@@mel.obj]
  end

  module AlertDialog_Portal_Ref = struct
    type t = t_alert_dialog_portal_ref
    (** The `Element.shadowRoot` read-only property represents the shadow root hosted by the element.
        
        \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Element/shadowRoot) *)
    external shadow_root : t -> Dom.shadowRoot = "shadowRoot" [@@mel.get]
    external element : t -> Dom.element = "%identity"
  end

  module AlertDialog_Portal_Ref2 = struct
    type t = t_alert_dialog_portal_ref2
    (** The `Element.shadowRoot` read-only property represents the shadow root hosted by the element.
        
        \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Element/shadowRoot) *)
    external shadow_root : t -> Dom.shadowRoot = "shadowRoot" [@@mel.get]
    external htmlDivElement : t -> Dom.htmlDivElement = "%identity"
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
    external separator_js : t -> ((unit -> Jsx.element) [@u]) = "separator" [@@mel.get]
    let separator o () = (separator_js o) () [@u]
    external make : separator:((unit -> Jsx.element) [@mel.as "separator"]) -> unit -> t = "" [@@mel.obj]
  end

  module CheckboxRootState = struct
    type t = t_checkbox_root_state
    (** Whether the checkbox is checked or not. *)
    external checked : t -> bool Solid.accessor = "checked" [@@mel.get]
    (** Whether the checkbox is in an indeterminate state. *)
    external indeterminate : t -> bool Solid.accessor = "indeterminate" [@@mel.get]
    external make : checked:(bool Solid.accessor [@mel.as "checked"]) -> indeterminate:(bool Solid.accessor [@mel.as "indeterminate"]) -> unit -> t = "" [@@mel.obj]
  end

  module CheckboxContextValue = struct
    type t = t_checkbox_context_value
    external value : t -> string Solid.accessor = "value" [@@mel.get]
    external dataset : t -> t_checkbox_data_set Solid.accessor = "dataset" [@@mel.get]
    external checked : t -> bool Solid.accessor = "checked" [@@mel.get]
    external indeterminate : t -> bool Solid.accessor = "indeterminate" [@@mel.get]
    external input_ref : t -> Dom.htmlInputElement option Solid.accessor = "inputRef" [@@mel.get]
    external generate_id_js : t -> ((string -> string) [@u]) = "generateId" [@@mel.get]
    let generate_id o x0 = (generate_id_js o) x0 [@u]
    external toggle_js : t -> ((unit -> unit) [@u]) = "toggle" [@@mel.get]
    let toggle o () = (toggle_js o) () [@u]
    external set_is_checked_js : t -> ((bool -> unit) [@u]) = "setIsChecked" [@@mel.get]
    let set_is_checked o x0 = (set_is_checked_js o) x0 [@u]
    external set_is_focused_js : t -> ((bool -> unit) [@u]) = "setIsFocused" [@@mel.get]
    let set_is_focused o x0 = (set_is_focused_js o) x0 [@u]
    external set_input_ref_js : t -> ((Dom.htmlInputElement -> unit) [@u]) = "setInputRef" [@@mel.get]
    let set_input_ref o x0 = (set_input_ref_js o) x0 [@u]
    external make : value:(string Solid.accessor [@mel.as "value"]) -> dataset:(t_checkbox_data_set Solid.accessor [@mel.as "dataset"]) -> checked:(bool Solid.accessor [@mel.as "checked"]) -> indeterminate:(bool Solid.accessor [@mel.as "indeterminate"]) -> input_ref:(Dom.htmlInputElement option Solid.accessor [@mel.as "inputRef"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> toggle:((unit -> unit) [@mel.as "toggle"]) -> set_is_checked:((bool -> unit) [@mel.as "setIsChecked"]) -> set_is_focused:((bool -> unit) [@mel.as "setIsFocused"]) -> set_input_ref:((Dom.htmlInputElement -> unit) [@mel.as "setInputRef"]) -> unit -> t = "" [@@mel.obj]
  end

  module CollapsibleContextValue = struct
    type t = t_collapsible_context_value
    external dataset : t -> t_collapsible_data_set Solid.accessor = "dataset" [@@mel.get]
    external is_open : t -> bool Solid.accessor = "isOpen" [@@mel.get]
    external disabled : t -> bool Solid.accessor = "disabled" [@@mel.get]
    external should_mount : t -> bool Solid.accessor = "shouldMount" [@@mel.get]
    external content_id : t -> string option Solid.accessor = "contentId" [@@mel.get]
    external toggle_js : t -> ((unit -> unit) [@u]) = "toggle" [@@mel.get]
    let toggle o () = (toggle_js o) () [@u]
    external generate_id_js : t -> ((string -> string) [@u]) = "generateId" [@@mel.get]
    let generate_id o x0 = (generate_id_js o) x0 [@u]
    external register_content_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerContentId" [@@mel.get]
    let register_content_id o x0 = let r = (register_content_id_js o) x0 [@u] in fun () -> r () [@u]
    external make : dataset:(t_collapsible_data_set Solid.accessor [@mel.as "dataset"]) -> is_open:(bool Solid.accessor [@mel.as "isOpen"]) -> disabled:(bool Solid.accessor [@mel.as "disabled"]) -> should_mount:(bool Solid.accessor [@mel.as "shouldMount"]) -> content_id:(string option Solid.accessor [@mel.as "contentId"]) -> toggle:((unit -> unit) [@mel.as "toggle"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> register_content_id:((string -> (unit -> unit)) [@mel.as "registerContentId"]) -> unit -> t = "" [@@mel.obj]
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
    external to_format : t -> [ `rgb | `hsl | `hsb | `hex | `hexa | `rgba | `hsla | `hsba ] -> t_color = "toFormat" [@@mel.send]
    external to_string : t -> [ `rgb | `hsl | `hsb | `hex | `hexa | `rgba | `hsla | `hsba | `css ] option -> string = "toString" [@@mel.send]
    external clone : t -> unit -> t_color = "clone" [@@mel.send]
    external to_hex_int : t -> unit -> float = "toHexInt" [@@mel.send]
    external get_channel_value : t -> [ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] -> float = "getChannelValue" [@@mel.send]
    external with_channel_value : t -> [ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] -> float -> t_color = "withChannelValue" [@@mel.send]
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
    external x_name : t -> string option Solid.accessor = "xName" [@@mel.get]
    external y_name : t -> string option Solid.accessor = "yName" [@@mel.get]
    external on_drag_start : t -> ((float array -> unit) option) = "onDragStart" [@@mel.get]
    external on_drag : t -> ((t_color_area_context_value_on_drag -> unit) option) = "onDrag" [@@mel.get]
    external on_drag_end : t -> ((unit -> unit) option) = "onDragEnd" [@@mel.get]
    external translations : t -> t_color_area_root_translations Solid.accessor = "translations" [@@mel.get]
    external get_display_color_js : t -> ((unit -> t_color) [@u]) = "getDisplayColor" [@@mel.get]
    let get_display_color o () = (get_display_color_js o) () [@u]
    external on_step_key_down_js : t -> ((Dom.keyboardEvent -> unit) [@u]) = "onStepKeyDown" [@@mel.get]
    let on_step_key_down o x0 = (on_step_key_down_js o) x0 [@u]
    external thumb_ref : t -> Dom.htmlElement option Solid.accessor = "thumbRef" [@@mel.get]
    external set_thumb_ref_js : t -> ((Dom.htmlElement -> unit) [@u]) = "setThumbRef" [@@mel.get]
    let set_thumb_ref o x0 = (set_thumb_ref_js o) x0 [@u]
    external background_ref : t -> Dom.htmlElement option Solid.accessor = "backgroundRef" [@@mel.get]
    external set_background_ref_js : t -> ((Dom.htmlElement -> unit) [@u]) = "setBackgroundRef" [@@mel.get]
    let set_background_ref o x0 = (set_background_ref_js o) x0 [@u]
    external generate_id_js : t -> ((string -> string) [@u]) = "generateId" [@@mel.get]
    let generate_id o x0 = (generate_id_js o) x0 [@u]
    external make : state:(t_color_area_state [@mel.as "state"]) -> x_name:(string option Solid.accessor [@mel.as "xName"]) -> y_name:(string option Solid.accessor [@mel.as "yName"]) -> on_drag_start:(((float array -> unit) option) [@mel.as "onDragStart"]) -> on_drag:(((t_color_area_context_value_on_drag -> unit) option) [@mel.as "onDrag"]) -> on_drag_end:(((unit -> unit) option) [@mel.as "onDragEnd"]) -> translations:(t_color_area_root_translations Solid.accessor [@mel.as "translations"]) -> get_display_color:((unit -> t_color) [@mel.as "getDisplayColor"]) -> on_step_key_down:((Dom.keyboardEvent -> unit) [@mel.as "onStepKeyDown"]) -> thumb_ref:(Dom.htmlElement option Solid.accessor [@mel.as "thumbRef"]) -> set_thumb_ref:((Dom.htmlElement -> unit) [@mel.as "setThumbRef"]) -> background_ref:(Dom.htmlElement option Solid.accessor [@mel.as "backgroundRef"]) -> set_background_ref:((Dom.htmlElement -> unit) [@mel.as "setBackgroundRef"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> unit -> t = "" [@@mel.obj]
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
    external provider_js : 't t -> (((t_context_provider, Jsx.element) t_flow_props -> Jsx.element) [@u]) = "Provider" [@@mel.get]
    let provider o x0 = (provider_js o) x0 [@u]
    external default_value : 't t -> 't = "defaultValue" [@@mel.get]
    external make : id:(t_context_id [@mel.as "id"]) -> provider:(((t_context_provider, Jsx.element) t_flow_props -> Jsx.element) [@mel.as "Provider"]) -> default_value:('t [@mel.as "defaultValue"]) -> unit -> 't t = "" [@@mel.obj]
  end

  module ColorModeContextType = struct
    type t = t_color_mode_context_type
    external color_mode : t -> [ `light | `dark ] Solid.accessor = "colorMode" [@@mel.get]
    external set_color_mode_js : t -> (([ `light | `dark | `system ] -> unit) [@u]) = "setColorMode" [@@mel.get]
    let set_color_mode o x0 = (set_color_mode_js o) x0 [@u]
    external toggle_color_mode_js : t -> ((unit -> unit) [@u]) = "toggleColorMode" [@@mel.get]
    let toggle_color_mode o () = (toggle_color_mode_js o) () [@u]
    external make : color_mode:([ `light | `dark ] Solid.accessor [@mel.as "colorMode"]) -> set_color_mode:(([ `light | `dark | `system ] -> unit) [@mel.as "setColorMode"]) -> toggle_color_mode:((unit -> unit) [@mel.as "toggleColorMode"]) -> unit -> t = "" [@@mel.obj]
  end

  module ColorModeStorageManager = struct
    type t = t_color_mode_storage_manager
    (** The type of storage. *)
    external type_ : t -> [ `localStorage | `cookie ] = "type" [@@mel.get]
    (** Whether it's an SSR environment. *)
    external ssr : t -> bool option = "ssr" [@@mel.get]
    (** Get the color mode from the storage. *)
    external get_js : t -> (([ `light | `dark | `system ] option -> [ `light | `dark | `system ] option) [@u]) = "get" [@@mel.get]
    let get o x0 = (get_js o) x0 [@u]
    (** Save the color mode in the storage. *)
    external set_js : t -> (([ `light | `dark | `system ] -> unit) [@u]) = "set" [@@mel.get]
    let set o x0 = (set_js o) x0 [@u]
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
    external color_name_js : t -> ((string -> string -> string -> string) [@u]) = "colorName" [@@mel.get]
    let color_name o x0 x1 x2 = (color_name_js o) x0 x1 x2 [@u]
    external transparent_color_name_js : t -> ((string -> string -> string -> string -> string) [@u]) = "transparentColorName" [@@mel.get]
    let transparent_color_name o x0 x1 x2 x3 = (transparent_color_name_js o) x0 x1 x2 x3 [@u]
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
    external value : t -> t_color Solid.accessor = "value" [@@mel.get]
    external channel : t -> [ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] Solid.accessor = "channel" [@@mel.get]
    external get_display_color_js : t -> ((unit -> t_color) [@u]) = "getDisplayColor" [@@mel.get]
    let get_display_color o () = (get_display_color_js o) () [@u]
    external translations : t -> t_color_slider_root_translations Solid.accessor = "translations" [@@mel.get]
    external make : value:(t_color Solid.accessor [@mel.as "value"]) -> channel:([ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] Solid.accessor [@mel.as "channel"]) -> get_display_color:((unit -> t_color) [@mel.as "getDisplayColor"]) -> translations:(t_color_slider_root_translations Solid.accessor [@mel.as "translations"]) -> unit -> t = "" [@@mel.obj]
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
    external outer_radius : t -> float option Solid.accessor = "outerRadius" [@@mel.get]
    external thickness : t -> float Solid.accessor = "thickness" [@@mel.get]
    external on_drag_start : t -> ((float array -> unit) option) = "onDragStart" [@@mel.get]
    external on_drag : t -> ((t_color_wheel_context_value_on_drag -> unit) option) = "onDrag" [@@mel.get]
    external on_drag_end : t -> ((unit -> unit) option) = "onDragEnd" [@@mel.get]
    external get_thumb_value_label_js : t -> ((unit -> string) [@u]) = "getThumbValueLabel" [@@mel.get]
    let get_thumb_value_label o () = (get_thumb_value_label_js o) () [@u]
    external get_value_label_js : t -> ((t_color -> string) [@u]) = "getValueLabel" [@@mel.get]
    let get_value_label o x0 = (get_value_label_js o) x0 [@u]
    external on_step_key_down_js : t -> ((Dom.keyboardEvent -> unit) [@u]) = "onStepKeyDown" [@@mel.get]
    let on_step_key_down o x0 = (on_step_key_down_js o) x0 [@u]
    external thumb_ref : t -> Dom.htmlElement option Solid.accessor = "thumbRef" [@@mel.get]
    external set_thumb_ref_js : t -> ((Dom.htmlElement -> unit) [@u]) = "setThumbRef" [@@mel.get]
    let set_thumb_ref o x0 = (set_thumb_ref_js o) x0 [@u]
    external track_ref : t -> Dom.htmlElement option Solid.accessor = "trackRef" [@@mel.get]
    external set_track_ref_js : t -> ((Dom.htmlElement -> unit) [@u]) = "setTrackRef" [@@mel.get]
    let set_track_ref o x0 = (set_track_ref_js o) x0 [@u]
    external generate_id_js : t -> ((string -> string) [@u]) = "generateId" [@@mel.get]
    let generate_id o x0 = (generate_id_js o) x0 [@u]
    external make : state:(t_color_wheel_state [@mel.as "state"]) -> outer_radius:(float option Solid.accessor [@mel.as "outerRadius"]) -> thickness:(float Solid.accessor [@mel.as "thickness"]) -> on_drag_start:(((float array -> unit) option) [@mel.as "onDragStart"]) -> on_drag:(((t_color_wheel_context_value_on_drag -> unit) option) [@mel.as "onDrag"]) -> on_drag_end:(((unit -> unit) option) [@mel.as "onDragEnd"]) -> get_thumb_value_label:((unit -> string) [@mel.as "getThumbValueLabel"]) -> get_value_label:((t_color -> string) [@mel.as "getValueLabel"]) -> on_step_key_down:((Dom.keyboardEvent -> unit) [@mel.as "onStepKeyDown"]) -> thumb_ref:(Dom.htmlElement option Solid.accessor [@mel.as "thumbRef"]) -> set_thumb_ref:((Dom.htmlElement -> unit) [@mel.as "setThumbRef"]) -> track_ref:(Dom.htmlElement option Solid.accessor [@mel.as "trackRef"]) -> set_track_ref:((Dom.htmlElement -> unit) [@mel.as "setTrackRef"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> unit -> t = "" [@@mel.obj]
  end

  module ComboboxControlState = struct
    type 'option t = 'option t_combobox_control_state
    (** The selected options. *)
    external selected_options : 'option t -> 'option array Solid.accessor = "selectedOptions" [@@mel.get]
    (** A function to remove an option from the selection. *)
    external remove_js : 'option t -> (('option -> unit) [@u]) = "remove" [@@mel.get]
    let remove o x0 = (remove_js o) x0 [@u]
    (** A function to clear the selection. *)
    external clear_js : 'option t -> ((unit -> unit) [@u]) = "clear" [@@mel.get]
    let clear o () = (clear_js o) () [@u]
    external make : selected_options:('option array Solid.accessor [@mel.as "selectedOptions"]) -> remove:(('option -> unit) [@mel.as "remove"]) -> clear:((unit -> unit) [@mel.as "clear"]) -> unit -> 'option t = "" [@@mel.obj]
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
    external get_size_js : 't t -> ((unit -> float) [@u]) = "getSize" [@@mel.get]
    let get_size o () = (get_size_js o) () [@u]
    (** Iterate over all keys in the collection. *)
    external get_keys_js : 't t -> ((unit -> string array) [@u]) = "getKeys" [@@mel.get]
    let get_keys o () = (get_keys_js o) () [@u]
    (** Get an item by its key. *)
    external get_item_js : 't t -> ((string -> 't option) [@u]) = "getItem" [@@mel.get]
    let get_item o x0 = (get_item_js o) x0 [@u]
    (** Get an item by the index of its key. *)
    external at_js : 't t -> ((float -> 't option) [@u]) = "at" [@@mel.get]
    let at o x0 = (at_js o) x0 [@u]
    (** Get the key that comes before the given key in the collection. *)
    external get_key_before_js : 't t -> ((string -> string option) [@u]) = "getKeyBefore" [@@mel.get]
    let get_key_before o x0 = (get_key_before_js o) x0 [@u]
    (** Get the key that comes after the given key in the collection. *)
    external get_key_after_js : 't t -> ((string -> string option) [@u]) = "getKeyAfter" [@@mel.get]
    let get_key_after o x0 = (get_key_after_js o) x0 [@u]
    (** Get the first key in the collection. *)
    external get_first_key_js : 't t -> ((unit -> string option) [@u]) = "getFirstKey" [@@mel.get]
    let get_first_key o () = (get_first_key_js o) () [@u]
    (** Get the last key in the collection. *)
    external get_last_key_js : 't t -> ((unit -> string option) [@u]) = "getLastKey" [@@mel.get]
    let get_last_key o () = (get_last_key_js o) () [@u]
    external make : get_size:((unit -> float) [@mel.as "getSize"]) -> get_keys:((unit -> string array) [@mel.as "getKeys"]) -> get_item:((string -> 't option) [@mel.as "getItem"]) -> at:((float -> 't option) [@mel.as "at"]) -> get_key_before:((string -> string option) [@mel.as "getKeyBefore"]) -> get_key_after:((string -> string option) [@mel.as "getKeyAfter"]) -> get_first_key:((unit -> string option) [@mel.as "getFirstKey"]) -> get_last_key:((unit -> string option) [@mel.as "getLastKey"]) -> unit -> 't t = "" [@@mel.obj]
  end

  module Combobox_Root_Translations = struct
    type t = t_combobox_root_translations
    external focus_announcement_js : t -> ((string -> bool -> string) [@u]) = "focusAnnouncement" [@@mel.get]
    let focus_announcement o x0 x1 = (focus_announcement_js o) x0 x1 [@u]
    external count_announcement_js : t -> ((float -> string option) [@u]) = "countAnnouncement" [@@mel.get]
    let count_announcement o x0 = (count_announcement_js o) x0 [@u]
    external selected_announcement_js : t -> ((string -> string) [@u]) = "selectedAnnouncement" [@@mel.get]
    let selected_announcement o x0 = (selected_announcement_js o) x0 [@u]
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
    external dataset : t -> t_combobox_data_set Solid.accessor = "dataset" [@@mel.get]
    external is_open : t -> bool Solid.accessor = "isOpen" [@@mel.get]
    external is_disabled : t -> bool Solid.accessor = "isDisabled" [@@mel.get]
    external is_multiple : t -> bool Solid.accessor = "isMultiple" [@@mel.get]
    external is_virtualized : t -> bool Solid.accessor = "isVirtualized" [@@mel.get]
    external is_modal : t -> bool Solid.accessor = "isModal" [@@mel.get]
    external prevent_scroll : t -> bool Solid.accessor = "preventScroll" [@@mel.get]
    external is_input_focused : t -> bool Solid.accessor = "isInputFocused" [@@mel.get]
    external allows_empty_collection : t -> bool Solid.accessor = "allowsEmptyCollection" [@@mel.get]
    external should_focus_wrap : t -> bool Solid.accessor = "shouldFocusWrap" [@@mel.get]
    external remove_on_backspace : t -> bool Solid.accessor = "removeOnBackspace" [@@mel.get]
    external content_present : t -> bool Solid.accessor = "contentPresent" [@@mel.get]
    external auto_focus : t -> ([ `first | `last ], bool) either Solid.accessor = "autoFocus" [@@mel.get]
    external active_descendant : t -> string option Solid.accessor = "activeDescendant" [@@mel.get]
    external input_value : t -> string option Solid.accessor = "inputValue" [@@mel.get]
    external trigger_mode : t -> [ `focus | `input | `manual ] Solid.accessor = "triggerMode" [@@mel.get]
    external control_ref : t -> Dom.htmlElement option Solid.accessor = "controlRef" [@@mel.get]
    external input_ref : t -> Dom.htmlInputElement option Solid.accessor = "inputRef" [@@mel.get]
    external trigger_ref : t -> Dom.htmlElement option Solid.accessor = "triggerRef" [@@mel.get]
    external content_ref : t -> Dom.htmlElement option Solid.accessor = "contentRef" [@@mel.get]
    external listbox_id : t -> string option Solid.accessor = "listboxId" [@@mel.get]
    external trigger_aria_label : t -> string option Solid.accessor = "triggerAriaLabel" [@@mel.get]
    external listbox_aria_label : t -> string option Solid.accessor = "listboxAriaLabel" [@@mel.get]
    external list_state : t -> t_list_state Solid.accessor = "listState" [@@mel.get]
    external keyboard_delegate : t -> t_keyboard_delegate Solid.accessor = "keyboardDelegate" [@@mel.get]
    external reset_input_value_js : t -> ((string Js.Set.t -> unit) [@u]) = "resetInputValue" [@@mel.get]
    let reset_input_value o x0 = (reset_input_value_js o) x0 [@u]
    external set_is_input_focused_js : t -> ((bool -> unit) [@u]) = "setIsInputFocused" [@@mel.get]
    let set_is_input_focused o x0 = (set_is_input_focused_js o) x0 [@u]
    external set_input_value_js : t -> ((string -> unit) [@u]) = "setInputValue" [@@mel.get]
    let set_input_value o x0 = (set_input_value_js o) x0 [@u]
    external set_control_ref_js : t -> ((Dom.htmlElement -> unit) [@u]) = "setControlRef" [@@mel.get]
    let set_control_ref o x0 = (set_control_ref_js o) x0 [@u]
    external set_input_ref_js : t -> ((Dom.htmlInputElement -> unit) [@u]) = "setInputRef" [@@mel.get]
    let set_input_ref o x0 = (set_input_ref_js o) x0 [@u]
    external set_trigger_ref_js : t -> ((Dom.htmlElement -> unit) [@u]) = "setTriggerRef" [@@mel.get]
    let set_trigger_ref o x0 = (set_trigger_ref_js o) x0 [@u]
    external set_content_ref_js : t -> ((Dom.htmlElement -> unit) [@u]) = "setContentRef" [@@mel.get]
    let set_content_ref o x0 = (set_content_ref_js o) x0 [@u]
    external set_listbox_ref_js : t -> ((Dom.htmlElement -> unit) [@u]) = "setListboxRef" [@@mel.get]
    let set_listbox_ref o x0 = (set_listbox_ref_js o) x0 [@u]
    external open__js : t -> ((([ `first | `last ], bool) either -> [ `focus | `input | `manual ] option -> unit) [@u]) = "open" [@@mel.get]
    let open_ o x0 x1 = (open__js o) x0 x1 [@u]
    external close_js : t -> ((unit -> unit) [@u]) = "close" [@@mel.get]
    let close o () = (close_js o) () [@u]
    external toggle_js : t -> ((([ `first | `last ], bool) either -> [ `focus | `input | `manual ] option -> unit) [@u]) = "toggle" [@@mel.get]
    let toggle o x0 x1 = (toggle_js o) x0 x1 [@u]
    external placeholder : t -> Jsx.element Solid.accessor = "placeholder" [@@mel.get]
    external render_item_js : t -> ((_ t_collection_node -> Jsx.element) [@u]) = "renderItem" [@@mel.get]
    let render_item o x0 = (render_item_js o) x0 [@u]
    external render_section_js : t -> ((_ t_collection_node -> Jsx.element) [@u]) = "renderSection" [@@mel.get]
    let render_section o x0 = (render_section_js o) x0 [@u]
    external on_input_key_down : t -> ((t_combobox_context_value_on_input_key_down -> unit, (Dom.htmlInputElement, Dom.keyboardEvent, t_combobox_context_value_on_input_key_down -> unit) t_bound_event_handler) either) = "onInputKeyDown" [@@mel.get]
    external generate_id_js : t -> ((string -> string) [@u]) = "generateId" [@@mel.get]
    let generate_id o x0 = (generate_id_js o) x0 [@u]
    external register_listbox_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerListboxId" [@@mel.get]
    let register_listbox_id o x0 = let r = (register_listbox_id_js o) x0 [@u] in fun () -> r () [@u]
    external make : dataset:(t_combobox_data_set Solid.accessor [@mel.as "dataset"]) -> is_open:(bool Solid.accessor [@mel.as "isOpen"]) -> is_disabled:(bool Solid.accessor [@mel.as "isDisabled"]) -> is_multiple:(bool Solid.accessor [@mel.as "isMultiple"]) -> is_virtualized:(bool Solid.accessor [@mel.as "isVirtualized"]) -> is_modal:(bool Solid.accessor [@mel.as "isModal"]) -> prevent_scroll:(bool Solid.accessor [@mel.as "preventScroll"]) -> is_input_focused:(bool Solid.accessor [@mel.as "isInputFocused"]) -> allows_empty_collection:(bool Solid.accessor [@mel.as "allowsEmptyCollection"]) -> should_focus_wrap:(bool Solid.accessor [@mel.as "shouldFocusWrap"]) -> remove_on_backspace:(bool Solid.accessor [@mel.as "removeOnBackspace"]) -> content_present:(bool Solid.accessor [@mel.as "contentPresent"]) -> auto_focus:(([ `first | `last ], bool) either Solid.accessor [@mel.as "autoFocus"]) -> active_descendant:(string option Solid.accessor [@mel.as "activeDescendant"]) -> input_value:(string option Solid.accessor [@mel.as "inputValue"]) -> trigger_mode:([ `focus | `input | `manual ] Solid.accessor [@mel.as "triggerMode"]) -> control_ref:(Dom.htmlElement option Solid.accessor [@mel.as "controlRef"]) -> input_ref:(Dom.htmlInputElement option Solid.accessor [@mel.as "inputRef"]) -> trigger_ref:(Dom.htmlElement option Solid.accessor [@mel.as "triggerRef"]) -> content_ref:(Dom.htmlElement option Solid.accessor [@mel.as "contentRef"]) -> listbox_id:(string option Solid.accessor [@mel.as "listboxId"]) -> trigger_aria_label:(string option Solid.accessor [@mel.as "triggerAriaLabel"]) -> listbox_aria_label:(string option Solid.accessor [@mel.as "listboxAriaLabel"]) -> list_state:(t_list_state Solid.accessor [@mel.as "listState"]) -> keyboard_delegate:(t_keyboard_delegate Solid.accessor [@mel.as "keyboardDelegate"]) -> reset_input_value:((string Js.Set.t -> unit) [@mel.as "resetInputValue"]) -> set_is_input_focused:((bool -> unit) [@mel.as "setIsInputFocused"]) -> set_input_value:((string -> unit) [@mel.as "setInputValue"]) -> set_control_ref:((Dom.htmlElement -> unit) [@mel.as "setControlRef"]) -> set_input_ref:((Dom.htmlInputElement -> unit) [@mel.as "setInputRef"]) -> set_trigger_ref:((Dom.htmlElement -> unit) [@mel.as "setTriggerRef"]) -> set_content_ref:((Dom.htmlElement -> unit) [@mel.as "setContentRef"]) -> set_listbox_ref:((Dom.htmlElement -> unit) [@mel.as "setListboxRef"]) -> open_:((([ `first | `last ], bool) either -> [ `focus | `input | `manual ] option -> unit) [@mel.as "open"]) -> close:((unit -> unit) [@mel.as "close"]) -> toggle:((([ `first | `last ], bool) either -> [ `focus | `input | `manual ] option -> unit) [@mel.as "toggle"]) -> placeholder:(Jsx.element Solid.accessor [@mel.as "placeholder"]) -> render_item:((_ t_collection_node -> Jsx.element) [@mel.as "renderItem"]) -> render_section:((_ t_collection_node -> Jsx.element) [@mel.as "renderSection"]) -> on_input_key_down:(((t_combobox_context_value_on_input_key_down -> unit, (Dom.htmlInputElement, Dom.keyboardEvent, t_combobox_context_value_on_input_key_down -> unit) t_bound_event_handler) either) [@mel.as "onInputKeyDown"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> register_listbox_id:((string -> (unit -> unit)) [@mel.as "registerListboxId"]) -> unit -> t = "" [@@mel.obj]
  end

  module ContextMenuContextValue = struct
    type t = t_context_menu_context_value
    external set_anchor_rect : t -> t_context_menu_context_value_set_anchor_rect Solid.setter = "setAnchorRect" [@@mel.get]
    external make : set_anchor_rect:(t_context_menu_context_value_set_anchor_rect Solid.setter [@mel.as "setAnchorRect"]) -> unit -> t = "" [@@mel.obj]
  end

  module DialogContextValue = struct
    type t = t_dialog_context_value
    external translations : t -> t_alert_dialog_root_translations Solid.accessor = "translations" [@@mel.get]
    external is_open : t -> bool Solid.accessor = "isOpen" [@@mel.get]
    external modal : t -> bool Solid.accessor = "modal" [@@mel.get]
    external prevent_scroll : t -> bool Solid.accessor = "preventScroll" [@@mel.get]
    external content_id : t -> string option Solid.accessor = "contentId" [@@mel.get]
    external title_id : t -> string option Solid.accessor = "titleId" [@@mel.get]
    external description_id : t -> string option Solid.accessor = "descriptionId" [@@mel.get]
    external trigger_ref : t -> Dom.htmlElement option Solid.accessor = "triggerRef" [@@mel.get]
    external overlay_ref : t -> Dom.htmlElement option Solid.accessor = "overlayRef" [@@mel.get]
    external set_overlay_ref : t -> Dom.htmlElement option Solid.setter = "setOverlayRef" [@@mel.get]
    external content_ref : t -> Dom.htmlElement option Solid.accessor = "contentRef" [@@mel.get]
    external set_content_ref : t -> Dom.htmlElement option Solid.setter = "setContentRef" [@@mel.get]
    external overlay_present : t -> bool Solid.accessor = "overlayPresent" [@@mel.get]
    external content_present : t -> bool Solid.accessor = "contentPresent" [@@mel.get]
    external close_js : t -> ((unit -> unit) [@u]) = "close" [@@mel.get]
    let close o () = (close_js o) () [@u]
    external toggle_js : t -> ((unit -> unit) [@u]) = "toggle" [@@mel.get]
    let toggle o () = (toggle_js o) () [@u]
    external set_trigger_ref : t -> Dom.htmlElement option Solid.setter = "setTriggerRef" [@@mel.get]
    external generate_id_js : t -> ((string -> string) [@u]) = "generateId" [@@mel.get]
    let generate_id o x0 = (generate_id_js o) x0 [@u]
    external register_content_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerContentId" [@@mel.get]
    let register_content_id o x0 = let r = (register_content_id_js o) x0 [@u] in fun () -> r () [@u]
    external register_title_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerTitleId" [@@mel.get]
    let register_title_id o x0 = let r = (register_title_id_js o) x0 [@u] in fun () -> r () [@u]
    external register_description_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerDescriptionId" [@@mel.get]
    let register_description_id o x0 = let r = (register_description_id_js o) x0 [@u] in fun () -> r () [@u]
    external make : translations:(t_alert_dialog_root_translations Solid.accessor [@mel.as "translations"]) -> is_open:(bool Solid.accessor [@mel.as "isOpen"]) -> modal:(bool Solid.accessor [@mel.as "modal"]) -> prevent_scroll:(bool Solid.accessor [@mel.as "preventScroll"]) -> content_id:(string option Solid.accessor [@mel.as "contentId"]) -> title_id:(string option Solid.accessor [@mel.as "titleId"]) -> description_id:(string option Solid.accessor [@mel.as "descriptionId"]) -> trigger_ref:(Dom.htmlElement option Solid.accessor [@mel.as "triggerRef"]) -> overlay_ref:(Dom.htmlElement option Solid.accessor [@mel.as "overlayRef"]) -> set_overlay_ref:(Dom.htmlElement option Solid.setter [@mel.as "setOverlayRef"]) -> content_ref:(Dom.htmlElement option Solid.accessor [@mel.as "contentRef"]) -> set_content_ref:(Dom.htmlElement option Solid.setter [@mel.as "setContentRef"]) -> overlay_present:(bool Solid.accessor [@mel.as "overlayPresent"]) -> content_present:(bool Solid.accessor [@mel.as "contentPresent"]) -> close:((unit -> unit) [@mel.as "close"]) -> toggle:((unit -> unit) [@mel.as "toggle"]) -> set_trigger_ref:(Dom.htmlElement option Solid.setter [@mel.as "setTriggerRef"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> register_content_id:((string -> (unit -> unit)) [@mel.as "registerContentId"]) -> register_title_id:((string -> (unit -> unit)) [@mel.as "registerTitleId"]) -> register_description_id:((string -> (unit -> unit)) [@mel.as "registerDescriptionId"]) -> unit -> t = "" [@@mel.obj]
  end

  module FileFieldContextValue = struct
    type t = t_file_field_context_value
    external translations : t -> t_file_field_root_translations Solid.accessor = "translations" [@@mel.get]
    external input_id : t -> string Solid.accessor = "inputId" [@@mel.get]
    external file_input_ref : t -> Dom.htmlInputElement option Solid.accessor = "fileInputRef" [@@mel.get]
    external set_file_input_ref : t -> Dom.htmlInputElement option Solid.setter = "setFileInputRef" [@@mel.get]
    external dropzone_ref : t -> Dom.htmlElement option Solid.accessor = "dropzoneRef" [@@mel.get]
    external set_dropzone_ref : t -> Dom.htmlElement option Solid.setter = "setDropzoneRef" [@@mel.get]
    external disabled : t -> bool option Solid.accessor = "disabled" [@@mel.get]
    external multiple : t -> bool option Solid.accessor = "multiple" [@@mel.get]
    external accept : t -> string option Solid.accessor = "accept" [@@mel.get]
    external allow_drag_and_drop : t -> bool option Solid.accessor = "allowDragAndDrop" [@@mel.get]
    external process_files_js : t -> ((t_file array -> unit) [@u]) = "processFiles" [@@mel.get]
    let process_files o x0 = (process_files_js o) x0 [@u]
    external accepted_files : t -> t_file array = "acceptedFiles" [@@mel.get]
    external rejected_files : t -> t_file_rejection array = "rejectedFiles" [@@mel.get]
    external remove_file_js : t -> ((t_file -> unit) [@u]) = "removeFile" [@@mel.get]
    let remove_file o x0 = (remove_file_js o) x0 [@u]
    external make : translations:(t_file_field_root_translations Solid.accessor [@mel.as "translations"]) -> input_id:(string Solid.accessor [@mel.as "inputId"]) -> file_input_ref:(Dom.htmlInputElement option Solid.accessor [@mel.as "fileInputRef"]) -> set_file_input_ref:(Dom.htmlInputElement option Solid.setter [@mel.as "setFileInputRef"]) -> dropzone_ref:(Dom.htmlElement option Solid.accessor [@mel.as "dropzoneRef"]) -> set_dropzone_ref:(Dom.htmlElement option Solid.setter [@mel.as "setDropzoneRef"]) -> disabled:(bool option Solid.accessor [@mel.as "disabled"]) -> multiple:(bool option Solid.accessor [@mel.as "multiple"]) -> accept:(string option Solid.accessor [@mel.as "accept"]) -> allow_drag_and_drop:(bool option Solid.accessor [@mel.as "allowDragAndDrop"]) -> process_files:((t_file array -> unit) [@mel.as "processFiles"]) -> accepted_files:(t_file array [@mel.as "acceptedFiles"]) -> rejected_files:(t_file_rejection array [@mel.as "rejectedFiles"]) -> remove_file:((t_file -> unit) [@mel.as "removeFile"]) -> unit -> t = "" [@@mel.obj]
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
        
        \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Blob/size)
        The size of this Blob in bytes *)
    external size : t -> float = "size" [@@mel.get]
    (** The **`type`** read-only property of the Blob interface returns the MIME type of the file.
        
        \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Blob/type)
        The MIME type of this Blob *)
    external type_ : t -> string = "type" [@@mel.get]
    external array_buffer : t -> unit -> t_array_buffer Js.Promise.t = "arrayBuffer" [@@mel.send]
    external bytes : t -> unit -> t_uint8_array Js.Promise.t = "bytes" [@@mel.send]
    external slice : t -> float option -> float option -> string option -> t_blob = "slice" [@@mel.send]
    external stream : t -> unit -> t_readable_stream = "stream" [@@mel.send]
    external text : t -> unit -> string Js.Promise.t = "text" [@@mel.send]
    external image : t -> t_constructor_options option -> t_image = "image" [@@mel.send]
    external form_data : t -> unit -> t_form_data Js.Promise.t = "formData" [@@mel.send]
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
    external dataset : t -> t_hover_card_data_set Solid.accessor = "dataset" [@@mel.get]
    external is_open : t -> bool Solid.accessor = "isOpen" [@@mel.get]
    external content_present : t -> bool Solid.accessor = "contentPresent" [@@mel.get]
    external open_with_delay_js : t -> ((unit -> unit) [@u]) = "openWithDelay" [@@mel.get]
    let open_with_delay o () = (open_with_delay_js o) () [@u]
    external close_with_delay_js : t -> ((unit -> unit) [@u]) = "closeWithDelay" [@@mel.get]
    let close_with_delay o () = (close_with_delay_js o) () [@u]
    external cancel_opening_js : t -> ((unit -> unit) [@u]) = "cancelOpening" [@@mel.get]
    let cancel_opening o () = (cancel_opening_js o) () [@u]
    external cancel_closing_js : t -> ((unit -> unit) [@u]) = "cancelClosing" [@@mel.get]
    let cancel_closing o () = (cancel_closing_js o) () [@u]
    external close_js : t -> ((unit -> unit) [@u]) = "close" [@@mel.get]
    let close o () = (close_js o) () [@u]
    external is_target_on_hover_card_js : t -> ((Dom.node Js.Nullable.t -> bool) [@u]) = "isTargetOnHoverCard" [@@mel.get]
    let is_target_on_hover_card o x0 = (is_target_on_hover_card_js o) x0 [@u]
    external set_trigger_ref_js : t -> ((Dom.htmlElement -> unit) [@u]) = "setTriggerRef" [@@mel.get]
    let set_trigger_ref o x0 = (set_trigger_ref_js o) x0 [@u]
    external set_content_ref_js : t -> ((Dom.htmlElement -> unit) [@u]) = "setContentRef" [@@mel.get]
    let set_content_ref o x0 = (set_content_ref_js o) x0 [@u]
    external make : dataset:(t_hover_card_data_set Solid.accessor [@mel.as "dataset"]) -> is_open:(bool Solid.accessor [@mel.as "isOpen"]) -> content_present:(bool Solid.accessor [@mel.as "contentPresent"]) -> open_with_delay:((unit -> unit) [@mel.as "openWithDelay"]) -> close_with_delay:((unit -> unit) [@mel.as "closeWithDelay"]) -> cancel_opening:((unit -> unit) [@mel.as "cancelOpening"]) -> cancel_closing:((unit -> unit) [@mel.as "cancelClosing"]) -> close:((unit -> unit) [@mel.as "close"]) -> is_target_on_hover_card:((Dom.node Js.Nullable.t -> bool) [@mel.as "isTargetOnHoverCard"]) -> set_trigger_ref:((Dom.htmlElement -> unit) [@mel.as "setTriggerRef"]) -> set_content_ref:((Dom.htmlElement -> unit) [@mel.as "setContentRef"]) -> unit -> t = "" [@@mel.obj]
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
    external make : ?locale_matcher:(string [@mel.as "localeMatcher"]) -> ?weekday:([ `long | `short | `narrow ] [@mel.as "weekday"]) -> ?era:([ `long | `short | `narrow ] [@mel.as "era"]) -> ?year:(string [@mel.as "year"]) -> ?month:(string [@mel.as "month"]) -> ?day:(string [@mel.as "day"]) -> ?hour:(string [@mel.as "hour"]) -> ?minute:(string [@mel.as "minute"]) -> ?second:(string [@mel.as "second"]) -> ?time_zone_name:([ `long | `short | `shortOffset | `longOffset | `shortGeneric | `longGeneric ] [@mel.as "timeZoneName"]) -> ?format_matcher:(string [@mel.as "formatMatcher"]) -> ?hour12:(bool [@mel.as "hour12"]) -> ?time_zone:(string [@mel.as "timeZone"]) -> ?calendar:(string [@mel.as "calendar"]) -> ?day_period:([ `long | `short | `narrow ] [@mel.as "dayPeriod"]) -> ?numbering_system:(string [@mel.as "numberingSystem"]) -> ?date_style:([ `long | `short | `full | `medium ] [@mel.as "dateStyle"]) -> ?time_style:([ `long | `short | `full | `medium ] [@mel.as "timeStyle"]) -> ?hour_cycle:([ `h11 | `h12 | `h23 | `h24 ] [@mel.as "hourCycle"]) -> unit -> t = "" [@@mel.obj]
  end

  module DateTimeFormat = struct
    type t = t_date_time_format
    external format : t -> (float, Js.Date.t) either option -> string = "format" [@@mel.send]
    external resolved_options : t -> unit -> t_resolved_date_time_format_options = "resolvedOptions" [@@mel.send]
    external format_to_parts : t -> (float, Js.Date.t) either option -> t_date_time_format_part array = "formatToParts" [@@mel.send]
  end

  module I18n_CreateDefaultLocale = struct
    type t = t_i18n_create_default_locale
    external locale_js : t -> ((unit -> string) [@u]) = "locale" [@@mel.get]
    let locale o () = (locale_js o) () [@u]
    external direction_js : t -> ((unit -> [ `rtl | `ltr ]) [@u]) = "direction" [@@mel.get]
    let direction o () = (direction_js o) () [@u]
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
    external use_grouping : t -> bool option = "useGrouping" [@@mel.get]
    external minimum_integer_digits : t -> float option = "minimumIntegerDigits" [@@mel.get]
    external minimum_fraction_digits : t -> float option = "minimumFractionDigits" [@@mel.get]
    external maximum_fraction_digits : t -> float option = "maximumFractionDigits" [@@mel.get]
    external minimum_significant_digits : t -> float option = "minimumSignificantDigits" [@@mel.get]
    external maximum_significant_digits : t -> float option = "maximumSignificantDigits" [@@mel.get]
    external compact_display : t -> [ `long | `short ] option = "compactDisplay" [@@mel.get]
    external notation : t -> [ `standard | `scientific | `engineering | `compact ] option = "notation" [@@mel.get]
    external sign_display : t -> [ `auto | `never | `always | `exceptZero ] option = "signDisplay" [@@mel.get]
    external unit : t -> string option = "unit" [@@mel.get]
    external unit_display : t -> [ `long | `short | `narrow ] option = "unitDisplay" [@@mel.get]
    external currency_sign : t -> [ `standard | `accounting ] option = "currencySign" [@@mel.get]
    external make : ?numbering_system:(string [@mel.as "numberingSystem"]) -> ?locale_matcher:(string [@mel.as "localeMatcher"]) -> ?style:([ `decimal | `percent | `currency | `unit ] [@mel.as "style"]) -> ?currency:(string [@mel.as "currency"]) -> ?currency_display:([ `symbol | `code | `name | `narrowSymbol ] [@mel.as "currencyDisplay"]) -> ?use_grouping:(bool [@mel.as "useGrouping"]) -> ?minimum_integer_digits:(float [@mel.as "minimumIntegerDigits"]) -> ?minimum_fraction_digits:(float [@mel.as "minimumFractionDigits"]) -> ?maximum_fraction_digits:(float [@mel.as "maximumFractionDigits"]) -> ?minimum_significant_digits:(float [@mel.as "minimumSignificantDigits"]) -> ?maximum_significant_digits:(float [@mel.as "maximumSignificantDigits"]) -> ?compact_display:([ `long | `short ] [@mel.as "compactDisplay"]) -> ?notation:([ `standard | `scientific | `engineering | `compact ] [@mel.as "notation"]) -> ?sign_display:([ `auto | `never | `always | `exceptZero ] [@mel.as "signDisplay"]) -> ?unit:(string [@mel.as "unit"]) -> ?unit_display:([ `long | `short | `narrow ] [@mel.as "unitDisplay"]) -> ?currency_sign:([ `standard | `accounting ] [@mel.as "currencySign"]) -> unit -> t = "" [@@mel.obj]
  end

  module NumberFormat = struct
    type t = t_number_format
    external format : t -> float -> string = "format" [@@mel.send]
    external resolved_options : t -> unit -> t_resolved_number_format_options = "resolvedOptions" [@@mel.send]
    external format_to_parts : t -> (float, t_number_format_format_to_parts) either option -> t_number_format_part array = "formatToParts" [@@mel.send]
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
    external locale_js : t -> ((unit -> string) [@u]) = "locale" [@@mel.get]
    let locale o () = (locale_js o) () [@u]
    external direction_js : t -> ((unit -> [ `rtl | `ltr ]) [@u]) = "direction" [@@mel.get]
    let direction o () = (direction_js o) () [@u]
    external make : locale:((unit -> string) [@mel.as "locale"]) -> direction:((unit -> [ `rtl | `ltr ]) [@mel.as "direction"]) -> unit -> t = "" [@@mel.obj]
  end

  module ImageContextValue = struct
    type t = t_image_context_value
    external fallback_delay : t -> float option Solid.accessor = "fallbackDelay" [@@mel.get]
    external image_loading_status : t -> [ `idle | `loading | `loaded | `error ] Solid.accessor = "imageLoadingStatus" [@@mel.get]
    external on_image_loading_status_change_js : t -> (([ `idle | `loading | `loaded | `error ] -> unit) [@u]) = "onImageLoadingStatusChange" [@@mel.get]
    let on_image_loading_status_change o x0 = (on_image_loading_status_change_js o) x0 [@u]
    external make : fallback_delay:(float option Solid.accessor [@mel.as "fallbackDelay"]) -> image_loading_status:([ `idle | `loading | `loaded | `error ] Solid.accessor [@mel.as "imageLoadingStatus"]) -> on_image_loading_status_change:(([ `idle | `loading | `loaded | `error ] -> unit) [@mel.as "onImageLoadingStatusChange"]) -> unit -> t = "" [@@mel.obj]
  end

  module ListState = struct
    type t = t_list_state
    (** A collection of items in the list. *)
    external collection : t -> _ t_collection_node t_collection Solid.accessor = "collection" [@@mel.get]
    (** A selection manager to read and update multiple selection state. *)
    external selection_manager : t -> t_selection_manager Solid.accessor = "selectionManager" [@@mel.get]
    external make : collection:(_ t_collection_node t_collection Solid.accessor [@mel.as "collection"]) -> selection_manager:(t_selection_manager Solid.accessor [@mel.as "selectionManager"]) -> unit -> t = "" [@@mel.obj]
  end

  module ListboxContextValue = struct
    type t = t_listbox_context_value
    external list_state : t -> t_list_state Solid.accessor = "listState" [@@mel.get]
    external generate_id_js : t -> ((string -> string) [@u]) = "generateId" [@@mel.get]
    let generate_id o x0 = (generate_id_js o) x0 [@u]
    external should_use_virtual_focus : t -> bool option Solid.accessor = "shouldUseVirtualFocus" [@@mel.get]
    external should_select_on_press_up : t -> bool option Solid.accessor = "shouldSelectOnPressUp" [@@mel.get]
    external should_focus_on_hover : t -> bool option Solid.accessor = "shouldFocusOnHover" [@@mel.get]
    external is_virtualized : t -> bool option Solid.accessor = "isVirtualized" [@@mel.get]
    external make : list_state:(t_list_state Solid.accessor [@mel.as "listState"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> should_use_virtual_focus:(bool option Solid.accessor [@mel.as "shouldUseVirtualFocus"]) -> should_select_on_press_up:(bool option Solid.accessor [@mel.as "shouldSelectOnPressUp"]) -> should_focus_on_hover:(bool option Solid.accessor [@mel.as "shouldFocusOnHover"]) -> is_virtualized:(bool option Solid.accessor [@mel.as "isVirtualized"]) -> unit -> t = "" [@@mel.obj]
  end

  module MenubarContextValue = struct
    type t = t_menubar_context_value
    external dataset : t -> t_menubar_data_set Solid.accessor = "dataset" [@@mel.get]
    external value : t -> string Js.Nullable.t Solid.accessor = "value" [@@mel.get]
    external set_value_js : t -> ((((string, string Js.Nullable.t -> string option) either Js.Nullable.t) -> unit) [@u]) = "setValue" [@@mel.get]
    let set_value o x0 = (set_value_js o) x0 [@u]
    external menus : t -> string Js.Set.t Solid.accessor = "menus" [@@mel.get]
    external menu_refs : t -> Dom.htmlElement array Solid.accessor = "menuRefs" [@@mel.get]
    external menu_ref_map : t -> (string, Dom.htmlElement array) Js.Map.t Solid.accessor = "menuRefMap" [@@mel.get]
    external last_value : t -> string option Solid.accessor = "lastValue" [@@mel.get]
    external set_last_value_js : t -> (((((string, string option -> string option) either) option) -> unit) [@u]) = "setLastValue" [@@mel.get]
    let set_last_value o x0 = (set_last_value_js o) x0 [@u]
    external register_menu_js : t -> ((string -> Dom.htmlElement array -> unit) [@u]) = "registerMenu" [@@mel.get]
    let register_menu o x0 x1 = (register_menu_js o) x0 x1 [@u]
    external unregister_menu_js : t -> ((string -> unit) [@u]) = "unregisterMenu" [@@mel.get]
    let unregister_menu o x0 = (unregister_menu_js o) x0 [@u]
    external next_menu_js : t -> ((unit -> unit) [@u]) = "nextMenu" [@@mel.get]
    let next_menu o () = (next_menu_js o) () [@u]
    external previous_menu_js : t -> ((unit -> unit) [@u]) = "previousMenu" [@@mel.get]
    let previous_menu o () = (previous_menu_js o) () [@u]
    external close_menu_js : t -> ((unit -> unit) [@u]) = "closeMenu" [@@mel.get]
    let close_menu o () = (close_menu_js o) () [@u]
    external set_auto_focus_menu : t -> bool Solid.setter = "setAutoFocusMenu" [@@mel.get]
    external auto_focus_menu : t -> bool Solid.accessor = "autoFocusMenu" [@@mel.get]
    external generate_id_js : t -> ((string -> string) [@u]) = "generateId" [@@mel.get]
    let generate_id o x0 = (generate_id_js o) x0 [@u]
    external orientation : t -> [ `horizontal | `vertical ] Solid.accessor = "orientation" [@@mel.get]
    external make : dataset:(t_menubar_data_set Solid.accessor [@mel.as "dataset"]) -> value:(string Js.Nullable.t Solid.accessor [@mel.as "value"]) -> set_value:((((string, string Js.Nullable.t -> string option) either Js.Nullable.t) -> unit) [@mel.as "setValue"]) -> menus:(string Js.Set.t Solid.accessor [@mel.as "menus"]) -> menu_refs:(Dom.htmlElement array Solid.accessor [@mel.as "menuRefs"]) -> menu_ref_map:((string, Dom.htmlElement array) Js.Map.t Solid.accessor [@mel.as "menuRefMap"]) -> last_value:(string option Solid.accessor [@mel.as "lastValue"]) -> set_last_value:(((((string, string option -> string option) either) option) -> unit) [@mel.as "setLastValue"]) -> register_menu:((string -> Dom.htmlElement array -> unit) [@mel.as "registerMenu"]) -> unregister_menu:((string -> unit) [@mel.as "unregisterMenu"]) -> next_menu:((unit -> unit) [@mel.as "nextMenu"]) -> previous_menu:((unit -> unit) [@mel.as "previousMenu"]) -> close_menu:((unit -> unit) [@mel.as "closeMenu"]) -> set_auto_focus_menu:(bool Solid.setter [@mel.as "setAutoFocusMenu"]) -> auto_focus_menu:(bool Solid.accessor [@mel.as "autoFocusMenu"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> orientation:([ `horizontal | `vertical ] Solid.accessor [@mel.as "orientation"]) -> unit -> t = "" [@@mel.obj]
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
    external dataset : t -> t_meter_data_set Solid.accessor = "dataset" [@@mel.get]
    external value : t -> float Solid.accessor = "value" [@@mel.get]
    external value_percent : t -> float Solid.accessor = "valuePercent" [@@mel.get]
    external value_label : t -> string option Solid.accessor = "valueLabel" [@@mel.get]
    external meter_fill_width : t -> string option Solid.accessor = "meterFillWidth" [@@mel.get]
    external label_id : t -> string option Solid.accessor = "labelId" [@@mel.get]
    external generate_id_js : t -> ((string -> string) [@u]) = "generateId" [@@mel.get]
    let generate_id o x0 = (generate_id_js o) x0 [@u]
    external register_label_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerLabelId" [@@mel.get]
    let register_label_id o x0 = let r = (register_label_id_js o) x0 [@u] in fun () -> r () [@u]
    external make : dataset:(t_meter_data_set Solid.accessor [@mel.as "dataset"]) -> value:(float Solid.accessor [@mel.as "value"]) -> value_percent:(float Solid.accessor [@mel.as "valuePercent"]) -> value_label:(string option Solid.accessor [@mel.as "valueLabel"]) -> meter_fill_width:(string option Solid.accessor [@mel.as "meterFillWidth"]) -> label_id:(string option Solid.accessor [@mel.as "labelId"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> register_label_id:((string -> (unit -> unit)) [@mel.as "registerLabelId"]) -> unit -> t = "" [@@mel.obj]
  end

  module NavigationMenuContextValue = struct
    type t = t_navigation_menu_context_value
    external dataset : t -> t_navigation_menu_data_set Solid.accessor = "dataset" [@@mel.get]
    external delay_duration : t -> float Solid.accessor = "delayDuration" [@@mel.get]
    external skip_delay_duration : t -> float Solid.accessor = "skipDelayDuration" [@@mel.get]
    external auto_focus_menu : t -> bool Solid.accessor = "autoFocusMenu" [@@mel.get]
    external set_auto_focus_menu : t -> bool Solid.setter = "setAutoFocusMenu" [@@mel.get]
    external start_leave_timer_js : t -> ((unit -> unit) [@u]) = "startLeaveTimer" [@@mel.get]
    let start_leave_timer o () = (start_leave_timer_js o) () [@u]
    external cancel_leave_timer_js : t -> ((unit -> unit) [@u]) = "cancelLeaveTimer" [@@mel.get]
    let cancel_leave_timer o () = (cancel_leave_timer_js o) () [@u]
    external root_ref : t -> Dom.htmlElement option Solid.accessor = "rootRef" [@@mel.get]
    external set_root_ref : t -> Dom.htmlElement Solid.setter = "setRootRef" [@@mel.get]
    external viewport_ref : t -> Dom.htmlElement option Solid.accessor = "viewportRef" [@@mel.get]
    external set_viewport_ref : t -> Dom.htmlElement Solid.setter = "setViewportRef" [@@mel.get]
    external viewport_present : t -> bool Solid.accessor = "viewportPresent" [@@mel.get]
    external current_placement : t -> string Solid.accessor = "currentPlacement" [@@mel.get]
    external previous_menu : t -> string option Solid.accessor = "previousMenu" [@@mel.get]
    external set_previous_menu : t -> string option Solid.setter = "setPreviousMenu" [@@mel.get]
    external make : dataset:(t_navigation_menu_data_set Solid.accessor [@mel.as "dataset"]) -> delay_duration:(float Solid.accessor [@mel.as "delayDuration"]) -> skip_delay_duration:(float Solid.accessor [@mel.as "skipDelayDuration"]) -> auto_focus_menu:(bool Solid.accessor [@mel.as "autoFocusMenu"]) -> set_auto_focus_menu:(bool Solid.setter [@mel.as "setAutoFocusMenu"]) -> start_leave_timer:((unit -> unit) [@mel.as "startLeaveTimer"]) -> cancel_leave_timer:((unit -> unit) [@mel.as "cancelLeaveTimer"]) -> root_ref:(Dom.htmlElement option Solid.accessor [@mel.as "rootRef"]) -> set_root_ref:(Dom.htmlElement Solid.setter [@mel.as "setRootRef"]) -> viewport_ref:(Dom.htmlElement option Solid.accessor [@mel.as "viewportRef"]) -> set_viewport_ref:(Dom.htmlElement Solid.setter [@mel.as "setViewportRef"]) -> viewport_present:(bool Solid.accessor [@mel.as "viewportPresent"]) -> current_placement:(string Solid.accessor [@mel.as "currentPlacement"]) -> previous_menu:(string option Solid.accessor [@mel.as "previousMenu"]) -> set_previous_menu:(string option Solid.setter [@mel.as "setPreviousMenu"]) -> unit -> t = "" [@@mel.obj]
  end

  module NumberFormatOptions2 = struct
    type t = t_number_format_options2
    external locale_matcher : t -> string option = "localeMatcher" [@@mel.get]
    external style : t -> [ `decimal | `percent | `currency | `unit ] option = "style" [@@mel.get]
    external currency : t -> string option = "currency" [@@mel.get]
    external currency_display : t -> [ `symbol | `code | `name | `narrowSymbol ] option = "currencyDisplay" [@@mel.get]
    external use_grouping : t -> bool option = "useGrouping" [@@mel.get]
    external minimum_integer_digits : t -> float option = "minimumIntegerDigits" [@@mel.get]
    external minimum_fraction_digits : t -> float option = "minimumFractionDigits" [@@mel.get]
    external maximum_fraction_digits : t -> float option = "maximumFractionDigits" [@@mel.get]
    external minimum_significant_digits : t -> float option = "minimumSignificantDigits" [@@mel.get]
    external maximum_significant_digits : t -> float option = "maximumSignificantDigits" [@@mel.get]
    external numbering_system : t -> string option = "numberingSystem" [@@mel.get]
    external compact_display : t -> [ `long | `short ] option = "compactDisplay" [@@mel.get]
    external notation : t -> [ `standard | `scientific | `engineering | `compact ] option = "notation" [@@mel.get]
    external sign_display : t -> [ `auto | `never | `always | `exceptZero ] option = "signDisplay" [@@mel.get]
    external unit : t -> string option = "unit" [@@mel.get]
    external unit_display : t -> [ `long | `short | `narrow ] option = "unitDisplay" [@@mel.get]
    external currency_sign : t -> [ `standard | `accounting ] option = "currencySign" [@@mel.get]
    external make : ?locale_matcher:(string [@mel.as "localeMatcher"]) -> ?style:([ `decimal | `percent | `currency | `unit ] [@mel.as "style"]) -> ?currency:(string [@mel.as "currency"]) -> ?currency_display:([ `symbol | `code | `name | `narrowSymbol ] [@mel.as "currencyDisplay"]) -> ?use_grouping:(bool [@mel.as "useGrouping"]) -> ?minimum_integer_digits:(float [@mel.as "minimumIntegerDigits"]) -> ?minimum_fraction_digits:(float [@mel.as "minimumFractionDigits"]) -> ?maximum_fraction_digits:(float [@mel.as "maximumFractionDigits"]) -> ?minimum_significant_digits:(float [@mel.as "minimumSignificantDigits"]) -> ?maximum_significant_digits:(float [@mel.as "maximumSignificantDigits"]) -> ?numbering_system:(string [@mel.as "numberingSystem"]) -> ?compact_display:([ `long | `short ] [@mel.as "compactDisplay"]) -> ?notation:([ `standard | `scientific | `engineering | `compact ] [@mel.as "notation"]) -> ?sign_display:([ `auto | `never | `always | `exceptZero ] [@mel.as "signDisplay"]) -> ?unit:(string [@mel.as "unit"]) -> ?unit_display:([ `long | `short | `narrow ] [@mel.as "unitDisplay"]) -> ?currency_sign:([ `standard | `accounting ] [@mel.as "currencySign"]) -> unit -> t = "" [@@mel.obj]
  end

  module NumberFieldContextValue = struct
    type t = t_number_field_context_value
    external value : t -> (string, float) either option Solid.accessor = "value" [@@mel.get]
    external set_value_js : t -> (((string, float) either -> unit) [@u]) = "setValue" [@@mel.get]
    let set_value o x0 = (set_value_js o) x0 [@u]
    external raw_value : t -> float Solid.accessor = "rawValue" [@@mel.get]
    external generate_id_js : t -> ((string -> string) [@u]) = "generateId" [@@mel.get]
    let generate_id o x0 = (generate_id_js o) x0 [@u]
    external format_number_js : t -> ((float -> string) [@u]) = "formatNumber" [@@mel.get]
    let format_number o x0 = (format_number_js o) x0 [@u]
    external format_js : t -> ((unit -> unit) [@u]) = "format" [@@mel.get]
    let format o () = (format_js o) () [@u]
    external on_input : t -> ((t_number_field_context_value_on_input -> unit, (Dom.htmlInputElement, Dom.inputEvent, t_number_field_context_value_on_input -> unit) t_bound_event_handler) either) = "onInput" [@@mel.get]
    external text_value : t -> string option Solid.accessor = "textValue" [@@mel.get]
    external min_value : t -> float Solid.accessor = "minValue" [@@mel.get]
    external max_value : t -> float Solid.accessor = "maxValue" [@@mel.get]
    external step : t -> float Solid.accessor = "step" [@@mel.get]
    external large_step : t -> float Solid.accessor = "largeStep" [@@mel.get]
    external change_on_wheel : t -> bool Solid.accessor = "changeOnWheel" [@@mel.get]
    external translations : t -> t_color_channel_field_root_translations option Solid.accessor = "translations" [@@mel.get]
    external input_ref : t -> Dom.htmlInputElement option Solid.accessor = "inputRef" [@@mel.get]
    external set_input_ref_js : t -> ((Dom.htmlInputElement -> unit) [@u]) = "setInputRef" [@@mel.get]
    let set_input_ref o x0 = (set_input_ref_js o) x0 [@u]
    external hidden_input_ref : t -> Dom.htmlInputElement option Solid.accessor = "hiddenInputRef" [@@mel.get]
    external set_hidden_input_ref_js : t -> ((Dom.htmlInputElement -> unit) [@u]) = "setHiddenInputRef" [@@mel.get]
    let set_hidden_input_ref o x0 = (set_hidden_input_ref_js o) x0 [@u]
    external vary_value_js : t -> ((float -> unit) [@u]) = "varyValue" [@@mel.get]
    let vary_value o x0 = (vary_value_js o) x0 [@u]
    external make : value:((string, float) either option Solid.accessor [@mel.as "value"]) -> set_value:(((string, float) either -> unit) [@mel.as "setValue"]) -> raw_value:(float Solid.accessor [@mel.as "rawValue"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> format_number:((float -> string) [@mel.as "formatNumber"]) -> format:((unit -> unit) [@mel.as "format"]) -> on_input:(((t_number_field_context_value_on_input -> unit, (Dom.htmlInputElement, Dom.inputEvent, t_number_field_context_value_on_input -> unit) t_bound_event_handler) either) [@mel.as "onInput"]) -> text_value:(string option Solid.accessor [@mel.as "textValue"]) -> min_value:(float Solid.accessor [@mel.as "minValue"]) -> max_value:(float Solid.accessor [@mel.as "maxValue"]) -> step:(float Solid.accessor [@mel.as "step"]) -> large_step:(float Solid.accessor [@mel.as "largeStep"]) -> change_on_wheel:(bool Solid.accessor [@mel.as "changeOnWheel"]) -> translations:(t_color_channel_field_root_translations option Solid.accessor [@mel.as "translations"]) -> input_ref:(Dom.htmlInputElement option Solid.accessor [@mel.as "inputRef"]) -> set_input_ref:((Dom.htmlInputElement -> unit) [@mel.as "setInputRef"]) -> hidden_input_ref:(Dom.htmlInputElement option Solid.accessor [@mel.as "hiddenInputRef"]) -> set_hidden_input_ref:((Dom.htmlInputElement -> unit) [@mel.as "setHiddenInputRef"]) -> vary_value:((float -> unit) [@mel.as "varyValue"]) -> unit -> t = "" [@@mel.obj]
  end

  module Pagination_Root_ItemComponent = struct
    type t = t_pagination_root_item_component
    external page : t -> float = "page" [@@mel.get]
    external make : page:(float [@mel.as "page"]) -> unit -> t = "" [@@mel.obj]
  end

  module PaginationContextValue = struct
    type t = t_pagination_context_value
    external count : t -> float Solid.accessor = "count" [@@mel.get]
    external sibling_count : t -> float Solid.accessor = "siblingCount" [@@mel.get]
    external show_first : t -> bool Solid.accessor = "showFirst" [@@mel.get]
    external show_last : t -> bool Solid.accessor = "showLast" [@@mel.get]
    external fixed_items : t -> (string, bool) either Solid.accessor = "fixedItems" [@@mel.get]
    external is_disabled : t -> bool Solid.accessor = "isDisabled" [@@mel.get]
    external render_item_js : t -> ((float -> Jsx.element) [@u]) = "renderItem" [@@mel.get]
    let render_item o x0 = (render_item_js o) x0 [@u]
    external render_ellipsis_js : t -> ((unit -> Jsx.element) [@u]) = "renderEllipsis" [@@mel.get]
    let render_ellipsis o () = (render_ellipsis_js o) () [@u]
    external page : t -> float Solid.accessor = "page" [@@mel.get]
    external set_page : t -> float Solid.setter = "setPage" [@@mel.get]
    external make : count:(float Solid.accessor [@mel.as "count"]) -> sibling_count:(float Solid.accessor [@mel.as "siblingCount"]) -> show_first:(bool Solid.accessor [@mel.as "showFirst"]) -> show_last:(bool Solid.accessor [@mel.as "showLast"]) -> fixed_items:((string, bool) either Solid.accessor [@mel.as "fixedItems"]) -> is_disabled:(bool Solid.accessor [@mel.as "isDisabled"]) -> render_item:((float -> Jsx.element) [@mel.as "renderItem"]) -> render_ellipsis:((unit -> Jsx.element) [@mel.as "renderEllipsis"]) -> page:(float Solid.accessor [@mel.as "page"]) -> set_page:(float Solid.setter [@mel.as "setPage"]) -> unit -> t = "" [@@mel.obj]
  end

  module Popover_Root_Translations = struct
    type t = t_popover_root_translations
    external dismiss : t -> string = "dismiss" [@@mel.get]
    external make : dismiss:(string [@mel.as "dismiss"]) -> unit -> t = "" [@@mel.obj]
  end

  module PopoverContextValue = struct
    type t = t_popover_context_value
    external translations : t -> t_popover_root_translations Solid.accessor = "translations" [@@mel.get]
    external dataset : t -> t_popover_data_set Solid.accessor = "dataset" [@@mel.get]
    external is_open : t -> bool Solid.accessor = "isOpen" [@@mel.get]
    external is_modal : t -> bool Solid.accessor = "isModal" [@@mel.get]
    external prevent_scroll : t -> bool Solid.accessor = "preventScroll" [@@mel.get]
    external content_present : t -> bool Solid.accessor = "contentPresent" [@@mel.get]
    external trigger_ref : t -> Dom.htmlElement option Solid.accessor = "triggerRef" [@@mel.get]
    external content_id : t -> string option Solid.accessor = "contentId" [@@mel.get]
    external title_id : t -> string option Solid.accessor = "titleId" [@@mel.get]
    external description_id : t -> string option Solid.accessor = "descriptionId" [@@mel.get]
    external set_default_anchor_ref_js : t -> ((Dom.htmlElement -> unit) [@u]) = "setDefaultAnchorRef" [@@mel.get]
    let set_default_anchor_ref o x0 = (set_default_anchor_ref_js o) x0 [@u]
    external set_trigger_ref_js : t -> ((Dom.htmlElement -> unit) [@u]) = "setTriggerRef" [@@mel.get]
    let set_trigger_ref o x0 = (set_trigger_ref_js o) x0 [@u]
    external set_content_ref_js : t -> ((Dom.htmlElement -> unit) [@u]) = "setContentRef" [@@mel.get]
    let set_content_ref o x0 = (set_content_ref_js o) x0 [@u]
    external close_js : t -> ((unit -> unit) [@u]) = "close" [@@mel.get]
    let close o () = (close_js o) () [@u]
    external toggle_js : t -> ((unit -> unit) [@u]) = "toggle" [@@mel.get]
    let toggle o () = (toggle_js o) () [@u]
    external generate_id_js : t -> ((string -> string) [@u]) = "generateId" [@@mel.get]
    let generate_id o x0 = (generate_id_js o) x0 [@u]
    external register_content_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerContentId" [@@mel.get]
    let register_content_id o x0 = let r = (register_content_id_js o) x0 [@u] in fun () -> r () [@u]
    external register_title_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerTitleId" [@@mel.get]
    let register_title_id o x0 = let r = (register_title_id_js o) x0 [@u] in fun () -> r () [@u]
    external register_description_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerDescriptionId" [@@mel.get]
    let register_description_id o x0 = let r = (register_description_id_js o) x0 [@u] in fun () -> r () [@u]
    external make : translations:(t_popover_root_translations Solid.accessor [@mel.as "translations"]) -> dataset:(t_popover_data_set Solid.accessor [@mel.as "dataset"]) -> is_open:(bool Solid.accessor [@mel.as "isOpen"]) -> is_modal:(bool Solid.accessor [@mel.as "isModal"]) -> prevent_scroll:(bool Solid.accessor [@mel.as "preventScroll"]) -> content_present:(bool Solid.accessor [@mel.as "contentPresent"]) -> trigger_ref:(Dom.htmlElement option Solid.accessor [@mel.as "triggerRef"]) -> content_id:(string option Solid.accessor [@mel.as "contentId"]) -> title_id:(string option Solid.accessor [@mel.as "titleId"]) -> description_id:(string option Solid.accessor [@mel.as "descriptionId"]) -> set_default_anchor_ref:((Dom.htmlElement -> unit) [@mel.as "setDefaultAnchorRef"]) -> set_trigger_ref:((Dom.htmlElement -> unit) [@mel.as "setTriggerRef"]) -> set_content_ref:((Dom.htmlElement -> unit) [@mel.as "setContentRef"]) -> close:((unit -> unit) [@mel.as "close"]) -> toggle:((unit -> unit) [@mel.as "toggle"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> register_content_id:((string -> (unit -> unit)) [@mel.as "registerContentId"]) -> register_title_id:((string -> (unit -> unit)) [@mel.as "registerTitleId"]) -> register_description_id:((string -> (unit -> unit)) [@mel.as "registerDescriptionId"]) -> unit -> t = "" [@@mel.obj]
  end

  module ProgressContextValue = struct
    type t = t_progress_context_value
    external dataset : t -> t_progress_data_set Solid.accessor = "dataset" [@@mel.get]
    external progress_fill_width : t -> string option Solid.accessor = "progressFillWidth" [@@mel.get]
    external value : t -> float Solid.accessor = "value" [@@mel.get]
    external value_percent : t -> float Solid.accessor = "valuePercent" [@@mel.get]
    external value_label : t -> string option Solid.accessor = "valueLabel" [@@mel.get]
    external label_id : t -> string option Solid.accessor = "labelId" [@@mel.get]
    external generate_id_js : t -> ((string -> string) [@u]) = "generateId" [@@mel.get]
    let generate_id o x0 = (generate_id_js o) x0 [@u]
    external register_label_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerLabelId" [@@mel.get]
    let register_label_id o x0 = let r = (register_label_id_js o) x0 [@u] in fun () -> r () [@u]
    external make : dataset:(t_progress_data_set Solid.accessor [@mel.as "dataset"]) -> progress_fill_width:(string option Solid.accessor [@mel.as "progressFillWidth"]) -> value:(float Solid.accessor [@mel.as "value"]) -> value_percent:(float Solid.accessor [@mel.as "valuePercent"]) -> value_label:(string option Solid.accessor [@mel.as "valueLabel"]) -> label_id:(string option Solid.accessor [@mel.as "labelId"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> register_label_id:((string -> (unit -> unit)) [@mel.as "registerLabelId"]) -> unit -> t = "" [@@mel.obj]
  end

  module RadioGroupContextValue = struct
    type t = t_radio_group_context_value
    external aria_described_by : t -> string option Solid.accessor = "ariaDescribedBy" [@@mel.get]
    external is_default_value_js : t -> ((string -> bool) [@u]) = "isDefaultValue" [@@mel.get]
    let is_default_value o x0 = (is_default_value_js o) x0 [@u]
    external is_selected_value_js : t -> ((string -> bool) [@u]) = "isSelectedValue" [@@mel.get]
    let is_selected_value o x0 = (is_selected_value_js o) x0 [@u]
    external set_selected_value_js : t -> ((string -> unit) [@u]) = "setSelectedValue" [@@mel.get]
    let set_selected_value o x0 = (set_selected_value_js o) x0 [@u]
    external make : aria_described_by:(string option Solid.accessor [@mel.as "ariaDescribedBy"]) -> is_default_value:((string -> bool) [@mel.as "isDefaultValue"]) -> is_selected_value:((string -> bool) [@mel.as "isSelectedValue"]) -> set_selected_value:((string -> unit) [@mel.as "setSelectedValue"]) -> unit -> t = "" [@@mel.obj]
  end

  module RatingItemState = struct
    type t = t_rating_item_state
    external half : t -> bool Solid.accessor = "half" [@@mel.get]
    external highlighted : t -> bool Solid.accessor = "highlighted" [@@mel.get]
    external make : half:(bool Solid.accessor [@mel.as "half"]) -> highlighted:(bool Solid.accessor [@mel.as "highlighted"]) -> unit -> t = "" [@@mel.obj]
  end

  module SearchContextValue = struct
    type t = t_search_context_value
    (** No results found *)
    external no_result : t -> bool Solid.accessor = "noResult" [@@mel.get]
    (** Are we currently loading suggestions? *)
    external is_loading_suggestions : t -> bool Solid.accessor = "isLoadingSuggestions" [@@mel.get]
    external make : no_result:(bool Solid.accessor [@mel.as "noResult"]) -> is_loading_suggestions:(bool Solid.accessor [@mel.as "isLoadingSuggestions"]) -> unit -> t = "" [@@mel.obj]
  end

  module SegmentedControlContextValue = struct
    type t = t_segmented_control_context_value
    external value : t -> string option Solid.accessor = "value" [@@mel.get]
    external default_value : t -> string option Solid.accessor = "defaultValue" [@@mel.get]
    external orientation : t -> [ `horizontal | `vertical ] option Solid.accessor = "orientation" [@@mel.get]
    external root : t -> Dom.htmlElement option Solid.accessor = "root" [@@mel.get]
    external selected_item : t -> Dom.htmlElement option Solid.accessor = "selectedItem" [@@mel.get]
    external set_selected_item : t -> Dom.htmlElement option Solid.setter = "setSelectedItem" [@@mel.get]
    external make : value:(string option Solid.accessor [@mel.as "value"]) -> default_value:(string option Solid.accessor [@mel.as "defaultValue"]) -> orientation:([ `horizontal | `vertical ] option Solid.accessor [@mel.as "orientation"]) -> root:(Dom.htmlElement option Solid.accessor [@mel.as "root"]) -> selected_item:(Dom.htmlElement option Solid.accessor [@mel.as "selectedItem"]) -> set_selected_item:(Dom.htmlElement option Solid.setter [@mel.as "setSelectedItem"]) -> unit -> t = "" [@@mel.obj]
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
    external selected_option : 'option t -> 'option Solid.accessor = "selectedOption" [@@mel.get]
    (** An array of selected options. It will contain only one value in case of single select. *)
    external selected_options : 'option t -> 'option array Solid.accessor = "selectedOptions" [@@mel.get]
    (** A function to remove an option from the selection. *)
    external remove_js : 'option t -> (('option -> unit) [@u]) = "remove" [@@mel.get]
    let remove o x0 = (remove_js o) x0 [@u]
    (** A function to clear the selection. *)
    external clear_js : 'option t -> ((unit -> unit) [@u]) = "clear" [@@mel.get]
    let clear o () = (clear_js o) () [@u]
    external make : selected_option:('option Solid.accessor [@mel.as "selectedOption"]) -> selected_options:('option array Solid.accessor [@mel.as "selectedOptions"]) -> remove:(('option -> unit) [@mel.as "remove"]) -> clear:((unit -> unit) [@mel.as "clear"]) -> unit -> 'option t = "" [@@mel.obj]
  end

  module SelectContextValue = struct
    type t = t_select_context_value
    external dataset : t -> t_select_data_set Solid.accessor = "dataset" [@@mel.get]
    external is_open : t -> bool Solid.accessor = "isOpen" [@@mel.get]
    external is_disabled : t -> bool Solid.accessor = "isDisabled" [@@mel.get]
    external is_multiple : t -> bool Solid.accessor = "isMultiple" [@@mel.get]
    external is_virtualized : t -> bool Solid.accessor = "isVirtualized" [@@mel.get]
    external is_modal : t -> bool Solid.accessor = "isModal" [@@mel.get]
    external prevent_scroll : t -> bool Solid.accessor = "preventScroll" [@@mel.get]
    external disallow_type_ahead : t -> bool Solid.accessor = "disallowTypeAhead" [@@mel.get]
    external should_focus_wrap : t -> bool Solid.accessor = "shouldFocusWrap" [@@mel.get]
    external content_present : t -> bool Solid.accessor = "contentPresent" [@@mel.get]
    external auto_focus : t -> ([ `first | `last ], bool) either Solid.accessor = "autoFocus" [@@mel.get]
    external trigger_ref : t -> Dom.htmlElement option Solid.accessor = "triggerRef" [@@mel.get]
    external trigger_id : t -> string option Solid.accessor = "triggerId" [@@mel.get]
    external value_id : t -> string option Solid.accessor = "valueId" [@@mel.get]
    external listbox_id : t -> string option Solid.accessor = "listboxId" [@@mel.get]
    external listbox_aria_labelled_by : t -> string option Solid.accessor = "listboxAriaLabelledBy" [@@mel.get]
    external list_state : t -> t_list_state Solid.accessor = "listState" [@@mel.get]
    external keyboard_delegate : t -> t_keyboard_delegate Solid.accessor = "keyboardDelegate" [@@mel.get]
    external set_listbox_aria_labelled_by : t -> string option Solid.setter = "setListboxAriaLabelledBy" [@@mel.get]
    external set_trigger_ref_js : t -> ((Dom.htmlElement -> unit) [@u]) = "setTriggerRef" [@@mel.get]
    let set_trigger_ref o x0 = (set_trigger_ref_js o) x0 [@u]
    external set_content_ref_js : t -> ((Dom.htmlElement -> unit) [@u]) = "setContentRef" [@@mel.get]
    let set_content_ref o x0 = (set_content_ref_js o) x0 [@u]
    external set_listbox_ref_js : t -> ((Dom.htmlElement -> unit) [@u]) = "setListboxRef" [@@mel.get]
    let set_listbox_ref o x0 = (set_listbox_ref_js o) x0 [@u]
    external open__js : t -> ((([ `first | `last ], bool) either -> unit) [@u]) = "open" [@@mel.get]
    let open_ o x0 = (open__js o) x0 [@u]
    external close_js : t -> ((unit -> unit) [@u]) = "close" [@@mel.get]
    let close o () = (close_js o) () [@u]
    external toggle_js : t -> ((([ `first | `last ], bool) either -> unit) [@u]) = "toggle" [@@mel.get]
    let toggle o x0 = (toggle_js o) x0 [@u]
    external placeholder : t -> Jsx.element Solid.accessor = "placeholder" [@@mel.get]
    external render_item_js : t -> ((_ t_collection_node -> Jsx.element) [@u]) = "renderItem" [@@mel.get]
    let render_item o x0 = (render_item_js o) x0 [@u]
    external render_section_js : t -> ((_ t_collection_node -> Jsx.element) [@u]) = "renderSection" [@@mel.get]
    let render_section o x0 = (render_section_js o) x0 [@u]
    external generate_id_js : t -> ((string -> string) [@u]) = "generateId" [@@mel.get]
    let generate_id o x0 = (generate_id_js o) x0 [@u]
    external register_trigger_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerTriggerId" [@@mel.get]
    let register_trigger_id o x0 = let r = (register_trigger_id_js o) x0 [@u] in fun () -> r () [@u]
    external register_value_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerValueId" [@@mel.get]
    let register_value_id o x0 = let r = (register_value_id_js o) x0 [@u] in fun () -> r () [@u]
    external register_listbox_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerListboxId" [@@mel.get]
    let register_listbox_id o x0 = let r = (register_listbox_id_js o) x0 [@u] in fun () -> r () [@u]
    external make : dataset:(t_select_data_set Solid.accessor [@mel.as "dataset"]) -> is_open:(bool Solid.accessor [@mel.as "isOpen"]) -> is_disabled:(bool Solid.accessor [@mel.as "isDisabled"]) -> is_multiple:(bool Solid.accessor [@mel.as "isMultiple"]) -> is_virtualized:(bool Solid.accessor [@mel.as "isVirtualized"]) -> is_modal:(bool Solid.accessor [@mel.as "isModal"]) -> prevent_scroll:(bool Solid.accessor [@mel.as "preventScroll"]) -> disallow_type_ahead:(bool Solid.accessor [@mel.as "disallowTypeAhead"]) -> should_focus_wrap:(bool Solid.accessor [@mel.as "shouldFocusWrap"]) -> content_present:(bool Solid.accessor [@mel.as "contentPresent"]) -> auto_focus:(([ `first | `last ], bool) either Solid.accessor [@mel.as "autoFocus"]) -> trigger_ref:(Dom.htmlElement option Solid.accessor [@mel.as "triggerRef"]) -> trigger_id:(string option Solid.accessor [@mel.as "triggerId"]) -> value_id:(string option Solid.accessor [@mel.as "valueId"]) -> listbox_id:(string option Solid.accessor [@mel.as "listboxId"]) -> listbox_aria_labelled_by:(string option Solid.accessor [@mel.as "listboxAriaLabelledBy"]) -> list_state:(t_list_state Solid.accessor [@mel.as "listState"]) -> keyboard_delegate:(t_keyboard_delegate Solid.accessor [@mel.as "keyboardDelegate"]) -> set_listbox_aria_labelled_by:(string option Solid.setter [@mel.as "setListboxAriaLabelledBy"]) -> set_trigger_ref:((Dom.htmlElement -> unit) [@mel.as "setTriggerRef"]) -> set_content_ref:((Dom.htmlElement -> unit) [@mel.as "setContentRef"]) -> set_listbox_ref:((Dom.htmlElement -> unit) [@mel.as "setListboxRef"]) -> open_:((([ `first | `last ], bool) either -> unit) [@mel.as "open"]) -> close:((unit -> unit) [@mel.as "close"]) -> toggle:((([ `first | `last ], bool) either -> unit) [@mel.as "toggle"]) -> placeholder:(Jsx.element Solid.accessor [@mel.as "placeholder"]) -> render_item:((_ t_collection_node -> Jsx.element) [@mel.as "renderItem"]) -> render_section:((_ t_collection_node -> Jsx.element) [@mel.as "renderSection"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> register_trigger_id:((string -> (unit -> unit)) [@mel.as "registerTriggerId"]) -> register_value_id:((string -> (unit -> unit)) [@mel.as "registerValueId"]) -> register_listbox_id:((string -> (unit -> unit)) [@mel.as "registerListboxId"]) -> unit -> t = "" [@@mel.obj]
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
    external dataset : t -> t_slider_data_set Solid.accessor = "dataset" [@@mel.get]
    external state : t -> t_slider_state = "state" [@@mel.get]
    external thumbs : t -> t_collection_item_with_ref array Solid.accessor = "thumbs" [@@mel.get]
    external set_thumbs : t -> t_collection_item_with_ref array Solid.setter = "setThumbs" [@@mel.get]
    external on_slide_start : t -> ((float -> float -> unit) option) = "onSlideStart" [@@mel.get]
    external on_slide_move : t -> ((t_slider_context_value_on_slide_move -> unit) option) = "onSlideMove" [@@mel.get]
    external on_slide_end : t -> ((unit -> unit) option) = "onSlideEnd" [@@mel.get]
    external on_step_key_down_js : t -> ((Dom.keyboardEvent -> float -> unit) [@u]) = "onStepKeyDown" [@@mel.get]
    let on_step_key_down o x0 x1 = (on_step_key_down_js o) x0 x1 [@u]
    external is_sliding_from_left_js : t -> ((unit -> bool) [@u]) = "isSlidingFromLeft" [@@mel.get]
    let is_sliding_from_left o () = (is_sliding_from_left_js o) () [@u]
    external is_sliding_from_bottom_js : t -> ((unit -> bool) [@u]) = "isSlidingFromBottom" [@@mel.get]
    let is_sliding_from_bottom o () = (is_sliding_from_bottom_js o) () [@u]
    external track_ref : t -> Dom.htmlElement option Solid.accessor = "trackRef" [@@mel.get]
    external start_edge : t -> [ `top | `bottom | `left | `right ] Solid.accessor = "startEdge" [@@mel.get]
    external end_edge : t -> [ `top | `bottom | `left | `right ] Solid.accessor = "endEdge" [@@mel.get]
    external min_value : t -> float Solid.accessor = "minValue" [@@mel.get]
    external max_value : t -> float Solid.accessor = "maxValue" [@@mel.get]
    external inverted : t -> bool Solid.accessor = "inverted" [@@mel.get]
    external register_track_js : t -> ((Dom.htmlElement -> unit) [@u]) = "registerTrack" [@@mel.get]
    let register_track o x0 = (register_track_js o) x0 [@u]
    external generate_id_js : t -> ((string -> string) [@u]) = "generateId" [@@mel.get]
    let generate_id o x0 = (generate_id_js o) x0 [@u]
    external get_value_label : t -> ((t_get_value_label_params2 -> string) option) = "getValueLabel" [@@mel.get]
    external make : dataset:(t_slider_data_set Solid.accessor [@mel.as "dataset"]) -> state:(t_slider_state [@mel.as "state"]) -> thumbs:(t_collection_item_with_ref array Solid.accessor [@mel.as "thumbs"]) -> set_thumbs:(t_collection_item_with_ref array Solid.setter [@mel.as "setThumbs"]) -> on_slide_start:(((float -> float -> unit) option) [@mel.as "onSlideStart"]) -> on_slide_move:(((t_slider_context_value_on_slide_move -> unit) option) [@mel.as "onSlideMove"]) -> on_slide_end:(((unit -> unit) option) [@mel.as "onSlideEnd"]) -> on_step_key_down:((Dom.keyboardEvent -> float -> unit) [@mel.as "onStepKeyDown"]) -> is_sliding_from_left:((unit -> bool) [@mel.as "isSlidingFromLeft"]) -> is_sliding_from_bottom:((unit -> bool) [@mel.as "isSlidingFromBottom"]) -> track_ref:(Dom.htmlElement option Solid.accessor [@mel.as "trackRef"]) -> start_edge:([ `top | `bottom | `left | `right ] Solid.accessor [@mel.as "startEdge"]) -> end_edge:([ `top | `bottom | `left | `right ] Solid.accessor [@mel.as "endEdge"]) -> min_value:(float Solid.accessor [@mel.as "minValue"]) -> max_value:(float Solid.accessor [@mel.as "maxValue"]) -> inverted:(bool Solid.accessor [@mel.as "inverted"]) -> register_track:((Dom.htmlElement -> unit) [@mel.as "registerTrack"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> get_value_label:(((t_get_value_label_params2 -> string) option) [@mel.as "getValueLabel"]) -> unit -> t = "" [@@mel.obj]
  end

  module SwitchRootState = struct
    type t = t_switch_root_state
    (** Whether the switch is checked or not. *)
    external checked : t -> bool Solid.accessor = "checked" [@@mel.get]
    external make : checked:(bool Solid.accessor [@mel.as "checked"]) -> unit -> t = "" [@@mel.obj]
  end

  module SwitchContextValue = struct
    type t = t_switch_context_value
    external value : t -> string Solid.accessor = "value" [@@mel.get]
    external dataset : t -> t_switch_data_set Solid.accessor = "dataset" [@@mel.get]
    external checked : t -> bool Solid.accessor = "checked" [@@mel.get]
    external input_ref : t -> Dom.htmlInputElement option Solid.accessor = "inputRef" [@@mel.get]
    external generate_id_js : t -> ((string -> string) [@u]) = "generateId" [@@mel.get]
    let generate_id o x0 = (generate_id_js o) x0 [@u]
    external toggle_js : t -> ((unit -> unit) [@u]) = "toggle" [@@mel.get]
    let toggle o () = (toggle_js o) () [@u]
    external set_is_checked_js : t -> ((bool -> unit) [@u]) = "setIsChecked" [@@mel.get]
    let set_is_checked o x0 = (set_is_checked_js o) x0 [@u]
    external set_is_focused_js : t -> ((bool -> unit) [@u]) = "setIsFocused" [@@mel.get]
    let set_is_focused o x0 = (set_is_focused_js o) x0 [@u]
    external set_input_ref_js : t -> ((Dom.htmlInputElement -> unit) [@u]) = "setInputRef" [@@mel.get]
    let set_input_ref o x0 = (set_input_ref_js o) x0 [@u]
    external make : value:(string Solid.accessor [@mel.as "value"]) -> dataset:(t_switch_data_set Solid.accessor [@mel.as "dataset"]) -> checked:(bool Solid.accessor [@mel.as "checked"]) -> input_ref:(Dom.htmlInputElement option Solid.accessor [@mel.as "inputRef"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> toggle:((unit -> unit) [@mel.as "toggle"]) -> set_is_checked:((bool -> unit) [@mel.as "setIsChecked"]) -> set_is_focused:((bool -> unit) [@mel.as "setIsFocused"]) -> set_input_ref:((Dom.htmlInputElement -> unit) [@mel.as "setInputRef"]) -> unit -> t = "" [@@mel.obj]
  end

  module TabsContextValue = struct
    type t = t_tabs_context_value
    external is_disabled : t -> bool Solid.accessor = "isDisabled" [@@mel.get]
    external orientation : t -> [ `horizontal | `vertical ] Solid.accessor = "orientation" [@@mel.get]
    external activation_mode : t -> [ `manual | `automatic ] Solid.accessor = "activationMode" [@@mel.get]
    external trigger_ids_map : t -> (string, string) Js.Map.t Solid.accessor = "triggerIdsMap" [@@mel.get]
    external content_ids_map : t -> (string, string) Js.Map.t Solid.accessor = "contentIdsMap" [@@mel.get]
    external list_state : t -> t_single_select_list_state Solid.accessor = "listState" [@@mel.get]
    external selected_tab : t -> Dom.htmlElement option Solid.accessor = "selectedTab" [@@mel.get]
    external set_selected_tab : t -> Dom.htmlElement option Solid.setter = "setSelectedTab" [@@mel.get]
    external generate_trigger_id_js : t -> ((string -> string) [@u]) = "generateTriggerId" [@@mel.get]
    let generate_trigger_id o x0 = (generate_trigger_id_js o) x0 [@u]
    external generate_content_id_js : t -> ((string -> string) [@u]) = "generateContentId" [@@mel.get]
    let generate_content_id o x0 = (generate_content_id_js o) x0 [@u]
    external make : is_disabled:(bool Solid.accessor [@mel.as "isDisabled"]) -> orientation:([ `horizontal | `vertical ] Solid.accessor [@mel.as "orientation"]) -> activation_mode:([ `manual | `automatic ] Solid.accessor [@mel.as "activationMode"]) -> trigger_ids_map:((string, string) Js.Map.t Solid.accessor [@mel.as "triggerIdsMap"]) -> content_ids_map:((string, string) Js.Map.t Solid.accessor [@mel.as "contentIdsMap"]) -> list_state:(t_single_select_list_state Solid.accessor [@mel.as "listState"]) -> selected_tab:(Dom.htmlElement option Solid.accessor [@mel.as "selectedTab"]) -> set_selected_tab:(Dom.htmlElement option Solid.setter [@mel.as "setSelectedTab"]) -> generate_trigger_id:((string -> string) [@mel.as "generateTriggerId"]) -> generate_content_id:((string -> string) [@mel.as "generateContentId"]) -> unit -> t = "" [@@mel.obj]
  end

  module TextFieldContextValue = struct
    type t = t_text_field_context_value
    external value : t -> string option Solid.accessor = "value" [@@mel.get]
    external generate_id_js : t -> ((string -> string) [@u]) = "generateId" [@@mel.get]
    let generate_id o x0 = (generate_id_js o) x0 [@u]
    external on_input : t -> ((t_text_field_context_value_on_input -> unit, ((Dom.htmlInputElement, Dom.htmlTextAreaElement) either, Dom.inputEvent, t_text_field_context_value_on_input -> unit) t_bound_event_handler) either) = "onInput" [@@mel.get]
    external make : value:(string option Solid.accessor [@mel.as "value"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> on_input:(((t_text_field_context_value_on_input -> unit, ((Dom.htmlInputElement, Dom.htmlTextAreaElement) either, Dom.inputEvent, t_text_field_context_value_on_input -> unit) t_bound_event_handler) either) [@mel.as "onInput"]) -> unit -> t = "" [@@mel.obj]
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
    external selected_time_description_js : t -> ((string -> string) [@u]) = "selectedTimeDescription" [@@mel.get]
    let selected_time_description o x0 = (selected_time_description_js o) x0 [@u]
    external make : hour:(string [@mel.as "hour"]) -> minute:(string [@mel.as "minute"]) -> second:(string [@mel.as "second"]) -> am:(string [@mel.as "am"]) -> pm:(string [@mel.as "pm"]) -> day_period:(string [@mel.as "dayPeriod"]) -> time_zone_name:(string [@mel.as "timeZoneName"]) -> selected_time_description:((string -> string) [@mel.as "selectedTimeDescription"]) -> unit -> t = "" [@@mel.obj]
  end

  module Toast_Region_Translations = struct
    type t = t_toast_region_translations
    external notifications_js : t -> ((string -> string) [@u]) = "notifications" [@@mel.get]
    let notifications o x0 = (notifications_js o) x0 [@u]
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
        
        \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/CustomEvent/detail)
        Any custom data the event was created with. Typically used for synthetic events. *)
    external detail : t -> t_swipe_event_detail = "detail" [@@mel.get]
    (** The **`CustomEvent.initCustomEvent()`** method initializes a CustomEvent object. *)
    external init_custom_event : t -> Dom.event = "initCustomEvent" [@@mel.get]
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
    (** The **`composedPath()`** method of the Event interface returns the event's path which is an array of the objects on which listeners will be invoked.
        
        \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Event/composedPath) *)
    external composed_path_js : t -> ((unit -> Dom.eventTarget array) [@u]) = "composedPath" [@@mel.get]
    let composed_path o () = (composed_path_js o) () [@u]
    (** The **`Event.initEvent()`** method is used to initialize the value of an event created using Document.createEvent(). *)
    external init_event : t -> Dom.event = "initEvent" [@@mel.get]
    (** The **`preventDefault()`** method of the Event interface tells the user agent that if the event does not get explicitly handled, its default action should not be taken as it normally would be.
        
        \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Event/preventDefault) *)
    external prevent_default_js : t -> ((unit -> unit) [@u]) = "preventDefault" [@@mel.get]
    let prevent_default o () = (prevent_default_js o) () [@u]
    (** The **`stopImmediatePropagation()`** method of the If several listeners are attached to the same element for the same event type, they are called in the order in which they were added.
        
        \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Event/stopImmediatePropagation) *)
    external stop_immediate_propagation_js : t -> ((unit -> unit) [@u]) = "stopImmediatePropagation" [@@mel.get]
    let stop_immediate_propagation o () = (stop_immediate_propagation_js o) () [@u]
    (** The **`stopPropagation()`** method of the Event interface prevents further propagation of the current event in the capturing and bubbling phases.
        
        \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Event/stopPropagation) *)
    external stop_propagation_js : t -> ((unit -> unit) [@u]) = "stopPropagation" [@@mel.get]
    let stop_propagation o () = (stop_propagation_js o) () [@u]
    external none : t -> float = "NONE" [@@mel.get]
    external capturing_phase : t -> float = "CAPTURING_PHASE" [@@mel.get]
    external at_target : t -> float = "AT_TARGET" [@@mel.get]
    external bubbling_phase : t -> float = "BUBBLING_PHASE" [@@mel.get]
    external make : current_target:(Dom.eventTarget [@mel.as "currentTarget"]) -> type_:(string [@mel.as "type"]) -> detail:(t_swipe_event_detail [@mel.as "detail"]) -> init_custom_event:(Dom.event [@mel.as "initCustomEvent"]) -> bubbles:(bool [@mel.as "bubbles"]) -> cancel_bubble:(bool [@mel.as "cancelBubble"]) -> cancelable:(bool [@mel.as "cancelable"]) -> composed:(bool [@mel.as "composed"]) -> default_prevented:(bool [@mel.as "defaultPrevented"]) -> event_phase:(float [@mel.as "eventPhase"]) -> is_trusted:(bool [@mel.as "isTrusted"]) -> return_value:(bool [@mel.as "returnValue"]) -> src_element:(Dom.eventTarget Js.Nullable.t [@mel.as "srcElement"]) -> target:(Dom.eventTarget Js.Nullable.t [@mel.as "target"]) -> time_stamp:(float [@mel.as "timeStamp"]) -> composed_path:((unit -> Dom.eventTarget array) [@mel.as "composedPath"]) -> init_event:(Dom.event [@mel.as "initEvent"]) -> prevent_default:((unit -> unit) [@mel.as "preventDefault"]) -> stop_immediate_propagation:((unit -> unit) [@mel.as "stopImmediatePropagation"]) -> stop_propagation:((unit -> unit) [@mel.as "stopPropagation"]) -> none:(float [@mel.as "NONE"]) -> capturing_phase:(float [@mel.as "CAPTURING_PHASE"]) -> at_target:(float [@mel.as "AT_TARGET"]) -> bubbling_phase:(float [@mel.as "BUBBLING_PHASE"]) -> unit -> t = "" [@@mel.obj]
  end

  module Toast_Toaster = struct
    type t = t_toast_toaster
    external show_js : t -> (((t_toast_component_props -> Jsx.element) -> t_show_toast_options option -> float) [@u]) = "show" [@@mel.get]
    let show o x0 x1 = (show_js o) x0 x1 [@u]
    external update_js : t -> ((float -> (t_toast_component_props -> Jsx.element) -> unit) [@u]) = "update" [@@mel.get]
    let update o x0 x1 = (update_js o) x0 x1 [@u]
    external promise_js : t -> (((('t Js.Promise.t, unit -> 't Js.Promise.t) either) -> (('t, 'u) t_toast_promise_component_props -> Jsx.element) -> t_show_toast_options option -> float) [@u]) = "promise" [@@mel.get]
    let promise o x0 x1 x2 = (promise_js o) x0 x1 x2 [@u]
    external dismiss_js : t -> ((float -> float) [@u]) = "dismiss" [@@mel.get]
    let dismiss o x0 = (dismiss_js o) x0 [@u]
    external clear_js : t -> ((unit -> unit) [@u]) = "clear" [@@mel.get]
    let clear o () = (clear_js o) () [@u]
    external make : show:(((t_toast_component_props -> Jsx.element) -> t_show_toast_options option -> float) [@mel.as "show"]) -> update:((float -> (t_toast_component_props -> Jsx.element) -> unit) [@mel.as "update"]) -> promise:(((('t Js.Promise.t, unit -> 't Js.Promise.t) either) -> (('t, 'u) t_toast_promise_component_props -> Jsx.element) -> t_show_toast_options option -> float) [@mel.as "promise"]) -> dismiss:((float -> float) [@mel.as "dismiss"]) -> clear:((unit -> unit) [@mel.as "clear"]) -> unit -> t = "" [@@mel.obj]
  end

  module ToastContextValue = struct
    type t = t_toast_context_value
    external translations : t -> t_toast_root_translations Solid.accessor = "translations" [@@mel.get]
    external close_js : t -> ((unit -> unit) [@u]) = "close" [@@mel.get]
    let close o () = (close_js o) () [@u]
    external duration : t -> float Solid.accessor = "duration" [@@mel.get]
    external is_persistent : t -> bool Solid.accessor = "isPersistent" [@@mel.get]
    external close_timer_start_time : t -> float Solid.accessor = "closeTimerStartTime" [@@mel.get]
    external generate_id_js : t -> ((string -> string) [@u]) = "generateId" [@@mel.get]
    let generate_id o x0 = (generate_id_js o) x0 [@u]
    external register_title_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerTitleId" [@@mel.get]
    let register_title_id o x0 = let r = (register_title_id_js o) x0 [@u] in fun () -> r () [@u]
    external register_description_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerDescriptionId" [@@mel.get]
    let register_description_id o x0 = let r = (register_description_id_js o) x0 [@u] in fun () -> r () [@u]
    external make : translations:(t_toast_root_translations Solid.accessor [@mel.as "translations"]) -> close:((unit -> unit) [@mel.as "close"]) -> duration:(float Solid.accessor [@mel.as "duration"]) -> is_persistent:(bool Solid.accessor [@mel.as "isPersistent"]) -> close_timer_start_time:(float Solid.accessor [@mel.as "closeTimerStartTime"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> register_title_id:((string -> (unit -> unit)) [@mel.as "registerTitleId"]) -> register_description_id:((string -> (unit -> unit)) [@mel.as "registerDescriptionId"]) -> unit -> t = "" [@@mel.obj]
  end

  module ToggleButtonRootState = struct
    type t = t_toggle_button_root_state
    (** Whether the toggle button is on (pressed) or off (not pressed). *)
    external pressed : t -> bool Solid.accessor = "pressed" [@@mel.get]
    external make : pressed:(bool Solid.accessor [@mel.as "pressed"]) -> unit -> t = "" [@@mel.obj]
  end

  module ToggleGroupContextValue = struct
    type t = t_toggle_group_context_value
    external is_multiple : t -> bool Solid.accessor = "isMultiple" [@@mel.get]
    external is_disabled : t -> bool Solid.accessor = "isDisabled" [@@mel.get]
    external list_state : t -> t_list_state Solid.accessor = "listState" [@@mel.get]
    external generate_id_js : t -> ((string -> string) [@u]) = "generateId" [@@mel.get]
    let generate_id o x0 = (generate_id_js o) x0 [@u]
    external orientation : t -> [ `horizontal | `vertical ] Solid.accessor = "orientation" [@@mel.get]
    external make : is_multiple:(bool Solid.accessor [@mel.as "isMultiple"]) -> is_disabled:(bool Solid.accessor [@mel.as "isDisabled"]) -> list_state:(t_list_state Solid.accessor [@mel.as "listState"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> orientation:([ `horizontal | `vertical ] Solid.accessor [@mel.as "orientation"]) -> unit -> t = "" [@@mel.obj]
  end

  module TooltipContextValue = struct
    type t = t_tooltip_context_value
    external dataset : t -> t_tooltip_data_set Solid.accessor = "dataset" [@@mel.get]
    external is_open : t -> bool Solid.accessor = "isOpen" [@@mel.get]
    external is_disabled : t -> bool Solid.accessor = "isDisabled" [@@mel.get]
    external trigger_on_focus_only : t -> bool Solid.accessor = "triggerOnFocusOnly" [@@mel.get]
    external content_id : t -> string option Solid.accessor = "contentId" [@@mel.get]
    external content_present : t -> bool Solid.accessor = "contentPresent" [@@mel.get]
    external open_tooltip_js : t -> ((bool option -> unit) [@u]) = "openTooltip" [@@mel.get]
    let open_tooltip o x0 = (open_tooltip_js o) x0 [@u]
    external hide_tooltip_js : t -> ((bool option -> unit) [@u]) = "hideTooltip" [@@mel.get]
    let hide_tooltip o x0 = (hide_tooltip_js o) x0 [@u]
    external cancel_opening_js : t -> ((unit -> unit) [@u]) = "cancelOpening" [@@mel.get]
    let cancel_opening o () = (cancel_opening_js o) () [@u]
    external generate_id_js : t -> ((string -> string) [@u]) = "generateId" [@@mel.get]
    let generate_id o x0 = (generate_id_js o) x0 [@u]
    external register_content_id_js : t -> (string -> (unit -> unit [@u]) [@u]) = "registerContentId" [@@mel.get]
    let register_content_id o x0 = let r = (register_content_id_js o) x0 [@u] in fun () -> r () [@u]
    external is_target_on_tooltip_js : t -> ((Dom.node Js.Nullable.t -> bool) [@u]) = "isTargetOnTooltip" [@@mel.get]
    let is_target_on_tooltip o x0 = (is_target_on_tooltip_js o) x0 [@u]
    external set_trigger_ref_js : t -> ((Dom.htmlElement -> unit) [@u]) = "setTriggerRef" [@@mel.get]
    let set_trigger_ref o x0 = (set_trigger_ref_js o) x0 [@u]
    external set_content_ref_js : t -> ((Dom.htmlElement -> unit) [@u]) = "setContentRef" [@@mel.get]
    let set_content_ref o x0 = (set_content_ref_js o) x0 [@u]
    external make : dataset:(t_tooltip_data_set Solid.accessor [@mel.as "dataset"]) -> is_open:(bool Solid.accessor [@mel.as "isOpen"]) -> is_disabled:(bool Solid.accessor [@mel.as "isDisabled"]) -> trigger_on_focus_only:(bool Solid.accessor [@mel.as "triggerOnFocusOnly"]) -> content_id:(string option Solid.accessor [@mel.as "contentId"]) -> content_present:(bool Solid.accessor [@mel.as "contentPresent"]) -> open_tooltip:((bool option -> unit) [@mel.as "openTooltip"]) -> hide_tooltip:((bool option -> unit) [@mel.as "hideTooltip"]) -> cancel_opening:((unit -> unit) [@mel.as "cancelOpening"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> register_content_id:((string -> (unit -> unit)) [@mel.as "registerContentId"]) -> is_target_on_tooltip:((Dom.node Js.Nullable.t -> bool) [@mel.as "isTargetOnTooltip"]) -> set_trigger_ref:((Dom.htmlElement -> unit) [@mel.as "setTriggerRef"]) -> set_content_ref:((Dom.htmlElement -> unit) [@mel.as "setContentRef"]) -> unit -> t = "" [@@mel.obj]
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
    external value : t -> t_color Solid.accessor = "value" [@@mel.get]
    external set_value_js : t -> ((t_color -> unit) [@u]) = "setValue" [@@mel.get]
    let set_value o x0 = (set_value_js o) x0 [@u]
    external x_value : t -> float Solid.accessor = "xValue" [@@mel.get]
    external y_value : t -> float Solid.accessor = "yValue" [@@mel.get]
    external set_x_value_js : t -> ((float -> unit) [@u]) = "setXValue" [@@mel.get]
    let set_x_value o x0 = (set_x_value_js o) x0 [@u]
    external set_y_value_js : t -> ((float -> unit) [@u]) = "setYValue" [@@mel.get]
    let set_y_value o x0 = (set_y_value_js o) x0 [@u]
    external x_step : t -> float Solid.accessor = "xStep" [@@mel.get]
    external y_step : t -> float Solid.accessor = "yStep" [@@mel.get]
    external x_page_size : t -> float Solid.accessor = "xPageSize" [@@mel.get]
    external y_page_size : t -> float Solid.accessor = "yPageSize" [@@mel.get]
    external x_max_value : t -> float Solid.accessor = "xMaxValue" [@@mel.get]
    external y_max_value : t -> float Solid.accessor = "yMaxValue" [@@mel.get]
    external x_min_value : t -> float Solid.accessor = "xMinValue" [@@mel.get]
    external y_min_value : t -> float Solid.accessor = "yMinValue" [@@mel.get]
    external increment_x_js : t -> ((float -> unit) [@u]) = "incrementX" [@@mel.get]
    let increment_x o x0 = (increment_x_js o) x0 [@u]
    external increment_y_js : t -> ((float -> unit) [@u]) = "incrementY" [@@mel.get]
    let increment_y o x0 = (increment_y_js o) x0 [@u]
    external decrement_x_js : t -> ((float -> unit) [@u]) = "decrementX" [@@mel.get]
    let decrement_x o x0 = (decrement_x_js o) x0 [@u]
    external decrement_y_js : t -> ((float -> unit) [@u]) = "decrementY" [@@mel.get]
    let decrement_y o x0 = (decrement_y_js o) x0 [@u]
    external get_thumb_position_js : t -> ((unit -> t_color_area_state_get_thumb_position) [@u]) = "getThumbPosition" [@@mel.get]
    let get_thumb_position o () = (get_thumb_position_js o) () [@u]
    external is_dragging : t -> bool Solid.accessor = "isDragging" [@@mel.get]
    external set_is_dragging_js : t -> ((bool -> unit) [@u]) = "setIsDragging" [@@mel.get]
    let set_is_dragging o x0 = (set_is_dragging_js o) x0 [@u]
    external channels : t -> t_color_area_state_channels Solid.accessor = "channels" [@@mel.get]
    external reset_value_js : t -> ((unit -> unit) [@u]) = "resetValue" [@@mel.get]
    let reset_value o () = (reset_value_js o) () [@u]
    external get_thumb_percent_js : t -> ((unit -> t_color_area_state_get_thumb_percent) [@u]) = "getThumbPercent" [@@mel.get]
    let get_thumb_percent o () = (get_thumb_percent_js o) () [@u]
    external set_thumb_percent_js : t -> ((t_color_area_state_set_thumb_percent -> unit) [@u]) = "setThumbPercent" [@@mel.get]
    let set_thumb_percent o x0 = (set_thumb_percent_js o) x0 [@u]
    external set_thumb_value_js : t -> ((t_color_area_state_set_thumb_value -> unit) [@u]) = "setThumbValue" [@@mel.get]
    let set_thumb_value o x0 = (set_thumb_value_js o) x0 [@u]
    external is_disabled : t -> bool Solid.accessor = "isDisabled" [@@mel.get]
    external make : value:(t_color Solid.accessor [@mel.as "value"]) -> set_value:((t_color -> unit) [@mel.as "setValue"]) -> x_value:(float Solid.accessor [@mel.as "xValue"]) -> y_value:(float Solid.accessor [@mel.as "yValue"]) -> set_x_value:((float -> unit) [@mel.as "setXValue"]) -> set_y_value:((float -> unit) [@mel.as "setYValue"]) -> x_step:(float Solid.accessor [@mel.as "xStep"]) -> y_step:(float Solid.accessor [@mel.as "yStep"]) -> x_page_size:(float Solid.accessor [@mel.as "xPageSize"]) -> y_page_size:(float Solid.accessor [@mel.as "yPageSize"]) -> x_max_value:(float Solid.accessor [@mel.as "xMaxValue"]) -> y_max_value:(float Solid.accessor [@mel.as "yMaxValue"]) -> x_min_value:(float Solid.accessor [@mel.as "xMinValue"]) -> y_min_value:(float Solid.accessor [@mel.as "yMinValue"]) -> increment_x:((float -> unit) [@mel.as "incrementX"]) -> increment_y:((float -> unit) [@mel.as "incrementY"]) -> decrement_x:((float -> unit) [@mel.as "decrementX"]) -> decrement_y:((float -> unit) [@mel.as "decrementY"]) -> get_thumb_position:((unit -> t_color_area_state_get_thumb_position) [@mel.as "getThumbPosition"]) -> is_dragging:(bool Solid.accessor [@mel.as "isDragging"]) -> set_is_dragging:((bool -> unit) [@mel.as "setIsDragging"]) -> channels:(t_color_area_state_channels Solid.accessor [@mel.as "channels"]) -> reset_value:((unit -> unit) [@mel.as "resetValue"]) -> get_thumb_percent:((unit -> t_color_area_state_get_thumb_percent) [@mel.as "getThumbPercent"]) -> set_thumb_percent:((t_color_area_state_set_thumb_percent -> unit) [@mel.as "setThumbPercent"]) -> set_thumb_value:((t_color_area_state_set_thumb_value -> unit) [@mel.as "setThumbValue"]) -> is_disabled:(bool Solid.accessor [@mel.as "isDisabled"]) -> unit -> t = "" [@@mel.obj]
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
    external focusEvent : t -> Dom.focusEvent = "%identity"
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
    external value : ('p, 'c) t -> 't = "value" [@@mel.get]
    external children : ('p, 'c) t -> Jsx.element = "children" [@@mel.get]
    external make : value:('t [@mel.as "value"]) -> children:(Jsx.element [@mel.as "children"]) -> unit -> ('p, 'c) t = "" [@@mel.obj]
  end

  module Context_Provider = struct
    type t = t_context_provider
    external value : t -> 't = "value" [@@mel.get]
    external make : value:('t [@mel.as "value"]) -> unit -> t = "" [@@mel.obj]
  end

  module ColorWheelState = struct
    type t = t_color_wheel_state
    external value : t -> t_color Solid.accessor = "value" [@@mel.get]
    external set_value_js : t -> ((t_color -> unit) [@u]) = "setValue" [@@mel.get]
    let set_value o x0 = (set_value_js o) x0 [@u]
    external hue : t -> float Solid.accessor = "hue" [@@mel.get]
    external set_hue_js : t -> ((float -> unit) [@u]) = "setHue" [@@mel.get]
    let set_hue o x0 = (set_hue_js o) x0 [@u]
    external step : t -> float Solid.accessor = "step" [@@mel.get]
    external page_size : t -> float Solid.accessor = "pageSize" [@@mel.get]
    external max_value : t -> float Solid.accessor = "maxValue" [@@mel.get]
    external min_value : t -> float Solid.accessor = "minValue" [@@mel.get]
    external increment_js : t -> ((float -> unit) [@u]) = "increment" [@@mel.get]
    let increment o x0 = (increment_js o) x0 [@u]
    external decrement_js : t -> ((float -> unit) [@u]) = "decrement" [@@mel.get]
    let decrement o x0 = (decrement_js o) x0 [@u]
    external get_thumb_position_js : t -> ((unit -> t_color_wheel_state_get_thumb_position) [@u]) = "getThumbPosition" [@@mel.get]
    let get_thumb_position o () = (get_thumb_position_js o) () [@u]
    external set_thumb_value_js : t -> ((float -> float -> float -> unit) [@u]) = "setThumbValue" [@@mel.get]
    let set_thumb_value o x0 x1 x2 = (set_thumb_value_js o) x0 x1 x2 [@u]
    external is_dragging : t -> bool Solid.accessor = "isDragging" [@@mel.get]
    external set_is_dragging_js : t -> ((bool -> unit) [@u]) = "setIsDragging" [@@mel.get]
    let set_is_dragging o x0 = (set_is_dragging_js o) x0 [@u]
    external reset_value_js : t -> ((unit -> unit) [@u]) = "resetValue" [@@mel.get]
    let reset_value o () = (reset_value_js o) () [@u]
    external is_disabled : t -> bool Solid.accessor = "isDisabled" [@@mel.get]
    external make : value:(t_color Solid.accessor [@mel.as "value"]) -> set_value:((t_color -> unit) [@mel.as "setValue"]) -> hue:(float Solid.accessor [@mel.as "hue"]) -> set_hue:((float -> unit) [@mel.as "setHue"]) -> step:(float Solid.accessor [@mel.as "step"]) -> page_size:(float Solid.accessor [@mel.as "pageSize"]) -> max_value:(float Solid.accessor [@mel.as "maxValue"]) -> min_value:(float Solid.accessor [@mel.as "minValue"]) -> increment:((float -> unit) [@mel.as "increment"]) -> decrement:((float -> unit) [@mel.as "decrement"]) -> get_thumb_position:((unit -> t_color_wheel_state_get_thumb_position) [@mel.as "getThumbPosition"]) -> set_thumb_value:((float -> float -> float -> unit) [@mel.as "setThumbValue"]) -> is_dragging:(bool Solid.accessor [@mel.as "isDragging"]) -> set_is_dragging:((bool -> unit) [@mel.as "setIsDragging"]) -> reset_value:((unit -> unit) [@mel.as "resetValue"]) -> is_disabled:(bool Solid.accessor [@mel.as "isDisabled"]) -> unit -> t = "" [@@mel.obj]
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
    external keyboardEvent : t -> Dom.keyboardEvent = "%identity"
  end

  module ContextMenuContextValue_SetAnchorRect = struct
    type t = t_context_menu_context_value_set_anchor_rect
    external x : t -> float = "x" [@@mel.get]
    external y : t -> float = "y" [@@mel.get]
    external make : x:(float [@mel.as "x"]) -> y:(float [@mel.as "y"]) -> unit -> t = "" [@@mel.obj]
  end

  module ConstructorOptions = struct
    type t = t_constructor_options
    (** Reject inputs whose `width × height` exceeds this many pixels. The
        check runs after the header is read but before any pixel buffer is
        allocated, so a tiny file claiming a huge canvas is refused cheaply. *)
    external max_pixels : t -> float option = "maxPixels" [@@mel.get]
    (** Apply EXIF Orientation (JPEG) before any other operation. *)
    external auto_orient : t -> bool option = "autoOrient" [@@mel.get]
    external make : ?max_pixels:(float [@mel.as "maxPixels"]) -> ?auto_orient:(bool [@mel.as "autoOrient"]) -> unit -> t = "" [@@mel.obj]
  end

  (** Decode, transform and re-encode images. Ships JPEG, PNG and WebP via
      statically-linked libjpeg-turbo / libspng / libwebp; resize and rotate
      are SIMD kernels — no native module install, no `sharp`.
      
      The constructor and every chainable method only *record* settings; the
      decode → transform → encode pipeline runs on a worker thread when a
      terminal (`bytes`, `buffer`, `blob`, `toBase64`, `metadata`) is awaited.
      
      Chainables overwrite (calling `.resize()` twice keeps the second). Order
      of execution is fixed regardless of call order:
      `autoOrient → rotate → flip/flop → resize → modulate`.
      
      The source ICC colour profile (Display P3, Adobe RGB, Jpegli XYB, etc.)
      is preserved through re-encode to JPEG, PNG, and WebP so non-sRGB
      images don't shift colour. *)
  module Image = struct
    type t = t_image
    external resize : t -> float -> float option -> t_resize_options option -> t_image = "resize" [@@mel.send]
    external rotate : t -> float -> t_image = "rotate" [@@mel.send]
    external flip : t -> unit -> t_image = "flip" [@@mel.send]
    external flop : t -> unit -> t_image = "flop" [@@mel.send]
    external modulate : t -> t_modulate_options -> t_image = "modulate" [@@mel.send]
    external jpeg : t -> t_image_jpeg option -> t_image = "jpeg" [@@mel.send]
    external png : t -> t_image_png option -> t_image = "png" [@@mel.send]
    external webp : t -> t_image_webp option -> t_image = "webp" [@@mel.send]
    external heic : t -> t_image_heic option -> t_image = "heic" [@@mel.send]
    external avif : t -> t_image_avif option -> t_image = "avif" [@@mel.send]
    external bytes : t -> unit -> t_uint8_array Js.Promise.t = "bytes" [@@mel.send]
    external buffer : t -> unit -> (t_array_buffer, t_shared_array_buffer) either t_buffer Js.Promise.t = "buffer" [@@mel.send]
    external to_buffer : t -> unit -> (t_array_buffer, t_shared_array_buffer) either t_buffer Js.Promise.t = "toBuffer" [@@mel.send]
    external dataurl : t -> unit -> string Js.Promise.t = "dataurl" [@@mel.send]
    external placeholder : t -> [ `dataurl ] option -> string Js.Promise.t = "placeholder" [@@mel.send]
    external blob : t -> unit -> t_blob Js.Promise.t = "blob" [@@mel.send]
    external to_base64 : t -> unit -> string Js.Promise.t = "toBase64" [@@mel.send]
    external metadata : t -> unit -> t_metadata Js.Promise.t = "metadata" [@@mel.send]
    (** Populated after the first awaited terminal; `-1` before. *)
    external width : t -> float = "width" [@@mel.get]
    (** Populated after the first awaited terminal; `-1` before. *)
    external height : t -> float = "height" [@@mel.get]
  end

  module HoverCardDataSet = struct
    type t = t_hover_card_data_set
  end

  module NumberFormat_FormatToParts = struct
    type t = t_number_format_format_to_parts
    external to_string : t -> float option -> string = "toString" [@@mel.send]
    external value_of : t -> unit -> t_number_format_format_to_parts = "valueOf" [@@mel.send]
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
    external set_focused_key : t -> string option -> unit = "setFocusedKey" [@@mel.send]
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
    external select : t -> string -> Dom.pointerEvent option -> unit = "select" [@@mel.send]
    external is_selection_equal : t -> string Js.Set.t -> bool = "isSelectionEqual" [@@mel.send]
    external can_select_item : t -> string -> bool = "canSelectItem" [@@mel.send]
    external is_disabled : t -> string -> bool = "isDisabled" [@@mel.send]
    external make : _ t_collection_node t_collection Solid.accessor -> t_multiple_selection_state -> t = "SelectionManager" [@@mel.new] [@@mel.module "@kobalte/core"]
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
    external inputEvent : t -> Dom.inputEvent = "%identity"
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
    external values : t -> float array Solid.accessor = "values" [@@mel.get]
    external get_thumb_value : t -> float -> float = "getThumbValue" [@@mel.send]
    external set_thumb_value : t -> float -> float -> unit = "setThumbValue" [@@mel.send]
    external get_thumb_percent : t -> float -> float = "getThumbPercent" [@@mel.send]
    external set_thumb_percent : t -> float -> float -> unit = "setThumbPercent" [@@mel.send]
    external is_thumb_dragging : t -> float -> bool = "isThumbDragging" [@@mel.send]
    external set_thumb_dragging : t -> float -> bool -> unit = "setThumbDragging" [@@mel.send]
    external focused_thumb : t -> float option Solid.accessor = "focusedThumb" [@@mel.get]
    external set_focused_thumb : t -> float option -> unit = "setFocusedThumb" [@@mel.send]
    external get_value_percent : t -> float -> float = "getValuePercent" [@@mel.send]
    external get_thumb_value_label : t -> float -> string = "getThumbValueLabel" [@@mel.send]
    external get_formatted_value : t -> float -> string = "getFormattedValue" [@@mel.send]
    external get_thumb_min_value : t -> float -> float = "getThumbMinValue" [@@mel.send]
    external get_thumb_max_value : t -> float -> float = "getThumbMaxValue" [@@mel.send]
    external get_percent_value : t -> float -> float = "getPercentValue" [@@mel.send]
    external is_thumb_editable : t -> float -> bool = "isThumbEditable" [@@mel.send]
    external set_thumb_editable : t -> float -> bool -> unit = "setThumbEditable" [@@mel.send]
    external increment_thumb : t -> float -> float option -> unit = "incrementThumb" [@@mel.send]
    external decrement_thumb : t -> float -> float option -> unit = "decrementThumb" [@@mel.send]
    external step : t -> float Solid.accessor = "step" [@@mel.get]
    external page_size : t -> float Solid.accessor = "pageSize" [@@mel.get]
    external orientation : t -> [ `horizontal | `vertical ] Solid.accessor = "orientation" [@@mel.get]
    external is_disabled : t -> bool Solid.accessor = "isDisabled" [@@mel.get]
    external set_values_js : t -> ((((float array, float array -> float array) either) -> unit) [@u]) = "setValues" [@@mel.get]
    let set_values o x0 = (set_values_js o) x0 [@u]
    external reset_values_js : t -> ((unit -> unit) [@u]) = "resetValues" [@@mel.get]
    let reset_values o () = (reset_values_js o) () [@u]
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
    external ref : t -> Dom.element option Solid.accessor = "ref" [@@mel.get]
    external make : type_:([ `section | `item ] [@mel.as "type"]) -> key:(string [@mel.as "key"]) -> text_value:(string [@mel.as "textValue"]) -> disabled:(bool [@mel.as "disabled"]) -> ref:(Dom.element option Solid.accessor [@mel.as "ref"]) -> unit -> t = "" [@@mel.obj]
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
    external selected_item : t -> _ t_collection_node option Solid.accessor = "selectedItem" [@@mel.get]
    (** The key for the currently selected item. *)
    external selected_key : t -> string option Solid.accessor = "selectedKey" [@@mel.get]
    external set_selected_key : t -> string -> unit = "setSelectedKey" [@@mel.send]
    (** A collection of items in the list. *)
    external collection : t -> _ t_collection_node t_collection Solid.accessor = "collection" [@@mel.get]
    (** A selection manager to read and update multiple selection state. *)
    external selection_manager : t -> t_selection_manager Solid.accessor = "selectionManager" [@@mel.get]
  end

  module TextFieldContextValue_OnInput = struct
    type t = t_text_field_context_value_on_input
    (** The **`currentTarget`** read-only property of the Event interface identifies the element to which the event handler has been attached.
        
        \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Event/currentTarget) *)
    external current_target : t -> Dom.eventTarget = "currentTarget" [@@mel.get]
    (** The read-only **`target`** property of the dispatched.
        
        \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Event/target) *)
    external target : t -> Dom.eventTarget = "target" [@@mel.get]
    external inputEvent : t -> Dom.inputEvent = "%identity"
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

  module ResizeOptions = struct
    type t = t_resize_options
    (** Resampling kernel. *)
    external filter : t -> [ `nearest | `box | `bilinear | `linear | `cubic | `mitchell | `lanczos2 | `lanczos3 | `mks2013 | `mks2021 ] option = "filter" [@@mel.get]
    (** `"fill"` stretches to exactly width×height. `"inside"` preserves
        aspect ratio so the result fits *within* width×height. *)
    external fit : t -> [ `fill | `inside ] option = "fit" [@@mel.get]
    (** Never upscale — if the source is already smaller, leave it. *)
    external without_enlargement : t -> bool option = "withoutEnlargement" [@@mel.get]
    external make : ?filter:([ `nearest | `box | `bilinear | `linear | `cubic | `mitchell | `lanczos2 | `lanczos3 | `mks2013 | `mks2021 ] [@mel.as "filter"]) -> ?fit:([ `fill | `inside ] [@mel.as "fit"]) -> ?without_enlargement:(bool [@mel.as "withoutEnlargement"]) -> unit -> t = "" [@@mel.obj]
  end

  module ModulateOptions = struct
    type t = t_modulate_options
    (** Multiplier; `1` leaves brightness unchanged. *)
    external brightness : t -> float option = "brightness" [@@mel.get]
    (** `0` = greyscale, `1` = unchanged, `>1` = more saturated. *)
    external saturation : t -> float option = "saturation" [@@mel.get]
    external make : ?brightness:(float [@mel.as "brightness"]) -> ?saturation:(float [@mel.as "saturation"]) -> unit -> t = "" [@@mel.obj]
  end

  module Image_Jpeg = struct
    type t = t_image_jpeg
    (** 1–100, default 80. *)
    external quality : t -> float option = "quality" [@@mel.get]
    (** Emit a progressive (multi-scan) JPEG. Default `false`. *)
    external progressive : t -> bool option = "progressive" [@@mel.get]
    external make : ?quality:(float [@mel.as "quality"]) -> ?progressive:(bool [@mel.as "progressive"]) -> unit -> t = "" [@@mel.obj]
  end

  module Image_Png = struct
    type t = t_image_png
    (** zlib level 0–9. *)
    external compression_level : t -> float option = "compressionLevel" [@@mel.get]
    (** Quantize to a palette and emit indexed (colour-type 3) PNG. *)
    external palette : t -> bool option = "palette" [@@mel.get]
    (** Max palette size when `palette: true`. 2–256. *)
    external colors : t -> float option = "colors" [@@mel.get]
    (** Floyd–Steinberg error-diffusion dither (only with `palette: true`). *)
    external dither : t -> bool option = "dither" [@@mel.get]
    external make : ?compression_level:(float [@mel.as "compressionLevel"]) -> ?palette:(bool [@mel.as "palette"]) -> ?colors:(float [@mel.as "colors"]) -> ?dither:(bool [@mel.as "dither"]) -> unit -> t = "" [@@mel.obj]
  end

  module Image_Webp = struct
    type t = t_image_webp
    external quality : t -> float option = "quality" [@@mel.get]
    external lossless : t -> bool option = "lossless" [@@mel.get]
    external make : ?quality:(float [@mel.as "quality"]) -> ?lossless:(bool [@mel.as "lossless"]) -> unit -> t = "" [@@mel.obj]
  end

  module Image_Heic = struct
    type t = t_image_heic
    external quality : t -> float option = "quality" [@@mel.get]
    external make : ?quality:(float [@mel.as "quality"]) -> unit -> t = "" [@@mel.obj]
  end

  module Image_Avif = struct
    type t = t_image_avif
    external quality : t -> float option = "quality" [@@mel.get]
    external make : ?quality:(float [@mel.as "quality"]) -> unit -> t = "" [@@mel.obj]
  end

  module Buffer = struct
    type 't_array_buffer t = 't_array_buffer t_buffer
    external slice : 't_array_buffer t -> float option -> float option -> t_array_buffer t_buffer = "slice" [@@mel.send]
    external subarray : 't_array_buffer t -> float option -> float option -> 't_array_buffer t_buffer = "subarray" [@@mel.send]
    external write : 't_array_buffer t -> string -> string option -> float = "write" [@@mel.send]
    external to_string : 't_array_buffer t -> string option -> float option -> float option -> string = "toString" [@@mel.send]
    external to_json : 't_array_buffer t -> unit -> t_buffer_to_json = "toJSON" [@@mel.send]
    external equals : 't_array_buffer t -> t_uint8_array -> bool = "equals" [@@mel.send]
    external compare : 't_array_buffer t -> t_uint8_array -> float option -> float option -> float option -> float option -> float = "compare" [@@mel.send]
    external copy : 't_array_buffer t -> t_uint8_array -> float option -> float option -> float option -> float = "copy" [@@mel.send]
    external write_big_int64_be : 't_array_buffer t -> t_number_format_format_to_parts -> float option -> float = "writeBigInt64BE" [@@mel.send]
    external write_big_int64_le : 't_array_buffer t -> t_number_format_format_to_parts -> float option -> float = "writeBigInt64LE" [@@mel.send]
    external write_big_u_int64_be : 't_array_buffer t -> t_number_format_format_to_parts -> float option -> float = "writeBigUInt64BE" [@@mel.send]
    external write_big_uint64_be : 't_array_buffer t -> t_number_format_format_to_parts -> float option -> float = "writeBigUint64BE" [@@mel.send]
    external write_big_u_int64_le : 't_array_buffer t -> t_number_format_format_to_parts -> float option -> float = "writeBigUInt64LE" [@@mel.send]
    external write_big_uint64_le : 't_array_buffer t -> t_number_format_format_to_parts -> float option -> float = "writeBigUint64LE" [@@mel.send]
    external write_u_int_le : 't_array_buffer t -> float -> float -> float -> float = "writeUIntLE" [@@mel.send]
    external write_uint_le : 't_array_buffer t -> float -> float -> float -> float = "writeUintLE" [@@mel.send]
    external write_u_int_be : 't_array_buffer t -> float -> float -> float -> float = "writeUIntBE" [@@mel.send]
    external write_uint_be : 't_array_buffer t -> float -> float -> float -> float = "writeUintBE" [@@mel.send]
    external write_int_le : 't_array_buffer t -> float -> float -> float -> float = "writeIntLE" [@@mel.send]
    external write_int_be : 't_array_buffer t -> float -> float -> float -> float = "writeIntBE" [@@mel.send]
    external read_big_u_int64_be : 't_array_buffer t -> float option -> t_number_format_format_to_parts = "readBigUInt64BE" [@@mel.send]
    external read_big_uint64_be : 't_array_buffer t -> float option -> t_number_format_format_to_parts = "readBigUint64BE" [@@mel.send]
    external read_big_u_int64_le : 't_array_buffer t -> float option -> t_number_format_format_to_parts = "readBigUInt64LE" [@@mel.send]
    external read_big_uint64_le : 't_array_buffer t -> float option -> t_number_format_format_to_parts = "readBigUint64LE" [@@mel.send]
    external read_big_int64_be : 't_array_buffer t -> float option -> t_number_format_format_to_parts = "readBigInt64BE" [@@mel.send]
    external read_big_int64_le : 't_array_buffer t -> float option -> t_number_format_format_to_parts = "readBigInt64LE" [@@mel.send]
    external read_u_int_le : 't_array_buffer t -> float -> float -> float = "readUIntLE" [@@mel.send]
    external read_uint_le : 't_array_buffer t -> float -> float -> float = "readUintLE" [@@mel.send]
    external read_u_int_be : 't_array_buffer t -> float -> float -> float = "readUIntBE" [@@mel.send]
    external read_uint_be : 't_array_buffer t -> float -> float -> float = "readUintBE" [@@mel.send]
    external read_int_le : 't_array_buffer t -> float -> float -> float = "readIntLE" [@@mel.send]
    external read_int_be : 't_array_buffer t -> float -> float -> float = "readIntBE" [@@mel.send]
    external read_u_int8 : 't_array_buffer t -> float option -> float = "readUInt8" [@@mel.send]
    external read_uint8 : 't_array_buffer t -> float option -> float = "readUint8" [@@mel.send]
    external read_u_int16_le : 't_array_buffer t -> float option -> float = "readUInt16LE" [@@mel.send]
    external read_uint16_le : 't_array_buffer t -> float option -> float = "readUint16LE" [@@mel.send]
    external read_u_int16_be : 't_array_buffer t -> float option -> float = "readUInt16BE" [@@mel.send]
    external read_uint16_be : 't_array_buffer t -> float option -> float = "readUint16BE" [@@mel.send]
    external read_u_int32_le : 't_array_buffer t -> float option -> float = "readUInt32LE" [@@mel.send]
    external read_uint32_le : 't_array_buffer t -> float option -> float = "readUint32LE" [@@mel.send]
    external read_u_int32_be : 't_array_buffer t -> float option -> float = "readUInt32BE" [@@mel.send]
    external read_uint32_be : 't_array_buffer t -> float option -> float = "readUint32BE" [@@mel.send]
    external read_int8 : 't_array_buffer t -> float option -> float = "readInt8" [@@mel.send]
    external read_int16_le : 't_array_buffer t -> float option -> float = "readInt16LE" [@@mel.send]
    external read_int16_be : 't_array_buffer t -> float option -> float = "readInt16BE" [@@mel.send]
    external read_int32_le : 't_array_buffer t -> float option -> float = "readInt32LE" [@@mel.send]
    external read_int32_be : 't_array_buffer t -> float option -> float = "readInt32BE" [@@mel.send]
    external read_float_le : 't_array_buffer t -> float option -> float = "readFloatLE" [@@mel.send]
    external read_float_be : 't_array_buffer t -> float option -> float = "readFloatBE" [@@mel.send]
    external read_double_le : 't_array_buffer t -> float option -> float = "readDoubleLE" [@@mel.send]
    external read_double_be : 't_array_buffer t -> float option -> float = "readDoubleBE" [@@mel.send]
    external reverse : 't_array_buffer t -> unit -> 't_array_buffer t_buffer = "reverse" [@@mel.send]
    external swap16 : 't_array_buffer t -> unit -> 't_array_buffer t_buffer = "swap16" [@@mel.send]
    external swap32 : 't_array_buffer t -> unit -> 't_array_buffer t_buffer = "swap32" [@@mel.send]
    external swap64 : 't_array_buffer t -> unit -> 't_array_buffer t_buffer = "swap64" [@@mel.send]
    external write_u_int8 : 't_array_buffer t -> float -> float option -> float = "writeUInt8" [@@mel.send]
    external write_uint8 : 't_array_buffer t -> float -> float option -> float = "writeUint8" [@@mel.send]
    external write_u_int16_le : 't_array_buffer t -> float -> float option -> float = "writeUInt16LE" [@@mel.send]
    external write_uint16_le : 't_array_buffer t -> float -> float option -> float = "writeUint16LE" [@@mel.send]
    external write_u_int16_be : 't_array_buffer t -> float -> float option -> float = "writeUInt16BE" [@@mel.send]
    external write_uint16_be : 't_array_buffer t -> float -> float option -> float = "writeUint16BE" [@@mel.send]
    external write_u_int32_le : 't_array_buffer t -> float -> float option -> float = "writeUInt32LE" [@@mel.send]
    external write_uint32_le : 't_array_buffer t -> float -> float option -> float = "writeUint32LE" [@@mel.send]
    external write_u_int32_be : 't_array_buffer t -> float -> float option -> float = "writeUInt32BE" [@@mel.send]
    external write_uint32_be : 't_array_buffer t -> float -> float option -> float = "writeUint32BE" [@@mel.send]
    external write_int8 : 't_array_buffer t -> float -> float option -> float = "writeInt8" [@@mel.send]
    external write_int16_le : 't_array_buffer t -> float -> float option -> float = "writeInt16LE" [@@mel.send]
    external write_int16_be : 't_array_buffer t -> float -> float option -> float = "writeInt16BE" [@@mel.send]
    external write_int32_le : 't_array_buffer t -> float -> float option -> float = "writeInt32LE" [@@mel.send]
    external write_int32_be : 't_array_buffer t -> float -> float option -> float = "writeInt32BE" [@@mel.send]
    external write_float_le : 't_array_buffer t -> float -> float option -> float = "writeFloatLE" [@@mel.send]
    external write_float_be : 't_array_buffer t -> float -> float option -> float = "writeFloatBE" [@@mel.send]
    external write_double_le : 't_array_buffer t -> float -> float option -> float = "writeDoubleLE" [@@mel.send]
    external write_double_be : 't_array_buffer t -> float -> float option -> float = "writeDoubleBE" [@@mel.send]
    (** The size in bytes of each element in the array. *)
    external bytes_per_element : 't_array_buffer t -> float = "BYTES_PER_ELEMENT" [@@mel.get]
    (** The ArrayBuffer instance referenced by the array. *)
    external buffer : 't_array_buffer t -> 't_array_buffer = "buffer" [@@mel.get]
    (** The length in bytes of the array. *)
    external byte_length : 't_array_buffer t -> float = "byteLength" [@@mel.get]
    (** The offset in bytes of the array. *)
    external byte_offset : 't_array_buffer t -> float = "byteOffset" [@@mel.get]
    external copy_within : 't_array_buffer t -> float -> float -> float option -> 't_array_buffer t_buffer = "copyWithin" [@@mel.send]
    external join : 't_array_buffer t -> string option -> string = "join" [@@mel.send]
    (** The length of the array. *)
    external length : 't_array_buffer t -> float = "length" [@@mel.get]
    external reduce : 't_array_buffer t -> (float -> float -> float -> 't_array_buffer t_buffer -> float) -> float = "reduce" [@@mel.send]
    external reduce_right : 't_array_buffer t -> (float -> float -> float -> 't_array_buffer t_buffer -> float) -> float = "reduceRight" [@@mel.send]
    external set : 't_array_buffer t -> t_array_like -> float option -> unit = "set" [@@mel.send]
    external sort : 't_array_buffer t -> ((float -> float -> float) option) -> 't_array_buffer t_buffer = "sort" [@@mel.send]
    external to_locale_string : 't_array_buffer t -> unit -> string = "toLocaleString" [@@mel.send]
    external value_of : 't_array_buffer t -> unit -> 't_array_buffer t_buffer = "valueOf" [@@mel.send]
    external entries : 't_array_buffer t -> unit -> t_array_iterator = "entries" [@@mel.send]
    external keys : 't_array_buffer t -> unit -> t_array_iterator = "keys" [@@mel.send]
    external values : 't_array_buffer t -> unit -> t_array_iterator = "values" [@@mel.send]
    external to_base64 : 't_array_buffer t -> t_buffer_to_base64 option -> string = "toBase64" [@@mel.send]
    external set_from_base64 : 't_array_buffer t -> string -> float option -> t_buffer_set_from_base64 = "setFromBase64" [@@mel.send]
    external to_hex : 't_array_buffer t -> unit -> string = "toHex" [@@mel.send]
    external set_from_hex : 't_array_buffer t -> string -> t_buffer_set_from_hex = "setFromHex" [@@mel.send]
  end

  (** \[`Blob`\](https://developer.mozilla.org/en-US/docs/Web/API/Blob) powered by the fastest system calls available for operating on files.
      
      This Blob is lazy: it does no work until you read from it.
      
      - `size` is not valid until the contents of the file are read at least once.
      - `type` is auto-set based on the file extension when possible *)
  module BunFile = struct
    type t = t_bun_file
    external slice : t -> float option -> float option -> string option -> t_bun_file = "slice" [@@mel.send]
    external writer : t -> t_bun_file_writer option -> t_file_sink = "writer" [@@mel.send]
    (** A UNIX timestamp indicating when the file was last modified. *)
    external last_modified : t -> float = "lastModified" [@@mel.get]
    (** The name or path of the file, as specified in the constructor. *)
    external name : t -> string option = "name" [@@mel.get]
    external exists : t -> unit -> bool Js.Promise.t = "exists" [@@mel.send]
    external unlink : t -> unit -> unit Js.Promise.t = "unlink" [@@mel.send]
    external delete : t -> unit -> unit Js.Promise.t = "delete" [@@mel.send]
    external stat : t -> unit -> t_stats Js.Promise.t = "stat" [@@mel.send]
    (** The **`size`** read-only property of the Blob interface returns the size of the Blob or File in bytes.
        
        \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Blob/size)
        The size of this Blob in bytes *)
    external size : t -> float = "size" [@@mel.get]
    (** The **`type`** read-only property of the Blob interface returns the MIME type of the file.
        
        \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Blob/type)
        The MIME type of this Blob *)
    external type_ : t -> string = "type" [@@mel.get]
    external array_buffer : t -> unit -> t_array_buffer Js.Promise.t = "arrayBuffer" [@@mel.send]
    external bytes : t -> unit -> t_uint8_array Js.Promise.t = "bytes" [@@mel.send]
    external stream : t -> unit -> t_readable_stream = "stream" [@@mel.send]
    external text : t -> unit -> string Js.Promise.t = "text" [@@mel.send]
    external image : t -> t_constructor_options option -> t_image = "image" [@@mel.send]
    external form_data : t -> unit -> t_form_data Js.Promise.t = "formData" [@@mel.send]
  end

  (** Represents a file in an S3-compatible storage service.
      Extends the Blob interface for compatibility with web APIs. *)
  module S3File = struct
    type t = t_s3_file
    external slice : t -> float option -> float option -> string option -> t_s3_file = "slice" [@@mel.send]
    external writer : t -> t_s3_options option -> t_network_sink = "writer" [@@mel.send]
    (** Gets a readable stream of the file's content.
        Useful for processing large files without loading them entirely into memory. *)
    external readable : t -> t_readable_stream = "readable" [@@mel.get]
    external stream : t -> unit -> t_readable_stream = "stream" [@@mel.send]
    (** The name or path of the file in the bucket. *)
    external name : t -> string option = "name" [@@mel.get]
    (** The bucket name containing the file. *)
    external bucket : t -> string option = "bucket" [@@mel.get]
    external exists : t -> unit -> bool Js.Promise.t = "exists" [@@mel.send]
    external presign : t -> t_s3_file_presign_options option -> string = "presign" [@@mel.send]
    external delete : t -> unit -> unit Js.Promise.t = "delete" [@@mel.send]
    (** Alias for `delete()`, matching the Node.js `fs` API naming. *)
    external unlink_js : t -> ((unit -> unit Js.Promise.t) [@u]) = "unlink" [@@mel.get]
    let unlink o () = (unlink_js o) () [@u]
    external stat : t -> unit -> t_s3_stats Js.Promise.t = "stat" [@@mel.send]
    (** The **`size`** read-only property of the Blob interface returns the size of the Blob or File in bytes.
        
        \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Blob/size)
        The size of this Blob in bytes *)
    external size : t -> float = "size" [@@mel.get]
    (** The **`type`** read-only property of the Blob interface returns the MIME type of the file.
        
        \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/Blob/type)
        The MIME type of this Blob *)
    external type_ : t -> string = "type" [@@mel.get]
    external array_buffer : t -> unit -> t_array_buffer Js.Promise.t = "arrayBuffer" [@@mel.send]
    external bytes : t -> unit -> t_uint8_array Js.Promise.t = "bytes" [@@mel.send]
    external text : t -> unit -> string Js.Promise.t = "text" [@@mel.send]
    external image : t -> t_constructor_options option -> t_image = "image" [@@mel.send]
    external form_data : t -> unit -> t_form_data Js.Promise.t = "formData" [@@mel.send]
  end

  module Metadata = struct
    type t = t_metadata
    external width : t -> float = "width" [@@mel.get]
    external height : t -> float = "height" [@@mel.get]
    external format : t -> [ `jpeg | `png | `webp | `heic | `avif | `bmp | `tiff | `gif ] = "format" [@@mel.get]
    external make : width:(float [@mel.as "width"]) -> height:(float [@mel.as "height"]) -> format:([ `jpeg | `png | `webp | `heic | `avif | `bmp | `tiff | `gif ] [@mel.as "format"]) -> unit -> t = "" [@@mel.obj]
  end

  module MultipleSelectionState = struct
    type t = t_multiple_selection_state
    (** The type of selection that is allowed in the collection. *)
    external selection_mode : t -> [ `none | `single | `multiple ] Solid.accessor = "selectionMode" [@@mel.get]
    (** The selection behavior for the collection. *)
    external selection_behavior : t -> [ `toggle | `replace ] Solid.accessor = "selectionBehavior" [@@mel.get]
    external set_selection_behavior : t -> [ `toggle | `replace ] -> unit = "setSelectionBehavior" [@@mel.send]
    (** Whether the collection allows empty selection. *)
    external disallow_empty_selection : t -> bool Solid.accessor = "disallowEmptySelection" [@@mel.get]
    (** The currently selected keys in the collection. *)
    external selected_keys : t -> string Js.Set.t Solid.accessor = "selectedKeys" [@@mel.get]
    external set_selected_keys : t -> string Js.Set.t -> unit = "setSelectedKeys" [@@mel.send]
    (** Whether the collection is currently focused. *)
    external is_focused : t -> bool Solid.accessor = "isFocused" [@@mel.get]
    (** The current focused key in the collection. *)
    external focused_key : t -> string option Solid.accessor = "focusedKey" [@@mel.get]
    external set_focused : t -> bool -> unit = "setFocused" [@@mel.send]
    external set_focused_key : t -> string option -> unit = "setFocusedKey" [@@mel.send]
  end

  module SwipeEvent_Detail_Delta = struct
    type t = t_swipe_event_detail_delta
    external x : t -> float = "x" [@@mel.get]
    external y : t -> float = "y" [@@mel.get]
    external make : x:(float [@mel.as "x"]) -> y:(float [@mel.as "y"]) -> unit -> t = "" [@@mel.obj]
  end

  module Buffer_ToJSON = struct
    type t = t_buffer_to_json
    external type_ : t -> [ `Buffer ] = "type" [@@mel.get]
    external data : t -> float array = "data" [@@mel.get]
    external make : type_:([ `Buffer ] [@mel.as "type"]) -> data:(float array [@mel.as "data"]) -> unit -> t = "" [@@mel.obj]
  end

  module Buffer_ToBase64 = struct
    type t = t_buffer_to_base64
    external alphabet : t -> [ `base64 | `base64url ] option = "alphabet" [@@mel.get]
    external omit_padding : t -> bool option = "omitPadding" [@@mel.get]
    external make : ?alphabet:([ `base64 | `base64url ] [@mel.as "alphabet"]) -> ?omit_padding:(bool [@mel.as "omitPadding"]) -> unit -> t = "" [@@mel.obj]
  end

  module Buffer_SetFromBase64 = struct
    type t = t_buffer_set_from_base64
    (** The number of bytes read from the base64 string *)
    external read : t -> float = "read" [@@mel.get]
    (** The number of bytes written to the Uint8Array.
        Never greater than the `.byteLength` of this Uint8Array *)
    external written : t -> float = "written" [@@mel.get]
    external make : read:(float [@mel.as "read"]) -> written:(float [@mel.as "written"]) -> unit -> t = "" [@@mel.obj]
  end

  module Buffer_SetFromHex = struct
    type t = t_buffer_set_from_hex
    (** The number of bytes read from the hex string *)
    external read : t -> float = "read" [@@mel.get]
    (** The number of bytes written to the Uint8Array.
        Never greater than the `.byteLength` of this Uint8Array *)
    external written : t -> float = "written" [@@mel.get]
    external make : read:(float [@mel.as "read"]) -> written:(float [@mel.as "written"]) -> unit -> t = "" [@@mel.obj]
  end

  module BunFile_Writer = struct
    type t = t_bun_file_writer
    external high_water_mark : t -> float option = "highWaterMark" [@@mel.get]
    external make : ?high_water_mark:(float [@mel.as "highWaterMark"]) -> unit -> t = "" [@@mel.obj]
  end

  (** Fast incremental writer for files and pipes.
      
      This uses the same interface as \{\@link ArrayBufferSink\}, but writes to a file or pipe. *)
  module FileSink = struct
    type t = t_file_sink
    external flush : t -> unit -> (float, float Js.Promise.t) either = "flush" [@@mel.send]
    external end_ : t -> t_error option -> (float, float Js.Promise.t) either = "end" [@@mel.send]
    external start : t -> t_file_sink_start option -> unit = "start" [@@mel.send]
    external ref : t -> unit -> unit = "ref" [@@mel.send]
    external unref : t -> unit -> unit = "unref" [@@mel.send]
  end

  module BunFile_Write = struct
    type t = t_bun_file_write
    external high_water_mark : t -> float option = "highWaterMark" [@@mel.get]
    external make : ?high_water_mark:(float [@mel.as "highWaterMark"]) -> unit -> t = "" [@@mel.obj]
  end

  (** A `fs.Stats` object provides information about a file.
      
      Objects returned from \{\@link stat\}, \{\@link lstat\}, \{\@link fstat\}, and
      their synchronous counterparts are of this type.
      If `bigint` in the `options` passed to those methods is true, the numeric values
      will be `bigint` instead of `number`, and the object will contain additional
      nanosecond-precision properties suffixed with `Ns`. `Stat` objects are not to be created directly using the `new` keyword.
      
      ```console
      Stats \{
        dev: 2114,
        ino: 48064969,
        mode: 33188,
        nlink: 1,
        uid: 85,
        gid: 100,
        rdev: 0,
        size: 527,
        blksize: 4096,
        blocks: 8,
        atimeMs: 1318289051000.1,
        mtimeMs: 1318289051000.1,
        ctimeMs: 1318289051000.1,
        birthtimeMs: 1318289051000.1,
        atime: Mon, 10 Oct 2011 23:24:11 GMT,
        mtime: Mon, 10 Oct 2011 23:24:11 GMT,
        ctime: Mon, 10 Oct 2011 23:24:11 GMT,
        birthtime: Mon, 10 Oct 2011 23:24:11 GMT \}
      ```
      
      `bigint` version:
      
      ```console
      BigIntStats \{
        dev: 2114n,
        ino: 48064969n,
        mode: 33188n,
        nlink: 1n,
        uid: 85n,
        gid: 100n,
        rdev: 0n,
        size: 527n,
        blksize: 4096n,
        blocks: 8n,
        atimeMs: 1318289051000n,
        mtimeMs: 1318289051000n,
        ctimeMs: 1318289051000n,
        birthtimeMs: 1318289051000n,
        atimeNs: 1318289051000000000n,
        mtimeNs: 1318289051000000000n,
        ctimeNs: 1318289051000000000n,
        birthtimeNs: 1318289051000000000n,
        atime: Mon, 10 Oct 2011 23:24:11 GMT,
        mtime: Mon, 10 Oct 2011 23:24:11 GMT,
        ctime: Mon, 10 Oct 2011 23:24:11 GMT,
        birthtime: Mon, 10 Oct 2011 23:24:11 GMT \}
      ``` *)
  module Stats = struct
    type t = t_stats
    external is_file : t -> unit -> bool = "isFile" [@@mel.send]
    external is_directory : t -> unit -> bool = "isDirectory" [@@mel.send]
    external is_block_device : t -> unit -> bool = "isBlockDevice" [@@mel.send]
    external is_character_device : t -> unit -> bool = "isCharacterDevice" [@@mel.send]
    external is_symbolic_link : t -> unit -> bool = "isSymbolicLink" [@@mel.send]
    external is_fifo : t -> unit -> bool = "isFIFO" [@@mel.send]
    external is_socket : t -> unit -> bool = "isSocket" [@@mel.send]
    external dev : t -> float = "dev" [@@mel.get]
    external ino : t -> float = "ino" [@@mel.get]
    external mode : t -> float = "mode" [@@mel.get]
    external nlink : t -> float = "nlink" [@@mel.get]
    external uid : t -> float = "uid" [@@mel.get]
    external gid : t -> float = "gid" [@@mel.get]
    external rdev : t -> float = "rdev" [@@mel.get]
    external size : t -> float = "size" [@@mel.get]
    external blksize : t -> float = "blksize" [@@mel.get]
    external blocks : t -> float = "blocks" [@@mel.get]
    external atime_ms : t -> float = "atimeMs" [@@mel.get]
    external mtime_ms : t -> float = "mtimeMs" [@@mel.get]
    external ctime_ms : t -> float = "ctimeMs" [@@mel.get]
    external birthtime_ms : t -> float = "birthtimeMs" [@@mel.get]
    external atime : t -> Js.Date.t = "atime" [@@mel.get]
    external mtime : t -> Js.Date.t = "mtime" [@@mel.get]
    external ctime : t -> Js.Date.t = "ctime" [@@mel.get]
    external birthtime : t -> Js.Date.t = "birthtime" [@@mel.get]
    external make : unit -> t = "Stats" [@@mel.new] [@@mel.module "@types/node"]
  end

  (** Configuration options for S3 operations *)
  module S3Options = struct
    type t = t_s3_options
    (** The Access Control List (ACL) policy for the file.
        Controls who can access the file and what permissions they have. *)
    external acl : t -> string option = "acl" [@@mel.get]
    (** The S3 bucket name. Defaults to `S3_BUCKET` or `AWS_BUCKET` environment variables. *)
    external bucket : t -> string option = "bucket" [@@mel.get]
    (** The AWS region. Defaults to `S3_REGION` or `AWS_REGION` environment variables. *)
    external region : t -> string option = "region" [@@mel.get]
    (** The access key ID for authentication.
        Defaults to `S3_ACCESS_KEY_ID` or `AWS_ACCESS_KEY_ID` environment variables. *)
    external access_key_id : t -> string option = "accessKeyId" [@@mel.get]
    (** The secret access key for authentication.
        Defaults to `S3_SECRET_ACCESS_KEY` or `AWS_SECRET_ACCESS_KEY` environment variables. *)
    external secret_access_key : t -> string option = "secretAccessKey" [@@mel.get]
    (** Optional session token for temporary credentials.
        Defaults to `S3_SESSION_TOKEN` or `AWS_SESSION_TOKEN` environment variables. *)
    external session_token : t -> string option = "sessionToken" [@@mel.get]
    (** The S3-compatible service endpoint URL.
        Defaults to `S3_ENDPOINT` or `AWS_ENDPOINT` environment variables. *)
    external endpoint : t -> string option = "endpoint" [@@mel.get]
    (** Use a virtual hosted-style endpoint, where the bucket name is part of the
        hostname. Defaults to `false`. When `true`, if `endpoint` is provided, the
        `bucket` option is ignored. *)
    external virtual_hosted_style : t -> bool option = "virtualHostedStyle" [@@mel.get]
    (** The size of each part in multipart uploads (in bytes).
        - Minimum: 5 MiB
        - Maximum: 5120 MiB
        - Default: 5 MiB *)
    external part_size : t -> float option = "partSize" [@@mel.get]
    (** Number of parts to upload in parallel for multipart uploads.
        - Default: 5
        - Maximum: 255
        
        Increasing this value can improve upload speeds for large files
        but uses more memory. *)
    external queue_size : t -> float option = "queueSize" [@@mel.get]
    (** Number of retry attempts for failed uploads.
        - Default: 3
        - Maximum: 255 *)
    external retry : t -> float option = "retry" [@@mel.get]
    (** The Content-Type of the file.
        Automatically set based on file extension when possible. *)
    external type_ : t -> string option = "type" [@@mel.get]
    (** The Content-Disposition header value.
        Controls how the file is presented when downloaded. *)
    external content_disposition : t -> string option = "contentDisposition" [@@mel.get]
    (** The Content-Encoding header value.
        Specifies what content encodings have been applied to the object,
        for example to indicate that it has been compressed. *)
    external content_encoding : t -> string option = "contentEncoding" [@@mel.get]
    (** The storage class for the object. By default, Amazon S3 stores newly
        created objects in the `STANDARD` storage class. *)
    external storage_class : t -> [ `STANDARD | `DEEP_ARCHIVE | `EXPRESS_ONEZONE | `GLACIER | `GLACIER_IR | `INTELLIGENT_TIERING | `ONEZONE_IA | `OUTPOSTS | `REDUCED_REDUNDANCY | `SNOW | `STANDARD_IA ] option = "storageClass" [@@mel.get]
    (** When set to `true`, confirms that the requester knows they will be charged
        for the request and data transfer costs. Required for accessing objects
        in Requester Pays buckets. *)
    external request_payer : t -> bool option = "requestPayer" [@@mel.get]
    external high_water_mark : t -> float option = "highWaterMark" [@@mel.get]
    external endings : t -> [ `native | `transparent ] option = "endings" [@@mel.get]
    external make : ?acl:(string [@mel.as "acl"]) -> ?bucket:(string [@mel.as "bucket"]) -> ?region:(string [@mel.as "region"]) -> ?access_key_id:(string [@mel.as "accessKeyId"]) -> ?secret_access_key:(string [@mel.as "secretAccessKey"]) -> ?session_token:(string [@mel.as "sessionToken"]) -> ?endpoint:(string [@mel.as "endpoint"]) -> ?virtual_hosted_style:(bool [@mel.as "virtualHostedStyle"]) -> ?part_size:(float [@mel.as "partSize"]) -> ?queue_size:(float [@mel.as "queueSize"]) -> ?retry:(float [@mel.as "retry"]) -> ?type_:(string [@mel.as "type"]) -> ?content_disposition:(string [@mel.as "contentDisposition"]) -> ?content_encoding:(string [@mel.as "contentEncoding"]) -> ?storage_class:([ `STANDARD | `DEEP_ARCHIVE | `EXPRESS_ONEZONE | `GLACIER | `GLACIER_IR | `INTELLIGENT_TIERING | `ONEZONE_IA | `OUTPOSTS | `REDUCED_REDUNDANCY | `SNOW | `STANDARD_IA ] [@mel.as "storageClass"]) -> ?request_payer:(bool [@mel.as "requestPayer"]) -> ?high_water_mark:(float [@mel.as "highWaterMark"]) -> ?endings:([ `native | `transparent ] [@mel.as "endings"]) -> unit -> t = "" [@@mel.obj]
  end

  module NetworkSink = struct
    type t = t_network_sink
    external flush : t -> unit -> (float, float Js.Promise.t) either = "flush" [@@mel.send]
    external end_ : t -> t_error option -> (float, float Js.Promise.t) either = "end" [@@mel.send]
    external stat : t -> unit -> t_stats Js.Promise.t = "stat" [@@mel.send]
    external start : t -> t_file_sink_start option -> unit = "start" [@@mel.send]
    external ref : t -> unit -> unit = "ref" [@@mel.send]
    external unref : t -> unit -> unit = "unref" [@@mel.send]
  end

  (** Create and extract tar archives, with optional gzip compression.
      
      `Bun.Archive` builds an archive from in-memory data, or wraps an existing
      archive so you can extract it to disk or memory. *)
  module Archive = struct
    type t = t_archive
    external extract : t -> string -> t_archive_extract_options option -> float Js.Promise.t = "extract" [@@mel.send]
    external blob : t -> unit -> t_blob Js.Promise.t = "blob" [@@mel.send]
    external bytes : t -> unit -> t_uint8_array Js.Promise.t = "bytes" [@@mel.send]
    external files : t -> (string, string array) either option -> (string, t_file) Js.Map.t Js.Promise.t = "files" [@@mel.send]
  end

  (** Options for generating presigned URLs *)
  module S3FilePresignOptions = struct
    type t = t_s3_file_presign_options
    (** Number of seconds until the presigned URL expires.
        - Default: 86400 (1 day) *)
    external expires_in : t -> float option = "expiresIn" [@@mel.get]
    (** The HTTP method allowed for the presigned URL. *)
    external method_ : t -> [ `GET | `POST | `PUT | `DELETE | `HEAD ] option = "method" [@@mel.get]
    (** The Access Control List (ACL) policy for the file.
        Controls who can access the file and what permissions they have. *)
    external acl : t -> string option = "acl" [@@mel.get]
    (** The S3 bucket name. Defaults to `S3_BUCKET` or `AWS_BUCKET` environment variables. *)
    external bucket : t -> string option = "bucket" [@@mel.get]
    (** The AWS region. Defaults to `S3_REGION` or `AWS_REGION` environment variables. *)
    external region : t -> string option = "region" [@@mel.get]
    (** The access key ID for authentication.
        Defaults to `S3_ACCESS_KEY_ID` or `AWS_ACCESS_KEY_ID` environment variables. *)
    external access_key_id : t -> string option = "accessKeyId" [@@mel.get]
    (** The secret access key for authentication.
        Defaults to `S3_SECRET_ACCESS_KEY` or `AWS_SECRET_ACCESS_KEY` environment variables. *)
    external secret_access_key : t -> string option = "secretAccessKey" [@@mel.get]
    (** Optional session token for temporary credentials.
        Defaults to `S3_SESSION_TOKEN` or `AWS_SESSION_TOKEN` environment variables. *)
    external session_token : t -> string option = "sessionToken" [@@mel.get]
    (** The S3-compatible service endpoint URL.
        Defaults to `S3_ENDPOINT` or `AWS_ENDPOINT` environment variables. *)
    external endpoint : t -> string option = "endpoint" [@@mel.get]
    (** Use a virtual hosted-style endpoint, where the bucket name is part of the
        hostname. Defaults to `false`. When `true`, if `endpoint` is provided, the
        `bucket` option is ignored. *)
    external virtual_hosted_style : t -> bool option = "virtualHostedStyle" [@@mel.get]
    (** The size of each part in multipart uploads (in bytes).
        - Minimum: 5 MiB
        - Maximum: 5120 MiB
        - Default: 5 MiB *)
    external part_size : t -> float option = "partSize" [@@mel.get]
    (** Number of parts to upload in parallel for multipart uploads.
        - Default: 5
        - Maximum: 255
        
        Increasing this value can improve upload speeds for large files
        but uses more memory. *)
    external queue_size : t -> float option = "queueSize" [@@mel.get]
    (** Number of retry attempts for failed uploads.
        - Default: 3
        - Maximum: 255 *)
    external retry : t -> float option = "retry" [@@mel.get]
    (** The Content-Type of the file.
        Automatically set based on file extension when possible. *)
    external type_ : t -> string option = "type" [@@mel.get]
    (** The Content-Disposition header value.
        Controls how the file is presented when downloaded. *)
    external content_disposition : t -> string option = "contentDisposition" [@@mel.get]
    (** The Content-Encoding header value.
        Specifies what content encodings have been applied to the object,
        for example to indicate that it has been compressed. *)
    external content_encoding : t -> string option = "contentEncoding" [@@mel.get]
    (** The storage class for the object. By default, Amazon S3 stores newly
        created objects in the `STANDARD` storage class. *)
    external storage_class : t -> [ `STANDARD | `DEEP_ARCHIVE | `EXPRESS_ONEZONE | `GLACIER | `GLACIER_IR | `INTELLIGENT_TIERING | `ONEZONE_IA | `OUTPOSTS | `REDUCED_REDUNDANCY | `SNOW | `STANDARD_IA ] option = "storageClass" [@@mel.get]
    (** When set to `true`, confirms that the requester knows they will be charged
        for the request and data transfer costs. Required for accessing objects
        in Requester Pays buckets. *)
    external request_payer : t -> bool option = "requestPayer" [@@mel.get]
    external high_water_mark : t -> float option = "highWaterMark" [@@mel.get]
    external endings : t -> [ `native | `transparent ] option = "endings" [@@mel.get]
    external make : ?expires_in:(float [@mel.as "expiresIn"]) -> ?method_:([ `GET | `POST | `PUT | `DELETE | `HEAD ] [@mel.as "method"]) -> ?acl:(string [@mel.as "acl"]) -> ?bucket:(string [@mel.as "bucket"]) -> ?region:(string [@mel.as "region"]) -> ?access_key_id:(string [@mel.as "accessKeyId"]) -> ?secret_access_key:(string [@mel.as "secretAccessKey"]) -> ?session_token:(string [@mel.as "sessionToken"]) -> ?endpoint:(string [@mel.as "endpoint"]) -> ?virtual_hosted_style:(bool [@mel.as "virtualHostedStyle"]) -> ?part_size:(float [@mel.as "partSize"]) -> ?queue_size:(float [@mel.as "queueSize"]) -> ?retry:(float [@mel.as "retry"]) -> ?type_:(string [@mel.as "type"]) -> ?content_disposition:(string [@mel.as "contentDisposition"]) -> ?content_encoding:(string [@mel.as "contentEncoding"]) -> ?storage_class:([ `STANDARD | `DEEP_ARCHIVE | `EXPRESS_ONEZONE | `GLACIER | `GLACIER_IR | `INTELLIGENT_TIERING | `ONEZONE_IA | `OUTPOSTS | `REDUCED_REDUNDANCY | `SNOW | `STANDARD_IA ] [@mel.as "storageClass"]) -> ?request_payer:(bool [@mel.as "requestPayer"]) -> ?high_water_mark:(float [@mel.as "highWaterMark"]) -> ?endings:([ `native | `transparent ] [@mel.as "endings"]) -> unit -> t = "" [@@mel.obj]
  end

  module S3Stats = struct
    type t = t_s3_stats
    external size : t -> float = "size" [@@mel.get]
    external last_modified : t -> Js.Date.t = "lastModified" [@@mel.get]
    external etag : t -> string = "etag" [@@mel.get]
    external type_ : t -> string = "type" [@@mel.get]
    external make : size:(float [@mel.as "size"]) -> last_modified:(Js.Date.t [@mel.as "lastModified"]) -> etag:(string [@mel.as "etag"]) -> type_:(string [@mel.as "type"]) -> unit -> t = "" [@@mel.obj]
  end

  module FileSink_Start = struct
    type t = t_file_sink_start
    (** Preallocate an internal buffer of this size.
        This can significantly improve performance when the chunk size is small. *)
    external high_water_mark : t -> float option = "highWaterMark" [@@mel.get]
    external make : ?high_water_mark:(float [@mel.as "highWaterMark"]) -> unit -> t = "" [@@mel.obj]
  end

  (** Options for extracting archive contents. *)
  module ArchiveExtractOptions = struct
    type t = t_archive_extract_options
    (** Glob pattern(s) to filter which entries are extracted.
        Uses the same syntax as \{\@link Bun.Glob\}, including support for wildcards (`*`, `**`),
        character classes (`\[abc\]`), alternation (`\{a,b\}`), and negation (`!pattern`).
        
        Patterns are matched against archive entry paths normalized to use forward slashes (`/`),
        regardless of the host operating system. Always write patterns using `/` as the separator.
        
        - Positive patterns: Only entries matching at least one pattern are extracted.
        - Negative patterns (prefixed with `!`): Entries matching these patterns are excluded.
          Negative patterns are applied after positive patterns.
        
        If not specified, all entries are extracted. *)
    external glob : t -> (string, string array) either option = "glob" [@@mel.get]
    external make : ?glob:((string, string array) either [@mel.as "glob"]) -> unit -> t = "" [@@mel.obj]
  end

  (** Options for creating an Archive instance.
      
      By default, archives are not compressed. Use `\{ compress: "gzip" \}` to enable compression. *)
  module ArchiveOptions = struct
    type t = t_archive_options
    (** Compression algorithm to use.
        Only `"gzip"` is supported.
        If not specified, no compression is applied. *)
    external compress : t -> [ `gzip ] option = "compress" [@@mel.get]
    (** Compression level (1-12). Only applies when `compress` is set.
        - 1: Fastest compression, lowest ratio
        - 6: Default balance of speed and ratio
        - 12: Best compression ratio, slowest *)
    external level : t -> float option = "level" [@@mel.get]
    external make : ?compress:([ `gzip ] [@mel.as "compress"]) -> ?level:(float [@mel.as "level"]) -> unit -> t = "" [@@mel.obj]
  end
end

module Accordion = struct
  (** Contains the content to be rendered when the `Accordion.Item` is expanded. *)
  module Content = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Content"
    [@@mel.module "@kobalte/core/accordion"]
  end

  (** Wraps an `Accordion.Trigger`.
      Use the `as` prop to update it to the appropriate heading level for your page. *)
  module Header = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.H3.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Header"
    [@@mel.module "@kobalte/core/accordion"]
  end

  (** An item of the accordion, contains all the parts of a collapsible section. *)
  module Item = struct
    module Props = struct
      external check :
        value:string Check.value ->
        ?disabled:bool Check.value ->
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Item"
    [@@mel.module "@kobalte/core/accordion"]
  end

  (** A vertically stacked set of interactive headings that each reveal an associated section of content. *)
  module Root = struct
    module Props = struct
      external check :
        ?value:string array Check.value ->
        ?defaultValue:string array Check.value ->
        ?onChange:(string array -> unit) ->
        ?multiple:bool Check.value ->
        ?collapsible:bool Check.value ->
        ?shouldFocusWrap:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/accordion"]
  end

  (** Toggles the collapsed state of its associated item. It should be nested inside an `Accordion.Header`. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/accordion"]
  end

  external use_accordion_context : unit -> Types.AccordionContextValue.t = "useAccordionContext"
  [@@mel.module "@kobalte/core/accordion"]
end

module Alert = struct
  (** Alert displays a brief, important message
      in a way that attracts the user's attention without interrupting the user's task. *)
  module Root = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/alert"]
  end
end

module AlertDialog = struct
  (** The button that closes the dialog. *)
  module CloseButton = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "CloseButton"
    [@@mel.module "@kobalte/core/alert-dialog"]
  end

  (** Overrides the regular `Dialog.Content` with role="alertdialog" to interrupt the user. *)
  module Content = struct
    module Props = struct
      external check :
        ?onOpenAutoFocus:(Dom.event -> unit) ->
        ?onCloseAutoFocus:(Dom.event -> unit) ->
        ?onEscapeKeyDown:(Dom.keyboardEvent -> unit) ->
        ?onPointerDownOutside:(Dom.customEvent -> unit) ->
        ?onFocusOutside:(Dom.customEvent -> unit) ->
        ?onInteractOutside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Content"
    [@@mel.module "@kobalte/core/alert-dialog"]
  end

  (** An optional accessible description to be announced when the dialog is open. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.P.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Description"
    [@@mel.module "@kobalte/core/alert-dialog"]
  end

  (** A layer that covers the inert portion of the view when the dialog is open. *)
  module Overlay = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Overlay"
    [@@mel.module "@kobalte/core/alert-dialog"]
  end

  (** Portals its children into the `body` when the dialog is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Check.value ->
        ?useShadow:bool Check.value ->
        ?isSVG:bool Check.value ->
        children:('f, [ `nodes ]) Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/alert-dialog"]
  end

  (** A dialog is a window overlaid on either the primary window or another dialog window. *)
  module Root = struct
    module Props = struct
      external check :
        ?translations:Types.AlertDialog_Root_Translations.t Check.value ->
        ?open_:bool Check.value ->
        ?defaultOpen:bool Check.value ->
        ?onOpenChange:(bool -> unit) ->
        ?id:string Check.value ->
        ?modal:bool Check.value ->
        ?preventScroll:bool Check.value ->
        ?forceMount:bool Check.value ->
        ?children:('f, [ `nodes ]) Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/alert-dialog"]
  end

  (** An accessible title to be announced when the dialog is open. *)
  module Title = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.H2.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Title"
    [@@mel.module "@kobalte/core/alert-dialog"]
  end

  (** The button that opens the dialog. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/alert-dialog"]
  end
end

module Badge = struct
  module Root = struct
    module Props = struct
      external check :
        ?textValue:string Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/badge"]
  end
end

module Breadcrumbs = struct
  (** The breadcrumbs link. *)
  module Link = struct
    module Props = struct
      external check :
        ?current:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.A.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Link"
    [@@mel.module "@kobalte/core/breadcrumbs"]
  end

  (** Breadcrumbs show hierarchy and navigational context for a user’s location within an application. *)
  module Root = struct
    module Props = struct
      external check :
        ?separator:Jsx.element Check.value ->
        ?translations:Types.Breadcrumbs_Root_Translations.t Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Nav.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/breadcrumbs"]
  end

  (** The visual separator between each breadcrumb items.
      It will not be visible by screen readers. *)
  module Separator = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Separator"
    [@@mel.module "@kobalte/core/breadcrumbs"]
  end

  external use_breadcrumbs_context : unit -> Types.BreadcrumbsContextValue.t = "useBreadcrumbsContext"
  [@@mel.module "@kobalte/core/breadcrumbs"]
end

module Button = struct
  (** Button enables users to trigger an action or event, such as submitting a form,
      opening a dialog, canceling an action, or performing a delete operation.
      This component is based on the \[WAI-ARIA Button Pattern\](https://www.w3.org/WAI/ARIA/apg/patterns/button/) *)
  module Root = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/button"]
  end
end

module Checkbox = struct
  (** The element that visually represents a checkbox. *)
  module Control = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Control"
    [@@mel.module "@kobalte/core/checkbox"]
  end

  (** The description that gives the user more information on the checkbox. *)
  module Description = struct
    module Props = struct
      external check :
        ?id:string Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Description"
    [@@mel.module "@kobalte/core/checkbox"]
  end

  (** The error message that gives the user information about how to fix a validation error on the checkbox. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?forceMount:bool Check.value ->
        ?id:string Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/checkbox"]
  end

  (** The visual indicator rendered when the checkbox is in a checked or indeterminate state.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module Indicator = struct
    module Props = struct
      external check :
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Indicator"
    [@@mel.module "@kobalte/core/checkbox"]
  end

  (** The native html input that is visually hidden in the checkbox. *)
  module Input = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Input"
    [@@mel.module "@kobalte/core/checkbox"]
  end

  (** The label that gives the user information on the checkbox. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Label"
    [@@mel.module "@kobalte/core/checkbox"]
  end

  (** A control that allows the user to toggle between checked and not checked. *)
  module Root = struct
    module Props = struct
      external check :
        ?checked:bool Check.value ->
        ?defaultChecked:bool Check.value ->
        ?onChange:(bool -> unit) ->
        ?indeterminate:bool Check.value ->
        ?value:string Check.value ->
        ?name:string Check.value ->
        ?validationState:[ `valid | `invalid ] Check.value ->
        ?required:bool Check.value ->
        ?disabled:bool Check.value ->
        ?readOnly:bool Check.value ->
        (?children:(Types.CheckboxRootState.t -> Jsx.element, [ `nodes | `render ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/checkbox"]
  end

  external use_checkbox_context : unit -> Types.CheckboxContextValue.t = "useCheckboxContext"
  [@@mel.module "@kobalte/core/checkbox"]
end

module Collapsible = struct
  (** Contains the content to be rendered when the collapsible is expanded. *)
  module Content = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Content"
    [@@mel.module "@kobalte/core/collapsible"]
  end

  (** An interactive component which expands/collapses a content. *)
  module Root = struct
    module Props = struct
      external check :
        ?open_:bool Check.value ->
        ?defaultOpen:bool Check.value ->
        ?onOpenChange:(bool -> unit) ->
        ?disabled:bool Check.value ->
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/collapsible"]
  end

  (** The button that expands/collapses the collapsible content. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/collapsible"]
  end

  external use_collapsible_context : unit -> Types.CollapsibleContextValue.t = "useCollapsibleContext"
  [@@mel.module "@kobalte/core/collapsible"]
end

module ColorArea = struct
  module Background = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Background"
    [@@mel.module "@kobalte/core/color-area"]
  end

  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Description"
    [@@mel.module "@kobalte/core/color-area"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/color-area"]
  end

  module HiddenInputX = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "HiddenInputX"
    [@@mel.module "@kobalte/core/color-area"]
  end

  module HiddenInputY = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "HiddenInputY"
    [@@mel.module "@kobalte/core/color-area"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Label"
    [@@mel.module "@kobalte/core/color-area"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?translations:Types.ColorArea_Root_Translations.t Check.value ->
        ?value:Types.Color.t Check.value ->
        ?defaultValue:Types.Color.t Check.value ->
        ?onChange:(Types.Color.t -> unit) ->
        ?onChangeEnd:(Types.Color.t -> unit) ->
        ?xChannel:[ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] Check.value ->
        ?yChannel:[ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] Check.value ->
        ?colorSpace:[ `rgb | `hsl | `hsb ] Check.value ->
        ?id:string Check.value ->
        ?name:string Check.value ->
        ?xName:string Check.value ->
        ?yName:string Check.value ->
        ?validationState:[ `valid | `invalid ] Check.value ->
        ?required:bool Check.value ->
        ?disabled:bool Check.value ->
        ?readOnly:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/color-area"]
  end

  module Thumb = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Thumb"
    [@@mel.module "@kobalte/core/color-area"]
  end

  external use_color_area_context : unit -> Types.ColorAreaContextValue.t = "useColorAreaContext"
  [@@mel.module "@kobalte/core/color-area"]
end

module ColorChannelField = struct
  module DecrementTrigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "DecrementTrigger"
    [@@mel.module "@kobalte/core/color-channel-field"]
  end

  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Description"
    [@@mel.module "@kobalte/core/color-channel-field"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/color-channel-field"]
  end

  module HiddenInput = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "HiddenInput"
    [@@mel.module "@kobalte/core/color-channel-field"]
  end

  module IncrementTrigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "IncrementTrigger"
    [@@mel.module "@kobalte/core/color-channel-field"]
  end

  module Input = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Input"
    [@@mel.module "@kobalte/core/color-channel-field"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Label"
    [@@mel.module "@kobalte/core/color-channel-field"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:Types.Color.t Check.value ->
        ?defaultValue:Types.Color.t Check.value ->
        ?onChange:(Types.Color.t -> unit) ->
        channel:[ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] Check.value ->
        ?colorSpace:[ `rgb | `hsl | `hsb ] Check.value ->
        ?id:string Check.value ->
        ?disabled:bool Check.value ->
        ?textValue:string Check.value ->
        ?translations:Types.ColorChannelField_Root_Translations.t Check.value ->
        ?minValue:float Check.value ->
        ?maxValue:float Check.value ->
        ?step:float Check.value ->
        ?largeStep:float Check.value ->
        ?changeOnWheel:bool Check.value ->
        ?format:bool Check.value ->
        ?name:string Check.value ->
        ?validationState:[ `valid | `invalid ] Check.value ->
        ?required:bool Check.value ->
        ?readOnly:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/color-channel-field"]
  end
end

module ColorField = struct
  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Description"
    [@@mel.module "@kobalte/core/color-field"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/color-field"]
  end

  module Input = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Input"
    [@@mel.module "@kobalte/core/color-field"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Label"
    [@@mel.module "@kobalte/core/color-field"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:string Check.value ->
        ?defaultValue:string Check.value ->
        ?onChange:(string -> unit) ->
        ?id:string Check.value ->
        ?name:string Check.value ->
        ?validationState:[ `valid | `invalid ] Check.value ->
        ?required:bool Check.value ->
        ?disabled:bool Check.value ->
        ?readOnly:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/color-field"]
  end

  external use_color_field_context : unit -> Types.ColorFieldContextValue.t = "useColorFieldContext"
  [@@mel.module "@kobalte/core/color-field"]
end

module ColorMode = struct
  external color_mode_storage_key : string = "COLOR_MODE_STORAGE_KEY"
  [@@mel.module "@kobalte/core/color-mode"]

  external color_mode_context : Types.ColorModeContextType.t option Types.Context.t = "ColorModeContext"
  [@@mel.module "@kobalte/core/color-mode"]

  (** Provides context for the color mode based on config in `theme`
      Returns the color mode and function to toggle the color mode *)
  module ColorModeProvider = struct
    module Props = struct
      external check :
        ?initialColorMode:[ `light | `dark | `system ] Check.value ->
        ?disableTransitionOnChange:bool Check.value ->
        ?storageManager:Types.ColorModeStorageManager.t Check.value ->
        ?children:('f, [ `nodes ]) Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ColorModeProvider"
    [@@mel.module "@kobalte/core/color-mode"]
  end

  module ColorModeScript = struct
    module Props = struct
      external check :
        ?initialColorMode:[ `light | `dark | `system ] Check.value ->
        ?storageType:[ `localStorage | `cookie ] Check.value ->
        ?storageKey:string Check.value ->
        ?nonce:string Check.value ->
        ?children:('f, [ `nodes ]) Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ColorModeScript"
    [@@mel.module "@kobalte/core/color-mode"]
  end

  external cookie_storage_manager : Types.ColorModeStorageManager.t = "cookieStorageManager"
  [@@mel.module "@kobalte/core/color-mode"]

  external cookie_storage_manager_ssr : string -> Types.ColorModeStorageManager.t = "cookieStorageManagerSSR"
  [@@mel.module "@kobalte/core/color-mode"]

  external create_cookie_storage_manager : string -> string option -> Types.ColorModeStorageManager.t = "createCookieStorageManager"
  [@@mel.module "@kobalte/core/color-mode"]

  external create_local_storage_manager : string -> Types.ColorModeStorageManager.t = "createLocalStorageManager"
  [@@mel.module "@kobalte/core/color-mode"]

  external local_storage_manager : Types.ColorModeStorageManager.t = "localStorageManager"
  [@@mel.module "@kobalte/core/color-mode"]

  (** Primitive that reads from `ColorModeProvider` context,
      Returns the color mode and function to toggle it. *)
  external use_color_mode : unit -> Types.ColorModeContextType.t = "useColorMode"
  [@@mel.module "@kobalte/core/color-mode"]

  (** Change value based on color mode. *)
  external use_color_mode_value : 't_light -> 't_dark -> ('t_light, 't_dark) Types.Either.t Solid.accessor = "useColorModeValue"
  [@@mel.module "@kobalte/core/color-mode"]
end

module ColorSlider = struct
  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Description"
    [@@mel.module "@kobalte/core/color-slider"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/color-slider"]
  end

  (** The native html input that is visually hidden in the slider thumb. *)
  module Input = struct
    module Props = struct
      external check :
        ?style:string Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Input"
    [@@mel.module "@kobalte/core/color-slider"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Label"
    [@@mel.module "@kobalte/core/color-slider"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:Types.Color.t Check.value ->
        ?defaultValue:Types.Color.t Check.value ->
        ?onChange:(Types.Color.t -> unit) ->
        ?onChangeEnd:(Types.Color.t -> unit) ->
        channel:[ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] Check.value ->
        ?colorSpace:[ `rgb | `hsl | `hsb ] Check.value ->
        ?orientation:[ `horizontal | `vertical ] Check.value ->
        ?getValueLabel:(Types.Color.t -> string) ->
        ?id:string Check.value ->
        ?name:string Check.value ->
        ?validationState:[ `valid | `invalid ] Check.value ->
        ?required:bool Check.value ->
        ?disabled:bool Check.value ->
        ?readOnly:bool Check.value ->
        ?translations:Types.ColorSlider_Root_Translations.t Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/color-slider"]
  end

  module Thumb = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Thumb"
    [@@mel.module "@kobalte/core/color-slider"]
  end

  module Track = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Track"
    [@@mel.module "@kobalte/core/color-slider"]
  end

  (** The accessible label text representing the current value in a human-readable format. *)
  module ValueLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ValueLabel"
    [@@mel.module "@kobalte/core/color-slider"]
  end

  external use_color_slider_context : unit -> Types.ColorSliderContextValue.t = "useColorSliderContext"
  [@@mel.module "@kobalte/core/color-slider"]
end

module ColorSwatch = struct
  module Root = struct
    module Props = struct
      external check :
        value:Types.Color.t Check.value ->
        ?colorName:string Check.value ->
        ?translations:Types.ColorSwatch_Root_Translations.t Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/color-swatch"]
  end
end

module ColorWheel = struct
  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Description"
    [@@mel.module "@kobalte/core/color-wheel"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/color-wheel"]
  end

  module Input = struct
    module Props = struct
      external check :
        ?style:string Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Input"
    [@@mel.module "@kobalte/core/color-wheel"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Label"
    [@@mel.module "@kobalte/core/color-wheel"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?translations:Types.ColorSlider_Root_Translations.t Check.value ->
        ?value:Types.Color.t Check.value ->
        ?defaultValue:Types.Color.t Check.value ->
        ?thickness:float Check.value ->
        ?onChange:(Types.Color.t -> unit) ->
        ?onChangeEnd:(Types.Color.t -> unit) ->
        ?getValueLabel:(Types.Color.t -> string) ->
        ?id:string Check.value ->
        ?name:string Check.value ->
        ?validationState:[ `valid | `invalid ] Check.value ->
        ?required:bool Check.value ->
        ?disabled:bool Check.value ->
        ?readOnly:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/color-wheel"]
  end

  module Thumb = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Thumb"
    [@@mel.module "@kobalte/core/color-wheel"]
  end

  module Track = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Track"
    [@@mel.module "@kobalte/core/color-wheel"]
  end

  module ValueLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ValueLabel"
    [@@mel.module "@kobalte/core/color-wheel"]
  end

  external use_color_wheel_context : unit -> Types.ColorWheelContextValue.t = "useColorWheelContext"
  [@@mel.module "@kobalte/core/color-wheel"]
end

module Colors = struct
  external color_intl_translations : Types.ColorSlider_Root_Translations.t = "COLOR_INTL_TRANSLATIONS"
  [@@mel.module "@kobalte/core/colors"]

  (** Returns a list of color channels for a given color space. *)
  external get_color_channels : [ `rgb | `hsl | `hsb ] -> ([ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] * [ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] * [ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ]) = "getColorChannels"
  [@@mel.module "@kobalte/core/colors"]

  external normalize_color : (string, Types.Color.t) Types.Either.t -> Types.Color.t = "normalizeColor"
  [@@mel.module "@kobalte/core/colors"]

  (** Returns the hue value normalized to the range of 0 to 360. *)
  external normalize_hue : float -> float = "normalizeHue"
  [@@mel.module "@kobalte/core/colors"]

  (** Parses a color from a string value. Throws an error if the string could not be parsed. *)
  external parse_color : string -> Types.Color.t = "parseColor"
  [@@mel.module "@kobalte/core/colors"]
end

module Combobox = struct
  (** An optional arrow element to render alongside the popper content.
      Must be rendered in the popper content. *)
  module Arrow = struct
    module Props = struct
      external check :
        ?size:float Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** The component that pops out when the combobox is open. *)
  module Content = struct
    module Props = struct
      external check :
        ?onCloseAutoFocus:(Dom.event -> unit) ->
        ?onPointerDownOutside:(Dom.customEvent -> unit) ->
        ?onFocusOutside:(Dom.customEvent -> unit) ->
        ?onInteractOutside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Content"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** Contains the combobox input and trigger. *)
  module Control = struct
    module Props = struct
      external check :
        (?children:('option Types.ComboboxControlState.t -> Jsx.element, [ `nodes | `render ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Control"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Description"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/combobox"]
  end

  module HiddenSelect = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Select.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "HiddenSelect"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** A small icon often displayed next to the value as a visual affordance for the fact it can be open.
      It renders a `▼` by default, but you can use your own icon `children`. *)
  module Icon = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Icon"
    [@@mel.module "@kobalte/core/combobox"]
  end

  module Input = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Input"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** An item of the listbox. *)
  module Item = struct
    module Props = struct
      external check :
        item:_ Types.CollectionNode.t Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Item"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** An optional accessible description to be announced for the item.
      Useful for items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** The visual indicator rendered when the item is selected.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module ItemIndicator = struct
    module Props = struct
      external check :
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemIndicator"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** An accessible label to be announced for the item.
      Useful for items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Label"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** Contains all the items of a `Combobox`. *)
  module Listbox = struct
    module Props = struct
      external check :
        ?scrollRef:Dom.htmlElement option Solid.accessor Check.value ->
        ?scrollToItem:(string -> unit) ->
        (?children:(('option, 'opt_group) Types.Either.t Types.CollectionNode.t Types.Collection.t Solid.accessor -> Jsx.element, [ `render ]) Check.children -> unit -> unit) Html.Ul.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Listbox"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** Portals its children into the `body` when the combobox is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Check.value ->
        ?useShadow:bool Check.value ->
        ?isSVG:bool Check.value ->
        children:('f, [ `nodes ]) Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/combobox"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:'option Js.Nullable.t Check.value ->
        ?defaultValue:'option Check.value ->
        ?onChange:('option Js.Nullable.t -> unit) ->
        ?id:string Check.value ->
        ?disabled:bool Check.value ->
        ?translations:Types.Combobox_Root_Translations.t Check.value ->
        ?name:string Check.value ->
        ?validationState:[ `valid | `invalid ] Check.value ->
        ?required:bool Check.value ->
        ?readOnly:bool Check.value ->
        ?getAnchorRect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Check.value ->
        ?gutter:float Check.value ->
        ?shift:float Check.value ->
        ?flip:(string, bool) Types.Either.t Check.value ->
        ?slide:bool Check.value ->
        ?overlap:bool Check.value ->
        ?sameWidth:bool Check.value ->
        ?fitViewport:bool Check.value ->
        ?hideWhenDetached:bool Check.value ->
        ?detachedPadding:float Check.value ->
        ?arrowPadding:float Check.value ->
        ?overflowPadding:float Check.value ->
        ?noResetInputOnBlur:bool Check.value ->
        ?open_:bool Check.value ->
        ?defaultOpen:bool Check.value ->
        ?onOpenChange:(bool -> [ `focus | `input | `manual ] option -> unit) ->
        ?onInputChange:(string -> unit) ->
        ?triggerMode:[ `focus | `input | `manual ] Check.value ->
        ?placeholder:Jsx.element Check.value ->
        options:('option, 'opt_group) Types.Either.t array Check.value ->
        ?optionValue:('option -> (string, float) Types.Either.t) ->
        ?optionTextValue:('option -> string) ->
        ?optionLabel:('option -> string) ->
        ?optionDisabled:('option -> bool) ->
        ?optionGroupChildren:string Check.value ->
        ?keyboardDelegate:Types.KeyboardDelegate.t Check.value ->
        ?defaultFilter:(([ `contains | `startsWith | `endsWith ], 'option -> string -> bool) Types.Either.t) Check.value ->
        ?shouldFocusWrap:bool Check.value ->
        ?allowsEmptyCollection:bool Check.value ->
        ?selectionBehavior:[ `toggle | `replace ] Check.value ->
        ?allowDuplicateSelectionEvents:bool Check.value ->
        ?disallowEmptySelection:bool Check.value ->
        ?closeOnSelection:bool Check.value ->
        ?removeOnBackspace:bool Check.value ->
        ?virtualized:bool Check.value ->
        ?itemComponent:('option Types.ComboboxBaseItemComponentProps.t -> Jsx.element) ->
        ?sectionComponent:('opt_group Types.ComboboxBaseSectionComponentProps.t -> Jsx.element) ->
        ?modal:bool Check.value ->
        ?preventScroll:bool Check.value ->
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/combobox"]
  end

  module Root_multiple = struct
    module Props = struct
      external check :
        ?value:'option array Check.value ->
        ?defaultValue:'option array Check.value ->
        ?onChange:('option array -> unit) ->
        multiple:bool Check.value ->
        ?id:string Check.value ->
        ?disabled:bool Check.value ->
        ?translations:Types.Combobox_Root_Translations.t Check.value ->
        ?name:string Check.value ->
        ?validationState:[ `valid | `invalid ] Check.value ->
        ?required:bool Check.value ->
        ?readOnly:bool Check.value ->
        ?getAnchorRect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Check.value ->
        ?gutter:float Check.value ->
        ?shift:float Check.value ->
        ?flip:(string, bool) Types.Either.t Check.value ->
        ?slide:bool Check.value ->
        ?overlap:bool Check.value ->
        ?sameWidth:bool Check.value ->
        ?fitViewport:bool Check.value ->
        ?hideWhenDetached:bool Check.value ->
        ?detachedPadding:float Check.value ->
        ?arrowPadding:float Check.value ->
        ?overflowPadding:float Check.value ->
        ?noResetInputOnBlur:bool Check.value ->
        ?open_:bool Check.value ->
        ?defaultOpen:bool Check.value ->
        ?onOpenChange:(bool -> [ `focus | `input | `manual ] option -> unit) ->
        ?onInputChange:(string -> unit) ->
        ?triggerMode:[ `focus | `input | `manual ] Check.value ->
        ?placeholder:Jsx.element Check.value ->
        options:('option, 'opt_group) Types.Either.t array Check.value ->
        ?optionValue:('option -> (string, float) Types.Either.t) ->
        ?optionTextValue:('option -> string) ->
        ?optionLabel:('option -> string) ->
        ?optionDisabled:('option -> bool) ->
        ?optionGroupChildren:string Check.value ->
        ?keyboardDelegate:Types.KeyboardDelegate.t Check.value ->
        ?defaultFilter:(([ `contains | `startsWith | `endsWith ], 'option -> string -> bool) Types.Either.t) Check.value ->
        ?shouldFocusWrap:bool Check.value ->
        ?allowsEmptyCollection:bool Check.value ->
        ?selectionBehavior:[ `toggle | `replace ] Check.value ->
        ?allowDuplicateSelectionEvents:bool Check.value ->
        ?disallowEmptySelection:bool Check.value ->
        ?closeOnSelection:bool Check.value ->
        ?removeOnBackspace:bool Check.value ->
        ?virtualized:bool Check.value ->
        ?itemComponent:('option Types.ComboboxBaseItemComponentProps.t -> Jsx.element) ->
        ?sectionComponent:('opt_group Types.ComboboxBaseSectionComponentProps.t -> Jsx.element) ->
        ?modal:bool Check.value ->
        ?preventScroll:bool Check.value ->
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** A component used to render the label of a listbox option group.
      It won't be focusable using arrow keys. *)
  module Section = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Section"
    [@@mel.module "@kobalte/core/combobox"]
  end

  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/combobox"]
  end

  external use_combobox_context : unit -> Types.ComboboxContextValue.t = "useComboboxContext"
  [@@mel.module "@kobalte/core/combobox"]
end

module ContextMenu = struct
  (** An optional arrow element to render alongside the popper content.
      Must be rendered in the popper content. *)
  module Arrow = struct
    module Props = struct
      external check :
        ?size:float Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** An item that can be controlled and rendered like a checkbox. *)
  module CheckboxItem = struct
    module Props = struct
      external check :
        ?checked:bool Check.value ->
        ?defaultChecked:bool Check.value ->
        ?onChange:(bool -> unit) ->
        ?disabled:bool Check.value ->
        ?textValue:string Check.value ->
        ?indeterminate:bool Check.value ->
        ?closeOnSelect:bool Check.value ->
        ?onSelect:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "CheckboxItem"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  module Content = struct
    module Props = struct
      external check :
        ?onOpenAutoFocus:(Dom.event -> unit) ->
        ?onCloseAutoFocus:(Dom.event -> unit) ->
        ?onEscapeKeyDown:(Dom.keyboardEvent -> unit) ->
        ?onPointerDownOutside:(Dom.customEvent -> unit) ->
        ?onFocusOutside:(Dom.customEvent -> unit) ->
        ?onInteractOutside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Content"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** A container used to group multiple `Menu.Item`s. *)
  module Group = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Group"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** A component used to render the label of a `Menu.Group`.
      It won't be focusable using arrow keys. *)
  module GroupLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "GroupLabel"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** A small icon often displayed inside the menu trigger as a visual affordance for the fact it can be open.
      It renders a `▼` by default, but you can use your own icon by providing a `children`. *)
  module Icon = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Icon"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** An item of the menu. *)
  module Item = struct
    module Props = struct
      external check :
        ?disabled:bool Check.value ->
        ?textValue:string Check.value ->
        ?closeOnSelect:bool Check.value ->
        ?onSelect:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Item"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** An optional accessible description to be announced for the menu item.
      Useful for menu items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** The visual indicator rendered when the parent menu `CheckboxItem` or `RadioItem` is checked.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module ItemIndicator = struct
    module Props = struct
      external check :
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemIndicator"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** An accessible label to be announced for the menu item.
      Useful for menu items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** Portals its children into the `body` when the menu is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Check.value ->
        ?useShadow:bool Check.value ->
        ?isSVG:bool Check.value ->
        children:('f, [ `nodes ]) Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** A container used to group multiple `Menu.RadioItem`s and manage the selection. *)
  module RadioGroup = struct
    module Props = struct
      external check :
        ?value:'t_value Check.value ->
        ?defaultValue:'t_value Check.value ->
        ?onChange:('t_value -> unit) ->
        ?disabled:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "RadioGroup"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** An item that can be controlled and rendered like a radio. *)
  module RadioItem = struct
    module Props = struct
      external check :
        value:'t_value Check.value ->
        ?disabled:bool Check.value ->
        ?textValue:string Check.value ->
        ?closeOnSelect:bool Check.value ->
        ?onSelect:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "RadioItem"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** Displays a menu located at the pointer, triggered by a right-click or a long-press. *)
  module Root = struct
    module Props = struct
      external check :
        ?id:string Check.value ->
        ?value:string Check.value ->
        ?placement:string Check.value ->
        ?gutter:float Check.value ->
        ?shift:float Check.value ->
        ?flip:(string, bool) Types.Either.t Check.value ->
        ?slide:bool Check.value ->
        ?overlap:bool Check.value ->
        ?sameWidth:bool Check.value ->
        ?fitViewport:bool Check.value ->
        ?hideWhenDetached:bool Check.value ->
        ?detachedPadding:float Check.value ->
        ?arrowPadding:float Check.value ->
        ?overflowPadding:float Check.value ->
        ?onOpenChange:(bool -> unit) ->
        ?modal:bool Check.value ->
        ?preventScroll:bool Check.value ->
        ?forceMount:bool Check.value ->
        ?orientation:[ `horizontal | `vertical ] Check.value ->
        ?children:('f, [ `nodes ]) Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** A separator visually or semantically separates content. *)
  module Separator = struct
    module Props = struct
      external check :
        ?orientation:[ `horizontal | `vertical ] Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Hr.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Separator"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** Contains all the parts of a submenu. *)
  module Sub = struct
    module Props = struct
      external check :
        ?getAnchorRect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?gutter:float Check.value ->
        ?shift:float Check.value ->
        ?slide:bool Check.value ->
        ?overlap:bool Check.value ->
        ?fitViewport:bool Check.value ->
        ?hideWhenDetached:bool Check.value ->
        ?detachedPadding:float Check.value ->
        ?arrowPadding:float Check.value ->
        ?overflowPadding:float Check.value ->
        ?open_:bool Check.value ->
        ?defaultOpen:bool Check.value ->
        ?onOpenChange:(bool -> unit) ->
        ?children:('f, [ `nodes ]) Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Sub"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** The component that pops out when a submenu is open. *)
  module SubContent = struct
    module Props = struct
      external check :
        ?onEscapeKeyDown:(Dom.keyboardEvent -> unit) ->
        ?onPointerDownOutside:(Dom.customEvent -> unit) ->
        ?onFocusOutside:(Dom.customEvent -> unit) ->
        ?onInteractOutside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "SubContent"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** An item that opens a submenu. *)
  module SubTrigger = struct
    module Props = struct
      external check :
        ?textValue:string Check.value ->
        ?disabled:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "SubTrigger"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  module Trigger = struct
    module Props = struct
      external check :
        ?disabled:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  external use_context_menu_context : unit -> Types.ContextMenuContextValue.t = "useContextMenuContext"
  [@@mel.module "@kobalte/core/context-menu"]
end

module Dialog = struct
  (** The button that closes the dialog. *)
  module CloseButton = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "CloseButton"
    [@@mel.module "@kobalte/core/dialog"]
  end

  (** Contains the content to be rendered when the dialog is open. *)
  module Content = struct
    module Props = struct
      external check :
        ?onOpenAutoFocus:(Dom.event -> unit) ->
        ?onCloseAutoFocus:(Dom.event -> unit) ->
        ?onEscapeKeyDown:(Dom.keyboardEvent -> unit) ->
        ?onPointerDownOutside:(Dom.customEvent -> unit) ->
        ?onFocusOutside:(Dom.customEvent -> unit) ->
        ?onInteractOutside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Content"
    [@@mel.module "@kobalte/core/dialog"]
  end

  (** An optional accessible description to be announced when the dialog is open. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.P.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Description"
    [@@mel.module "@kobalte/core/dialog"]
  end

  (** A layer that covers the inert portion of the view when the dialog is open. *)
  module Overlay = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Overlay"
    [@@mel.module "@kobalte/core/dialog"]
  end

  (** Portals its children into the `body` when the dialog is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Check.value ->
        ?useShadow:bool Check.value ->
        ?isSVG:bool Check.value ->
        children:('f, [ `nodes ]) Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/dialog"]
  end

  (** A dialog is a window overlaid on either the primary window or another dialog window. *)
  module Root = struct
    module Props = struct
      external check :
        ?translations:Types.AlertDialog_Root_Translations.t Check.value ->
        ?open_:bool Check.value ->
        ?defaultOpen:bool Check.value ->
        ?onOpenChange:(bool -> unit) ->
        ?id:string Check.value ->
        ?modal:bool Check.value ->
        ?preventScroll:bool Check.value ->
        ?forceMount:bool Check.value ->
        ?children:('f, [ `nodes ]) Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/dialog"]
  end

  (** An accessible title to be announced when the dialog is open. *)
  module Title = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.H2.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Title"
    [@@mel.module "@kobalte/core/dialog"]
  end

  (** The button that opens the dialog. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/dialog"]
  end

  external use_dialog_context : unit -> Types.DialogContextValue.t = "useDialogContext"
  [@@mel.module "@kobalte/core/dialog"]
end

module DropdownMenu = struct
  (** An optional arrow element to render alongside the popper content.
      Must be rendered in the popper content. *)
  module Arrow = struct
    module Props = struct
      external check :
        ?size:float Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** An item that can be controlled and rendered like a checkbox. *)
  module CheckboxItem = struct
    module Props = struct
      external check :
        ?checked:bool Check.value ->
        ?defaultChecked:bool Check.value ->
        ?onChange:(bool -> unit) ->
        ?disabled:bool Check.value ->
        ?textValue:string Check.value ->
        ?indeterminate:bool Check.value ->
        ?closeOnSelect:bool Check.value ->
        ?onSelect:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "CheckboxItem"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** Contains the content to be rendered when the dropdown menu is open. *)
  module Content = struct
    module Props = struct
      external check :
        ?onOpenAutoFocus:(Dom.event -> unit) ->
        ?onCloseAutoFocus:(Dom.event -> unit) ->
        ?onEscapeKeyDown:(Dom.keyboardEvent -> unit) ->
        ?onPointerDownOutside:(Dom.customEvent -> unit) ->
        ?onFocusOutside:(Dom.customEvent -> unit) ->
        ?onInteractOutside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Content"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** A container used to group multiple `Menu.Item`s. *)
  module Group = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Group"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** A component used to render the label of a `Menu.Group`.
      It won't be focusable using arrow keys. *)
  module GroupLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "GroupLabel"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** A small icon often displayed inside the menu trigger as a visual affordance for the fact it can be open.
      It renders a `▼` by default, but you can use your own icon by providing a `children`. *)
  module Icon = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Icon"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** An item of the menu. *)
  module Item = struct
    module Props = struct
      external check :
        ?disabled:bool Check.value ->
        ?textValue:string Check.value ->
        ?closeOnSelect:bool Check.value ->
        ?onSelect:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Item"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** An optional accessible description to be announced for the menu item.
      Useful for menu items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** The visual indicator rendered when the parent menu `CheckboxItem` or `RadioItem` is checked.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module ItemIndicator = struct
    module Props = struct
      external check :
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemIndicator"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** An accessible label to be announced for the menu item.
      Useful for menu items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** Portals its children into the `body` when the menu is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Check.value ->
        ?useShadow:bool Check.value ->
        ?isSVG:bool Check.value ->
        children:('f, [ `nodes ]) Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** A container used to group multiple `Menu.RadioItem`s and manage the selection. *)
  module RadioGroup = struct
    module Props = struct
      external check :
        ?value:'t_value Check.value ->
        ?defaultValue:'t_value Check.value ->
        ?onChange:('t_value -> unit) ->
        ?disabled:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "RadioGroup"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** An item that can be controlled and rendered like a radio. *)
  module RadioItem = struct
    module Props = struct
      external check :
        value:'t_value Check.value ->
        ?disabled:bool Check.value ->
        ?textValue:string Check.value ->
        ?closeOnSelect:bool Check.value ->
        ?onSelect:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "RadioItem"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** Displays a menu to the user —such as a set of actions or functions— triggered by a button. *)
  module Root = struct
    module Props = struct
      external check :
        ?id:string Check.value ->
        ?modal:bool Check.value ->
        ?preventScroll:bool Check.value ->
        ?forceMount:bool Check.value ->
        ?orientation:[ `horizontal | `vertical ] Check.value ->
        ?value:string Check.value ->
        ?open_:bool Check.value ->
        ?defaultOpen:bool Check.value ->
        ?onOpenChange:(bool -> unit) ->
        ?getAnchorRect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Check.value ->
        ?gutter:float Check.value ->
        ?shift:float Check.value ->
        ?flip:(string, bool) Types.Either.t Check.value ->
        ?slide:bool Check.value ->
        ?overlap:bool Check.value ->
        ?sameWidth:bool Check.value ->
        ?fitViewport:bool Check.value ->
        ?hideWhenDetached:bool Check.value ->
        ?detachedPadding:float Check.value ->
        ?arrowPadding:float Check.value ->
        ?overflowPadding:float Check.value ->
        ?children:('f, [ `nodes ]) Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** A separator visually or semantically separates content. *)
  module Separator = struct
    module Props = struct
      external check :
        ?orientation:[ `horizontal | `vertical ] Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Hr.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Separator"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** Contains all the parts of a submenu. *)
  module Sub = struct
    module Props = struct
      external check :
        ?getAnchorRect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?gutter:float Check.value ->
        ?shift:float Check.value ->
        ?slide:bool Check.value ->
        ?overlap:bool Check.value ->
        ?fitViewport:bool Check.value ->
        ?hideWhenDetached:bool Check.value ->
        ?detachedPadding:float Check.value ->
        ?arrowPadding:float Check.value ->
        ?overflowPadding:float Check.value ->
        ?open_:bool Check.value ->
        ?defaultOpen:bool Check.value ->
        ?onOpenChange:(bool -> unit) ->
        ?children:('f, [ `nodes ]) Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Sub"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** The component that pops out when a submenu is open. *)
  module SubContent = struct
    module Props = struct
      external check :
        ?onEscapeKeyDown:(Dom.keyboardEvent -> unit) ->
        ?onPointerDownOutside:(Dom.customEvent -> unit) ->
        ?onFocusOutside:(Dom.customEvent -> unit) ->
        ?onInteractOutside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "SubContent"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** An item that opens a submenu. *)
  module SubTrigger = struct
    module Props = struct
      external check :
        ?textValue:string Check.value ->
        ?disabled:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "SubTrigger"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** The button that toggles the menu. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end
end

module FileField = struct
  external context : Types.FileFieldContextValue.t option Types.Context.t = "Context"
  [@@mel.module "@kobalte/core/file-field"]

  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Description"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module Dropzone = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Dropzone"
    [@@mel.module "@kobalte/core/file-field"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module HiddenInput = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "HiddenInput"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module Item = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Item"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module ItemDeleteTrigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemDeleteTrigger"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module ItemList = struct
    module Props = struct
      external check :
        (children:(Types.File.t -> Jsx.element, [ `render ]) Check.children -> unit -> unit) Html.Ul.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemList"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module ItemName = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemName"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module ItemPreview = struct
    module Props = struct
      external check :
        type_:string Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemPreview"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module ItemPreviewImage = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Img.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemPreviewImage"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module ItemSize = struct
    module Props = struct
      external check :
        ?precision:float Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemSize"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Label"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?translations:Types.FileField_Root_Translations.t Check.value ->
        ?multiple:bool Check.value ->
        ?accept:(string, string array) Types.Either.t Check.value ->
        ?maxFiles:float Check.value ->
        ?allowDragAndDrop:bool Check.value ->
        ?maxFileSize:float Check.value ->
        ?minFileSize:float Check.value ->
        ?onFileAccept:(Types.File.t array -> unit) ->
        ?onFileReject:(Types.FileRejection.t array -> unit) ->
        ?onFileChange:(Types.Details.t -> unit) ->
        ?validate:(Types.File.t -> [ `TOO_MANY_FILES | `FILE_INVALID_TYPE | `FILE_TOO_LARGE | `FILE_TOO_SMALL ] array Js.Nullable.t) ->
        ?id:string Check.value ->
        ?name:string Check.value ->
        ?validationState:[ `valid | `invalid ] Check.value ->
        ?required:bool Check.value ->
        ?disabled:bool Check.value ->
        ?readOnly:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/file-field"]
  end

  external use_file_field_context : unit -> Types.FileFieldContextValue.t = "useFileFieldContext"
  [@@mel.module "@kobalte/core/file-field"]
end

module HoverCard = struct
  (** An optional arrow element to render alongside the popper content.
      Must be rendered in the popper content. *)
  module Arrow = struct
    module Props = struct
      external check :
        ?size:float Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/hover-card"]
  end

  (** Contains the content to be rendered when the hovercard is open. *)
  module Content = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Content"
    [@@mel.module "@kobalte/core/hover-card"]
  end

  (** Portals its children into the `body` when the hovercard is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Check.value ->
        ?useShadow:bool Check.value ->
        ?isSVG:bool Check.value ->
        children:('f, [ `nodes ]) Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/hover-card"]
  end

  (** A popover that allows sighted users to preview content available behind a link. *)
  module Root = struct
    module Props = struct
      external check :
        ?open_:bool Check.value ->
        ?defaultOpen:bool Check.value ->
        ?onOpenChange:(bool -> unit) ->
        ?openDelay:float Check.value ->
        ?closeDelay:float Check.value ->
        ?ignoreSafeArea:bool Check.value ->
        ?forceMount:bool Check.value ->
        ?id:string Check.value ->
        ?getAnchorRect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Check.value ->
        ?gutter:float Check.value ->
        ?shift:float Check.value ->
        ?flip:(string, bool) Types.Either.t Check.value ->
        ?slide:bool Check.value ->
        ?overlap:bool Check.value ->
        ?sameWidth:bool Check.value ->
        ?fitViewport:bool Check.value ->
        ?hideWhenDetached:bool Check.value ->
        ?detachedPadding:float Check.value ->
        ?arrowPadding:float Check.value ->
        ?overflowPadding:float Check.value ->
        ?children:('f, [ `nodes ]) Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/hover-card"]
  end

  (** The link that opens the hovercard when hovered. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.A.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/hover-card"]
  end

  external use_hover_card_context : unit -> Types.HoverCardContextValue.t = "useHoverCardContext"
  [@@mel.module "@kobalte/core/hover-card"]
end

module I18n = struct
  (** Provides the locale for the application to all child components. *)
  module I18nProvider = struct
    module Props = struct
      external check :
        ?locale:string Check.value ->
        ?children:('f, [ `nodes ]) Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "I18nProvider"
    [@@mel.module "@kobalte/core/i18n"]
  end

  external rtl_langs : string Js.Set.t = "RTL_LANGS"
  [@@mel.module "@kobalte/core/i18n"]

  (** Provides localized string collation for the current locale. Automatically updates when the locale changes,
      and handles caching of the collator for performance. *)
  external create_collator : Types.CollatorOptions.t option -> Types.Collator.t Solid.accessor = "createCollator"
  [@@mel.module "@kobalte/core/i18n"]

  (** Provides localized date formatting for the current locale. Automatically updates when the locale changes,
      and handles caching of the date formatter for performance. *)
  external create_date_formatter : (Types.DateTimeFormatOptions.t, Types.DateTimeFormatOptions.t Solid.accessor) Types.Either.t -> Types.DateTimeFormat.t Solid.accessor = "createDateFormatter"
  [@@mel.module "@kobalte/core/i18n"]

  (** Returns an accessor for the current browser/system language, and updates when it changes. *)
  external create_default_locale : unit -> Types.I18n_CreateDefaultLocale.t = "createDefaultLocale"
  [@@mel.module "@kobalte/core/i18n"]

  (** Provides localized string search functionality that is useful for filtering or matching items
      in a list. Options can be provided to adjust the sensitivity to case, diacritics, and other parameters. *)
  external create_filter : Types.CollatorOptions.t option -> Types.Filter.t = "createFilter"
  [@@mel.module "@kobalte/core/i18n"]

  (** Provides localized number formatting for the current locale. Automatically updates when the locale changes,
      and handles caching of the number formatter for performance. *)
  external create_number_formatter : (Types.NumberFormatOptions.t, Types.NumberFormatOptions.t Solid.accessor) Types.Either.t -> Types.NumberFormat.t Solid.accessor = "createNumberFormatter"
  [@@mel.module "@kobalte/core/i18n"]

  (** Gets the locale setting of the browser. *)
  external get_default_locale : unit -> Types.Locale.t = "getDefaultLocale"
  [@@mel.module "@kobalte/core/i18n"]

  external get_reading_direction : string -> [ `rtl | `ltr ] = "getReadingDirection"
  [@@mel.module "@kobalte/core/i18n"]

  (** Determines if a locale is read right to left using \[Intl.Locale\]
      \{\@link https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale\}. *)
  external is_rtl : string -> bool = "isRTL"
  [@@mel.module "@kobalte/core/i18n"]

  (** Returns an accessor for the current locale and layout direction. *)
  external use_locale : unit -> Types.I18n_UseLocale.t = "useLocale"
  [@@mel.module "@kobalte/core/i18n"]
end

module Image = struct
  (** An element that renders when the image hasn't loaded.
      This means whilst it's loading, or if there was an error. *)
  module Fallback = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Fallback"
    [@@mel.module "@kobalte/core/image"]
  end

  (** The image to render. By default, it will only render when it has loaded. *)
  module Img = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Img.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Img"
    [@@mel.module "@kobalte/core/image"]
  end

  (** An image element with an optional fallback for loading and error status. *)
  module Root = struct
    module Props = struct
      external check :
        ?fallbackDelay:float Check.value ->
        ?onLoadingStatusChange:([ `idle | `loading | `loaded | `error ] -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/image"]
  end

  external use_image_context : unit -> Types.ImageContextValue.t = "useImageContext"
  [@@mel.module "@kobalte/core/image"]
end

module Link = struct
  (** Link allows a user to navigate to another page or resource within a web page or application. *)
  module Root = struct
    module Props = struct
      external check :
        ?disabled:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.A.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/link"]
  end
end

module Listbox = struct
  (** An item of the listbox. *)
  module Item = struct
    module Props = struct
      external check :
        item:_ Types.CollectionNode.t Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Item"
    [@@mel.module "@kobalte/core/listbox"]
  end

  (** An optional accessible description to be announced for the item.
      Useful for items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/listbox"]
  end

  (** The visual indicator rendered when the item is selected.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module ItemIndicator = struct
    module Props = struct
      external check :
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemIndicator"
    [@@mel.module "@kobalte/core/listbox"]
  end

  (** An accessible label to be announced for the item.
      Useful for items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/listbox"]
  end

  (** Listbox presents a list of options and allows a user to select one or more of them. *)
  module Root = struct
    module Props = struct
      external check :
        ?value:string array Check.value ->
        ?defaultValue:string array Check.value ->
        ?onChange:(string Js.Set.t -> unit) ->
        ?options:('option, 'opt_group) Types.Either.t array Check.value ->
        ?optionValue:('option -> string) ->
        ?optionTextValue:('option -> string) ->
        ?optionDisabled:('option -> bool) ->
        ?optionGroupChildren:('opt_group -> 'option array) ->
        ?state:Types.ListState.t Check.value ->
        ?keyboardDelegate:Types.KeyboardDelegate.t Check.value ->
        ?autoFocus:([ `first | `last ], bool) Types.Either.t Check.value ->
        ?shouldFocusWrap:bool Check.value ->
        ?shouldUseVirtualFocus:bool Check.value ->
        ?shouldSelectOnPressUp:bool Check.value ->
        ?shouldFocusOnHover:bool Check.value ->
        ?scrollRef:Dom.htmlElement option Solid.accessor Check.value ->
        ?selectionBehavior:[ `toggle | `replace ] Check.value ->
        ?allowDuplicateSelectionEvents:bool Check.value ->
        ?selectionMode:[ `none | `single | `multiple ] Check.value ->
        ?disallowEmptySelection:bool Check.value ->
        ?selectOnFocus:bool Check.value ->
        ?disallowTypeAhead:bool Check.value ->
        ?allowsTabNavigation:bool Check.value ->
        ?virtualized:bool Check.value ->
        ?renderItem:('option Types.CollectionNode.t -> Jsx.element) ->
        ?renderSection:('opt_group Types.CollectionNode.t -> Jsx.element) ->
        ?scrollToItem:(string -> unit) ->
        (?children:(('option, 'opt_group) Types.Either.t Types.CollectionNode.t Types.Collection.t Solid.accessor -> Jsx.element, [ `render ]) Check.children -> unit -> unit) Html.Ul.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/listbox"]
  end

  (** A component used to render the label of a listbox option group.
      It won't be focusable using arrow keys. *)
  module Section = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Section"
    [@@mel.module "@kobalte/core/listbox"]
  end

  external use_listbox_context : unit -> Types.ListboxContextValue.t = "useListboxContext"
  [@@mel.module "@kobalte/core/listbox"]
end

module Menubar = struct
  (** An optional arrow element to render alongside the popper content.
      Must be rendered in the popper content. *)
  module Arrow = struct
    module Props = struct
      external check :
        ?size:float Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** An item that can be controlled and rendered like a checkbox. *)
  module CheckboxItem = struct
    module Props = struct
      external check :
        ?checked:bool Check.value ->
        ?defaultChecked:bool Check.value ->
        ?onChange:(bool -> unit) ->
        ?disabled:bool Check.value ->
        ?textValue:string Check.value ->
        ?indeterminate:bool Check.value ->
        ?closeOnSelect:bool Check.value ->
        ?onSelect:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "CheckboxItem"
    [@@mel.module "@kobalte/core/menubar"]
  end

  module Content = struct
    module Props = struct
      external check :
        ?onOpenAutoFocus:(Dom.event -> unit) ->
        ?onCloseAutoFocus:(Dom.event -> unit) ->
        ?onEscapeKeyDown:(Dom.keyboardEvent -> unit) ->
        ?onPointerDownOutside:(Dom.customEvent -> unit) ->
        ?onFocusOutside:(Dom.customEvent -> unit) ->
        ?onInteractOutside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Content"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** A container used to group multiple `Menu.Item`s. *)
  module Group = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Group"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** A component used to render the label of a `Menu.Group`.
      It won't be focusable using arrow keys. *)
  module GroupLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "GroupLabel"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** A small icon often displayed inside the menu trigger as a visual affordance for the fact it can be open.
      It renders a `▼` by default, but you can use your own icon by providing a `children`. *)
  module Icon = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Icon"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** An item of the menu. *)
  module Item = struct
    module Props = struct
      external check :
        ?disabled:bool Check.value ->
        ?textValue:string Check.value ->
        ?closeOnSelect:bool Check.value ->
        ?onSelect:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Item"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** An optional accessible description to be announced for the menu item.
      Useful for menu items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** The visual indicator rendered when the parent menu `CheckboxItem` or `RadioItem` is checked.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module ItemIndicator = struct
    module Props = struct
      external check :
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemIndicator"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** An accessible label to be announced for the menu item.
      Useful for menu items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** Displays a menu to the user —such as a set of actions or functions— triggered by a button. *)
  module Menu = struct
    module Props = struct
      external check :
        ?id:string Check.value ->
        ?modal:bool Check.value ->
        ?preventScroll:bool Check.value ->
        ?forceMount:bool Check.value ->
        ?orientation:[ `horizontal | `vertical ] Check.value ->
        ?value:string Check.value ->
        ?open_:bool Check.value ->
        ?defaultOpen:bool Check.value ->
        ?onOpenChange:(bool -> unit) ->
        ?getAnchorRect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Check.value ->
        ?gutter:float Check.value ->
        ?shift:float Check.value ->
        ?flip:(string, bool) Types.Either.t Check.value ->
        ?slide:bool Check.value ->
        ?overlap:bool Check.value ->
        ?sameWidth:bool Check.value ->
        ?fitViewport:bool Check.value ->
        ?hideWhenDetached:bool Check.value ->
        ?detachedPadding:float Check.value ->
        ?arrowPadding:float Check.value ->
        ?overflowPadding:float Check.value ->
        ?children:('f, [ `nodes ]) Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Menu"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** Portals its children into the `body` when the menu is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Check.value ->
        ?useShadow:bool Check.value ->
        ?isSVG:bool Check.value ->
        children:('f, [ `nodes ]) Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** A container used to group multiple `Menu.RadioItem`s and manage the selection. *)
  module RadioGroup = struct
    module Props = struct
      external check :
        ?value:'t_value Check.value ->
        ?defaultValue:'t_value Check.value ->
        ?onChange:('t_value -> unit) ->
        ?disabled:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "RadioGroup"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** An item that can be controlled and rendered like a radio. *)
  module RadioItem = struct
    module Props = struct
      external check :
        value:'t_value Check.value ->
        ?disabled:bool Check.value ->
        ?textValue:string Check.value ->
        ?closeOnSelect:bool Check.value ->
        ?onSelect:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "RadioItem"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** A visually persistent menu common in desktop applications that provides quick access to a consistent set of commands. *)
  module Root = struct
    module Props = struct
      external check :
        ?defaultValue:string Check.value ->
        ?value:string Js.Nullable.t Check.value ->
        ?onValueChange:(string Js.Nullable.t -> unit) ->
        ?loop:bool Check.value ->
        ?focusOnAlt:bool Check.value ->
        ?orientation:[ `horizontal | `vertical ] Check.value ->
        ?autoFocusMenu:bool Check.value ->
        ?onAutoFocusMenuChange:bool Solid.setter Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** A separator visually or semantically separates content. *)
  module Separator = struct
    module Props = struct
      external check :
        ?orientation:[ `horizontal | `vertical ] Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Hr.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Separator"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** Contains all the parts of a submenu. *)
  module Sub = struct
    module Props = struct
      external check :
        ?getAnchorRect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?gutter:float Check.value ->
        ?shift:float Check.value ->
        ?slide:bool Check.value ->
        ?overlap:bool Check.value ->
        ?fitViewport:bool Check.value ->
        ?hideWhenDetached:bool Check.value ->
        ?detachedPadding:float Check.value ->
        ?arrowPadding:float Check.value ->
        ?overflowPadding:float Check.value ->
        ?open_:bool Check.value ->
        ?defaultOpen:bool Check.value ->
        ?onOpenChange:(bool -> unit) ->
        ?children:('f, [ `nodes ]) Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Sub"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** The component that pops out when a submenu is open. *)
  module SubContent = struct
    module Props = struct
      external check :
        ?onEscapeKeyDown:(Dom.keyboardEvent -> unit) ->
        ?onPointerDownOutside:(Dom.customEvent -> unit) ->
        ?onFocusOutside:(Dom.customEvent -> unit) ->
        ?onInteractOutside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "SubContent"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** An item that opens a submenu. *)
  module SubTrigger = struct
    module Props = struct
      external check :
        ?textValue:string Check.value ->
        ?disabled:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "SubTrigger"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** The button that toggles the menubar menu or a menubar link. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/menubar"]
  end

  external use_menubar_context : unit -> Types.MenubarContextValue.t = "useMenubarContext"
  [@@mel.module "@kobalte/core/menubar"]
end

module Meter = struct
  (** The component that visually represents the meter value.
      Used to visually show the fill of `Meter.Track`. *)
  module Fill = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Fill"
    [@@mel.module "@kobalte/core/meter"]
  end

  (** An accessible label that gives the user information on the meter. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Label"
    [@@mel.module "@kobalte/core/meter"]
  end

  (** Meter displays numeric value that varies within a defined range. *)
  module Root = struct
    module Props = struct
      external check :
        ?value:float Check.value ->
        ?minValue:float Check.value ->
        ?maxValue:float Check.value ->
        ?getValueLabel:(Types.GetValueLabelParams.t -> string) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/meter"]
  end

  (** The component that visually represents the meter track.
      Act as a container for `Meter.Fill`. *)
  module Track = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Track"
    [@@mel.module "@kobalte/core/meter"]
  end

  (** The accessible label text representing the current value in a human-readable format. *)
  module ValueLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ValueLabel"
    [@@mel.module "@kobalte/core/meter"]
  end

  external use_meter_context : unit -> Types.MeterContextValue.t = "useMeterContext"
  [@@mel.module "@kobalte/core/meter"]
end

module NavigationMenu = struct
  (** An optional arrow element to render alongside the viewport content.
      Must be rendered in the viewport. *)
  module Arrow = struct
    module Props = struct
      external check :
        ?size:float Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** An item that can be controlled and rendered like a checkbox. *)
  module CheckboxItem = struct
    module Props = struct
      external check :
        ?checked:bool Check.value ->
        ?defaultChecked:bool Check.value ->
        ?onChange:(bool -> unit) ->
        ?disabled:bool Check.value ->
        ?textValue:string Check.value ->
        ?indeterminate:bool Check.value ->
        ?closeOnSelect:bool Check.value ->
        ?onSelect:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "CheckboxItem"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  module Content = struct
    module Props = struct
      external check :
        ?onOpenAutoFocus:(Dom.event -> unit) ->
        ?onCloseAutoFocus:(Dom.event -> unit) ->
        ?onEscapeKeyDown:(Dom.keyboardEvent -> unit) ->
        ?onPointerDownOutside:(Dom.customEvent -> unit) ->
        ?onFocusOutside:(Dom.customEvent -> unit) ->
        ?onInteractOutside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Ul.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Content"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** A container used to group multiple `Menu.Item`s. *)
  module Group = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Group"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** A component used to render the label of a `Menu.Group`.
      It won't be focusable using arrow keys. *)
  module GroupLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "GroupLabel"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** A small icon often displayed inside the menu trigger as a visual affordance for the fact it can be open.
      It renders a `▼` by default, but you can use your own icon by providing a `children`. *)
  module Icon = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Icon"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** An item of the navigation menu. *)
  module Item = struct
    module Props = struct
      external check :
        ?disabled:bool Check.value ->
        ?textValue:string Check.value ->
        ?closeOnSelect:bool Check.value ->
        ?onSelect:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.A.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Item"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** An optional accessible description to be announced for the menu item.
      Useful for menu items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** The visual indicator rendered when the parent menu `CheckboxItem` or `RadioItem` is checked.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module ItemIndicator = struct
    module Props = struct
      external check :
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemIndicator"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** An accessible label to be announced for the menu item.
      Useful for menu items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** Displays a menu to the user —such as a set of actions or functions— triggered by a button. *)
  module Menu = struct
    module Props = struct
      external check :
        ?id:string Check.value ->
        ?modal:bool Check.value ->
        ?preventScroll:bool Check.value ->
        ?forceMount:bool Check.value ->
        ?orientation:[ `horizontal | `vertical ] Check.value ->
        ?value:string Check.value ->
        ?open_:bool Check.value ->
        ?defaultOpen:bool Check.value ->
        ?onOpenChange:(bool -> unit) ->
        ?getAnchorRect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Check.value ->
        ?gutter:float Check.value ->
        ?shift:float Check.value ->
        ?flip:(string, bool) Types.Either.t Check.value ->
        ?slide:bool Check.value ->
        ?overlap:bool Check.value ->
        ?sameWidth:bool Check.value ->
        ?fitViewport:bool Check.value ->
        ?hideWhenDetached:bool Check.value ->
        ?detachedPadding:float Check.value ->
        ?arrowPadding:float Check.value ->
        ?overflowPadding:float Check.value ->
        ?children:('f, [ `nodes ]) Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Menu"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** Portals its children into the NavigationMenu.Viewport when the menu is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Check.value ->
        ?useShadow:bool Check.value ->
        ?isSVG:bool Check.value ->
        children:('f, [ `nodes ]) Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** A container used to group multiple `Menu.RadioItem`s and manage the selection. *)
  module RadioGroup = struct
    module Props = struct
      external check :
        ?value:'t_value Check.value ->
        ?defaultValue:'t_value Check.value ->
        ?onChange:('t_value -> unit) ->
        ?disabled:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "RadioGroup"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** An item that can be controlled and rendered like a radio. *)
  module RadioItem = struct
    module Props = struct
      external check :
        value:'t_value Check.value ->
        ?disabled:bool Check.value ->
        ?textValue:string Check.value ->
        ?closeOnSelect:bool Check.value ->
        ?onSelect:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "RadioItem"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** A visually persistent menu common in desktop applications that provides quick access to a consistent set of commands. *)
  module Root = struct
    module Props = struct
      external check :
        ?delayDuration:float Check.value ->
        ?skipDelayDuration:float Check.value ->
        ?forceMount:bool Check.value ->
        ?autoFocusMenu:bool Check.value ->
        ?onAutoFocusMenuChange:bool Solid.setter Check.value ->
        ?defaultValue:string Check.value ->
        ?value:string Js.Nullable.t Check.value ->
        ?onValueChange:(string Js.Nullable.t -> unit) ->
        ?loop:bool Check.value ->
        ?focusOnAlt:bool Check.value ->
        ?orientation:[ `horizontal | `vertical ] Check.value ->
        ?getAnchorRect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Check.value ->
        ?gutter:float Check.value ->
        ?shift:float Check.value ->
        ?flip:(string, bool) Types.Either.t Check.value ->
        ?slide:bool Check.value ->
        ?overlap:bool Check.value ->
        ?sameWidth:bool Check.value ->
        ?fitViewport:bool Check.value ->
        ?hideWhenDetached:bool Check.value ->
        ?detachedPadding:float Check.value ->
        ?arrowPadding:float Check.value ->
        ?overflowPadding:float Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Ul.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** A separator visually or semantically separates content. *)
  module Separator = struct
    module Props = struct
      external check :
        ?orientation:[ `horizontal | `vertical ] Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Hr.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Separator"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** Contains all the parts of a submenu. *)
  module Sub = struct
    module Props = struct
      external check :
        ?getAnchorRect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?gutter:float Check.value ->
        ?shift:float Check.value ->
        ?slide:bool Check.value ->
        ?overlap:bool Check.value ->
        ?fitViewport:bool Check.value ->
        ?hideWhenDetached:bool Check.value ->
        ?detachedPadding:float Check.value ->
        ?arrowPadding:float Check.value ->
        ?overflowPadding:float Check.value ->
        ?open_:bool Check.value ->
        ?defaultOpen:bool Check.value ->
        ?onOpenChange:(bool -> unit) ->
        ?children:('f, [ `nodes ]) Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Sub"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** The component that pops out when a submenu is open. *)
  module SubContent = struct
    module Props = struct
      external check :
        ?onEscapeKeyDown:(Dom.keyboardEvent -> unit) ->
        ?onPointerDownOutside:(Dom.customEvent -> unit) ->
        ?onFocusOutside:(Dom.customEvent -> unit) ->
        ?onInteractOutside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "SubContent"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** An item that opens a submenu. *)
  module SubTrigger = struct
    module Props = struct
      external check :
        ?textValue:string Check.value ->
        ?disabled:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "SubTrigger"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** The button that toggles the menubar menu or a menubar link. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  module Viewport = struct
    module Props = struct
      external check :
        ?onEscapeKeyDown:(Dom.keyboardEvent -> unit) ->
        ?onPointerDownOutside:(Dom.customEvent -> unit) ->
        ?onFocusOutside:(Dom.customEvent -> unit) ->
        ?onInteractOutside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Viewport"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  external use_navigation_menu_context : unit -> Types.NavigationMenuContextValue.t = "useNavigationMenuContext"
  [@@mel.module "@kobalte/core/navigation-menu"]
end

module NumberField = struct
  module DecrementTrigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "DecrementTrigger"
    [@@mel.module "@kobalte/core/number-field"]
  end

  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Description"
    [@@mel.module "@kobalte/core/number-field"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/number-field"]
  end

  module HiddenInput = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "HiddenInput"
    [@@mel.module "@kobalte/core/number-field"]
  end

  module IncrementTrigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "IncrementTrigger"
    [@@mel.module "@kobalte/core/number-field"]
  end

  module Input = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Input"
    [@@mel.module "@kobalte/core/number-field"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Label"
    [@@mel.module "@kobalte/core/number-field"]
  end

  (** A text input that allow users to input custom text entries with a keyboard. *)
  module Root = struct
    module Props = struct
      external check :
        ?value:(string, float) Types.Either.t Check.value ->
        ?defaultValue:(string, float) Types.Either.t Check.value ->
        ?onChange:(string -> unit) ->
        ?rawValue:float Check.value ->
        ?onRawValueChange:(float -> unit) ->
        ?minValue:float Check.value ->
        ?maxValue:float Check.value ->
        ?step:float Check.value ->
        ?largeStep:float Check.value ->
        ?changeOnWheel:bool Check.value ->
        ?format:bool Check.value ->
        ?formatOptions:Types.NumberFormatOptions2.t Check.value ->
        ?allowedInput:Js.Re.t Check.value ->
        ?id:string Check.value ->
        ?name:string Check.value ->
        ?validationState:[ `valid | `invalid ] Check.value ->
        ?required:bool Check.value ->
        ?disabled:bool Check.value ->
        ?readOnly:bool Check.value ->
        ?textValue:string Check.value ->
        ?translations:Types.ColorChannelField_Root_Translations.t Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/number-field"]
  end

  external use_number_field_context : unit -> Types.NumberFieldContextValue.t = "useNumberFieldContext"
  [@@mel.module "@kobalte/core/number-field"]
end

module Pagination = struct
  module Ellipsis = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Ellipsis"
    [@@mel.module "@kobalte/core/pagination"]
  end

  module Item = struct
    module Props = struct
      external check :
        page:float Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Item"
    [@@mel.module "@kobalte/core/pagination"]
  end

  module Items = struct
    module Props = struct
      external check :
        ?children:('f, [ `nodes ]) Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Items"
    [@@mel.module "@kobalte/core/pagination"]
  end

  module Next = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Next"
    [@@mel.module "@kobalte/core/pagination"]
  end

  module Previous = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Previous"
    [@@mel.module "@kobalte/core/pagination"]
  end

  (** A list of page number that allows users to change the current page. *)
  module Root = struct
    module Props = struct
      external check :
        ?page:float Check.value ->
        ?defaultPage:float Check.value ->
        ?onPageChange:(float -> unit) ->
        count:float Check.value ->
        ?siblingCount:float Check.value ->
        ?showFirst:bool Check.value ->
        ?showLast:bool Check.value ->
        ?fixedItems:(string, bool) Types.Either.t Check.value ->
        itemComponent:(Types.Pagination_Root_ItemComponent.t -> Jsx.element) ->
        ellipsisComponent:(unit -> Jsx.element) ->
        ?disabled:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Nav.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/pagination"]
  end

  external use_pagination_context : unit -> Types.PaginationContextValue.t = "usePaginationContext"
  [@@mel.module "@kobalte/core/pagination"]
end

module Popover = struct
  (** An optional element to position the `Popover.Content` against.
      If this part is not used, the content will position alongside the `Popover.Trigger`. *)
  module Anchor = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Anchor"
    [@@mel.module "@kobalte/core/popover"]
  end

  (** An optional arrow element to render alongside the popper content.
      Must be rendered in the popper content. *)
  module Arrow = struct
    module Props = struct
      external check :
        ?size:float Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/popover"]
  end

  (** The button that closes the popover. *)
  module CloseButton = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "CloseButton"
    [@@mel.module "@kobalte/core/popover"]
  end

  (** Contains the content to be rendered when the popover is open. *)
  module Content = struct
    module Props = struct
      external check :
        ?onOpenAutoFocus:(Dom.event -> unit) ->
        ?onCloseAutoFocus:(Dom.event -> unit) ->
        ?onEscapeKeyDown:(Dom.keyboardEvent -> unit) ->
        ?onPointerDownOutside:(Dom.customEvent -> unit) ->
        ?onFocusOutside:(Dom.customEvent -> unit) ->
        ?onInteractOutside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Content"
    [@@mel.module "@kobalte/core/popover"]
  end

  (** An optional accessible description to be announced when the popover is open. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.P.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Description"
    [@@mel.module "@kobalte/core/popover"]
  end

  (** Portals its children into the `body` when the popover is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Check.value ->
        ?useShadow:bool Check.value ->
        ?isSVG:bool Check.value ->
        children:('f, [ `nodes ]) Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/popover"]
  end

  (** A popover is a dialog positioned relative to an anchor element. *)
  module Root = struct
    module Props = struct
      external check :
        ?anchorRef:Dom.htmlElement option Solid.accessor Check.value ->
        ?open_:bool Check.value ->
        ?defaultOpen:bool Check.value ->
        ?onOpenChange:(bool -> unit) ->
        ?id:string Check.value ->
        ?modal:bool Check.value ->
        ?preventScroll:bool Check.value ->
        ?forceMount:bool Check.value ->
        ?translations:Types.Popover_Root_Translations.t Check.value ->
        ?getAnchorRect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Check.value ->
        ?gutter:float Check.value ->
        ?shift:float Check.value ->
        ?flip:(string, bool) Types.Either.t Check.value ->
        ?slide:bool Check.value ->
        ?overlap:bool Check.value ->
        ?sameWidth:bool Check.value ->
        ?fitViewport:bool Check.value ->
        ?hideWhenDetached:bool Check.value ->
        ?detachedPadding:float Check.value ->
        ?arrowPadding:float Check.value ->
        ?overflowPadding:float Check.value ->
        ?children:('f, [ `nodes ]) Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/popover"]
  end

  (** An accessible title to be announced when the popover is open. *)
  module Title = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.H2.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Title"
    [@@mel.module "@kobalte/core/popover"]
  end

  (** The button that opens the popover. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/popover"]
  end

  external use_popover_context : unit -> Types.PopoverContextValue.t = "usePopoverContext"
  [@@mel.module "@kobalte/core/popover"]
end

module Progress = struct
  (** The component that visually represents the progress value.
      Used to visually show the fill of `Progress.Track`. *)
  module Fill = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Fill"
    [@@mel.module "@kobalte/core/progress"]
  end

  (** An accessible label that gives the user information on the progress. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Label"
    [@@mel.module "@kobalte/core/progress"]
  end

  (** Progress show either determinate or indeterminate progress of an operation over time. *)
  module Root = struct
    module Props = struct
      external check :
        ?indeterminate:bool Check.value ->
        ?value:float Check.value ->
        ?minValue:float Check.value ->
        ?maxValue:float Check.value ->
        ?getValueLabel:(Types.GetValueLabelParams.t -> string) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/progress"]
  end

  (** The component that visually represents the progress track.
      Act as a container for `Progress.Fill`. *)
  module Track = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Track"
    [@@mel.module "@kobalte/core/progress"]
  end

  (** The accessible label text representing the current value in a human-readable format. *)
  module ValueLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ValueLabel"
    [@@mel.module "@kobalte/core/progress"]
  end

  external use_progress_context : unit -> Types.ProgressContextValue.t = "useProgressContext"
  [@@mel.module "@kobalte/core/progress"]
end

module RadioGroup = struct
  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Description"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  (** The root container for a radio button. *)
  module Item = struct
    module Props = struct
      external check :
        value:string Check.value ->
        ?disabled:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Item"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  (** The element that visually represents a radio button. *)
  module ItemControl = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemControl"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  (** The description that gives the user more information on the radio button. *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  (** The visual indicator rendered when the radio item is in a checked state.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module ItemIndicator = struct
    module Props = struct
      external check :
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemIndicator"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  (** The native html input that is visually hidden in the radio button. *)
  module ItemInput = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemInput"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  (** The label that gives the user information on the radio button. *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  (** The label that gives the user information on the radio group. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Label"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  (** A set of checkable buttons, known as radio buttons, where no more than one of the buttons can be checked at a time.
      This component is based on the \[WAI-ARIA Radio Group Pattern\](https://www.w3.org/WAI/ARIA/apg/patterns/radiobutton/) *)
  module Root = struct
    module Props = struct
      external check :
        ?value:string Check.value ->
        ?defaultValue:string Check.value ->
        ?onChange:(string -> unit) ->
        ?orientation:[ `horizontal | `vertical ] Check.value ->
        ?id:string Check.value ->
        ?name:string Check.value ->
        ?validationState:[ `valid | `invalid ] Check.value ->
        ?required:bool Check.value ->
        ?disabled:bool Check.value ->
        ?readOnly:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  external use_radio_group_context : unit -> Types.RadioGroupContextValue.t = "useRadioGroupContext"
  [@@mel.module "@kobalte/core/radio-group"]
end

module Rating = struct
  module Control = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Control"
    [@@mel.module "@kobalte/core/rating"]
  end

  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Description"
    [@@mel.module "@kobalte/core/rating"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/rating"]
  end

  module HiddenInput = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "HiddenInput"
    [@@mel.module "@kobalte/core/rating"]
  end

  module Item = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Item"
    [@@mel.module "@kobalte/core/rating"]
  end

  module ItemControl = struct
    module Props = struct
      external check :
        (?children:(Types.RatingItemState.t -> Jsx.element, [ `nodes | `render ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemControl"
    [@@mel.module "@kobalte/core/rating"]
  end

  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/rating"]
  end

  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/rating"]
  end

  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Label"
    [@@mel.module "@kobalte/core/rating"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:float Check.value ->
        ?defaultValue:float Check.value ->
        ?onChange:(float -> unit) ->
        ?allowHalf:bool Check.value ->
        ?orientation:[ `horizontal | `vertical ] Check.value ->
        ?id:string Check.value ->
        ?name:string Check.value ->
        ?validationState:[ `valid | `invalid ] Check.value ->
        ?required:bool Check.value ->
        ?disabled:bool Check.value ->
        ?readOnly:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/rating"]
  end
end

module Search = struct
  (** An optional arrow element to render alongside the popper content.
      Must be rendered in the popper content. *)
  module Arrow = struct
    module Props = struct
      external check :
        ?size:float Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/search"]
  end

  (** The component that pops out when the combobox is open. *)
  module Content = struct
    module Props = struct
      external check :
        ?onCloseAutoFocus:(Dom.event -> unit) ->
        ?onPointerDownOutside:(Dom.customEvent -> unit) ->
        ?onFocusOutside:(Dom.customEvent -> unit) ->
        ?onInteractOutside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Content"
    [@@mel.module "@kobalte/core/search"]
  end

  (** Contains the combobox input and trigger. *)
  module Control = struct
    module Props = struct
      external check :
        (?children:('option Types.ComboboxControlState.t -> Jsx.element, [ `nodes | `render ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Control"
    [@@mel.module "@kobalte/core/search"]
  end

  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Description"
    [@@mel.module "@kobalte/core/search"]
  end

  module HiddenSelect = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Select.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "HiddenSelect"
    [@@mel.module "@kobalte/core/search"]
  end

  (** A small icon often displayed next to the value as a visual affordance for the fact it can be open.
      It renders a `▼` by default, but you can use your own icon `children`. *)
  module Icon = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Icon"
    [@@mel.module "@kobalte/core/search"]
  end

  module Indicator = struct
    module Props = struct
      external check :
        ?loadingComponent:Jsx.element Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Indicator"
    [@@mel.module "@kobalte/core/search"]
  end

  module Input = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Input"
    [@@mel.module "@kobalte/core/search"]
  end

  (** An item of the listbox. *)
  module Item = struct
    module Props = struct
      external check :
        item:_ Types.CollectionNode.t Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Item"
    [@@mel.module "@kobalte/core/search"]
  end

  (** An optional accessible description to be announced for the item.
      Useful for items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/search"]
  end

  (** An accessible label to be announced for the item.
      Useful for items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/search"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Label"
    [@@mel.module "@kobalte/core/search"]
  end

  (** Contains all the items of a `Combobox`. *)
  module Listbox = struct
    module Props = struct
      external check :
        ?scrollRef:Dom.htmlElement option Solid.accessor Check.value ->
        ?scrollToItem:(string -> unit) ->
        (?children:(('option, 'opt_group) Types.Either.t Types.CollectionNode.t Types.Collection.t Solid.accessor -> Jsx.element, [ `render ]) Check.children -> unit -> unit) Html.Ul.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Listbox"
    [@@mel.module "@kobalte/core/search"]
  end

  (** Displayed in portal when no options are presented *)
  module NoResult = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "NoResult"
    [@@mel.module "@kobalte/core/search"]
  end

  (** Portals its children into the `body` when the combobox is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Check.value ->
        ?useShadow:bool Check.value ->
        ?isSVG:bool Check.value ->
        children:('f, [ `nodes ]) Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/search"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:'option Js.Nullable.t Check.value ->
        ?defaultValue:'option Check.value ->
        ?onChange:('option Js.Nullable.t -> unit) ->
        ?id:string Check.value ->
        ?disabled:bool Check.value ->
        ?translations:Types.Combobox_Root_Translations.t Check.value ->
        ?name:string Check.value ->
        ?validationState:[ `valid | `invalid ] Check.value ->
        ?required:bool Check.value ->
        ?readOnly:bool Check.value ->
        ?getAnchorRect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Check.value ->
        ?gutter:float Check.value ->
        ?shift:float Check.value ->
        ?flip:(string, bool) Types.Either.t Check.value ->
        ?slide:bool Check.value ->
        ?overlap:bool Check.value ->
        ?sameWidth:bool Check.value ->
        ?fitViewport:bool Check.value ->
        ?hideWhenDetached:bool Check.value ->
        ?detachedPadding:float Check.value ->
        ?arrowPadding:float Check.value ->
        ?overflowPadding:float Check.value ->
        ?noResetInputOnBlur:bool Check.value ->
        ?open_:bool Check.value ->
        ?defaultOpen:bool Check.value ->
        ?onOpenChange:(bool -> [ `focus | `input | `manual ] option -> unit) ->
        ?onInputChange:(string -> unit) ->
        ?triggerMode:[ `focus | `input | `manual ] Check.value ->
        ?placeholder:Jsx.element Check.value ->
        options:('option, 'opt_group) Types.Either.t array Check.value ->
        ?optionValue:('option -> (string, float) Types.Either.t) ->
        ?optionTextValue:('option -> string) ->
        ?optionLabel:('option -> string) ->
        ?optionDisabled:('option -> bool) ->
        ?optionGroupChildren:string Check.value ->
        ?keyboardDelegate:Types.KeyboardDelegate.t Check.value ->
        ?shouldFocusWrap:bool Check.value ->
        ?allowsEmptyCollection:bool Check.value ->
        ?selectionBehavior:[ `toggle | `replace ] Check.value ->
        ?allowDuplicateSelectionEvents:bool Check.value ->
        ?disallowEmptySelection:bool Check.value ->
        ?closeOnSelection:bool Check.value ->
        ?removeOnBackspace:bool Check.value ->
        ?virtualized:bool Check.value ->
        ?itemComponent:('option Types.ComboboxBaseItemComponentProps.t -> Jsx.element) ->
        ?sectionComponent:('opt_group Types.ComboboxBaseSectionComponentProps.t -> Jsx.element) ->
        ?modal:bool Check.value ->
        ?preventScroll:bool Check.value ->
        ?forceMount:bool Check.value ->
        ?debounceOptionsMillisecond:float Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/search"]
  end

  module Root_multiple = struct
    module Props = struct
      external check :
        ?value:'option array Check.value ->
        ?defaultValue:'option array Check.value ->
        ?onChange:('option array -> unit) ->
        multiple:bool Check.value ->
        ?id:string Check.value ->
        ?disabled:bool Check.value ->
        ?translations:Types.Combobox_Root_Translations.t Check.value ->
        ?name:string Check.value ->
        ?validationState:[ `valid | `invalid ] Check.value ->
        ?required:bool Check.value ->
        ?readOnly:bool Check.value ->
        ?getAnchorRect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Check.value ->
        ?gutter:float Check.value ->
        ?shift:float Check.value ->
        ?flip:(string, bool) Types.Either.t Check.value ->
        ?slide:bool Check.value ->
        ?overlap:bool Check.value ->
        ?sameWidth:bool Check.value ->
        ?fitViewport:bool Check.value ->
        ?hideWhenDetached:bool Check.value ->
        ?detachedPadding:float Check.value ->
        ?arrowPadding:float Check.value ->
        ?overflowPadding:float Check.value ->
        ?noResetInputOnBlur:bool Check.value ->
        ?open_:bool Check.value ->
        ?defaultOpen:bool Check.value ->
        ?onOpenChange:(bool -> [ `focus | `input | `manual ] option -> unit) ->
        ?onInputChange:(string -> unit) ->
        ?triggerMode:[ `focus | `input | `manual ] Check.value ->
        ?placeholder:Jsx.element Check.value ->
        options:('option, 'opt_group) Types.Either.t array Check.value ->
        ?optionValue:('option -> (string, float) Types.Either.t) ->
        ?optionTextValue:('option -> string) ->
        ?optionLabel:('option -> string) ->
        ?optionDisabled:('option -> bool) ->
        ?optionGroupChildren:string Check.value ->
        ?keyboardDelegate:Types.KeyboardDelegate.t Check.value ->
        ?shouldFocusWrap:bool Check.value ->
        ?allowsEmptyCollection:bool Check.value ->
        ?selectionBehavior:[ `toggle | `replace ] Check.value ->
        ?allowDuplicateSelectionEvents:bool Check.value ->
        ?disallowEmptySelection:bool Check.value ->
        ?closeOnSelection:bool Check.value ->
        ?removeOnBackspace:bool Check.value ->
        ?virtualized:bool Check.value ->
        ?itemComponent:('option Types.ComboboxBaseItemComponentProps.t -> Jsx.element) ->
        ?sectionComponent:('opt_group Types.ComboboxBaseSectionComponentProps.t -> Jsx.element) ->
        ?modal:bool Check.value ->
        ?preventScroll:bool Check.value ->
        ?forceMount:bool Check.value ->
        ?debounceOptionsMillisecond:float Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/search"]
  end

  (** A component used to render the label of a listbox option group.
      It won't be focusable using arrow keys. *)
  module Section = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Section"
    [@@mel.module "@kobalte/core/search"]
  end

  external use_search_context : unit -> Types.SearchContextValue.t = "useSearchContext"
  [@@mel.module "@kobalte/core/search"]
end

module SegmentedControl = struct
  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Description"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  module Indicator = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Indicator"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  module Item = struct
    module Props = struct
      external check :
        value:string Check.value ->
        ?disabled:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Item"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  (** The element that visually represents a radio button. *)
  module ItemControl = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemControl"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  (** The description that gives the user more information on the radio button. *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  (** The visual indicator rendered when the radio item is in a checked state.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module ItemIndicator = struct
    module Props = struct
      external check :
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemIndicator"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  module ItemInput = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemInput"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  (** The label that gives the user information on the radio button. *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  (** The label that gives the user information on the radio group. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Label"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:string Check.value ->
        ?defaultValue:string Check.value ->
        ?onChange:(string -> unit) ->
        ?orientation:[ `horizontal | `vertical ] Check.value ->
        ?id:string Check.value ->
        ?name:string Check.value ->
        ?validationState:[ `valid | `invalid ] Check.value ->
        ?required:bool Check.value ->
        ?disabled:bool Check.value ->
        ?readOnly:bool Check.value ->
        ?ref:((Dom.htmlElement, Dom.htmlElement -> unit) Types.Either.t) Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  external use_segmented_control_context : unit -> Types.SegmentedControlContextValue.t = "useSegmentedControlContext"
  [@@mel.module "@kobalte/core/segmented-control"]
end

module Select = struct
  (** An optional arrow element to render alongside the popper content.
      Must be rendered in the popper content. *)
  module Arrow = struct
    module Props = struct
      external check :
        ?size:float Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/select"]
  end

  (** The component that pops out when the select is open. *)
  module Content = struct
    module Props = struct
      external check :
        ?onCloseAutoFocus:(Dom.event -> unit) ->
        ?onPointerDownOutside:(Dom.customEvent -> unit) ->
        ?onFocusOutside:(Dom.customEvent -> unit) ->
        ?onInteractOutside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Content"
    [@@mel.module "@kobalte/core/select"]
  end

  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Description"
    [@@mel.module "@kobalte/core/select"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/select"]
  end

  module HiddenSelect = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Select.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "HiddenSelect"
    [@@mel.module "@kobalte/core/select"]
  end

  (** A small icon often displayed next to the value as a visual affordance for the fact it can be open.
      It renders a `▼` by default, but you can use your own icon `children`. *)
  module Icon = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Icon"
    [@@mel.module "@kobalte/core/select"]
  end

  (** An item of the listbox. *)
  module Item = struct
    module Props = struct
      external check :
        item:_ Types.CollectionNode.t Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Item"
    [@@mel.module "@kobalte/core/select"]
  end

  (** An optional accessible description to be announced for the item.
      Useful for items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/select"]
  end

  (** The visual indicator rendered when the item is selected.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module ItemIndicator = struct
    module Props = struct
      external check :
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemIndicator"
    [@@mel.module "@kobalte/core/select"]
  end

  (** An accessible label to be announced for the item.
      Useful for items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/select"]
  end

  (** The label that gives the user information on the select. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Label"
    [@@mel.module "@kobalte/core/select"]
  end

  (** Contains all the items of a `Select`. *)
  module Listbox = struct
    module Props = struct
      external check :
        ?scrollRef:Dom.htmlElement option Solid.accessor Check.value ->
        ?scrollToItem:(string -> unit) ->
        (?children:(('option, 'opt_group) Types.Either.t Types.CollectionNode.t Types.Collection.t Solid.accessor -> Jsx.element, [ `render ]) Check.children -> unit -> unit) Html.Ul.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Listbox"
    [@@mel.module "@kobalte/core/select"]
  end

  (** Portals its children into the `body` when the select is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Check.value ->
        ?useShadow:bool Check.value ->
        ?isSVG:bool Check.value ->
        children:('f, [ `nodes ]) Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/select"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:'option Js.Nullable.t Check.value ->
        ?defaultValue:'option Check.value ->
        ?onChange:('option Js.Nullable.t -> unit) ->
        ?id:string Check.value ->
        ?disabled:bool Check.value ->
        ?name:string Check.value ->
        ?validationState:[ `valid | `invalid ] Check.value ->
        ?required:bool Check.value ->
        ?readOnly:bool Check.value ->
        ?getAnchorRect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Check.value ->
        ?gutter:float Check.value ->
        ?shift:float Check.value ->
        ?flip:(string, bool) Types.Either.t Check.value ->
        ?slide:bool Check.value ->
        ?overlap:bool Check.value ->
        ?sameWidth:bool Check.value ->
        ?fitViewport:bool Check.value ->
        ?hideWhenDetached:bool Check.value ->
        ?detachedPadding:float Check.value ->
        ?arrowPadding:float Check.value ->
        ?overflowPadding:float Check.value ->
        ?open_:bool Check.value ->
        ?defaultOpen:bool Check.value ->
        ?onOpenChange:(bool -> unit) ->
        ?placeholder:Jsx.element Check.value ->
        options:('option, 'opt_group) Types.Either.t array Check.value ->
        ?optionValue:('option -> (string, float) Types.Either.t) ->
        ?optionTextValue:('option -> string) ->
        ?optionDisabled:('option -> bool) ->
        ?optionGroupChildren:string Check.value ->
        ?keyboardDelegate:Types.KeyboardDelegate.t Check.value ->
        ?shouldFocusWrap:bool Check.value ->
        ?selectionBehavior:[ `toggle | `replace ] Check.value ->
        ?allowDuplicateSelectionEvents:bool Check.value ->
        ?disallowEmptySelection:bool Check.value ->
        ?closeOnSelection:bool Check.value ->
        ?virtualized:bool Check.value ->
        ?itemComponent:('option Types.SelectBaseItemComponentProps.t -> Jsx.element) ->
        ?sectionComponent:('opt_group Types.SelectBaseSectionComponentProps.t -> Jsx.element) ->
        ?modal:bool Check.value ->
        ?preventScroll:bool Check.value ->
        ?forceMount:bool Check.value ->
        ?disallowTypeAhead:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/select"]
  end

  module Root_multiple = struct
    module Props = struct
      external check :
        ?value:'option array Check.value ->
        ?defaultValue:'option array Check.value ->
        ?onChange:('option array -> unit) ->
        multiple:bool Check.value ->
        ?id:string Check.value ->
        ?disabled:bool Check.value ->
        ?name:string Check.value ->
        ?validationState:[ `valid | `invalid ] Check.value ->
        ?required:bool Check.value ->
        ?readOnly:bool Check.value ->
        ?getAnchorRect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Check.value ->
        ?gutter:float Check.value ->
        ?shift:float Check.value ->
        ?flip:(string, bool) Types.Either.t Check.value ->
        ?slide:bool Check.value ->
        ?overlap:bool Check.value ->
        ?sameWidth:bool Check.value ->
        ?fitViewport:bool Check.value ->
        ?hideWhenDetached:bool Check.value ->
        ?detachedPadding:float Check.value ->
        ?arrowPadding:float Check.value ->
        ?overflowPadding:float Check.value ->
        ?open_:bool Check.value ->
        ?defaultOpen:bool Check.value ->
        ?onOpenChange:(bool -> unit) ->
        ?placeholder:Jsx.element Check.value ->
        options:('option, 'opt_group) Types.Either.t array Check.value ->
        ?optionValue:('option -> (string, float) Types.Either.t) ->
        ?optionTextValue:('option -> string) ->
        ?optionDisabled:('option -> bool) ->
        ?optionGroupChildren:string Check.value ->
        ?keyboardDelegate:Types.KeyboardDelegate.t Check.value ->
        ?shouldFocusWrap:bool Check.value ->
        ?selectionBehavior:[ `toggle | `replace ] Check.value ->
        ?allowDuplicateSelectionEvents:bool Check.value ->
        ?disallowEmptySelection:bool Check.value ->
        ?closeOnSelection:bool Check.value ->
        ?virtualized:bool Check.value ->
        ?itemComponent:('option Types.SelectBaseItemComponentProps.t -> Jsx.element) ->
        ?sectionComponent:('opt_group Types.SelectBaseSectionComponentProps.t -> Jsx.element) ->
        ?modal:bool Check.value ->
        ?preventScroll:bool Check.value ->
        ?forceMount:bool Check.value ->
        ?disallowTypeAhead:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/select"]
  end

  (** A component used to render the label of a listbox option group.
      It won't be focusable using arrow keys. *)
  module Section = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Section"
    [@@mel.module "@kobalte/core/select"]
  end

  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/select"]
  end

  (** The part that reflects the selected value(s). *)
  module Value = struct
    module Props = struct
      external check :
        (?children:('option Types.SelectValueState.t -> Jsx.element, [ `nodes | `render ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Value"
    [@@mel.module "@kobalte/core/select"]
  end

  external use_select_context : unit -> Types.SelectContextValue.t = "useSelectContext"
  [@@mel.module "@kobalte/core/select"]
end

module Separator = struct
  (** A separator visually or semantically separates content. *)
  module Root = struct
    module Props = struct
      external check :
        ?orientation:[ `horizontal | `vertical ] Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Hr.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/separator"]
  end
end

module Skeleton = struct
  module Root = struct
    module Props = struct
      external check :
        ?visible:bool Check.value ->
        ?width:float Check.value ->
        ?height:float Check.value ->
        ?circle:bool Check.value ->
        ?radius:float Check.value ->
        ?animate:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/skeleton"]
  end
end

module Slider = struct
  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Description"
    [@@mel.module "@kobalte/core/slider"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/slider"]
  end

  (** The component that visually represents the slider value.
      Used to visually show the fill of `Slider.Track`. *)
  module Fill = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Fill"
    [@@mel.module "@kobalte/core/slider"]
  end

  (** The native html input that is visually hidden in the slider thumb. *)
  module Input = struct
    module Props = struct
      external check :
        ?style:string Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Input"
    [@@mel.module "@kobalte/core/slider"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Label"
    [@@mel.module "@kobalte/core/slider"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:float array Check.value ->
        ?defaultValue:float array Check.value ->
        ?onChange:(float array -> unit) ->
        ?onChangeEnd:(float array -> unit) ->
        ?inverted:bool Check.value ->
        ?minValue:float Check.value ->
        ?maxValue:float Check.value ->
        ?step:float Check.value ->
        ?minStepsBetweenThumbs:float Check.value ->
        ?getValueLabel:(Types.GetValueLabelParams2.t -> string) ->
        ?orientation:[ `horizontal | `vertical ] Check.value ->
        ?id:string Check.value ->
        ?name:string Check.value ->
        ?validationState:[ `valid | `invalid ] Check.value ->
        ?required:bool Check.value ->
        ?disabled:bool Check.value ->
        ?readOnly:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/slider"]
  end

  module Thumb = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Thumb"
    [@@mel.module "@kobalte/core/slider"]
  end

  (** The component that visually represents the slider track.
      Act as a container for `Slider.Fill`. *)
  module Track = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Track"
    [@@mel.module "@kobalte/core/slider"]
  end

  (** The accessible label text representing the current value in a human-readable format. *)
  module ValueLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ValueLabel"
    [@@mel.module "@kobalte/core/slider"]
  end

  external use_slider_context : unit -> Types.SliderContextValue.t = "useSliderContext"
  [@@mel.module "@kobalte/core/slider"]
end

module SpinButton = struct
  module Root = struct
    module Props = struct
      external check :
        ?translations:Types.ColorChannelField_Root_Translations.t Check.value ->
        ?value:(string, float) Types.Either.t Check.value ->
        ?textValue:string Check.value ->
        ?minValue:float Check.value ->
        ?maxValue:float Check.value ->
        ?validationState:[ `valid | `invalid ] Check.value ->
        ?required:bool Check.value ->
        ?disabled:bool Check.value ->
        ?readOnly:bool Check.value ->
        ?onIncrement:(unit -> unit) ->
        ?onIncrementPage:(unit -> unit) ->
        ?onDecrement:(unit -> unit) ->
        ?onDecrementPage:(unit -> unit) ->
        ?onDecrementToMin:(unit -> unit) ->
        ?onIncrementToMax:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/spin-button"]
  end
end

module Switch = struct
  (** The element that visually represents a switch. *)
  module Control = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Control"
    [@@mel.module "@kobalte/core/switch"]
  end

  (** The description that gives the user more information on the switch. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Description"
    [@@mel.module "@kobalte/core/switch"]
  end

  (** The error message that gives the user information about how to fix a validation error on the switch. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/switch"]
  end

  (** The native html input that is visually hidden in the switch. *)
  module Input = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Input"
    [@@mel.module "@kobalte/core/switch"]
  end

  (** The label that gives the user information on the switch. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Label"
    [@@mel.module "@kobalte/core/switch"]
  end

  (** A control that allows users to choose one of two values: on or off. *)
  module Root = struct
    module Props = struct
      external check :
        ?checked:bool Check.value ->
        ?defaultChecked:bool Check.value ->
        ?onChange:(bool -> unit) ->
        ?value:string Check.value ->
        ?name:string Check.value ->
        ?validationState:[ `valid | `invalid ] Check.value ->
        ?required:bool Check.value ->
        ?disabled:bool Check.value ->
        ?readOnly:bool Check.value ->
        (?children:(Types.SwitchRootState.t -> Jsx.element, [ `nodes | `render ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/switch"]
  end

  (** The thumb that is used to visually indicate whether the switch is on or off. *)
  module Thumb = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Thumb"
    [@@mel.module "@kobalte/core/switch"]
  end

  external use_switch_context : unit -> Types.SwitchContextValue.t = "useSwitchContext"
  [@@mel.module "@kobalte/core/switch"]
end

module Tabs = struct
  (** Contains the content associated with a tab trigger. *)
  module Content = struct
    module Props = struct
      external check :
        value:string Check.value ->
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Content"
    [@@mel.module "@kobalte/core/tabs"]
  end

  (** The visual indicator displayed at the bottom of the tab list to indicate the selected tab.
      It provides the base style needed to display a smooth transition to the new selected tab. *)
  module Indicator = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Indicator"
    [@@mel.module "@kobalte/core/tabs"]
  end

  (** Contains the tabs that are aligned along the edge of the active tab panel. *)
  module List = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "List"
    [@@mel.module "@kobalte/core/tabs"]
  end

  (** A set of layered sections of content, known as tab panels, that display one panel of content at a time.
      `Tabs` contains all the parts of a tabs component and provide context for its children. *)
  module Root = struct
    module Props = struct
      external check :
        ?value:string Check.value ->
        ?defaultValue:string Check.value ->
        ?onChange:(string -> unit) ->
        ?orientation:[ `horizontal | `vertical ] Check.value ->
        ?activationMode:[ `manual | `automatic ] Check.value ->
        ?disabled:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/tabs"]
  end

  (** The button that activates its associated tab panel. *)
  module Trigger = struct
    module Props = struct
      external check :
        value:string Check.value ->
        ?disabled:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/tabs"]
  end

  external use_tabs_context : unit -> Types.TabsContextValue.t = "useTabsContext"
  [@@mel.module "@kobalte/core/tabs"]
end

module TextField = struct
  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Description"
    [@@mel.module "@kobalte/core/text-field"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/text-field"]
  end

  module Input = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Input"
    [@@mel.module "@kobalte/core/text-field"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Label"
    [@@mel.module "@kobalte/core/text-field"]
  end

  (** A text input that allow users to input custom text entries with a keyboard. *)
  module Root = struct
    module Props = struct
      external check :
        ?value:string Check.value ->
        ?defaultValue:string Check.value ->
        ?onChange:(string -> unit) ->
        ?id:string Check.value ->
        ?name:string Check.value ->
        ?validationState:[ `valid | `invalid ] Check.value ->
        ?required:bool Check.value ->
        ?disabled:bool Check.value ->
        ?readOnly:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/text-field"]
  end

  (** The native html textarea of the textfield. *)
  module TextArea = struct
    module Props = struct
      external check :
        ?autoResize:bool Check.value ->
        ?submitOnEnter:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Textarea.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "TextArea"
    [@@mel.module "@kobalte/core/text-field"]
  end

  external use_text_field_context : unit -> Types.TextFieldContextValue.t = "useTextFieldContext"
  [@@mel.module "@kobalte/core/text-field"]
end

module TimeField = struct
  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Description"
    [@@mel.module "@kobalte/core/time-field"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?forceMount:bool Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/time-field"]
  end

  module HiddenInput = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "HiddenInput"
    [@@mel.module "@kobalte/core/time-field"]
  end

  module Input = struct
    module Props = struct
      external check :
        (?children:([ `hour | `minute | `second | `dayPeriod ] Solid.accessor -> Jsx.element, [ `render ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Input"
    [@@mel.module "@kobalte/core/time-field"]
  end

  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Label"
    [@@mel.module "@kobalte/core/time-field"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:Types.Time.t Check.value ->
        ?defaultValue:Types.Time.t Check.value ->
        ?onChange:(Types.Time.t -> unit) ->
        ?hourCycle:float Check.value ->
        ?granularity:([ `hour | `minute | `second ], Types.TimeField_Root_Granularity.t) Types.Either.t Check.value ->
        ?forceLeadingZeros:bool Check.value ->
        ?placeholder:Types.Time.t Check.value ->
        ?min:Types.Time.t Check.value ->
        ?max:Types.Time.t Check.value ->
        ?id:string Check.value ->
        ?name:string Check.value ->
        ?validationState:[ `valid | `invalid ] Check.value ->
        ?required:bool Check.value ->
        ?disabled:bool Check.value ->
        ?readOnly:bool Check.value ->
        ?translations:Types.TimeField_Root_Translations.t Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/time-field"]
  end

  module Segment = struct
    module Props = struct
      external check :
        segment:[ `hour | `minute | `second | `dayPeriod ] Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Segment"
    [@@mel.module "@kobalte/core/time-field"]
  end
end

module Toast = struct
  (** The button that closes the toast. *)
  module CloseButton = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "CloseButton"
    [@@mel.module "@kobalte/core/toast"]
  end

  (** An optional accessible description to be announced when the toast is open. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Description"
    [@@mel.module "@kobalte/core/toast"]
  end

  (** The list containing all rendered toasts.
      Must be inside a `Toast.Region`. *)
  module List = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Ol.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "List"
    [@@mel.module "@kobalte/core/toast"]
  end

  (** The component that visually represents the toast remaining lifetime.
      Used to visually show the fill of `Toast.ProgressTrack`. *)
  module ProgressFill = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ProgressFill"
    [@@mel.module "@kobalte/core/toast"]
  end

  (** The component that visually represents the toast lifetime.
      Act as a container for `Toast.ProgressFill`. *)
  module ProgressTrack = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "ProgressTrack"
    [@@mel.module "@kobalte/core/toast"]
  end

  (** The fixed area where toasts appear. Users can jump to by pressing a hotkey.
      It is up to you to ensure the discoverability of the hotkey for keyboard users. *)
  module Region = struct
    module Props = struct
      external check :
        ?translations:Types.Toast_Region_Translations.t Check.value ->
        ?hotkey:string array Check.value ->
        ?duration:float Check.value ->
        ?limit:float Check.value ->
        ?swipeDirection:[ `left | `right | `up | `down ] Check.value ->
        ?swipeThreshold:float Check.value ->
        ?pauseOnInteraction:bool Check.value ->
        ?pauseOnPageIdle:bool Check.value ->
        ?topLayer:bool Check.value ->
        ?regionId:string Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Region"
    [@@mel.module "@kobalte/core/toast"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?translations:Types.Toast_Root_Translations.t Check.value ->
        toastId:float Check.value ->
        ?priority:[ `high | `low ] Check.value ->
        ?duration:float Check.value ->
        ?persistent:bool Check.value ->
        ?onPause:(unit -> unit) ->
        ?onResume:(unit -> unit) ->
        ?onSwipeStart:(Types.SwipeEvent.t -> unit) ->
        ?onSwipeMove:(Types.SwipeEvent.t -> unit) ->
        ?onSwipeCancel:(Types.SwipeEvent.t -> unit) ->
        ?onSwipeEnd:(Types.SwipeEvent.t -> unit) ->
        ?onEscapeKeyDown:(Dom.keyboardEvent -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/toast"]
  end

  (** An accessible title to be announced when the toast is open. *)
  module Title = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Title"
    [@@mel.module "@kobalte/core/toast"]
  end

  external toaster : Types.Toast_Toaster.t = "toaster"
  [@@mel.module "@kobalte/core/toast"]

  external use_toast_context : unit -> Types.ToastContextValue.t = "useToastContext"
  [@@mel.module "@kobalte/core/toast"]
end

module ToggleButton = struct
  (** A two-state button that allow users to toggle a selection on or off.
      This component is based on the \[WAI-ARIA Button Pattern\](https://www.w3.org/WAI/ARIA/apg/patterns/button/) *)
  module Root = struct
    module Props = struct
      external check :
        ?pressed:bool Check.value ->
        ?defaultPressed:bool Check.value ->
        ?onChange:(bool -> unit) ->
        (?children:(Types.ToggleButtonRootState.t -> Jsx.element, [ `nodes | `render ]) Check.children -> unit -> unit) Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/toggle-button"]
  end
end

module ToggleGroup = struct
  module Item = struct
    module Props = struct
      external check :
        value:string Check.value ->
        (?children:(Types.ToggleButtonRootState.t -> Jsx.element, [ `nodes | `render ]) Check.children -> unit -> unit) Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Item"
    [@@mel.module "@kobalte/core/toggle-group"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:string Js.Nullable.t Check.value ->
        ?defaultValue:string Check.value ->
        ?onChange:(string Js.Nullable.t -> unit) ->
        ?disabled:bool Check.value ->
        ?orientation:[ `horizontal | `vertical ] Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/toggle-group"]
  end

  module Root_multiple = struct
    module Props = struct
      external check :
        ?value:string array Check.value ->
        ?defaultValue:string array Check.value ->
        ?onChange:(string array -> unit) ->
        multiple:bool Check.value ->
        ?disabled:bool Check.value ->
        ?orientation:[ `horizontal | `vertical ] Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/toggle-group"]
  end

  external use_toggle_group_context : unit -> Types.ToggleGroupContextValue.t = "useToggleGroupContext"
  [@@mel.module "@kobalte/core/toggle-group"]
end

module Tooltip = struct
  (** An optional arrow element to render alongside the popper content.
      Must be rendered in the popper content. *)
  module Arrow = struct
    module Props = struct
      external check :
        ?size:float Check.value ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/tooltip"]
  end

  (** Contains the content to be rendered when the tooltip is open. *)
  module Content = struct
    module Props = struct
      external check :
        ?onEscapeKeyDown:(Dom.keyboardEvent -> unit) ->
        ?onPointerDownOutside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Content"
    [@@mel.module "@kobalte/core/tooltip"]
  end

  (** Portals its children into the `body` when the tooltip is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Check.value ->
        ?useShadow:bool Check.value ->
        ?isSVG:bool Check.value ->
        children:('f, [ `nodes ]) Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/tooltip"]
  end

  (** A popup that displays information related to an element
      when the element receives keyboard focus or the mouse hovers over it. *)
  module Root = struct
    module Props = struct
      external check :
        ?open_:bool Check.value ->
        ?defaultOpen:bool Check.value ->
        ?onOpenChange:(bool -> unit) ->
        ?disabled:bool Check.value ->
        ?triggerOnFocusOnly:bool Check.value ->
        ?openDelay:float Check.value ->
        ?closeDelay:float Check.value ->
        ?skipDelayDuration:float Check.value ->
        ?ignoreSafeArea:bool Check.value ->
        ?forceMount:bool Check.value ->
        ?id:string Check.value ->
        ?onCurrentPlacementChange:(string -> unit) ->
        ?getAnchorRect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Check.value ->
        ?gutter:float Check.value ->
        ?shift:float Check.value ->
        ?flip:(string, bool) Types.Either.t Check.value ->
        ?slide:bool Check.value ->
        ?overlap:bool Check.value ->
        ?sameWidth:bool Check.value ->
        ?fitViewport:bool Check.value ->
        ?hideWhenDetached:bool Check.value ->
        ?detachedPadding:float Check.value ->
        ?arrowPadding:float Check.value ->
        ?overflowPadding:float Check.value ->
        ?children:('f, [ `nodes ]) Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Root"
    [@@mel.module "@kobalte/core/tooltip"]
  end

  (** The button that opens the tooltip when hovered. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Check.children -> unit -> unit) Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/tooltip"]
  end

  external use_tooltip_context : unit -> Types.TooltipContextValue.t = "useTooltipContext"
  [@@mel.module "@kobalte/core/tooltip"]
end
