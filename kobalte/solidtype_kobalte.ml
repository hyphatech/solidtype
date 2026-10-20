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
    external list_state : t -> t_list_state Solidtype.Solid.accessor = "listState" [@@mel.get]
    external generate_id : t -> string -> string = "generateId" [@@mel.send]
    external make : list_state:(t_list_state Solidtype.Solid.accessor [@mel.as "listState"]) -> generate_id:((string -> string) [@mel.as "generateId"]) -> unit -> t = "" [@@mel.obj]
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
    external to_string : t -> [ `rgb | `hsl | `hsb | `hex | `hexa | `rgba | `hsla | `hsba | `css ] option -> string = "toString" [@@mel.send]
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
    external get : t -> [ `light | `dark | `system ] option -> [ `light | `dark | `system ] option = "get" [@@mel.send]
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
    external open_ : t -> ([ `first | `last ], bool) either -> [ `focus | `input | `manual ] option -> unit = "open" [@@mel.send]
    external close : t -> unit -> unit = "close" [@@mel.send]
    external toggle : t -> ([ `first | `last ], bool) either -> [ `focus | `input | `manual ] option -> unit = "toggle" [@@mel.send]
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
        
        \[MDN Reference\](https://developer.mozilla.org/docs/Web/API/CustomEvent/detail)
        Any custom data the event was created with. Typically used for synthetic events. *)
    external detail : t -> t_swipe_event_detail = "detail" [@@mel.get]
    external init_custom_event : t -> string -> bool option -> bool option -> t_swipe_event_detail option -> unit = "initCustomEvent" [@@mel.send]
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
    external init_event : t -> string -> bool option -> bool option -> unit = "initEvent" [@@mel.send]
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
    external show : t -> (t_toast_component_props -> Solidtype.Jsx.element) -> t_show_toast_options option -> float = "show" [@@mel.send]
    external update : t -> float -> (t_toast_component_props -> Solidtype.Jsx.element) -> unit = "update" [@@mel.send]
    external promise : t -> (('t Js.Promise.t, unit -> 't Js.Promise.t) either) -> (('t, 'u) t_toast_promise_component_props -> Solidtype.Jsx.element) -> t_show_toast_options option -> float = "promise" [@@mel.send]
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
    external open_tooltip : t -> bool option -> unit = "openTooltip" [@@mel.send]
    external hide_tooltip : t -> bool option -> unit = "hideTooltip" [@@mel.send]
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
    external children : ('p, 'c) t -> Solidtype.Jsx.element = "children" [@@mel.get]
    external make : value:('t [@mel.as "value"]) -> children:(Solidtype.Jsx.element [@mel.as "children"]) -> unit -> ('p, 'c) t = "" [@@mel.obj]
  end

  module Context_Provider = struct
    type t = t_context_provider
    external value : t -> 't = "value" [@@mel.get]
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
    external increment_thumb : t -> float -> float option -> unit = "incrementThumb" [@@mel.send]
    external decrement_thumb : t -> float -> float option -> unit = "decrementThumb" [@@mel.send]
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
    external read_u_int_be_js : 't_array_buffer t -> float -> float -> float = "readUIntBE" [@@mel.send]
    (** Reads `byteLength` number of bytes from `buf` at the specified `offset` and interprets the result as an unsigned big-endian integer supporting
        up to 48 bits of accuracy.
        
        This function is also available under the `readUintBE` alias.
        
        ```js
        import \{ Buffer \} from 'node:buffer';
        
        const buf = Buffer.from(\[0x12, 0x34, 0x56, 0x78, 0x90, 0xab\]);
        
        console.log(buf.readUIntBE(0, 6).toString(16));
        // Prints: 1234567890ab
        console.log(buf.readUIntBE(1, 6).toString(16));
        // Throws ERR_OUT_OF_RANGE.
        ```
        
        @raise Invalid_argument with Kobalte's message, where it throws. *)
    let read_u_int_be o x0 x1 =
      match read_u_int_be_js o x0 x1 with
      | v -> v
      | exception Js.Exn.Error e -> invalid_arg ("read_u_int_be: " ^ Option.value (Js.Exn.message e) ~default:"")
    external read_uint_be : 't_array_buffer t -> float -> float -> float = "readUintBE" [@@mel.send]
    external read_int_le : 't_array_buffer t -> float -> float -> float = "readIntLE" [@@mel.send]
    external read_int_be_js : 't_array_buffer t -> float -> float -> float = "readIntBE" [@@mel.send]
    (** Reads `byteLength` number of bytes from `buf` at the specified `offset` and interprets the result as a big-endian, two's complement signed value
        supporting up to 48 bits of accuracy.
        
        ```js
        import \{ Buffer \} from 'node:buffer';
        
        const buf = Buffer.from(\[0x12, 0x34, 0x56, 0x78, 0x90, 0xab\]);
        
        console.log(buf.readIntBE(0, 6).toString(16));
        // Prints: 1234567890ab
        console.log(buf.readIntBE(1, 6).toString(16));
        // Throws ERR_OUT_OF_RANGE.
        console.log(buf.readIntBE(1, 0).toString(16));
        // Throws ERR_OUT_OF_RANGE.
        ```
        
        @raise Invalid_argument with Kobalte's message, where it throws. *)
    let read_int_be o x0 x1 =
      match read_int_be_js o x0 x1 with
      | v -> v
      | exception Js.Exn.Error e -> invalid_arg ("read_int_be: " ^ Option.value (Js.Exn.message e) ~default:"")
    external read_u_int8_js : 't_array_buffer t -> float option -> float = "readUInt8" [@@mel.send]
    (** Reads an unsigned 8-bit integer from `buf` at the specified `offset`.
        
        This function is also available under the `readUint8` alias.
        
        ```js
        import \{ Buffer \} from 'node:buffer';
        
        const buf = Buffer.from(\[1, -2\]);
        
        console.log(buf.readUInt8(0));
        // Prints: 1
        console.log(buf.readUInt8(1));
        // Prints: 254
        console.log(buf.readUInt8(2));
        // Throws ERR_OUT_OF_RANGE.
        ```
        
        @raise Invalid_argument with Kobalte's message, where it throws. *)
    let read_u_int8 o x0 =
      match read_u_int8_js o x0 with
      | v -> v
      | exception Js.Exn.Error e -> invalid_arg ("read_u_int8: " ^ Option.value (Js.Exn.message e) ~default:"")
    external read_uint8 : 't_array_buffer t -> float option -> float = "readUint8" [@@mel.send]
    external read_u_int16_le_js : 't_array_buffer t -> float option -> float = "readUInt16LE" [@@mel.send]
    (** Reads an unsigned, little-endian 16-bit integer from `buf` at the specified `offset`.
        
        This function is also available under the `readUint16LE` alias.
        
        ```js
        import \{ Buffer \} from 'node:buffer';
        
        const buf = Buffer.from(\[0x12, 0x34, 0x56\]);
        
        console.log(buf.readUInt16LE(0).toString(16));
        // Prints: 3412
        console.log(buf.readUInt16LE(1).toString(16));
        // Prints: 5634
        console.log(buf.readUInt16LE(2).toString(16));
        // Throws ERR_OUT_OF_RANGE.
        ```
        
        @raise Invalid_argument with Kobalte's message, where it throws. *)
    let read_u_int16_le o x0 =
      match read_u_int16_le_js o x0 with
      | v -> v
      | exception Js.Exn.Error e -> invalid_arg ("read_u_int16_le: " ^ Option.value (Js.Exn.message e) ~default:"")
    external read_uint16_le : 't_array_buffer t -> float option -> float = "readUint16LE" [@@mel.send]
    external read_u_int16_be : 't_array_buffer t -> float option -> float = "readUInt16BE" [@@mel.send]
    external read_uint16_be : 't_array_buffer t -> float option -> float = "readUint16BE" [@@mel.send]
    external read_u_int32_le_js : 't_array_buffer t -> float option -> float = "readUInt32LE" [@@mel.send]
    (** Reads an unsigned, little-endian 32-bit integer from `buf` at the specified`offset`.
        
        This function is also available under the `readUint32LE` alias.
        
        ```js
        import \{ Buffer \} from 'node:buffer';
        
        const buf = Buffer.from(\[0x12, 0x34, 0x56, 0x78\]);
        
        console.log(buf.readUInt32LE(0).toString(16));
        // Prints: 78563412
        console.log(buf.readUInt32LE(1).toString(16));
        // Throws ERR_OUT_OF_RANGE.
        ```
        
        @raise Invalid_argument with Kobalte's message, where it throws. *)
    let read_u_int32_le o x0 =
      match read_u_int32_le_js o x0 with
      | v -> v
      | exception Js.Exn.Error e -> invalid_arg ("read_u_int32_le: " ^ Option.value (Js.Exn.message e) ~default:"")
    external read_uint32_le : 't_array_buffer t -> float option -> float = "readUint32LE" [@@mel.send]
    external read_u_int32_be : 't_array_buffer t -> float option -> float = "readUInt32BE" [@@mel.send]
    external read_uint32_be : 't_array_buffer t -> float option -> float = "readUint32BE" [@@mel.send]
    external read_int8_js : 't_array_buffer t -> float option -> float = "readInt8" [@@mel.send]
    (** Reads a signed 8-bit integer from `buf` at the specified `offset`.
        
        Integers read from a `Buffer` are interpreted as two's complement signed values.
        
        ```js
        import \{ Buffer \} from 'node:buffer';
        
        const buf = Buffer.from(\[-1, 5\]);
        
        console.log(buf.readInt8(0));
        // Prints: -1
        console.log(buf.readInt8(1));
        // Prints: 5
        console.log(buf.readInt8(2));
        // Throws ERR_OUT_OF_RANGE.
        ```
        
        @raise Invalid_argument with Kobalte's message, where it throws. *)
    let read_int8 o x0 =
      match read_int8_js o x0 with
      | v -> v
      | exception Js.Exn.Error e -> invalid_arg ("read_int8: " ^ Option.value (Js.Exn.message e) ~default:"")
    external read_int16_le_js : 't_array_buffer t -> float option -> float = "readInt16LE" [@@mel.send]
    (** Reads a signed, little-endian 16-bit integer from `buf` at the specified`offset`.
        
        Integers read from a `Buffer` are interpreted as two's complement signed values.
        
        ```js
        import \{ Buffer \} from 'node:buffer';
        
        const buf = Buffer.from(\[0, 5\]);
        
        console.log(buf.readInt16LE(0));
        // Prints: 1280
        console.log(buf.readInt16LE(1));
        // Throws ERR_OUT_OF_RANGE.
        ```
        
        @raise Invalid_argument with Kobalte's message, where it throws. *)
    let read_int16_le o x0 =
      match read_int16_le_js o x0 with
      | v -> v
      | exception Js.Exn.Error e -> invalid_arg ("read_int16_le: " ^ Option.value (Js.Exn.message e) ~default:"")
    external read_int16_be : 't_array_buffer t -> float option -> float = "readInt16BE" [@@mel.send]
    external read_int32_le_js : 't_array_buffer t -> float option -> float = "readInt32LE" [@@mel.send]
    (** Reads a signed, little-endian 32-bit integer from `buf` at the specified`offset`.
        
        Integers read from a `Buffer` are interpreted as two's complement signed values.
        
        ```js
        import \{ Buffer \} from 'node:buffer';
        
        const buf = Buffer.from(\[0, 0, 0, 5\]);
        
        console.log(buf.readInt32LE(0));
        // Prints: 83886080
        console.log(buf.readInt32LE(1));
        // Throws ERR_OUT_OF_RANGE.
        ```
        
        @raise Invalid_argument with Kobalte's message, where it throws. *)
    let read_int32_le o x0 =
      match read_int32_le_js o x0 with
      | v -> v
      | exception Js.Exn.Error e -> invalid_arg ("read_int32_le: " ^ Option.value (Js.Exn.message e) ~default:"")
    external read_int32_be : 't_array_buffer t -> float option -> float = "readInt32BE" [@@mel.send]
    external read_float_le_js : 't_array_buffer t -> float option -> float = "readFloatLE" [@@mel.send]
    (** Reads a 32-bit, little-endian float from `buf` at the specified `offset`.
        
        ```js
        import \{ Buffer \} from 'node:buffer';
        
        const buf = Buffer.from(\[1, 2, 3, 4\]);
        
        console.log(buf.readFloatLE(0));
        // Prints: 1.539989614439558e-36
        console.log(buf.readFloatLE(1));
        // Throws ERR_OUT_OF_RANGE.
        ```
        
        @raise Invalid_argument with Kobalte's message, where it throws. *)
    let read_float_le o x0 =
      match read_float_le_js o x0 with
      | v -> v
      | exception Js.Exn.Error e -> invalid_arg ("read_float_le: " ^ Option.value (Js.Exn.message e) ~default:"")
    external read_float_be : 't_array_buffer t -> float option -> float = "readFloatBE" [@@mel.send]
    external read_double_le_js : 't_array_buffer t -> float option -> float = "readDoubleLE" [@@mel.send]
    (** Reads a 64-bit, little-endian double from `buf` at the specified `offset`.
        
        ```js
        import \{ Buffer \} from 'node:buffer';
        
        const buf = Buffer.from(\[1, 2, 3, 4, 5, 6, 7, 8\]);
        
        console.log(buf.readDoubleLE(0));
        // Prints: 5.447603722011605e-270
        console.log(buf.readDoubleLE(1));
        // Throws ERR_OUT_OF_RANGE.
        ```
        
        @raise Invalid_argument with Kobalte's message, where it throws. *)
    let read_double_le o x0 =
      match read_double_le_js o x0 with
      | v -> v
      | exception Js.Exn.Error e -> invalid_arg ("read_double_le: " ^ Option.value (Js.Exn.message e) ~default:"")
    external read_double_be : 't_array_buffer t -> float option -> float = "readDoubleBE" [@@mel.send]
    external reverse : 't_array_buffer t -> unit -> 't_array_buffer t_buffer = "reverse" [@@mel.send]
    external swap16_js : 't_array_buffer t -> unit -> 't_array_buffer t_buffer = "swap16" [@@mel.send]
    (** Interprets `buf` as an array of unsigned 16-bit integers and swaps the
        byte order _in-place_. Throws `ERR_INVALID_BUFFER_SIZE` if `buf.length` is not a multiple of 2.
        
        ```js
        import \{ Buffer \} from 'node:buffer';
        
        const buf1 = Buffer.from(\[0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8\]);
        
        console.log(buf1);
        // Prints: <Buffer 01 02 03 04 05 06 07 08>
        
        buf1.swap16();
        
        console.log(buf1);
        // Prints: <Buffer 02 01 04 03 06 05 08 07>
        
        const buf2 = Buffer.from(\[0x1, 0x2, 0x3\]);
        
        buf2.swap16();
        // Throws ERR_INVALID_BUFFER_SIZE.
        ```
        
        One convenient use of `buf.swap16()` is to perform a fast in-place conversion
        between UTF-16 little-endian and UTF-16 big-endian:
        
        ```js
        import \{ Buffer \} from 'node:buffer';
        
        const buf = Buffer.from('This is little-endian UTF-16', 'utf16le');
        buf.swap16(); // Convert to big-endian UTF-16 text.
        ```
        
        @raise Invalid_argument with Kobalte's message, where it throws. *)
    let swap16 o () =
      match swap16_js o () with
      | v -> v
      | exception Js.Exn.Error e -> invalid_arg ("swap16: " ^ Option.value (Js.Exn.message e) ~default:"")
    external swap32_js : 't_array_buffer t -> unit -> 't_array_buffer t_buffer = "swap32" [@@mel.send]
    (** Interprets `buf` as an array of unsigned 32-bit integers and swaps the
        byte order _in-place_. Throws `ERR_INVALID_BUFFER_SIZE` if `buf.length` is not a multiple of 4.
        
        ```js
        import \{ Buffer \} from 'node:buffer';
        
        const buf1 = Buffer.from(\[0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8\]);
        
        console.log(buf1);
        // Prints: <Buffer 01 02 03 04 05 06 07 08>
        
        buf1.swap32();
        
        console.log(buf1);
        // Prints: <Buffer 04 03 02 01 08 07 06 05>
        
        const buf2 = Buffer.from(\[0x1, 0x2, 0x3\]);
        
        buf2.swap32();
        // Throws ERR_INVALID_BUFFER_SIZE.
        ```
        
        @raise Invalid_argument with Kobalte's message, where it throws. *)
    let swap32 o () =
      match swap32_js o () with
      | v -> v
      | exception Js.Exn.Error e -> invalid_arg ("swap32: " ^ Option.value (Js.Exn.message e) ~default:"")
    external swap64_js : 't_array_buffer t -> unit -> 't_array_buffer t_buffer = "swap64" [@@mel.send]
    (** Interprets `buf` as an array of 64-bit numbers and swaps byte order _in-place_.
        Throws `ERR_INVALID_BUFFER_SIZE` if `buf.length` is not a multiple of 8.
        
        ```js
        import \{ Buffer \} from 'node:buffer';
        
        const buf1 = Buffer.from(\[0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8\]);
        
        console.log(buf1);
        // Prints: <Buffer 01 02 03 04 05 06 07 08>
        
        buf1.swap64();
        
        console.log(buf1);
        // Prints: <Buffer 08 07 06 05 04 03 02 01>
        
        const buf2 = Buffer.from(\[0x1, 0x2, 0x3\]);
        
        buf2.swap64();
        // Throws ERR_INVALID_BUFFER_SIZE.
        ```
        
        @raise Invalid_argument with Kobalte's message, where it throws. *)
    let swap64 o () =
      match swap64_js o () with
      | v -> v
      | exception Js.Exn.Error e -> invalid_arg ("swap64: " ^ Option.value (Js.Exn.message e) ~default:"")
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
    external unlink : t -> unit -> unit Js.Promise.t = "unlink" [@@mel.send]
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
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/accordion"]
  end

  (** Wraps an `Accordion.Trigger`.
      Use the `as` prop to update it to the appropriate heading level for your page. *)
  module Header = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.H3.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Header"
    [@@mel.module "@kobalte/core/accordion"]
  end

  (** An item of the accordion, contains all the parts of a collapsible section. *)
  module Item = struct
    module Props = struct
      external check :
        value:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/accordion"]
  end

  (** A vertically stacked set of interactive headings that each reveal an associated section of content. *)
  module Root = struct
    module Props = struct
      external check :
        ?value:string array Solidtype.Check.value ->
        ?default_value:string array Solidtype.Check.value ->
        ?on_change:(string array -> unit) ->
        ?multiple:bool Solidtype.Check.value ->
        ?collapsible:bool Solidtype.Check.value ->
        ?should_focus_wrap:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/accordion"]
  end

  (** Toggles the collapsed state of its associated item. It should be nested inside an `Accordion.Header`. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
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
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/alert"]
  end
end

module AlertDialog = struct
  (** The button that closes the dialog. *)
  module CloseButton = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "CloseButton"
    [@@mel.module "@kobalte/core/alert-dialog"]
  end

  (** Overrides the regular `Dialog.Content` with role="alertdialog" to interrupt the user. *)
  module Content = struct
    module Props = struct
      external check :
        ?on_open_auto_focus:(Dom.event -> unit) ->
        ?on_close_auto_focus:(Dom.event -> unit) ->
        ?on_escape_key_down:(Dom.keyboardEvent -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/alert-dialog"]
  end

  (** An optional accessible description to be announced when the dialog is open. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.P.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/alert-dialog"]
  end

  (** A layer that covers the inert portion of the view when the dialog is open. *)
  module Overlay = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Overlay"
    [@@mel.module "@kobalte/core/alert-dialog"]
  end

  (** Portals its children into the `body` when the dialog is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Solidtype.Check.value ->
        ?use_shadow:bool Solidtype.Check.value ->
        ?is_svg:bool Solidtype.Check.value ->
        children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/alert-dialog"]
  end

  (** A dialog is a window overlaid on either the primary window or another dialog window. *)
  module Root = struct
    module Props = struct
      external check :
        ?translations:Types.AlertDialog_Root_Translations.t Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?id:string Solidtype.Check.value ->
        ?modal:bool Solidtype.Check.value ->
        ?prevent_scroll:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/alert-dialog"]
  end

  (** An accessible title to be announced when the dialog is open. *)
  module Title = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.H2.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Title"
    [@@mel.module "@kobalte/core/alert-dialog"]
  end

  (** The button that opens the dialog. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/alert-dialog"]
  end
end

module Badge = struct
  module Root = struct
    module Props = struct
      external check :
        ?text_value:string Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/badge"]
  end
end

module Breadcrumbs = struct
  (** The breadcrumbs link. *)
  module Link = struct
    module Props = struct
      external check :
        ?current:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.A.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Link"
    [@@mel.module "@kobalte/core/breadcrumbs"]
  end

  (** Breadcrumbs show hierarchy and navigational context for a user’s location within an application. *)
  module Root = struct
    module Props = struct
      external check :
        ?separator:Solidtype.Jsx.element Solidtype.Check.value ->
        ?translations:Types.Breadcrumbs_Root_Translations.t Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Nav.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/breadcrumbs"]
  end

  (** The visual separator between each breadcrumb items.
      It will not be visible by screen readers. *)
  module Separator = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Separator"
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
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/button"]
  end
end

module Checkbox = struct
  (** The element that visually represents a checkbox. *)
  module Control = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Control"
    [@@mel.module "@kobalte/core/checkbox"]
  end

  (** The description that gives the user more information on the checkbox. *)
  module Description = struct
    module Props = struct
      external check :
        ?id:string Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/checkbox"]
  end

  (** The error message that gives the user information about how to fix a validation error on the checkbox. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        ?id:string Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/checkbox"]
  end

  (** The visual indicator rendered when the checkbox is in a checked or indeterminate state.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module Indicator = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Indicator"
    [@@mel.module "@kobalte/core/checkbox"]
  end

  (** The native html input that is visually hidden in the checkbox. *)
  module Input = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Input"
    [@@mel.module "@kobalte/core/checkbox"]
  end

  (** The label that gives the user information on the checkbox. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/checkbox"]
  end

  (** A control that allows the user to toggle between checked and not checked. *)
  module Root = struct
    module Props = struct
      external check :
        ?checked:bool Solidtype.Check.value ->
        ?default_checked:bool Solidtype.Check.value ->
        ?on_change:(bool -> unit) ->
        ?indeterminate:bool Solidtype.Check.value ->
        ?value:string Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        (?children:(Types.CheckboxRootState.t -> Solidtype.Jsx.element, [ `nodes | `render ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
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
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/collapsible"]
  end

  (** An interactive component which expands/collapses a content. *)
  module Root = struct
    module Props = struct
      external check :
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?disabled:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/collapsible"]
  end

  (** The button that expands/collapses the collapsible content. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/collapsible"]
  end

  external use_collapsible_context : unit -> Types.CollapsibleContextValue.t = "useCollapsibleContext"
  [@@mel.module "@kobalte/core/collapsible"]
end

module ColorArea = struct
  module Background = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Background"
    [@@mel.module "@kobalte/core/color-area"]
  end

  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/color-area"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/color-area"]
  end

  module HiddenInputX = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "HiddenInputX"
    [@@mel.module "@kobalte/core/color-area"]
  end

  module HiddenInputY = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "HiddenInputY"
    [@@mel.module "@kobalte/core/color-area"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/color-area"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?translations:Types.ColorArea_Root_Translations.t Solidtype.Check.value ->
        ?value:Types.Color.t Solidtype.Check.value ->
        ?default_value:Types.Color.t Solidtype.Check.value ->
        ?on_change:(Types.Color.t -> unit) ->
        ?on_change_end:(Types.Color.t -> unit) ->
        ?x_channel:[ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] Solidtype.Check.value ->
        ?y_channel:[ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] Solidtype.Check.value ->
        ?color_space:[ `rgb | `hsl | `hsb ] Solidtype.Check.value ->
        ?id:string Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?x_name:string Solidtype.Check.value ->
        ?y_name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/color-area"]
  end

  module Thumb = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Thumb"
    [@@mel.module "@kobalte/core/color-area"]
  end

  external use_color_area_context : unit -> Types.ColorAreaContextValue.t = "useColorAreaContext"
  [@@mel.module "@kobalte/core/color-area"]
end

module ColorChannelField = struct
  module DecrementTrigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "DecrementTrigger"
    [@@mel.module "@kobalte/core/color-channel-field"]
  end

  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/color-channel-field"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/color-channel-field"]
  end

  module HiddenInput = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "HiddenInput"
    [@@mel.module "@kobalte/core/color-channel-field"]
  end

  module IncrementTrigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "IncrementTrigger"
    [@@mel.module "@kobalte/core/color-channel-field"]
  end

  module Input = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Input"
    [@@mel.module "@kobalte/core/color-channel-field"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/color-channel-field"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:Types.Color.t Solidtype.Check.value ->
        ?default_value:Types.Color.t Solidtype.Check.value ->
        ?on_change:(Types.Color.t -> unit) ->
        channel:[ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] Solidtype.Check.value ->
        ?color_space:[ `rgb | `hsl | `hsb ] Solidtype.Check.value ->
        ?id:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?translations:Types.ColorChannelField_Root_Translations.t Solidtype.Check.value ->
        ?min_value:float Solidtype.Check.value ->
        ?max_value:float Solidtype.Check.value ->
        ?step:float Solidtype.Check.value ->
        ?large_step:float Solidtype.Check.value ->
        ?change_on_wheel:bool Solidtype.Check.value ->
        ?format:bool Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/color-channel-field"]
  end
end

module ColorField = struct
  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/color-field"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/color-field"]
  end

  module Input = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Input"
    [@@mel.module "@kobalte/core/color-field"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/color-field"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:string Solidtype.Check.value ->
        ?default_value:string Solidtype.Check.value ->
        ?on_change:(string -> unit) ->
        ?id:string Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
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
        ?initial_color_mode:[ `light | `dark | `system ] Solidtype.Check.value ->
        ?disable_transition_on_change:bool Solidtype.Check.value ->
        ?storage_manager:Types.ColorModeStorageManager.t Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ColorModeProvider"
    [@@mel.module "@kobalte/core/color-mode"]
  end

  module ColorModeScript = struct
    module Props = struct
      external check :
        ?initial_color_mode:[ `light | `dark | `system ] Solidtype.Check.value ->
        ?storage_type:[ `localStorage | `cookie ] Solidtype.Check.value ->
        ?storage_key:string Solidtype.Check.value ->
        ?nonce:string Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ColorModeScript"
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
  external use_color_mode_value : 't_light -> 't_dark -> ('t_light, 't_dark) Types.Either.t Solidtype.Solid.accessor = "useColorModeValue"
  [@@mel.module "@kobalte/core/color-mode"]
end

module ColorSlider = struct
  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/color-slider"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/color-slider"]
  end

  (** The native html input that is visually hidden in the slider thumb. *)
  module Input = struct
    module Props = struct
      external check :
        ?style:string Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Input"
    [@@mel.module "@kobalte/core/color-slider"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/color-slider"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:Types.Color.t Solidtype.Check.value ->
        ?default_value:Types.Color.t Solidtype.Check.value ->
        ?on_change:(Types.Color.t -> unit) ->
        ?on_change_end:(Types.Color.t -> unit) ->
        channel:[ `hue | `saturation | `brightness | `lightness | `red | `green | `blue | `alpha ] Solidtype.Check.value ->
        ?color_space:[ `rgb | `hsl | `hsb ] Solidtype.Check.value ->
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        ?get_value_label:(Types.Color.t -> string) ->
        ?id:string Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        ?translations:Types.ColorSlider_Root_Translations.t Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/color-slider"]
  end

  module Thumb = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Thumb"
    [@@mel.module "@kobalte/core/color-slider"]
  end

  module Track = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Track"
    [@@mel.module "@kobalte/core/color-slider"]
  end

  (** The accessible label text representing the current value in a human-readable format. *)
  module ValueLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ValueLabel"
    [@@mel.module "@kobalte/core/color-slider"]
  end

  external use_color_slider_context : unit -> Types.ColorSliderContextValue.t = "useColorSliderContext"
  [@@mel.module "@kobalte/core/color-slider"]
end

module ColorSwatch = struct
  module Root = struct
    module Props = struct
      external check :
        value:Types.Color.t Solidtype.Check.value ->
        ?color_name:string Solidtype.Check.value ->
        ?translations:Types.ColorSwatch_Root_Translations.t Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/color-swatch"]
  end
end

module ColorWheel = struct
  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/color-wheel"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/color-wheel"]
  end

  module Input = struct
    module Props = struct
      external check :
        ?style:string Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Input"
    [@@mel.module "@kobalte/core/color-wheel"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/color-wheel"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?translations:Types.ColorSlider_Root_Translations.t Solidtype.Check.value ->
        ?value:Types.Color.t Solidtype.Check.value ->
        ?default_value:Types.Color.t Solidtype.Check.value ->
        ?thickness:float Solidtype.Check.value ->
        ?on_change:(Types.Color.t -> unit) ->
        ?on_change_end:(Types.Color.t -> unit) ->
        ?get_value_label:(Types.Color.t -> string) ->
        ?id:string Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/color-wheel"]
  end

  module Thumb = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Thumb"
    [@@mel.module "@kobalte/core/color-wheel"]
  end

  module Track = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Track"
    [@@mel.module "@kobalte/core/color-wheel"]
  end

  module ValueLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ValueLabel"
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

  external parse_color_js : string -> Types.Color.t = "parseColor"
  [@@mel.module "@kobalte/core/colors"]
  (** Parses a color from a string value. Throws an error if the string could not be parsed.
      
      @raise Invalid_argument with Kobalte's message, where it throws. *)
  let parse_color x0 =
    match parse_color_js x0 with
    | v -> v
    | exception Js.Exn.Error e -> invalid_arg ("parse_color: " ^ Option.value (Js.Exn.message e) ~default:"")
  let parse_color_opt x0 = match parse_color_js x0 with v -> Some v | exception Js.Exn.Error _ -> None
end

module Combobox = struct
  (** An optional arrow element to render alongside the popper content.
      Must be rendered in the popper content. *)
  module Arrow = struct
    module Props = struct
      external check :
        ?size:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** The component that pops out when the combobox is open. *)
  module Content = struct
    module Props = struct
      external check :
        ?on_close_auto_focus:(Dom.event -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** Contains the combobox input and trigger. *)
  module Control = struct
    module Props = struct
      external check :
        (?children:('option Types.ComboboxControlState.t -> Solidtype.Jsx.element, [ `nodes | `render ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Control"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/combobox"]
  end

  module HiddenSelect = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Select.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "HiddenSelect"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** A small icon often displayed next to the value as a visual affordance for the fact it can be open.
      It renders a `▼` by default, but you can use your own icon `children`. *)
  module Icon = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Icon"
    [@@mel.module "@kobalte/core/combobox"]
  end

  module Input = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Input"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** An item of the listbox. *)
  module Item = struct
    module Props = struct
      external check :
        item:_ Types.CollectionNode.t Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** An optional accessible description to be announced for the item.
      Useful for items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** The visual indicator rendered when the item is selected.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module ItemIndicator = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemIndicator"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** An accessible label to be announced for the item.
      Useful for items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** Contains all the items of a `Combobox`. *)
  module Listbox = struct
    module Props = struct
      external check :
        ?scroll_ref:Dom.htmlElement option Solidtype.Solid.accessor Solidtype.Check.value ->
        ?scroll_to_item:(string -> unit) ->
        (?children:(('option, 'opt_group) Types.Either.t Types.CollectionNode.t Types.Collection.t Solidtype.Solid.accessor -> Solidtype.Jsx.element, [ `render ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Ul.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Listbox"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** Portals its children into the `body` when the combobox is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Solidtype.Check.value ->
        ?use_shadow:bool Solidtype.Check.value ->
        ?is_svg:bool Solidtype.Check.value ->
        children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/combobox"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:'option Js.Nullable.t Solidtype.Check.value ->
        ?default_value:'option Solidtype.Check.value ->
        ?on_change:('option Js.Nullable.t -> unit) ->
        ?id:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?translations:Types.Combobox_Root_Translations.t Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Solidtype.Check.value ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?flip:(string, bool) Types.Either.t Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?same_width:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?no_reset_input_on_blur:bool Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> [ `focus | `input | `manual ] option -> unit) ->
        ?on_input_change:(string -> unit) ->
        ?trigger_mode:[ `focus | `input | `manual ] Solidtype.Check.value ->
        ?placeholder:Solidtype.Jsx.element Solidtype.Check.value ->
        options:('option, 'opt_group) Types.Either.t array Solidtype.Check.value ->
        ?option_value:('option -> (string, float) Types.Either.t) ->
        ?option_text_value:('option -> string) ->
        ?option_label:('option -> string) ->
        ?option_disabled:('option -> bool) ->
        ?option_group_children:string Solidtype.Check.value ->
        ?keyboard_delegate:Types.KeyboardDelegate.t Solidtype.Check.value ->
        ?default_filter:(([ `contains | `startsWith | `endsWith ], 'option -> string -> bool) Types.Either.t) Solidtype.Check.value ->
        ?should_focus_wrap:bool Solidtype.Check.value ->
        ?allows_empty_collection:bool Solidtype.Check.value ->
        ?selection_behavior:[ `toggle | `replace ] Solidtype.Check.value ->
        ?allow_duplicate_selection_events:bool Solidtype.Check.value ->
        ?disallow_empty_selection:bool Solidtype.Check.value ->
        ?close_on_selection:bool Solidtype.Check.value ->
        ?remove_on_backspace:bool Solidtype.Check.value ->
        ?virtualized:bool Solidtype.Check.value ->
        ?item_component:('option Types.ComboboxBaseItemComponentProps.t -> Solidtype.Jsx.element) ->
        ?section_component:('opt_group Types.ComboboxBaseSectionComponentProps.t -> Solidtype.Jsx.element) ->
        ?modal:bool Solidtype.Check.value ->
        ?prevent_scroll:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/combobox"]
  end

  module Root_multiple = struct
    module Props = struct
      external check :
        ?value:'option array Solidtype.Check.value ->
        ?default_value:'option array Solidtype.Check.value ->
        ?on_change:('option array -> unit) ->
        multiple:bool Solidtype.Check.value ->
        ?id:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?translations:Types.Combobox_Root_Translations.t Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Solidtype.Check.value ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?flip:(string, bool) Types.Either.t Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?same_width:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?no_reset_input_on_blur:bool Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> [ `focus | `input | `manual ] option -> unit) ->
        ?on_input_change:(string -> unit) ->
        ?trigger_mode:[ `focus | `input | `manual ] Solidtype.Check.value ->
        ?placeholder:Solidtype.Jsx.element Solidtype.Check.value ->
        options:('option, 'opt_group) Types.Either.t array Solidtype.Check.value ->
        ?option_value:('option -> (string, float) Types.Either.t) ->
        ?option_text_value:('option -> string) ->
        ?option_label:('option -> string) ->
        ?option_disabled:('option -> bool) ->
        ?option_group_children:string Solidtype.Check.value ->
        ?keyboard_delegate:Types.KeyboardDelegate.t Solidtype.Check.value ->
        ?default_filter:(([ `contains | `startsWith | `endsWith ], 'option -> string -> bool) Types.Either.t) Solidtype.Check.value ->
        ?should_focus_wrap:bool Solidtype.Check.value ->
        ?allows_empty_collection:bool Solidtype.Check.value ->
        ?selection_behavior:[ `toggle | `replace ] Solidtype.Check.value ->
        ?allow_duplicate_selection_events:bool Solidtype.Check.value ->
        ?disallow_empty_selection:bool Solidtype.Check.value ->
        ?close_on_selection:bool Solidtype.Check.value ->
        ?remove_on_backspace:bool Solidtype.Check.value ->
        ?virtualized:bool Solidtype.Check.value ->
        ?item_component:('option Types.ComboboxBaseItemComponentProps.t -> Solidtype.Jsx.element) ->
        ?section_component:('opt_group Types.ComboboxBaseSectionComponentProps.t -> Solidtype.Jsx.element) ->
        ?modal:bool Solidtype.Check.value ->
        ?prevent_scroll:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/combobox"]
  end

  (** A component used to render the label of a listbox option group.
      It won't be focusable using arrow keys. *)
  module Section = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Section"
    [@@mel.module "@kobalte/core/combobox"]
  end

  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
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
        ?size:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** An item that can be controlled and rendered like a checkbox. *)
  module CheckboxItem = struct
    module Props = struct
      external check :
        ?checked:bool Solidtype.Check.value ->
        ?default_checked:bool Solidtype.Check.value ->
        ?on_change:(bool -> unit) ->
        ?disabled:bool Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?indeterminate:bool Solidtype.Check.value ->
        ?close_on_select:bool Solidtype.Check.value ->
        ?on_select:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "CheckboxItem"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  module Content = struct
    module Props = struct
      external check :
        ?on_open_auto_focus:(Dom.event -> unit) ->
        ?on_close_auto_focus:(Dom.event -> unit) ->
        ?on_escape_key_down:(Dom.keyboardEvent -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** A container used to group multiple `Menu.Item`s. *)
  module Group = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Group"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** A component used to render the label of a `Menu.Group`.
      It won't be focusable using arrow keys. *)
  module GroupLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "GroupLabel"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** A small icon often displayed inside the menu trigger as a visual affordance for the fact it can be open.
      It renders a `▼` by default, but you can use your own icon by providing a `children`. *)
  module Icon = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Icon"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** An item of the menu. *)
  module Item = struct
    module Props = struct
      external check :
        ?disabled:bool Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?close_on_select:bool Solidtype.Check.value ->
        ?on_select:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** An optional accessible description to be announced for the menu item.
      Useful for menu items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** The visual indicator rendered when the parent menu `CheckboxItem` or `RadioItem` is checked.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module ItemIndicator = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemIndicator"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** An accessible label to be announced for the menu item.
      Useful for menu items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** Portals its children into the `body` when the menu is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Solidtype.Check.value ->
        ?use_shadow:bool Solidtype.Check.value ->
        ?is_svg:bool Solidtype.Check.value ->
        children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** A container used to group multiple `Menu.RadioItem`s and manage the selection. *)
  module RadioGroup = struct
    module Props = struct
      external check :
        ?value:'t_value Solidtype.Check.value ->
        ?default_value:'t_value Solidtype.Check.value ->
        ?on_change:('t_value -> unit) ->
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "RadioGroup"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** An item that can be controlled and rendered like a radio. *)
  module RadioItem = struct
    module Props = struct
      external check :
        value:'t_value Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?close_on_select:bool Solidtype.Check.value ->
        ?on_select:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "RadioItem"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** Displays a menu located at the pointer, triggered by a right-click or a long-press. *)
  module Root = struct
    module Props = struct
      external check :
        ?id:string Solidtype.Check.value ->
        ?value:string Solidtype.Check.value ->
        ?placement:string Solidtype.Check.value ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?flip:(string, bool) Types.Either.t Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?same_width:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?modal:bool Solidtype.Check.value ->
        ?prevent_scroll:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** A separator visually or semantically separates content. *)
  module Separator = struct
    module Props = struct
      external check :
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Hr.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Separator"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** Contains all the parts of a submenu. *)
  module Sub = struct
    module Props = struct
      external check :
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Sub"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** The component that pops out when a submenu is open. *)
  module SubContent = struct
    module Props = struct
      external check :
        ?on_escape_key_down:(Dom.keyboardEvent -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "SubContent"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  (** An item that opens a submenu. *)
  module SubTrigger = struct
    module Props = struct
      external check :
        ?text_value:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "SubTrigger"
    [@@mel.module "@kobalte/core/context-menu"]
  end

  module Trigger = struct
    module Props = struct
      external check :
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
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
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "CloseButton"
    [@@mel.module "@kobalte/core/dialog"]
  end

  (** Contains the content to be rendered when the dialog is open. *)
  module Content = struct
    module Props = struct
      external check :
        ?on_open_auto_focus:(Dom.event -> unit) ->
        ?on_close_auto_focus:(Dom.event -> unit) ->
        ?on_escape_key_down:(Dom.keyboardEvent -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/dialog"]
  end

  (** An optional accessible description to be announced when the dialog is open. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.P.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/dialog"]
  end

  (** A layer that covers the inert portion of the view when the dialog is open. *)
  module Overlay = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Overlay"
    [@@mel.module "@kobalte/core/dialog"]
  end

  (** Portals its children into the `body` when the dialog is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Solidtype.Check.value ->
        ?use_shadow:bool Solidtype.Check.value ->
        ?is_svg:bool Solidtype.Check.value ->
        children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/dialog"]
  end

  (** A dialog is a window overlaid on either the primary window or another dialog window. *)
  module Root = struct
    module Props = struct
      external check :
        ?translations:Types.AlertDialog_Root_Translations.t Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?id:string Solidtype.Check.value ->
        ?modal:bool Solidtype.Check.value ->
        ?prevent_scroll:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/dialog"]
  end

  (** An accessible title to be announced when the dialog is open. *)
  module Title = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.H2.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Title"
    [@@mel.module "@kobalte/core/dialog"]
  end

  (** The button that opens the dialog. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
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
        ?size:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** An item that can be controlled and rendered like a checkbox. *)
  module CheckboxItem = struct
    module Props = struct
      external check :
        ?checked:bool Solidtype.Check.value ->
        ?default_checked:bool Solidtype.Check.value ->
        ?on_change:(bool -> unit) ->
        ?disabled:bool Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?indeterminate:bool Solidtype.Check.value ->
        ?close_on_select:bool Solidtype.Check.value ->
        ?on_select:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "CheckboxItem"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** Contains the content to be rendered when the dropdown menu is open. *)
  module Content = struct
    module Props = struct
      external check :
        ?on_open_auto_focus:(Dom.event -> unit) ->
        ?on_close_auto_focus:(Dom.event -> unit) ->
        ?on_escape_key_down:(Dom.keyboardEvent -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** A container used to group multiple `Menu.Item`s. *)
  module Group = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Group"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** A component used to render the label of a `Menu.Group`.
      It won't be focusable using arrow keys. *)
  module GroupLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "GroupLabel"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** A small icon often displayed inside the menu trigger as a visual affordance for the fact it can be open.
      It renders a `▼` by default, but you can use your own icon by providing a `children`. *)
  module Icon = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Icon"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** An item of the menu. *)
  module Item = struct
    module Props = struct
      external check :
        ?disabled:bool Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?close_on_select:bool Solidtype.Check.value ->
        ?on_select:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** An optional accessible description to be announced for the menu item.
      Useful for menu items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** The visual indicator rendered when the parent menu `CheckboxItem` or `RadioItem` is checked.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module ItemIndicator = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemIndicator"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** An accessible label to be announced for the menu item.
      Useful for menu items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** Portals its children into the `body` when the menu is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Solidtype.Check.value ->
        ?use_shadow:bool Solidtype.Check.value ->
        ?is_svg:bool Solidtype.Check.value ->
        children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** A container used to group multiple `Menu.RadioItem`s and manage the selection. *)
  module RadioGroup = struct
    module Props = struct
      external check :
        ?value:'t_value Solidtype.Check.value ->
        ?default_value:'t_value Solidtype.Check.value ->
        ?on_change:('t_value -> unit) ->
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "RadioGroup"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** An item that can be controlled and rendered like a radio. *)
  module RadioItem = struct
    module Props = struct
      external check :
        value:'t_value Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?close_on_select:bool Solidtype.Check.value ->
        ?on_select:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "RadioItem"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** Displays a menu to the user —such as a set of actions or functions— triggered by a button. *)
  module Root = struct
    module Props = struct
      external check :
        ?id:string Solidtype.Check.value ->
        ?modal:bool Solidtype.Check.value ->
        ?prevent_scroll:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        ?value:string Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Solidtype.Check.value ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?flip:(string, bool) Types.Either.t Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?same_width:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** A separator visually or semantically separates content. *)
  module Separator = struct
    module Props = struct
      external check :
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Hr.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Separator"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** Contains all the parts of a submenu. *)
  module Sub = struct
    module Props = struct
      external check :
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Sub"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** The component that pops out when a submenu is open. *)
  module SubContent = struct
    module Props = struct
      external check :
        ?on_escape_key_down:(Dom.keyboardEvent -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "SubContent"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** An item that opens a submenu. *)
  module SubTrigger = struct
    module Props = struct
      external check :
        ?text_value:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "SubTrigger"
    [@@mel.module "@kobalte/core/dropdown-menu"]
  end

  (** The button that toggles the menu. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
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
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module Dropzone = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Dropzone"
    [@@mel.module "@kobalte/core/file-field"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module HiddenInput = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "HiddenInput"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module Item = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module ItemDeleteTrigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemDeleteTrigger"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module ItemList = struct
    module Props = struct
      external check :
        (children:(Types.File.t -> Solidtype.Jsx.element, [ `render ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Ul.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemList"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module ItemName = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemName"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module ItemPreview = struct
    module Props = struct
      external check :
        type_:string Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemPreview"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module ItemPreviewImage = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Img.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemPreviewImage"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module ItemSize = struct
    module Props = struct
      external check :
        ?precision:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemSize"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?translations:Types.FileField_Root_Translations.t Solidtype.Check.value ->
        ?multiple:bool Solidtype.Check.value ->
        ?accept:(string, string array) Types.Either.t Solidtype.Check.value ->
        ?max_files:float Solidtype.Check.value ->
        ?allow_drag_and_drop:bool Solidtype.Check.value ->
        ?max_file_size:float Solidtype.Check.value ->
        ?min_file_size:float Solidtype.Check.value ->
        ?on_file_accept:(Types.File.t array -> unit) ->
        ?on_file_reject:(Types.FileRejection.t array -> unit) ->
        ?on_file_change:(Types.Details.t -> unit) ->
        ?validate:(Types.File.t -> [ `TOO_MANY_FILES | `FILE_INVALID_TYPE | `FILE_TOO_LARGE | `FILE_TOO_SMALL ] array Js.Nullable.t) ->
        ?id:string Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/file-field"]
  end

  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
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
        ?size:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/hover-card"]
  end

  (** Contains the content to be rendered when the hovercard is open. *)
  module Content = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/hover-card"]
  end

  (** Portals its children into the `body` when the hovercard is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Solidtype.Check.value ->
        ?use_shadow:bool Solidtype.Check.value ->
        ?is_svg:bool Solidtype.Check.value ->
        children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/hover-card"]
  end

  (** A popover that allows sighted users to preview content available behind a link. *)
  module Root = struct
    module Props = struct
      external check :
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?open_delay:float Solidtype.Check.value ->
        ?close_delay:float Solidtype.Check.value ->
        ?ignore_safe_area:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        ?id:string Solidtype.Check.value ->
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Solidtype.Check.value ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?flip:(string, bool) Types.Either.t Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?same_width:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/hover-card"]
  end

  (** The link that opens the hovercard when hovered. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.A.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
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
        ?locale:string Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "I18nProvider"
    [@@mel.module "@kobalte/core/i18n"]
  end

  external rtl_langs : string Js.Set.t = "RTL_LANGS"
  [@@mel.module "@kobalte/core/i18n"]

  (** Provides localized string collation for the current locale. Automatically updates when the locale changes,
      and handles caching of the collator for performance. *)
  external create_collator : Types.CollatorOptions.t option -> Types.Collator.t Solidtype.Solid.accessor = "createCollator"
  [@@mel.module "@kobalte/core/i18n"]

  (** Provides localized date formatting for the current locale. Automatically updates when the locale changes,
      and handles caching of the date formatter for performance. *)
  external create_date_formatter : (Types.DateTimeFormatOptions.t, Types.DateTimeFormatOptions.t Solidtype.Solid.accessor) Types.Either.t -> Types.DateTimeFormat.t Solidtype.Solid.accessor = "createDateFormatter"
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
  external create_number_formatter : (Types.NumberFormatOptions.t, Types.NumberFormatOptions.t Solidtype.Solid.accessor) Types.Either.t -> Types.NumberFormat.t Solidtype.Solid.accessor = "createNumberFormatter"
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
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Fallback"
    [@@mel.module "@kobalte/core/image"]
  end

  (** The image to render. By default, it will only render when it has loaded. *)
  module Img = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Img.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Img"
    [@@mel.module "@kobalte/core/image"]
  end

  (** An image element with an optional fallback for loading and error status. *)
  module Root = struct
    module Props = struct
      external check :
        ?fallback_delay:float Solidtype.Check.value ->
        ?on_loading_status_change:([ `idle | `loading | `loaded | `error ] -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
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
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.A.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/link"]
  end
end

module Listbox = struct
  (** An item of the listbox. *)
  module Item = struct
    module Props = struct
      external check :
        item:_ Types.CollectionNode.t Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/listbox"]
  end

  (** An optional accessible description to be announced for the item.
      Useful for items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/listbox"]
  end

  (** The visual indicator rendered when the item is selected.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module ItemIndicator = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemIndicator"
    [@@mel.module "@kobalte/core/listbox"]
  end

  (** An accessible label to be announced for the item.
      Useful for items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/listbox"]
  end

  (** Listbox presents a list of options and allows a user to select one or more of them. *)
  module Root = struct
    module Props = struct
      external check :
        ?value:string array Solidtype.Check.value ->
        ?default_value:string array Solidtype.Check.value ->
        ?on_change:(string Js.Set.t -> unit) ->
        ?options:('option, 'opt_group) Types.Either.t array Solidtype.Check.value ->
        ?option_value:('option -> string) ->
        ?option_text_value:('option -> string) ->
        ?option_disabled:('option -> bool) ->
        ?option_group_children:('opt_group -> 'option array) ->
        ?state:Types.ListState.t Solidtype.Check.value ->
        ?keyboard_delegate:Types.KeyboardDelegate.t Solidtype.Check.value ->
        ?auto_focus:([ `first | `last ], bool) Types.Either.t Solidtype.Check.value ->
        ?should_focus_wrap:bool Solidtype.Check.value ->
        ?should_use_virtual_focus:bool Solidtype.Check.value ->
        ?should_select_on_press_up:bool Solidtype.Check.value ->
        ?should_focus_on_hover:bool Solidtype.Check.value ->
        ?scroll_ref:Dom.htmlElement option Solidtype.Solid.accessor Solidtype.Check.value ->
        ?selection_behavior:[ `toggle | `replace ] Solidtype.Check.value ->
        ?allow_duplicate_selection_events:bool Solidtype.Check.value ->
        ?selection_mode:[ `none | `single | `multiple ] Solidtype.Check.value ->
        ?disallow_empty_selection:bool Solidtype.Check.value ->
        ?select_on_focus:bool Solidtype.Check.value ->
        ?disallow_type_ahead:bool Solidtype.Check.value ->
        ?allows_tab_navigation:bool Solidtype.Check.value ->
        ?virtualized:bool Solidtype.Check.value ->
        ?render_item:('option Types.CollectionNode.t -> Solidtype.Jsx.element) ->
        ?render_section:('opt_group Types.CollectionNode.t -> Solidtype.Jsx.element) ->
        ?scroll_to_item:(string -> unit) ->
        (?children:(('option, 'opt_group) Types.Either.t Types.CollectionNode.t Types.Collection.t Solidtype.Solid.accessor -> Solidtype.Jsx.element, [ `render ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Ul.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/listbox"]
  end

  (** A component used to render the label of a listbox option group.
      It won't be focusable using arrow keys. *)
  module Section = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Section"
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
        ?size:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** An item that can be controlled and rendered like a checkbox. *)
  module CheckboxItem = struct
    module Props = struct
      external check :
        ?checked:bool Solidtype.Check.value ->
        ?default_checked:bool Solidtype.Check.value ->
        ?on_change:(bool -> unit) ->
        ?disabled:bool Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?indeterminate:bool Solidtype.Check.value ->
        ?close_on_select:bool Solidtype.Check.value ->
        ?on_select:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "CheckboxItem"
    [@@mel.module "@kobalte/core/menubar"]
  end

  module Content = struct
    module Props = struct
      external check :
        ?on_open_auto_focus:(Dom.event -> unit) ->
        ?on_close_auto_focus:(Dom.event -> unit) ->
        ?on_escape_key_down:(Dom.keyboardEvent -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** A container used to group multiple `Menu.Item`s. *)
  module Group = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Group"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** A component used to render the label of a `Menu.Group`.
      It won't be focusable using arrow keys. *)
  module GroupLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "GroupLabel"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** A small icon often displayed inside the menu trigger as a visual affordance for the fact it can be open.
      It renders a `▼` by default, but you can use your own icon by providing a `children`. *)
  module Icon = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Icon"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** An item of the menu. *)
  module Item = struct
    module Props = struct
      external check :
        ?disabled:bool Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?close_on_select:bool Solidtype.Check.value ->
        ?on_select:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** An optional accessible description to be announced for the menu item.
      Useful for menu items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** The visual indicator rendered when the parent menu `CheckboxItem` or `RadioItem` is checked.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module ItemIndicator = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemIndicator"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** An accessible label to be announced for the menu item.
      Useful for menu items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** Displays a menu to the user —such as a set of actions or functions— triggered by a button. *)
  module Menu = struct
    module Props = struct
      external check :
        ?id:string Solidtype.Check.value ->
        ?modal:bool Solidtype.Check.value ->
        ?prevent_scroll:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        ?value:string Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Solidtype.Check.value ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?flip:(string, bool) Types.Either.t Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?same_width:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Menu"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** Portals its children into the `body` when the menu is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Solidtype.Check.value ->
        ?use_shadow:bool Solidtype.Check.value ->
        ?is_svg:bool Solidtype.Check.value ->
        children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** A container used to group multiple `Menu.RadioItem`s and manage the selection. *)
  module RadioGroup = struct
    module Props = struct
      external check :
        ?value:'t_value Solidtype.Check.value ->
        ?default_value:'t_value Solidtype.Check.value ->
        ?on_change:('t_value -> unit) ->
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "RadioGroup"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** An item that can be controlled and rendered like a radio. *)
  module RadioItem = struct
    module Props = struct
      external check :
        value:'t_value Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?close_on_select:bool Solidtype.Check.value ->
        ?on_select:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "RadioItem"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** A visually persistent menu common in desktop applications that provides quick access to a consistent set of commands. *)
  module Root = struct
    module Props = struct
      external check :
        ?default_value:string Solidtype.Check.value ->
        ?value:string Js.Nullable.t Solidtype.Check.value ->
        ?on_value_change:(string Js.Nullable.t -> unit) ->
        ?loop:bool Solidtype.Check.value ->
        ?focus_on_alt:bool Solidtype.Check.value ->
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        ?auto_focus_menu:bool Solidtype.Check.value ->
        ?on_auto_focus_menu_change:bool Solidtype.Solid.setter Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** A separator visually or semantically separates content. *)
  module Separator = struct
    module Props = struct
      external check :
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Hr.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Separator"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** Contains all the parts of a submenu. *)
  module Sub = struct
    module Props = struct
      external check :
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Sub"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** The component that pops out when a submenu is open. *)
  module SubContent = struct
    module Props = struct
      external check :
        ?on_escape_key_down:(Dom.keyboardEvent -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "SubContent"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** An item that opens a submenu. *)
  module SubTrigger = struct
    module Props = struct
      external check :
        ?text_value:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "SubTrigger"
    [@@mel.module "@kobalte/core/menubar"]
  end

  (** The button that toggles the menubar menu or a menubar link. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
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
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Fill"
    [@@mel.module "@kobalte/core/meter"]
  end

  (** An accessible label that gives the user information on the meter. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/meter"]
  end

  (** Meter displays numeric value that varies within a defined range. *)
  module Root = struct
    module Props = struct
      external check :
        ?value:float Solidtype.Check.value ->
        ?min_value:float Solidtype.Check.value ->
        ?max_value:float Solidtype.Check.value ->
        ?get_value_label:(Types.GetValueLabelParams.t -> string) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/meter"]
  end

  (** The component that visually represents the meter track.
      Act as a container for `Meter.Fill`. *)
  module Track = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Track"
    [@@mel.module "@kobalte/core/meter"]
  end

  (** The accessible label text representing the current value in a human-readable format. *)
  module ValueLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ValueLabel"
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
        ?size:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** An item that can be controlled and rendered like a checkbox. *)
  module CheckboxItem = struct
    module Props = struct
      external check :
        ?checked:bool Solidtype.Check.value ->
        ?default_checked:bool Solidtype.Check.value ->
        ?on_change:(bool -> unit) ->
        ?disabled:bool Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?indeterminate:bool Solidtype.Check.value ->
        ?close_on_select:bool Solidtype.Check.value ->
        ?on_select:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "CheckboxItem"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  module Content = struct
    module Props = struct
      external check :
        ?on_open_auto_focus:(Dom.event -> unit) ->
        ?on_close_auto_focus:(Dom.event -> unit) ->
        ?on_escape_key_down:(Dom.keyboardEvent -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Ul.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** A container used to group multiple `Menu.Item`s. *)
  module Group = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Group"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** A component used to render the label of a `Menu.Group`.
      It won't be focusable using arrow keys. *)
  module GroupLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "GroupLabel"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** A small icon often displayed inside the menu trigger as a visual affordance for the fact it can be open.
      It renders a `▼` by default, but you can use your own icon by providing a `children`. *)
  module Icon = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Icon"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** An item of the navigation menu. *)
  module Item = struct
    module Props = struct
      external check :
        ?disabled:bool Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?close_on_select:bool Solidtype.Check.value ->
        ?on_select:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.A.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** An optional accessible description to be announced for the menu item.
      Useful for menu items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** The visual indicator rendered when the parent menu `CheckboxItem` or `RadioItem` is checked.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module ItemIndicator = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemIndicator"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** An accessible label to be announced for the menu item.
      Useful for menu items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** Displays a menu to the user —such as a set of actions or functions— triggered by a button. *)
  module Menu = struct
    module Props = struct
      external check :
        ?id:string Solidtype.Check.value ->
        ?modal:bool Solidtype.Check.value ->
        ?prevent_scroll:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        ?value:string Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Solidtype.Check.value ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?flip:(string, bool) Types.Either.t Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?same_width:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Menu"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** Portals its children into the NavigationMenu.Viewport when the menu is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Solidtype.Check.value ->
        ?use_shadow:bool Solidtype.Check.value ->
        ?is_svg:bool Solidtype.Check.value ->
        children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** A container used to group multiple `Menu.RadioItem`s and manage the selection. *)
  module RadioGroup = struct
    module Props = struct
      external check :
        ?value:'t_value Solidtype.Check.value ->
        ?default_value:'t_value Solidtype.Check.value ->
        ?on_change:('t_value -> unit) ->
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "RadioGroup"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** An item that can be controlled and rendered like a radio. *)
  module RadioItem = struct
    module Props = struct
      external check :
        value:'t_value Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?close_on_select:bool Solidtype.Check.value ->
        ?on_select:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "RadioItem"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** A visually persistent menu common in desktop applications that provides quick access to a consistent set of commands. *)
  module Root = struct
    module Props = struct
      external check :
        ?delay_duration:float Solidtype.Check.value ->
        ?skip_delay_duration:float Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        ?auto_focus_menu:bool Solidtype.Check.value ->
        ?on_auto_focus_menu_change:bool Solidtype.Solid.setter Solidtype.Check.value ->
        ?default_value:string Solidtype.Check.value ->
        ?value:string Js.Nullable.t Solidtype.Check.value ->
        ?on_value_change:(string Js.Nullable.t -> unit) ->
        ?loop:bool Solidtype.Check.value ->
        ?focus_on_alt:bool Solidtype.Check.value ->
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Solidtype.Check.value ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?flip:(string, bool) Types.Either.t Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?same_width:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Ul.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** A separator visually or semantically separates content. *)
  module Separator = struct
    module Props = struct
      external check :
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Hr.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Separator"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** Contains all the parts of a submenu. *)
  module Sub = struct
    module Props = struct
      external check :
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Sub"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** The component that pops out when a submenu is open. *)
  module SubContent = struct
    module Props = struct
      external check :
        ?on_escape_key_down:(Dom.keyboardEvent -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "SubContent"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** An item that opens a submenu. *)
  module SubTrigger = struct
    module Props = struct
      external check :
        ?text_value:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "SubTrigger"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  (** The button that toggles the menubar menu or a menubar link. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  module Viewport = struct
    module Props = struct
      external check :
        ?on_escape_key_down:(Dom.keyboardEvent -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Viewport"
    [@@mel.module "@kobalte/core/navigation-menu"]
  end

  external use_navigation_menu_context : unit -> Types.NavigationMenuContextValue.t = "useNavigationMenuContext"
  [@@mel.module "@kobalte/core/navigation-menu"]
end

module NumberField = struct
  module DecrementTrigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "DecrementTrigger"
    [@@mel.module "@kobalte/core/number-field"]
  end

  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/number-field"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/number-field"]
  end

  module HiddenInput = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "HiddenInput"
    [@@mel.module "@kobalte/core/number-field"]
  end

  module IncrementTrigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "IncrementTrigger"
    [@@mel.module "@kobalte/core/number-field"]
  end

  module Input = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Input"
    [@@mel.module "@kobalte/core/number-field"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/number-field"]
  end

  (** A text input that allow users to input custom text entries with a keyboard. *)
  module Root = struct
    module Props = struct
      external check :
        ?value:(string, float) Types.Either.t Solidtype.Check.value ->
        ?default_value:(string, float) Types.Either.t Solidtype.Check.value ->
        ?on_change:(string -> unit) ->
        ?raw_value:float Solidtype.Check.value ->
        ?on_raw_value_change:(float -> unit) ->
        ?min_value:float Solidtype.Check.value ->
        ?max_value:float Solidtype.Check.value ->
        ?step:float Solidtype.Check.value ->
        ?large_step:float Solidtype.Check.value ->
        ?change_on_wheel:bool Solidtype.Check.value ->
        ?format:bool Solidtype.Check.value ->
        ?format_options:Types.NumberFormatOptions2.t Solidtype.Check.value ->
        ?allowed_input:Js.Re.t Solidtype.Check.value ->
        ?id:string Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?translations:Types.ColorChannelField_Root_Translations.t Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/number-field"]
  end

  external use_number_field_context : unit -> Types.NumberFieldContextValue.t = "useNumberFieldContext"
  [@@mel.module "@kobalte/core/number-field"]
end

module Pagination = struct
  module Ellipsis = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Ellipsis"
    [@@mel.module "@kobalte/core/pagination"]
  end

  module Item = struct
    module Props = struct
      external check :
        page:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/pagination"]
  end

  module Items = struct
    module Props = struct
      external check :
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Items"
    [@@mel.module "@kobalte/core/pagination"]
  end

  module Next = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Next"
    [@@mel.module "@kobalte/core/pagination"]
  end

  module Previous = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Previous"
    [@@mel.module "@kobalte/core/pagination"]
  end

  (** A list of page number that allows users to change the current page. *)
  module Root = struct
    module Props = struct
      external check :
        ?page:float Solidtype.Check.value ->
        ?default_page:float Solidtype.Check.value ->
        ?on_page_change:(float -> unit) ->
        count:float Solidtype.Check.value ->
        ?sibling_count:float Solidtype.Check.value ->
        ?show_first:bool Solidtype.Check.value ->
        ?show_last:bool Solidtype.Check.value ->
        ?fixed_items:(string, bool) Types.Either.t Solidtype.Check.value ->
        item_component:(Types.Pagination_Root_ItemComponent.t -> Solidtype.Jsx.element) ->
        ellipsis_component:(unit -> Solidtype.Jsx.element) ->
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Nav.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
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
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Anchor"
    [@@mel.module "@kobalte/core/popover"]
  end

  (** An optional arrow element to render alongside the popper content.
      Must be rendered in the popper content. *)
  module Arrow = struct
    module Props = struct
      external check :
        ?size:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/popover"]
  end

  (** The button that closes the popover. *)
  module CloseButton = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "CloseButton"
    [@@mel.module "@kobalte/core/popover"]
  end

  (** Contains the content to be rendered when the popover is open. *)
  module Content = struct
    module Props = struct
      external check :
        ?on_open_auto_focus:(Dom.event -> unit) ->
        ?on_close_auto_focus:(Dom.event -> unit) ->
        ?on_escape_key_down:(Dom.keyboardEvent -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/popover"]
  end

  (** An optional accessible description to be announced when the popover is open. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.P.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/popover"]
  end

  (** Portals its children into the `body` when the popover is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Solidtype.Check.value ->
        ?use_shadow:bool Solidtype.Check.value ->
        ?is_svg:bool Solidtype.Check.value ->
        children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/popover"]
  end

  (** A popover is a dialog positioned relative to an anchor element. *)
  module Root = struct
    module Props = struct
      external check :
        ?anchor_ref:Dom.htmlElement option Solidtype.Solid.accessor Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?id:string Solidtype.Check.value ->
        ?modal:bool Solidtype.Check.value ->
        ?prevent_scroll:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        ?translations:Types.Popover_Root_Translations.t Solidtype.Check.value ->
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Solidtype.Check.value ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?flip:(string, bool) Types.Either.t Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?same_width:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/popover"]
  end

  (** An accessible title to be announced when the popover is open. *)
  module Title = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.H2.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Title"
    [@@mel.module "@kobalte/core/popover"]
  end

  (** The button that opens the popover. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
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
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Fill"
    [@@mel.module "@kobalte/core/progress"]
  end

  (** An accessible label that gives the user information on the progress. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/progress"]
  end

  (** Progress show either determinate or indeterminate progress of an operation over time. *)
  module Root = struct
    module Props = struct
      external check :
        ?indeterminate:bool Solidtype.Check.value ->
        ?value:float Solidtype.Check.value ->
        ?min_value:float Solidtype.Check.value ->
        ?max_value:float Solidtype.Check.value ->
        ?get_value_label:(Types.GetValueLabelParams.t -> string) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/progress"]
  end

  (** The component that visually represents the progress track.
      Act as a container for `Progress.Fill`. *)
  module Track = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Track"
    [@@mel.module "@kobalte/core/progress"]
  end

  (** The accessible label text representing the current value in a human-readable format. *)
  module ValueLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ValueLabel"
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
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  (** The root container for a radio button. *)
  module Item = struct
    module Props = struct
      external check :
        value:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  (** The element that visually represents a radio button. *)
  module ItemControl = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemControl"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  (** The description that gives the user more information on the radio button. *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  (** The visual indicator rendered when the radio item is in a checked state.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module ItemIndicator = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemIndicator"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  (** The native html input that is visually hidden in the radio button. *)
  module ItemInput = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemInput"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  (** The label that gives the user information on the radio button. *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  (** The label that gives the user information on the radio group. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  (** A set of checkable buttons, known as radio buttons, where no more than one of the buttons can be checked at a time.
      This component is based on the \[WAI-ARIA Radio Group Pattern\](https://www.w3.org/WAI/ARIA/apg/patterns/radiobutton/) *)
  module Root = struct
    module Props = struct
      external check :
        ?value:string Solidtype.Check.value ->
        ?default_value:string Solidtype.Check.value ->
        ?on_change:(string -> unit) ->
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        ?id:string Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/radio-group"]
  end

  external use_radio_group_context : unit -> Types.RadioGroupContextValue.t = "useRadioGroupContext"
  [@@mel.module "@kobalte/core/radio-group"]
end

module Rating = struct
  module Control = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Control"
    [@@mel.module "@kobalte/core/rating"]
  end

  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/rating"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/rating"]
  end

  module HiddenInput = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "HiddenInput"
    [@@mel.module "@kobalte/core/rating"]
  end

  module Item = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/rating"]
  end

  module ItemControl = struct
    module Props = struct
      external check :
        (?children:(Types.RatingItemState.t -> Solidtype.Jsx.element, [ `nodes | `render ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemControl"
    [@@mel.module "@kobalte/core/rating"]
  end

  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/rating"]
  end

  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/rating"]
  end

  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/rating"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:float Solidtype.Check.value ->
        ?default_value:float Solidtype.Check.value ->
        ?on_change:(float -> unit) ->
        ?allow_half:bool Solidtype.Check.value ->
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        ?id:string Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/rating"]
  end
end

module Search = struct
  (** An optional arrow element to render alongside the popper content.
      Must be rendered in the popper content. *)
  module Arrow = struct
    module Props = struct
      external check :
        ?size:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/search"]
  end

  (** The component that pops out when the combobox is open. *)
  module Content = struct
    module Props = struct
      external check :
        ?on_close_auto_focus:(Dom.event -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/search"]
  end

  (** Contains the combobox input and trigger. *)
  module Control = struct
    module Props = struct
      external check :
        (?children:('option Types.ComboboxControlState.t -> Solidtype.Jsx.element, [ `nodes | `render ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Control"
    [@@mel.module "@kobalte/core/search"]
  end

  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/search"]
  end

  module HiddenSelect = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Select.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "HiddenSelect"
    [@@mel.module "@kobalte/core/search"]
  end

  (** A small icon often displayed next to the value as a visual affordance for the fact it can be open.
      It renders a `▼` by default, but you can use your own icon `children`. *)
  module Icon = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Icon"
    [@@mel.module "@kobalte/core/search"]
  end

  module Indicator = struct
    module Props = struct
      external check :
        ?loading_component:Solidtype.Jsx.element Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Indicator"
    [@@mel.module "@kobalte/core/search"]
  end

  module Input = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Input"
    [@@mel.module "@kobalte/core/search"]
  end

  (** An item of the listbox. *)
  module Item = struct
    module Props = struct
      external check :
        item:_ Types.CollectionNode.t Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/search"]
  end

  (** An optional accessible description to be announced for the item.
      Useful for items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/search"]
  end

  (** An accessible label to be announced for the item.
      Useful for items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/search"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/search"]
  end

  (** Contains all the items of a `Combobox`. *)
  module Listbox = struct
    module Props = struct
      external check :
        ?scroll_ref:Dom.htmlElement option Solidtype.Solid.accessor Solidtype.Check.value ->
        ?scroll_to_item:(string -> unit) ->
        (?children:(('option, 'opt_group) Types.Either.t Types.CollectionNode.t Types.Collection.t Solidtype.Solid.accessor -> Solidtype.Jsx.element, [ `render ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Ul.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Listbox"
    [@@mel.module "@kobalte/core/search"]
  end

  (** Displayed in portal when no options are presented *)
  module NoResult = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "NoResult"
    [@@mel.module "@kobalte/core/search"]
  end

  (** Portals its children into the `body` when the combobox is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Solidtype.Check.value ->
        ?use_shadow:bool Solidtype.Check.value ->
        ?is_svg:bool Solidtype.Check.value ->
        children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/search"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:'option Js.Nullable.t Solidtype.Check.value ->
        ?default_value:'option Solidtype.Check.value ->
        ?on_change:('option Js.Nullable.t -> unit) ->
        ?id:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?translations:Types.Combobox_Root_Translations.t Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Solidtype.Check.value ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?flip:(string, bool) Types.Either.t Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?same_width:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?no_reset_input_on_blur:bool Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> [ `focus | `input | `manual ] option -> unit) ->
        ?on_input_change:(string -> unit) ->
        ?trigger_mode:[ `focus | `input | `manual ] Solidtype.Check.value ->
        ?placeholder:Solidtype.Jsx.element Solidtype.Check.value ->
        options:('option, 'opt_group) Types.Either.t array Solidtype.Check.value ->
        ?option_value:('option -> (string, float) Types.Either.t) ->
        ?option_text_value:('option -> string) ->
        ?option_label:('option -> string) ->
        ?option_disabled:('option -> bool) ->
        ?option_group_children:string Solidtype.Check.value ->
        ?keyboard_delegate:Types.KeyboardDelegate.t Solidtype.Check.value ->
        ?should_focus_wrap:bool Solidtype.Check.value ->
        ?allows_empty_collection:bool Solidtype.Check.value ->
        ?selection_behavior:[ `toggle | `replace ] Solidtype.Check.value ->
        ?allow_duplicate_selection_events:bool Solidtype.Check.value ->
        ?disallow_empty_selection:bool Solidtype.Check.value ->
        ?close_on_selection:bool Solidtype.Check.value ->
        ?remove_on_backspace:bool Solidtype.Check.value ->
        ?virtualized:bool Solidtype.Check.value ->
        ?item_component:('option Types.ComboboxBaseItemComponentProps.t -> Solidtype.Jsx.element) ->
        ?section_component:('opt_group Types.ComboboxBaseSectionComponentProps.t -> Solidtype.Jsx.element) ->
        ?modal:bool Solidtype.Check.value ->
        ?prevent_scroll:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        ?debounce_options_millisecond:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/search"]
  end

  module Root_multiple = struct
    module Props = struct
      external check :
        ?value:'option array Solidtype.Check.value ->
        ?default_value:'option array Solidtype.Check.value ->
        ?on_change:('option array -> unit) ->
        multiple:bool Solidtype.Check.value ->
        ?id:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?translations:Types.Combobox_Root_Translations.t Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Solidtype.Check.value ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?flip:(string, bool) Types.Either.t Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?same_width:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?no_reset_input_on_blur:bool Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> [ `focus | `input | `manual ] option -> unit) ->
        ?on_input_change:(string -> unit) ->
        ?trigger_mode:[ `focus | `input | `manual ] Solidtype.Check.value ->
        ?placeholder:Solidtype.Jsx.element Solidtype.Check.value ->
        options:('option, 'opt_group) Types.Either.t array Solidtype.Check.value ->
        ?option_value:('option -> (string, float) Types.Either.t) ->
        ?option_text_value:('option -> string) ->
        ?option_label:('option -> string) ->
        ?option_disabled:('option -> bool) ->
        ?option_group_children:string Solidtype.Check.value ->
        ?keyboard_delegate:Types.KeyboardDelegate.t Solidtype.Check.value ->
        ?should_focus_wrap:bool Solidtype.Check.value ->
        ?allows_empty_collection:bool Solidtype.Check.value ->
        ?selection_behavior:[ `toggle | `replace ] Solidtype.Check.value ->
        ?allow_duplicate_selection_events:bool Solidtype.Check.value ->
        ?disallow_empty_selection:bool Solidtype.Check.value ->
        ?close_on_selection:bool Solidtype.Check.value ->
        ?remove_on_backspace:bool Solidtype.Check.value ->
        ?virtualized:bool Solidtype.Check.value ->
        ?item_component:('option Types.ComboboxBaseItemComponentProps.t -> Solidtype.Jsx.element) ->
        ?section_component:('opt_group Types.ComboboxBaseSectionComponentProps.t -> Solidtype.Jsx.element) ->
        ?modal:bool Solidtype.Check.value ->
        ?prevent_scroll:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        ?debounce_options_millisecond:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/search"]
  end

  (** A component used to render the label of a listbox option group.
      It won't be focusable using arrow keys. *)
  module Section = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Section"
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
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  module Indicator = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Indicator"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  module Item = struct
    module Props = struct
      external check :
        value:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  (** The element that visually represents a radio button. *)
  module ItemControl = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemControl"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  (** The description that gives the user more information on the radio button. *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  (** The visual indicator rendered when the radio item is in a checked state.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module ItemIndicator = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemIndicator"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  module ItemInput = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemInput"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  (** The label that gives the user information on the radio button. *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  (** The label that gives the user information on the radio group. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/segmented-control"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:string Solidtype.Check.value ->
        ?default_value:string Solidtype.Check.value ->
        ?on_change:(string -> unit) ->
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        ?id:string Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        ?ref:((Dom.htmlElement, Dom.htmlElement -> unit) Types.Either.t) Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
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
        ?size:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/select"]
  end

  (** The component that pops out when the select is open. *)
  module Content = struct
    module Props = struct
      external check :
        ?on_close_auto_focus:(Dom.event -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        ?on_focus_outside:(Dom.customEvent -> unit) ->
        ?on_interact_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/select"]
  end

  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/select"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/select"]
  end

  module HiddenSelect = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Select.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "HiddenSelect"
    [@@mel.module "@kobalte/core/select"]
  end

  (** A small icon often displayed next to the value as a visual affordance for the fact it can be open.
      It renders a `▼` by default, but you can use your own icon `children`. *)
  module Icon = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Icon"
    [@@mel.module "@kobalte/core/select"]
  end

  (** An item of the listbox. *)
  module Item = struct
    module Props = struct
      external check :
        item:_ Types.CollectionNode.t Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/select"]
  end

  (** An optional accessible description to be announced for the item.
      Useful for items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemDescription = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemDescription"
    [@@mel.module "@kobalte/core/select"]
  end

  (** The visual indicator rendered when the item is selected.
      You can style this element directly, or you can use it as a wrapper to put an icon into, or both. *)
  module ItemIndicator = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemIndicator"
    [@@mel.module "@kobalte/core/select"]
  end

  (** An accessible label to be announced for the item.
      Useful for items that have more complex content (e.g. icons, multiple lines of text, etc.) *)
  module ItemLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ItemLabel"
    [@@mel.module "@kobalte/core/select"]
  end

  (** The label that gives the user information on the select. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/select"]
  end

  (** Contains all the items of a `Select`. *)
  module Listbox = struct
    module Props = struct
      external check :
        ?scroll_ref:Dom.htmlElement option Solidtype.Solid.accessor Solidtype.Check.value ->
        ?scroll_to_item:(string -> unit) ->
        (?children:(('option, 'opt_group) Types.Either.t Types.CollectionNode.t Types.Collection.t Solidtype.Solid.accessor -> Solidtype.Jsx.element, [ `render ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Ul.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Listbox"
    [@@mel.module "@kobalte/core/select"]
  end

  (** Portals its children into the `body` when the select is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Solidtype.Check.value ->
        ?use_shadow:bool Solidtype.Check.value ->
        ?is_svg:bool Solidtype.Check.value ->
        children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/select"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:'option Js.Nullable.t Solidtype.Check.value ->
        ?default_value:'option Solidtype.Check.value ->
        ?on_change:('option Js.Nullable.t -> unit) ->
        ?id:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Solidtype.Check.value ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?flip:(string, bool) Types.Either.t Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?same_width:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?placeholder:Solidtype.Jsx.element Solidtype.Check.value ->
        options:('option, 'opt_group) Types.Either.t array Solidtype.Check.value ->
        ?option_value:('option -> (string, float) Types.Either.t) ->
        ?option_text_value:('option -> string) ->
        ?option_disabled:('option -> bool) ->
        ?option_group_children:string Solidtype.Check.value ->
        ?keyboard_delegate:Types.KeyboardDelegate.t Solidtype.Check.value ->
        ?should_focus_wrap:bool Solidtype.Check.value ->
        ?selection_behavior:[ `toggle | `replace ] Solidtype.Check.value ->
        ?allow_duplicate_selection_events:bool Solidtype.Check.value ->
        ?disallow_empty_selection:bool Solidtype.Check.value ->
        ?close_on_selection:bool Solidtype.Check.value ->
        ?virtualized:bool Solidtype.Check.value ->
        ?item_component:('option Types.SelectBaseItemComponentProps.t -> Solidtype.Jsx.element) ->
        ?section_component:('opt_group Types.SelectBaseSectionComponentProps.t -> Solidtype.Jsx.element) ->
        ?modal:bool Solidtype.Check.value ->
        ?prevent_scroll:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        ?disallow_type_ahead:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/select"]
  end

  module Root_multiple = struct
    module Props = struct
      external check :
        ?value:'option array Solidtype.Check.value ->
        ?default_value:'option array Solidtype.Check.value ->
        ?on_change:('option array -> unit) ->
        multiple:bool Solidtype.Check.value ->
        ?id:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Solidtype.Check.value ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?flip:(string, bool) Types.Either.t Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?same_width:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?placeholder:Solidtype.Jsx.element Solidtype.Check.value ->
        options:('option, 'opt_group) Types.Either.t array Solidtype.Check.value ->
        ?option_value:('option -> (string, float) Types.Either.t) ->
        ?option_text_value:('option -> string) ->
        ?option_disabled:('option -> bool) ->
        ?option_group_children:string Solidtype.Check.value ->
        ?keyboard_delegate:Types.KeyboardDelegate.t Solidtype.Check.value ->
        ?should_focus_wrap:bool Solidtype.Check.value ->
        ?selection_behavior:[ `toggle | `replace ] Solidtype.Check.value ->
        ?allow_duplicate_selection_events:bool Solidtype.Check.value ->
        ?disallow_empty_selection:bool Solidtype.Check.value ->
        ?close_on_selection:bool Solidtype.Check.value ->
        ?virtualized:bool Solidtype.Check.value ->
        ?item_component:('option Types.SelectBaseItemComponentProps.t -> Solidtype.Jsx.element) ->
        ?section_component:('opt_group Types.SelectBaseSectionComponentProps.t -> Solidtype.Jsx.element) ->
        ?modal:bool Solidtype.Check.value ->
        ?prevent_scroll:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        ?disallow_type_ahead:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/select"]
  end

  (** A component used to render the label of a listbox option group.
      It won't be focusable using arrow keys. *)
  module Section = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Section"
    [@@mel.module "@kobalte/core/select"]
  end

  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/select"]
  end

  (** The part that reflects the selected value(s). *)
  module Value = struct
    module Props = struct
      external check :
        (?children:('option Types.SelectValueState.t -> Solidtype.Jsx.element, [ `nodes | `render ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Value"
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
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Hr.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/separator"]
  end
end

module Skeleton = struct
  module Root = struct
    module Props = struct
      external check :
        ?visible:bool Solidtype.Check.value ->
        ?width:float Solidtype.Check.value ->
        ?height:float Solidtype.Check.value ->
        ?circle:bool Solidtype.Check.value ->
        ?radius:float Solidtype.Check.value ->
        ?animate:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/skeleton"]
  end
end

module Slider = struct
  (** The description that gives the user more information on the form control. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/slider"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/slider"]
  end

  (** The component that visually represents the slider value.
      Used to visually show the fill of `Slider.Track`. *)
  module Fill = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Fill"
    [@@mel.module "@kobalte/core/slider"]
  end

  (** The native html input that is visually hidden in the slider thumb. *)
  module Input = struct
    module Props = struct
      external check :
        ?style:string Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Input"
    [@@mel.module "@kobalte/core/slider"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/slider"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:float array Solidtype.Check.value ->
        ?default_value:float array Solidtype.Check.value ->
        ?on_change:(float array -> unit) ->
        ?on_change_end:(float array -> unit) ->
        ?inverted:bool Solidtype.Check.value ->
        ?min_value:float Solidtype.Check.value ->
        ?max_value:float Solidtype.Check.value ->
        ?step:float Solidtype.Check.value ->
        ?min_steps_between_thumbs:float Solidtype.Check.value ->
        ?get_value_label:(Types.GetValueLabelParams2.t -> string) ->
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        ?id:string Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/slider"]
  end

  module Thumb = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Thumb"
    [@@mel.module "@kobalte/core/slider"]
  end

  (** The component that visually represents the slider track.
      Act as a container for `Slider.Fill`. *)
  module Track = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Track"
    [@@mel.module "@kobalte/core/slider"]
  end

  (** The accessible label text representing the current value in a human-readable format. *)
  module ValueLabel = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ValueLabel"
    [@@mel.module "@kobalte/core/slider"]
  end

  external use_slider_context : unit -> Types.SliderContextValue.t = "useSliderContext"
  [@@mel.module "@kobalte/core/slider"]
end

module SpinButton = struct
  module Root = struct
    module Props = struct
      external check :
        ?translations:Types.ColorChannelField_Root_Translations.t Solidtype.Check.value ->
        ?value:(string, float) Types.Either.t Solidtype.Check.value ->
        ?text_value:string Solidtype.Check.value ->
        ?min_value:float Solidtype.Check.value ->
        ?max_value:float Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        ?on_increment:(unit -> unit) ->
        ?on_increment_page:(unit -> unit) ->
        ?on_decrement:(unit -> unit) ->
        ?on_decrement_page:(unit -> unit) ->
        ?on_decrement_to_min:(unit -> unit) ->
        ?on_increment_to_max:(unit -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/spin-button"]
  end
end

module Switch = struct
  (** The element that visually represents a switch. *)
  module Control = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Control"
    [@@mel.module "@kobalte/core/switch"]
  end

  (** The description that gives the user more information on the switch. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/switch"]
  end

  (** The error message that gives the user information about how to fix a validation error on the switch. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/switch"]
  end

  (** The native html input that is visually hidden in the switch. *)
  module Input = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Input"
    [@@mel.module "@kobalte/core/switch"]
  end

  (** The label that gives the user information on the switch. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/switch"]
  end

  (** A control that allows users to choose one of two values: on or off. *)
  module Root = struct
    module Props = struct
      external check :
        ?checked:bool Solidtype.Check.value ->
        ?default_checked:bool Solidtype.Check.value ->
        ?on_change:(bool -> unit) ->
        ?value:string Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        (?children:(Types.SwitchRootState.t -> Solidtype.Jsx.element, [ `nodes | `render ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/switch"]
  end

  (** The thumb that is used to visually indicate whether the switch is on or off. *)
  module Thumb = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Thumb"
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
        value:string Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/tabs"]
  end

  (** The visual indicator displayed at the bottom of the tab list to indicate the selected tab.
      It provides the base style needed to display a smooth transition to the new selected tab. *)
  module Indicator = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Indicator"
    [@@mel.module "@kobalte/core/tabs"]
  end

  (** Contains the tabs that are aligned along the edge of the active tab panel. *)
  module List = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "List"
    [@@mel.module "@kobalte/core/tabs"]
  end

  (** A set of layered sections of content, known as tab panels, that display one panel of content at a time.
      `Tabs` contains all the parts of a tabs component and provide context for its children. *)
  module Root = struct
    module Props = struct
      external check :
        ?value:string Solidtype.Check.value ->
        ?default_value:string Solidtype.Check.value ->
        ?on_change:(string -> unit) ->
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        ?activation_mode:[ `manual | `automatic ] Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/tabs"]
  end

  (** The button that activates its associated tab panel. *)
  module Trigger = struct
    module Props = struct
      external check :
        value:string Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
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
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/text-field"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/text-field"]
  end

  module Input = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Input"
    [@@mel.module "@kobalte/core/text-field"]
  end

  (** The label that gives the user information on the form control. *)
  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Label.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/text-field"]
  end

  (** A text input that allow users to input custom text entries with a keyboard. *)
  module Root = struct
    module Props = struct
      external check :
        ?value:string Solidtype.Check.value ->
        ?default_value:string Solidtype.Check.value ->
        ?on_change:(string -> unit) ->
        ?id:string Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/text-field"]
  end

  (** The native html textarea of the textfield. *)
  module TextArea = struct
    module Props = struct
      external check :
        ?auto_resize:bool Solidtype.Check.value ->
        ?submit_on_enter:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Textarea.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "TextArea"
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
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/time-field"]
  end

  (** The error message that gives the user information about how to fix a validation error on the form control. *)
  module ErrorMessage = struct
    module Props = struct
      external check :
        ?force_mount:bool Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ErrorMessage"
    [@@mel.module "@kobalte/core/time-field"]
  end

  module HiddenInput = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Input.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "HiddenInput"
    [@@mel.module "@kobalte/core/time-field"]
  end

  module Input = struct
    module Props = struct
      external check :
        (?children:([ `hour | `minute | `second | `dayPeriod ] Solidtype.Solid.accessor -> Solidtype.Jsx.element, [ `render ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Input"
    [@@mel.module "@kobalte/core/time-field"]
  end

  module Label = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Span.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Label"
    [@@mel.module "@kobalte/core/time-field"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:Types.Time.t Solidtype.Check.value ->
        ?default_value:Types.Time.t Solidtype.Check.value ->
        ?on_change:(Types.Time.t -> unit) ->
        ?hour_cycle:float Solidtype.Check.value ->
        ?granularity:([ `hour | `minute | `second ], Types.TimeField_Root_Granularity.t) Types.Either.t Solidtype.Check.value ->
        ?force_leading_zeros:bool Solidtype.Check.value ->
        ?placeholder:Types.Time.t Solidtype.Check.value ->
        ?min:Types.Time.t Solidtype.Check.value ->
        ?max:Types.Time.t Solidtype.Check.value ->
        ?id:string Solidtype.Check.value ->
        ?name:string Solidtype.Check.value ->
        ?validation_state:[ `valid | `invalid ] Solidtype.Check.value ->
        ?required:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?read_only:bool Solidtype.Check.value ->
        ?translations:Types.TimeField_Root_Translations.t Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/time-field"]
  end

  module Segment = struct
    module Props = struct
      external check :
        segment:[ `hour | `minute | `second | `dayPeriod ] Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Segment"
    [@@mel.module "@kobalte/core/time-field"]
  end
end

module Toast = struct
  (** The button that closes the toast. *)
  module CloseButton = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "CloseButton"
    [@@mel.module "@kobalte/core/toast"]
  end

  (** An optional accessible description to be announced when the toast is open. *)
  module Description = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Description"
    [@@mel.module "@kobalte/core/toast"]
  end

  (** The list containing all rendered toasts.
      Must be inside a `Toast.Region`. *)
  module List = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Ol.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "List"
    [@@mel.module "@kobalte/core/toast"]
  end

  (** The component that visually represents the toast remaining lifetime.
      Used to visually show the fill of `Toast.ProgressTrack`. *)
  module ProgressFill = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ProgressFill"
    [@@mel.module "@kobalte/core/toast"]
  end

  (** The component that visually represents the toast lifetime.
      Act as a container for `Toast.ProgressFill`. *)
  module ProgressTrack = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "ProgressTrack"
    [@@mel.module "@kobalte/core/toast"]
  end

  (** The fixed area where toasts appear. Users can jump to by pressing a hotkey.
      It is up to you to ensure the discoverability of the hotkey for keyboard users. *)
  module Region = struct
    module Props = struct
      external check :
        ?translations:Types.Toast_Region_Translations.t Solidtype.Check.value ->
        ?hotkey:string array Solidtype.Check.value ->
        ?duration:float Solidtype.Check.value ->
        ?limit:float Solidtype.Check.value ->
        ?swipe_direction:[ `left | `right | `up | `down ] Solidtype.Check.value ->
        ?swipe_threshold:float Solidtype.Check.value ->
        ?pause_on_interaction:bool Solidtype.Check.value ->
        ?pause_on_page_idle:bool Solidtype.Check.value ->
        ?top_layer:bool Solidtype.Check.value ->
        ?region_id:string Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Region"
    [@@mel.module "@kobalte/core/toast"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?translations:Types.Toast_Root_Translations.t Solidtype.Check.value ->
        toast_id:float Solidtype.Check.value ->
        ?priority:[ `high | `low ] Solidtype.Check.value ->
        ?duration:float Solidtype.Check.value ->
        ?persistent:bool Solidtype.Check.value ->
        ?on_pause:(unit -> unit) ->
        ?on_resume:(unit -> unit) ->
        ?on_swipe_start:(Types.SwipeEvent.t -> unit) ->
        ?on_swipe_move:(Types.SwipeEvent.t -> unit) ->
        ?on_swipe_cancel:(Types.SwipeEvent.t -> unit) ->
        ?on_swipe_end:(Types.SwipeEvent.t -> unit) ->
        ?on_escape_key_down:(Dom.keyboardEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Li.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/toast"]
  end

  (** An accessible title to be announced when the toast is open. *)
  module Title = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Title"
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
        ?pressed:bool Solidtype.Check.value ->
        ?default_pressed:bool Solidtype.Check.value ->
        ?on_change:(bool -> unit) ->
        (?children:(Types.ToggleButtonRootState.t -> Solidtype.Jsx.element, [ `nodes | `render ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/toggle-button"]
  end
end

module ToggleGroup = struct
  module Item = struct
    module Props = struct
      external check :
        value:string Solidtype.Check.value ->
        (?children:(Types.ToggleButtonRootState.t -> Solidtype.Jsx.element, [ `nodes | `render ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Item"
    [@@mel.module "@kobalte/core/toggle-group"]
  end

  module Root = struct
    module Props = struct
      external check :
        ?value:string Js.Nullable.t Solidtype.Check.value ->
        ?default_value:string Solidtype.Check.value ->
        ?on_change:(string Js.Nullable.t -> unit) ->
        ?disabled:bool Solidtype.Check.value ->
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/toggle-group"]
  end

  module Root_multiple = struct
    module Props = struct
      external check :
        ?value:string array Solidtype.Check.value ->
        ?default_value:string array Solidtype.Check.value ->
        ?on_change:(string array -> unit) ->
        multiple:bool Solidtype.Check.value ->
        ?disabled:bool Solidtype.Check.value ->
        ?orientation:[ `horizontal | `vertical ] Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
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
        ?size:float Solidtype.Check.value ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Arrow"
    [@@mel.module "@kobalte/core/tooltip"]
  end

  (** Contains the content to be rendered when the tooltip is open. *)
  module Content = struct
    module Props = struct
      external check :
        ?on_escape_key_down:(Dom.keyboardEvent -> unit) ->
        ?on_pointer_down_outside:(Dom.customEvent -> unit) ->
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Div.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Content"
    [@@mel.module "@kobalte/core/tooltip"]
  end

  (** Portals its children into the `body` when the tooltip is open. *)
  module Portal = struct
    module Props = struct
      external check :
        ?mount:Dom.node Solidtype.Check.value ->
        ?use_shadow:bool Solidtype.Check.value ->
        ?is_svg:bool Solidtype.Check.value ->
        children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Portal"
    [@@mel.module "@kobalte/core/tooltip"]
  end

  (** A popup that displays information related to an element
      when the element receives keyboard focus or the mouse hovers over it. *)
  module Root = struct
    module Props = struct
      external check :
        ?open_:bool Solidtype.Check.value ->
        ?default_open:bool Solidtype.Check.value ->
        ?on_open_change:(bool -> unit) ->
        ?disabled:bool Solidtype.Check.value ->
        ?trigger_on_focus_only:bool Solidtype.Check.value ->
        ?open_delay:float Solidtype.Check.value ->
        ?close_delay:float Solidtype.Check.value ->
        ?skip_delay_duration:float Solidtype.Check.value ->
        ?ignore_safe_area:bool Solidtype.Check.value ->
        ?force_mount:bool Solidtype.Check.value ->
        ?id:string Solidtype.Check.value ->
        ?on_current_placement_change:(string -> unit) ->
        ?get_anchor_rect:(Dom.htmlElement option -> Types.AnchorRect.t option) ->
        ?placement:string Solidtype.Check.value ->
        ?gutter:float Solidtype.Check.value ->
        ?shift:float Solidtype.Check.value ->
        ?flip:(string, bool) Types.Either.t Solidtype.Check.value ->
        ?slide:bool Solidtype.Check.value ->
        ?overlap:bool Solidtype.Check.value ->
        ?same_width:bool Solidtype.Check.value ->
        ?fit_viewport:bool Solidtype.Check.value ->
        ?hide_when_detached:bool Solidtype.Check.value ->
        ?detached_padding:float Solidtype.Check.value ->
        ?arrow_padding:float Solidtype.Check.value ->
        ?overflow_padding:float Solidtype.Check.value ->
        ?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Root"
    [@@mel.module "@kobalte/core/tooltip"]
  end

  (** The button that opens the tooltip when hovered. *)
  module Trigger = struct
    module Props = struct
      external check :
        (?children:('f, [ `nodes ]) Solidtype.Check.children -> unit -> unit) Solidtype.Html.Button.check = "check"
      [@@mel.module "vite-plugin-solidtype/markers"]
    end

    external component : unit Solidtype.Jsx.component = "Trigger"
    [@@mel.module "@kobalte/core/tooltip"]
  end

  external use_tooltip_context : unit -> Types.TooltipContextValue.t = "useTooltipContext"
  [@@mel.module "@kobalte/core/tooltip"]
end
