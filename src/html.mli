(** Each element's attributes, as their types: [Html.Div.class_] is
    [string]. Generated from the JSX types of solid-js 1.9.17 by
    [generate/html.ts]; never edited by hand.

    An attribute is named as Solid's JSX names it, by one rule: a capital is
    an underscore and the lower case, [read_only], a hyphen an underscore,
    [aria_label], and an OCaml keyword takes a trailing underscore,
    [class_]. *)

module type Dom_attributes = sig
  type element
  type aria_activedescendant = string
  type aria_atomic = bool
  type aria_autocomplete = [ `none | `inline | `list | `both ]
  type aria_braillelabel = string
  type aria_brailleroledescription = string
  type aria_busy = bool
  type aria_checked = string
  type aria_colcount = string
  type aria_colindex = string
  type aria_colindextext = string
  type aria_colspan = string
  type aria_controls = string
  type aria_current = string
  type aria_describedby = string
  type aria_description = string
  type aria_details = string
  type aria_disabled = bool
  type aria_dropeffect = [ `none | `copy | `execute | `link | `move | `popup ]
  type aria_errormessage = string
  type aria_expanded = bool
  type aria_flowto = string
  type aria_grabbed = bool
  type aria_haspopup = string
  type aria_hidden = bool
  type aria_invalid = string
  type aria_keyshortcuts = string
  type aria_label = string
  type aria_labelledby = string
  type aria_level = string
  type aria_live = [ `off | `assertive | `polite ]
  type aria_modal = bool
  type aria_multiline = bool
  type aria_multiselectable = bool
  type aria_orientation = [ `horizontal | `vertical ]
  type aria_owns = string
  type aria_placeholder = string
  type aria_posinset = string
  type aria_pressed = string
  type aria_readonly = bool
  type aria_relevant = string
  type aria_required = bool
  type aria_roledescription = string
  type aria_rowcount = string
  type aria_rowindex = string
  type aria_rowindextext = string
  type aria_rowspan = string
  type aria_selected = bool
  type aria_setsize = string
  type aria_sort = [ `none | `ascending | `descending | `other ]
  type aria_valuemax = string
  type aria_valuemin = string
  type aria_valuenow = string
  type aria_valuetext = string
  type autofocus = bool
  type class_ = string
  type class_list = bool Js.Dict.t
  type elementtiming = string
  type id = string
  type inner_html = string
  type nonce = string
  type on_abort = Dom.uiEvent -> unit
  type on_animation_cancel = Dom.animationEvent -> unit
  type on_animation_end = Dom.animationEvent -> unit
  type on_animation_iteration = Dom.animationEvent -> unit
  type on_animation_start = Dom.animationEvent -> unit
  type on_aux_click = Dom.pointerEvent -> unit
  type on_before_copy = Dom.clipboardEvent -> unit
  type on_before_cut = Dom.clipboardEvent -> unit
  type on_before_input = Dom.inputEvent -> unit
  type on_before_match = Dom.event -> unit
  type on_before_paste = Dom.clipboardEvent -> unit
  type on_before_toggle = Dom.event -> unit
  type on_before_xr_select = Dom.event -> unit
  type on_blur = Dom.focusEvent -> unit
  type on_can_play = Dom.event -> unit
  type on_can_play_through = Dom.event -> unit
  type on_cancel = Dom.event -> unit
  type on_change = Dom.event -> unit
  type on_click = Dom.mouseEvent -> unit
  type on_close = Dom.event -> unit
  type on_command = Dom.event -> unit
  type on_composition_end = Dom.compositionEvent -> unit
  type on_composition_start = Dom.compositionEvent -> unit
  type on_composition_update = Dom.compositionEvent -> unit
  type on_content_visibility_auto_state_change = Dom.event -> unit
  type on_context_lost = Dom.event -> unit
  type on_context_menu = Dom.pointerEvent -> unit
  type on_context_restored = Dom.event -> unit
  type on_copy = Dom.clipboardEvent -> unit
  type on_cue_change = Dom.event -> unit
  type on_cut = Dom.clipboardEvent -> unit
  type on_dbl_click = Dom.mouseEvent -> unit
  type on_drag = Dom.dragEvent -> unit
  type on_drag_end = Dom.dragEvent -> unit
  type on_drag_enter = Dom.dragEvent -> unit
  type on_drag_exit = Dom.dragEvent -> unit
  type on_drag_leave = Dom.dragEvent -> unit
  type on_drag_over = Dom.dragEvent -> unit
  type on_drag_start = Dom.dragEvent -> unit
  type on_drop = Dom.dragEvent -> unit
  type on_duration_change = Dom.event -> unit
  type on_emptied = Dom.event -> unit
  type on_ended = Dom.event -> unit
  type on_error = Dom.errorEvent -> unit
  type on_focus = Dom.focusEvent -> unit
  type on_focus_in = Dom.focusEvent -> unit
  type on_focus_out = Dom.focusEvent -> unit
  type on_form_data = Dom.event -> unit
  type on_fullscreen_change = Dom.event -> unit
  type on_fullscreen_error = Dom.event -> unit
  type on_got_pointer_capture = Dom.pointerEvent -> unit
  type on_input = Dom.inputEvent -> unit
  type on_invalid = Dom.event -> unit
  type on_key_down = Dom.keyboardEvent -> unit
  type on_key_press = Dom.keyboardEvent -> unit
  type on_key_up = Dom.keyboardEvent -> unit
  type on_load = Dom.event -> unit
  type on_load_start = Dom.event -> unit
  type on_loaded_data = Dom.event -> unit
  type on_loaded_metadata = Dom.event -> unit
  type on_lost_pointer_capture = Dom.pointerEvent -> unit
  type on_mouse_down = Dom.mouseEvent -> unit
  type on_mouse_enter = Dom.mouseEvent -> unit
  type on_mouse_leave = Dom.mouseEvent -> unit
  type on_mouse_move = Dom.mouseEvent -> unit
  type on_mouse_out = Dom.mouseEvent -> unit
  type on_mouse_over = Dom.mouseEvent -> unit
  type on_mouse_up = Dom.mouseEvent -> unit
  type on_paste = Dom.clipboardEvent -> unit
  type on_pause = Dom.event -> unit
  type on_play = Dom.event -> unit
  type on_playing = Dom.event -> unit
  type on_pointer_cancel = Dom.pointerEvent -> unit
  type on_pointer_down = Dom.pointerEvent -> unit
  type on_pointer_enter = Dom.pointerEvent -> unit
  type on_pointer_leave = Dom.pointerEvent -> unit
  type on_pointer_move = Dom.pointerEvent -> unit
  type on_pointer_out = Dom.pointerEvent -> unit
  type on_pointer_over = Dom.pointerEvent -> unit
  type on_pointer_raw_update = Dom.pointerEvent -> unit
  type on_pointer_up = Dom.pointerEvent -> unit
  type on_progress = Dom.progressEvent -> unit
  type on_rate_change = Dom.event -> unit
  type on_reset = Dom.event -> unit
  type on_resize = Dom.uiEvent -> unit
  type on_scroll = Dom.event -> unit
  type on_scroll_end = Dom.event -> unit
  type on_scroll_snap_change = Dom.event -> unit
  type on_scroll_snap_changing = Dom.event -> unit
  type on_security_policy_violation = Dom.event -> unit
  type on_seeked = Dom.event -> unit
  type on_seeking = Dom.event -> unit
  type on_select = Dom.event -> unit
  type on_select_start = Dom.event -> unit
  type on_selection_change = Dom.event -> unit
  type on_slot_change = Dom.event -> unit
  type on_stalled = Dom.event -> unit
  type on_submit = Dom.event -> unit
  type on_suspend = Dom.event -> unit
  type on_time_update = Dom.event -> unit
  type on_toggle = Dom.event -> unit
  type on_touch_cancel = Dom.touchEvent -> unit
  type on_touch_end = Dom.touchEvent -> unit
  type on_touch_move = Dom.touchEvent -> unit
  type on_touch_start = Dom.touchEvent -> unit
  type on_transition_cancel = Dom.transitionEvent -> unit
  type on_transition_end = Dom.transitionEvent -> unit
  type on_transition_run = Dom.transitionEvent -> unit
  type on_transition_start = Dom.transitionEvent -> unit
  type on_volume_change = Dom.event -> unit
  type on_waiting = Dom.event -> unit
  type on_wheel = Dom.wheelEvent -> unit
  type ref = element -> unit
  type role = [ `none | `list | `link | `menu | `listbox | `tree | `grid | `dialog | `alert | `alertdialog | `application | `article | `banner | `button | `cell | `checkbox | `columnheader | `combobox | `complementary | `contentinfo | `definition | `directory | `document | `feed | `figure | `form | `gridcell | `group | `heading | `img | `listitem | `log | `main | `marquee | `math | `menubar | `menuitem | `menuitemcheckbox | `menuitemradio | `meter | `navigation | `note | `option | `presentation | `progressbar | `radio | `radiogroup | `region | `row | `rowgroup | `rowheader | `scrollbar | `search | `searchbox | `separator | `slider | `spinbutton | `status | `switch | `tab | `table | `tablist | `tabpanel | `term | `textbox | `timer | `toolbar | `tooltip | `treegrid | `treeitem ]
  type slot = string
  type style = string
  type tab_index = string
  type tabindex = string
  type text_content = string
  type 'r dom_check =
    ?aria_activedescendant:aria_activedescendant Check.value ->
    ?aria_atomic:aria_atomic Check.value ->
    ?aria_autocomplete:aria_autocomplete Check.value ->
    ?aria_braillelabel:aria_braillelabel Check.value ->
    ?aria_brailleroledescription:aria_brailleroledescription Check.value ->
    ?aria_busy:aria_busy Check.value ->
    ?aria_checked:aria_checked Check.value ->
    ?aria_colcount:aria_colcount Check.value ->
    ?aria_colindex:aria_colindex Check.value ->
    ?aria_colindextext:aria_colindextext Check.value ->
    ?aria_colspan:aria_colspan Check.value ->
    ?aria_controls:aria_controls Check.value ->
    ?aria_current:aria_current Check.value ->
    ?aria_describedby:aria_describedby Check.value ->
    ?aria_description:aria_description Check.value ->
    ?aria_details:aria_details Check.value ->
    ?aria_disabled:aria_disabled Check.value ->
    ?aria_dropeffect:aria_dropeffect Check.value ->
    ?aria_errormessage:aria_errormessage Check.value ->
    ?aria_expanded:aria_expanded Check.value ->
    ?aria_flowto:aria_flowto Check.value ->
    ?aria_grabbed:aria_grabbed Check.value ->
    ?aria_haspopup:aria_haspopup Check.value ->
    ?aria_hidden:aria_hidden Check.value ->
    ?aria_invalid:aria_invalid Check.value ->
    ?aria_keyshortcuts:aria_keyshortcuts Check.value ->
    ?aria_label:aria_label Check.value ->
    ?aria_labelledby:aria_labelledby Check.value ->
    ?aria_level:aria_level Check.value ->
    ?aria_live:aria_live Check.value ->
    ?aria_modal:aria_modal Check.value ->
    ?aria_multiline:aria_multiline Check.value ->
    ?aria_multiselectable:aria_multiselectable Check.value ->
    ?aria_orientation:aria_orientation Check.value ->
    ?aria_owns:aria_owns Check.value ->
    ?aria_placeholder:aria_placeholder Check.value ->
    ?aria_posinset:aria_posinset Check.value ->
    ?aria_pressed:aria_pressed Check.value ->
    ?aria_readonly:aria_readonly Check.value ->
    ?aria_relevant:aria_relevant Check.value ->
    ?aria_required:aria_required Check.value ->
    ?aria_roledescription:aria_roledescription Check.value ->
    ?aria_rowcount:aria_rowcount Check.value ->
    ?aria_rowindex:aria_rowindex Check.value ->
    ?aria_rowindextext:aria_rowindextext Check.value ->
    ?aria_rowspan:aria_rowspan Check.value ->
    ?aria_selected:aria_selected Check.value ->
    ?aria_setsize:aria_setsize Check.value ->
    ?aria_sort:aria_sort Check.value ->
    ?aria_valuemax:aria_valuemax Check.value ->
    ?aria_valuemin:aria_valuemin Check.value ->
    ?aria_valuenow:aria_valuenow Check.value ->
    ?aria_valuetext:aria_valuetext Check.value ->
    ?autofocus:autofocus Check.value ->
    ?class_:class_ Check.value ->
    ?class_list:class_list Check.value ->
    ?elementtiming:elementtiming Check.value ->
    ?id:id Check.value ->
    ?inner_html:inner_html Check.value ->
    ?nonce:nonce Check.value ->
    ?on_abort:on_abort ->
    ?on_animation_cancel:on_animation_cancel ->
    ?on_animation_end:on_animation_end ->
    ?on_animation_iteration:on_animation_iteration ->
    ?on_animation_start:on_animation_start ->
    ?on_aux_click:on_aux_click ->
    ?on_before_copy:on_before_copy ->
    ?on_before_cut:on_before_cut ->
    ?on_before_input:on_before_input ->
    ?on_before_match:on_before_match ->
    ?on_before_paste:on_before_paste ->
    ?on_before_toggle:on_before_toggle ->
    ?on_before_xr_select:on_before_xr_select ->
    ?on_blur:on_blur ->
    ?on_can_play:on_can_play ->
    ?on_can_play_through:on_can_play_through ->
    ?on_cancel:on_cancel ->
    ?on_change:on_change ->
    ?on_click:on_click ->
    ?on_close:on_close ->
    ?on_command:on_command ->
    ?on_composition_end:on_composition_end ->
    ?on_composition_start:on_composition_start ->
    ?on_composition_update:on_composition_update ->
    ?on_content_visibility_auto_state_change:on_content_visibility_auto_state_change ->
    ?on_context_lost:on_context_lost ->
    ?on_context_menu:on_context_menu ->
    ?on_context_restored:on_context_restored ->
    ?on_copy:on_copy ->
    ?on_cue_change:on_cue_change ->
    ?on_cut:on_cut ->
    ?on_dbl_click:on_dbl_click ->
    ?on_drag:on_drag ->
    ?on_drag_end:on_drag_end ->
    ?on_drag_enter:on_drag_enter ->
    ?on_drag_exit:on_drag_exit ->
    ?on_drag_leave:on_drag_leave ->
    ?on_drag_over:on_drag_over ->
    ?on_drag_start:on_drag_start ->
    ?on_drop:on_drop ->
    ?on_duration_change:on_duration_change ->
    ?on_emptied:on_emptied ->
    ?on_ended:on_ended ->
    ?on_error:on_error ->
    ?on_focus:on_focus ->
    ?on_focus_in:on_focus_in ->
    ?on_focus_out:on_focus_out ->
    ?on_form_data:on_form_data ->
    ?on_fullscreen_change:on_fullscreen_change ->
    ?on_fullscreen_error:on_fullscreen_error ->
    ?on_got_pointer_capture:on_got_pointer_capture ->
    ?on_input:on_input ->
    ?on_invalid:on_invalid ->
    ?on_key_down:on_key_down ->
    ?on_key_press:on_key_press ->
    ?on_key_up:on_key_up ->
    ?on_load:on_load ->
    ?on_load_start:on_load_start ->
    ?on_loaded_data:on_loaded_data ->
    ?on_loaded_metadata:on_loaded_metadata ->
    ?on_lost_pointer_capture:on_lost_pointer_capture ->
    ?on_mouse_down:on_mouse_down ->
    ?on_mouse_enter:on_mouse_enter ->
    ?on_mouse_leave:on_mouse_leave ->
    ?on_mouse_move:on_mouse_move ->
    ?on_mouse_out:on_mouse_out ->
    ?on_mouse_over:on_mouse_over ->
    ?on_mouse_up:on_mouse_up ->
    ?on_paste:on_paste ->
    ?on_pause:on_pause ->
    ?on_play:on_play ->
    ?on_playing:on_playing ->
    ?on_pointer_cancel:on_pointer_cancel ->
    ?on_pointer_down:on_pointer_down ->
    ?on_pointer_enter:on_pointer_enter ->
    ?on_pointer_leave:on_pointer_leave ->
    ?on_pointer_move:on_pointer_move ->
    ?on_pointer_out:on_pointer_out ->
    ?on_pointer_over:on_pointer_over ->
    ?on_pointer_raw_update:on_pointer_raw_update ->
    ?on_pointer_up:on_pointer_up ->
    ?on_progress:on_progress ->
    ?on_rate_change:on_rate_change ->
    ?on_reset:on_reset ->
    ?on_resize:on_resize ->
    ?on_scroll:on_scroll ->
    ?on_scroll_end:on_scroll_end ->
    ?on_scroll_snap_change:on_scroll_snap_change ->
    ?on_scroll_snap_changing:on_scroll_snap_changing ->
    ?on_security_policy_violation:on_security_policy_violation ->
    ?on_seeked:on_seeked ->
    ?on_seeking:on_seeking ->
    ?on_select:on_select ->
    ?on_select_start:on_select_start ->
    ?on_selection_change:on_selection_change ->
    ?on_slot_change:on_slot_change ->
    ?on_stalled:on_stalled ->
    ?on_submit:on_submit ->
    ?on_suspend:on_suspend ->
    ?on_time_update:on_time_update ->
    ?on_toggle:on_toggle ->
    ?on_touch_cancel:on_touch_cancel ->
    ?on_touch_end:on_touch_end ->
    ?on_touch_move:on_touch_move ->
    ?on_touch_start:on_touch_start ->
    ?on_transition_cancel:on_transition_cancel ->
    ?on_transition_end:on_transition_end ->
    ?on_transition_run:on_transition_run ->
    ?on_transition_start:on_transition_start ->
    ?on_volume_change:on_volume_change ->
    ?on_waiting:on_waiting ->
    ?on_wheel:on_wheel ->
    ?ref:ref ->
    ?role:role Check.value ->
    ?slot:slot Check.value ->
    ?style:style Check.value ->
    ?tab_index:tab_index Check.value ->
    ?tabindex:tabindex Check.value ->
    ?text_content:text_content Check.value ->
    'r
end

module type AnchorHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type attributionsrc = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type charset = string
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type coords = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type download = string
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type href = string
  type hreflang = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type name = string
  type part = string
  type ping = string
  type popover = string
  type prefix = string
  type property = string
  type referrer_policy = string
  type referrerpolicy = string
  type rel = string
  type resource = string
  type rev = string
  type shape = [ `rect | `circle | `poly | `default ]
  type spellcheck = bool
  type target = string
  type title = string
  type translate = [ `yes | `no ]
  type type_ = string
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?attributionsrc:attributionsrc Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?charset:charset Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?coords:coords Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?download:download Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?href:href Check.value ->
    ?hreflang:hreflang Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?name:name Check.value ->
    ?part:part Check.value ->
    ?ping:ping Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?referrer_policy:referrer_policy Check.value ->
    ?referrerpolicy:referrerpolicy Check.value ->
    ?rel:rel Check.value ->
    ?resource:resource Check.value ->
    ?rev:rev Check.value ->
    ?shape:shape Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?target:target Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?type_:type_ Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type AnimateMotionSVGAttributes = sig
  include Dom_attributes
  type accumulate = [ `none | `sum ]
  type additive = [ `sum | `replace ]
  type attribute_name = string
  type begin_ = string
  type by = string
  type calc_mode = [ `discrete | `linear | `paced | `spline ]
  type dur = string
  type end_ = string
  type external_resources_required = bool
  type fill = [ `freeze | `remove ]
  type from = string
  type key_points = string
  type key_splines = string
  type key_times = string
  type lang = string
  type max = string
  type min = string
  type on_begin = Dom.event -> unit
  type on_end = Dom.event -> unit
  type on_repeat = Dom.event -> unit
  type origin = [ `default ]
  type path = string
  type repeat_count = string
  type repeat_dur = string
  type required_extensions = string
  type required_features = string
  type restart = [ `always | `whenNotActive | `never ]
  type rotate = string
  type system_language = string
  type to_ = string
  type values = string
  type xmlns = string
  type 'r check =
    ?accumulate:accumulate Check.value ->
    ?additive:additive Check.value ->
    ?attribute_name:attribute_name Check.value ->
    ?begin_:begin_ Check.value ->
    ?by:by Check.value ->
    ?calc_mode:calc_mode Check.value ->
    ?dur:dur Check.value ->
    ?end_:end_ Check.value ->
    ?external_resources_required:external_resources_required Check.value ->
    ?fill:fill Check.value ->
    ?from:from Check.value ->
    ?key_points:key_points Check.value ->
    ?key_splines:key_splines Check.value ->
    ?key_times:key_times Check.value ->
    ?lang:lang Check.value ->
    ?max:max Check.value ->
    ?min:min Check.value ->
    ?on_begin:on_begin ->
    ?on_end:on_end ->
    ?on_repeat:on_repeat ->
    ?origin:origin Check.value ->
    ?path:path Check.value ->
    ?repeat_count:repeat_count Check.value ->
    ?repeat_dur:repeat_dur Check.value ->
    ?required_extensions:required_extensions Check.value ->
    ?required_features:required_features Check.value ->
    ?restart:restart Check.value ->
    ?rotate:rotate Check.value ->
    ?system_language:system_language Check.value ->
    ?to_:to_ Check.value ->
    ?values:values Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type AnimateSVGAttributes = sig
  include Dom_attributes
  type accumulate = [ `none | `sum ]
  type additive = [ `sum | `replace ]
  type attribute_name = string
  type attribute_type = [ `auto | `CSS | `XML ]
  type begin_ = string
  type by = string
  type calc_mode = [ `discrete | `linear | `paced | `spline ]
  type color_interpolation = string
  type color_rendering = string
  type dur = string
  type end_ = string
  type external_resources_required = bool
  type fill = [ `freeze | `remove ]
  type from = string
  type key_splines = string
  type key_times = string
  type lang = string
  type max = string
  type min = string
  type on_begin = Dom.event -> unit
  type on_end = Dom.event -> unit
  type on_repeat = Dom.event -> unit
  type repeat_count = string
  type repeat_dur = string
  type required_extensions = string
  type required_features = string
  type restart = [ `always | `whenNotActive | `never ]
  type system_language = string
  type to_ = string
  type values = string
  type xmlns = string
  type 'r check =
    ?accumulate:accumulate Check.value ->
    ?additive:additive Check.value ->
    ?attribute_name:attribute_name Check.value ->
    ?attribute_type:attribute_type Check.value ->
    ?begin_:begin_ Check.value ->
    ?by:by Check.value ->
    ?calc_mode:calc_mode Check.value ->
    ?color_interpolation:color_interpolation Check.value ->
    ?color_rendering:color_rendering Check.value ->
    ?dur:dur Check.value ->
    ?end_:end_ Check.value ->
    ?external_resources_required:external_resources_required Check.value ->
    ?fill:fill Check.value ->
    ?from:from Check.value ->
    ?key_splines:key_splines Check.value ->
    ?key_times:key_times Check.value ->
    ?lang:lang Check.value ->
    ?max:max Check.value ->
    ?min:min Check.value ->
    ?on_begin:on_begin ->
    ?on_end:on_end ->
    ?on_repeat:on_repeat ->
    ?repeat_count:repeat_count Check.value ->
    ?repeat_dur:repeat_dur Check.value ->
    ?required_extensions:required_extensions Check.value ->
    ?required_features:required_features Check.value ->
    ?restart:restart Check.value ->
    ?system_language:system_language Check.value ->
    ?to_:to_ Check.value ->
    ?values:values Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type AnimateTransformSVGAttributes = sig
  include Dom_attributes
  type accumulate = [ `none | `sum ]
  type additive = [ `sum | `replace ]
  type attribute_name = string
  type attribute_type = [ `auto | `CSS | `XML ]
  type begin_ = string
  type by = string
  type calc_mode = [ `discrete | `linear | `paced | `spline ]
  type dur = string
  type end_ = string
  type external_resources_required = bool
  type fill = [ `freeze | `remove ]
  type from = string
  type key_splines = string
  type key_times = string
  type lang = string
  type max = string
  type min = string
  type on_begin = Dom.event -> unit
  type on_end = Dom.event -> unit
  type on_repeat = Dom.event -> unit
  type repeat_count = string
  type repeat_dur = string
  type required_extensions = string
  type required_features = string
  type restart = [ `always | `whenNotActive | `never ]
  type system_language = string
  type to_ = string
  type type_ = [ `translate | `scale | `rotate | `skewX | `skewY ]
  type values = string
  type xmlns = string
  type 'r check =
    ?accumulate:accumulate Check.value ->
    ?additive:additive Check.value ->
    ?attribute_name:attribute_name Check.value ->
    ?attribute_type:attribute_type Check.value ->
    ?begin_:begin_ Check.value ->
    ?by:by Check.value ->
    ?calc_mode:calc_mode Check.value ->
    ?dur:dur Check.value ->
    ?end_:end_ Check.value ->
    ?external_resources_required:external_resources_required Check.value ->
    ?fill:fill Check.value ->
    ?from:from Check.value ->
    ?key_splines:key_splines Check.value ->
    ?key_times:key_times Check.value ->
    ?lang:lang Check.value ->
    ?max:max Check.value ->
    ?min:min Check.value ->
    ?on_begin:on_begin ->
    ?on_end:on_end ->
    ?on_repeat:on_repeat ->
    ?repeat_count:repeat_count Check.value ->
    ?repeat_dur:repeat_dur Check.value ->
    ?required_extensions:required_extensions Check.value ->
    ?required_features:required_features Check.value ->
    ?restart:restart Check.value ->
    ?system_language:system_language Check.value ->
    ?to_:to_ Check.value ->
    ?type_:type_ Check.value ->
    ?values:values Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type AreaHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type alt = string
  type attributionsrc = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type coords = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type download = string
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type href = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type nohref = bool
  type part = string
  type ping = string
  type popover = string
  type prefix = string
  type property = string
  type referrer_policy = string
  type referrerpolicy = string
  type rel = string
  type resource = string
  type shape = [ `rect | `circle | `poly | `default ]
  type spellcheck = bool
  type target = string
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?alt:alt Check.value ->
    ?attributionsrc:attributionsrc Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?coords:coords Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?download:download Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?href:href Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?nohref:nohref Check.value ->
    ?part:part Check.value ->
    ?ping:ping Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?referrer_policy:referrer_policy Check.value ->
    ?referrerpolicy:referrerpolicy Check.value ->
    ?rel:rel Check.value ->
    ?resource:resource Check.value ->
    ?shape:shape Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?target:target Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type AudioHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type autoplay = bool
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type controls = bool
  type controlslist = string
  type cross_origin = string
  type crossorigin = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type disableremoteplayback = bool
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type loop = bool
  type media_group = string
  type mediagroup = string
  type muted = bool
  type on_encrypted = Dom.event -> unit
  type on_waiting_for_key = Dom.event -> unit
  type part = string
  type popover = string
  type prefix = string
  type preload = string
  type property = string
  type resource = string
  type spellcheck = bool
  type src = string
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?autoplay:autoplay Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?controls:controls Check.value ->
    ?controlslist:controlslist Check.value ->
    ?cross_origin:cross_origin Check.value ->
    ?crossorigin:crossorigin Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?disableremoteplayback:disableremoteplayback Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?loop:loop Check.value ->
    ?media_group:media_group Check.value ->
    ?mediagroup:mediagroup Check.value ->
    ?muted:muted Check.value ->
    ?on_encrypted:on_encrypted ->
    ?on_waiting_for_key:on_waiting_for_key ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?preload:preload Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?src:src Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type BaseHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type href = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type spellcheck = bool
  type target = string
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?href:href Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?target:target Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type BdoHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type BlockquoteHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type cite = string
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?cite:cite Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type BodyHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type on_after_print = Dom.event -> unit
  type on_before_print = Dom.event -> unit
  type on_before_unload = Dom.beforeUnloadEvent -> unit
  type on_gamepad_connected = Dom.event -> unit
  type on_gamepad_disconnected = Dom.event -> unit
  type on_hashchange = Dom.event -> unit
  type on_language_change = Dom.event -> unit
  type on_message = Dom.messageEvent -> unit
  type on_message_error = Dom.messageEvent -> unit
  type on_offline = Dom.event -> unit
  type on_online = Dom.event -> unit
  type on_page_hide = Dom.pageTransitionEvent -> unit
  type on_page_reveal = Dom.event -> unit
  type on_page_show = Dom.pageTransitionEvent -> unit
  type on_page_swap = Dom.event -> unit
  type on_popstate = Dom.popStateEvent -> unit
  type on_rejection_handled = Dom.event -> unit
  type on_storage = Dom.storageEvent -> unit
  type on_unhandled_rejection = Dom.event -> unit
  type on_unload = Dom.event -> unit
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?on_after_print:on_after_print ->
    ?on_before_print:on_before_print ->
    ?on_before_unload:on_before_unload ->
    ?on_gamepad_connected:on_gamepad_connected ->
    ?on_gamepad_disconnected:on_gamepad_disconnected ->
    ?on_hashchange:on_hashchange ->
    ?on_language_change:on_language_change ->
    ?on_message:on_message ->
    ?on_message_error:on_message_error ->
    ?on_offline:on_offline ->
    ?on_online:on_online ->
    ?on_page_hide:on_page_hide ->
    ?on_page_reveal:on_page_reveal ->
    ?on_page_show:on_page_show ->
    ?on_page_swap:on_page_swap ->
    ?on_popstate:on_popstate ->
    ?on_rejection_handled:on_rejection_handled ->
    ?on_storage:on_storage ->
    ?on_unhandled_rejection:on_unhandled_rejection ->
    ?on_unload:on_unload ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type ButtonHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type command = string
  type commandfor = string
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type disabled = bool
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type form = string
  type form_action = string
  type form_enctype = string
  type form_method = [ `dialog | `post | `get ]
  type form_no_validate = bool
  type form_target = string
  type formaction = string
  type formenctype = string
  type formmethod = [ `dialog | `post | `get ]
  type formnovalidate = bool
  type formtarget = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type name = string
  type part = string
  type popover = string
  type popover_target = string
  type popover_target_action = [ `hide | `show | `toggle ]
  type popovertarget = string
  type popovertargetaction = [ `hide | `show | `toggle ]
  type prefix = string
  type property = string
  type resource = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type type_ = [ `menu | `button | `submit | `reset ]
  type typeof = string
  type value = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?command:command Check.value ->
    ?commandfor:commandfor Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?disabled:disabled Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?form:form Check.value ->
    ?form_action:form_action Check.value ->
    ?form_enctype:form_enctype Check.value ->
    ?form_method:form_method Check.value ->
    ?form_no_validate:form_no_validate Check.value ->
    ?form_target:form_target Check.value ->
    ?formaction:formaction Check.value ->
    ?formenctype:formenctype Check.value ->
    ?formmethod:formmethod Check.value ->
    ?formnovalidate:formnovalidate Check.value ->
    ?formtarget:formtarget Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?name:name Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?popover_target:popover_target Check.value ->
    ?popover_target_action:popover_target_action Check.value ->
    ?popovertarget:popovertarget Check.value ->
    ?popovertargetaction:popovertargetaction Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?type_:type_ Check.value ->
    ?typeof:typeof Check.value ->
    ?value:value Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type CanvasHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type height = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type moz_opaque = bool
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type vocab = string
  type width = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?height:height Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?moz_opaque:moz_opaque Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    ?width:width Check.value ->
    'r dom_check
end

module type CaptionHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type align = [ `left | `center | `right ]
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?align:align Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type CircleSVGAttributes = sig
  include Dom_attributes
  type clip_path = string
  type clip_rule = string
  type color = string
  type color_interpolation = string
  type color_rendering = string
  type cursor = string
  type cx = string
  type cy = string
  type display = string
  type fill = string
  type fill_opacity = string
  type fill_rule = string
  type filter = string
  type lang = string
  type mask = string
  type opacity = string
  type path_length = string
  type pointer_events = string
  type r = string
  type required_extensions = string
  type required_features = string
  type shape_rendering = string
  type stroke = string
  type stroke_dasharray = string
  type stroke_dashoffset = string
  type stroke_linecap = string
  type stroke_linejoin = string
  type stroke_miterlimit = string
  type stroke_opacity = string
  type stroke_width = string
  type system_language = string
  type transform = string
  type visibility = string
  type xmlns = string
  type 'r check =
    ?clip_path:clip_path Check.value ->
    ?clip_rule:clip_rule Check.value ->
    ?color:color Check.value ->
    ?color_interpolation:color_interpolation Check.value ->
    ?color_rendering:color_rendering Check.value ->
    ?cursor:cursor Check.value ->
    ?cx:cx Check.value ->
    ?cy:cy Check.value ->
    ?display:display Check.value ->
    ?fill:fill Check.value ->
    ?fill_opacity:fill_opacity Check.value ->
    ?fill_rule:fill_rule Check.value ->
    ?filter:filter Check.value ->
    ?lang:lang Check.value ->
    ?mask:mask Check.value ->
    ?opacity:opacity Check.value ->
    ?path_length:path_length Check.value ->
    ?pointer_events:pointer_events Check.value ->
    ?r:r Check.value ->
    ?required_extensions:required_extensions Check.value ->
    ?required_features:required_features Check.value ->
    ?shape_rendering:shape_rendering Check.value ->
    ?stroke:stroke Check.value ->
    ?stroke_dasharray:stroke_dasharray Check.value ->
    ?stroke_dashoffset:stroke_dashoffset Check.value ->
    ?stroke_linecap:stroke_linecap Check.value ->
    ?stroke_linejoin:stroke_linejoin Check.value ->
    ?stroke_miterlimit:stroke_miterlimit Check.value ->
    ?stroke_opacity:stroke_opacity Check.value ->
    ?stroke_width:stroke_width Check.value ->
    ?system_language:system_language Check.value ->
    ?transform:transform Check.value ->
    ?visibility:visibility Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type ClipPathSVGAttributes = sig
  include Dom_attributes
  type clip_path = string
  type clip_path_units = [ `userSpaceOnUse | `objectBoundingBox ]
  type external_resources_required = bool
  type lang = string
  type required_extensions = string
  type required_features = string
  type system_language = string
  type transform = string
  type xmlns = string
  type 'r check =
    ?clip_path:clip_path Check.value ->
    ?clip_path_units:clip_path_units Check.value ->
    ?external_resources_required:external_resources_required Check.value ->
    ?lang:lang Check.value ->
    ?required_extensions:required_extensions Check.value ->
    ?required_features:required_features Check.value ->
    ?system_language:system_language Check.value ->
    ?transform:transform Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type ColHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type align = [ `left | `center | `right | `justify | `char ]
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type bgcolor = string
  type char = string
  type charoff = string
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type span = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type valign = [ `baseline | `middle | `bottom | `top ]
  type vocab = string
  type width = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?align:align Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?bgcolor:bgcolor Check.value ->
    ?char:char Check.value ->
    ?charoff:charoff Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?span:span Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?valign:valign Check.value ->
    ?vocab:vocab Check.value ->
    ?width:width Check.value ->
    'r dom_check
end

module type ColgroupHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type align = [ `left | `center | `right | `justify | `char ]
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type bgcolor = string
  type char = string
  type charoff = string
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type span = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type valign = [ `baseline | `middle | `bottom | `top ]
  type vocab = string
  type width = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?align:align Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?bgcolor:bgcolor Check.value ->
    ?char:char Check.value ->
    ?charoff:charoff Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?span:span Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?valign:valign Check.value ->
    ?vocab:vocab Check.value ->
    ?width:width Check.value ->
    'r dom_check
end

module type DataHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type value = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?value:value Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type DefsSVGAttributes = sig
  include Dom_attributes
  type clip_path = string
  type color = string
  type color_interpolation = string
  type color_rendering = string
  type cursor = string
  type enable_background = string
  type external_resources_required = bool
  type fill = string
  type fill_opacity = string
  type fill_rule = string
  type filter = string
  type lang = string
  type mask = string
  type opacity = string
  type path_length = string
  type required_extensions = string
  type required_features = string
  type shape_rendering = string
  type stroke = string
  type stroke_dasharray = string
  type stroke_dashoffset = string
  type stroke_linecap = string
  type stroke_linejoin = string
  type stroke_miterlimit = string
  type stroke_opacity = string
  type stroke_width = string
  type system_language = string
  type transform = string
  type xmlns = string
  type 'r check =
    ?clip_path:clip_path Check.value ->
    ?color:color Check.value ->
    ?color_interpolation:color_interpolation Check.value ->
    ?color_rendering:color_rendering Check.value ->
    ?cursor:cursor Check.value ->
    ?enable_background:enable_background Check.value ->
    ?external_resources_required:external_resources_required Check.value ->
    ?fill:fill Check.value ->
    ?fill_opacity:fill_opacity Check.value ->
    ?fill_rule:fill_rule Check.value ->
    ?filter:filter Check.value ->
    ?lang:lang Check.value ->
    ?mask:mask Check.value ->
    ?opacity:opacity Check.value ->
    ?path_length:path_length Check.value ->
    ?required_extensions:required_extensions Check.value ->
    ?required_features:required_features Check.value ->
    ?shape_rendering:shape_rendering Check.value ->
    ?stroke:stroke Check.value ->
    ?stroke_dasharray:stroke_dasharray Check.value ->
    ?stroke_dashoffset:stroke_dashoffset Check.value ->
    ?stroke_linecap:stroke_linecap Check.value ->
    ?stroke_linejoin:stroke_linejoin Check.value ->
    ?stroke_miterlimit:stroke_miterlimit Check.value ->
    ?stroke_opacity:stroke_opacity Check.value ->
    ?stroke_width:stroke_width Check.value ->
    ?system_language:system_language Check.value ->
    ?transform:transform Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type DescSVGAttributes = sig
  include Dom_attributes
  type lang = string
  type xmlns = string
  type 'r check =
    ?lang:lang Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type DetailsHtmlAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type name = string
  type open_ = bool
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?name:name Check.value ->
    ?open_:open_ Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type DialogHtmlAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type closedby = [ `none | `any | `closerequest ]
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type open_ = bool
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?closedby:closedby Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?open_:open_ Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type EllipseSVGAttributes = sig
  include Dom_attributes
  type clip_path = string
  type clip_rule = string
  type color = string
  type color_interpolation = string
  type color_rendering = string
  type cursor = string
  type cx = string
  type cy = string
  type display = string
  type external_resources_required = bool
  type fill = string
  type fill_opacity = string
  type fill_rule = string
  type filter = string
  type lang = string
  type mask = string
  type opacity = string
  type path_length = string
  type pointer_events = string
  type required_extensions = string
  type required_features = string
  type rx = string
  type ry = string
  type shape_rendering = string
  type stroke = string
  type stroke_dasharray = string
  type stroke_dashoffset = string
  type stroke_linecap = string
  type stroke_linejoin = string
  type stroke_miterlimit = string
  type stroke_opacity = string
  type stroke_width = string
  type system_language = string
  type transform = string
  type visibility = string
  type xmlns = string
  type 'r check =
    ?clip_path:clip_path Check.value ->
    ?clip_rule:clip_rule Check.value ->
    ?color:color Check.value ->
    ?color_interpolation:color_interpolation Check.value ->
    ?color_rendering:color_rendering Check.value ->
    ?cursor:cursor Check.value ->
    ?cx:cx Check.value ->
    ?cy:cy Check.value ->
    ?display:display Check.value ->
    ?external_resources_required:external_resources_required Check.value ->
    ?fill:fill Check.value ->
    ?fill_opacity:fill_opacity Check.value ->
    ?fill_rule:fill_rule Check.value ->
    ?filter:filter Check.value ->
    ?lang:lang Check.value ->
    ?mask:mask Check.value ->
    ?opacity:opacity Check.value ->
    ?path_length:path_length Check.value ->
    ?pointer_events:pointer_events Check.value ->
    ?required_extensions:required_extensions Check.value ->
    ?required_features:required_features Check.value ->
    ?rx:rx Check.value ->
    ?ry:ry Check.value ->
    ?shape_rendering:shape_rendering Check.value ->
    ?stroke:stroke Check.value ->
    ?stroke_dasharray:stroke_dasharray Check.value ->
    ?stroke_dashoffset:stroke_dashoffset Check.value ->
    ?stroke_linecap:stroke_linecap Check.value ->
    ?stroke_linejoin:stroke_linejoin Check.value ->
    ?stroke_miterlimit:stroke_miterlimit Check.value ->
    ?stroke_opacity:stroke_opacity Check.value ->
    ?stroke_width:stroke_width Check.value ->
    ?system_language:system_language Check.value ->
    ?transform:transform Check.value ->
    ?visibility:visibility Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type EmbedHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type align = [ `left | `center | `right | `justify ]
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type height = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type name = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type spellcheck = bool
  type src = string
  type title = string
  type translate = [ `yes | `no ]
  type type_ = string
  type typeof = string
  type vocab = string
  type width = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?align:align Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?height:height Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?name:name Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?src:src Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?type_:type_ Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    ?width:width Check.value ->
    'r dom_check
end

module type FeBlendSVGAttributes = sig
  include Dom_attributes
  type color_interpolation_filters = string
  type height = string
  type in2 = string
  type in_ = string
  type lang = string
  type mode = [ `normal | `multiply | `screen | `darken | `lighten ]
  type result = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?color_interpolation_filters:color_interpolation_filters Check.value ->
    ?height:height Check.value ->
    ?in2:in2 Check.value ->
    ?in_:in_ Check.value ->
    ?lang:lang Check.value ->
    ?mode:mode Check.value ->
    ?result:result Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type FeColorMatrixSVGAttributes = sig
  include Dom_attributes
  type color_interpolation_filters = string
  type height = string
  type in_ = string
  type lang = string
  type result = string
  type type_ = [ `matrix | `saturate | `hueRotate | `luminanceToAlpha ]
  type values = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?color_interpolation_filters:color_interpolation_filters Check.value ->
    ?height:height Check.value ->
    ?in_:in_ Check.value ->
    ?lang:lang Check.value ->
    ?result:result Check.value ->
    ?type_:type_ Check.value ->
    ?values:values Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type FeComponentTransferSVGAttributes = sig
  include Dom_attributes
  type color_interpolation_filters = string
  type height = string
  type in_ = string
  type lang = string
  type result = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?color_interpolation_filters:color_interpolation_filters Check.value ->
    ?height:height Check.value ->
    ?in_:in_ Check.value ->
    ?lang:lang Check.value ->
    ?result:result Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type FeCompositeSVGAttributes = sig
  include Dom_attributes
  type color_interpolation_filters = string
  type height = string
  type in2 = string
  type in_ = string
  type k1 = string
  type k2 = string
  type k3 = string
  type k4 = string
  type lang = string
  type operator = string
  type result = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?color_interpolation_filters:color_interpolation_filters Check.value ->
    ?height:height Check.value ->
    ?in2:in2 Check.value ->
    ?in_:in_ Check.value ->
    ?k1:k1 Check.value ->
    ?k2:k2 Check.value ->
    ?k3:k3 Check.value ->
    ?k4:k4 Check.value ->
    ?lang:lang Check.value ->
    ?operator:operator Check.value ->
    ?result:result Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type FeConvolveMatrixSVGAttributes = sig
  include Dom_attributes
  type bias = string
  type color_interpolation_filters = string
  type divisor = string
  type edge_mode = [ `none | `duplicate | `wrap ]
  type height = string
  type in_ = string
  type kernel_matrix = string
  type kernel_unit_length = string
  type lang = string
  type order = string
  type preserve_alpha = bool
  type result = string
  type target_x = string
  type target_y = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?bias:bias Check.value ->
    ?color_interpolation_filters:color_interpolation_filters Check.value ->
    ?divisor:divisor Check.value ->
    ?edge_mode:edge_mode Check.value ->
    ?height:height Check.value ->
    ?in_:in_ Check.value ->
    ?kernel_matrix:kernel_matrix Check.value ->
    ?kernel_unit_length:kernel_unit_length Check.value ->
    ?lang:lang Check.value ->
    ?order:order Check.value ->
    ?preserve_alpha:preserve_alpha Check.value ->
    ?result:result Check.value ->
    ?target_x:target_x Check.value ->
    ?target_y:target_y Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type FeDiffuseLightingSVGAttributes = sig
  include Dom_attributes
  type color = string
  type color_interpolation_filters = string
  type diffuse_constant = string
  type height = string
  type in_ = string
  type kernel_unit_length = string
  type lang = string
  type lighting_color = string
  type result = string
  type surface_scale = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?color:color Check.value ->
    ?color_interpolation_filters:color_interpolation_filters Check.value ->
    ?diffuse_constant:diffuse_constant Check.value ->
    ?height:height Check.value ->
    ?in_:in_ Check.value ->
    ?kernel_unit_length:kernel_unit_length Check.value ->
    ?lang:lang Check.value ->
    ?lighting_color:lighting_color Check.value ->
    ?result:result Check.value ->
    ?surface_scale:surface_scale Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type FeDisplacementMapSVGAttributes = sig
  include Dom_attributes
  type color_interpolation_filters = string
  type height = string
  type in2 = string
  type in_ = string
  type lang = string
  type result = string
  type scale = string
  type width = string
  type x = string
  type x_channel_selector = [ `R | `G | `B | `A ]
  type xmlns = string
  type y = string
  type y_channel_selector = [ `R | `G | `B | `A ]
  type 'r check =
    ?color_interpolation_filters:color_interpolation_filters Check.value ->
    ?height:height Check.value ->
    ?in2:in2 Check.value ->
    ?in_:in_ Check.value ->
    ?lang:lang Check.value ->
    ?result:result Check.value ->
    ?scale:scale Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?x_channel_selector:x_channel_selector Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    ?y_channel_selector:y_channel_selector Check.value ->
    'r dom_check
end

module type FeDistantLightSVGAttributes = sig
  include Dom_attributes
  type azimuth = string
  type elevation = string
  type lang = string
  type xmlns = string
  type 'r check =
    ?azimuth:azimuth Check.value ->
    ?elevation:elevation Check.value ->
    ?lang:lang Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type FeDropShadowSVGAttributes = sig
  include Dom_attributes
  type color = string
  type color_interpolation_filters = string
  type dx = string
  type dy = string
  type flood_color = string
  type flood_opacity = string
  type height = string
  type lang = string
  type result = string
  type std_deviation = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?color:color Check.value ->
    ?color_interpolation_filters:color_interpolation_filters Check.value ->
    ?dx:dx Check.value ->
    ?dy:dy Check.value ->
    ?flood_color:flood_color Check.value ->
    ?flood_opacity:flood_opacity Check.value ->
    ?height:height Check.value ->
    ?lang:lang Check.value ->
    ?result:result Check.value ->
    ?std_deviation:std_deviation Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type FeFloodSVGAttributes = sig
  include Dom_attributes
  type color = string
  type color_interpolation_filters = string
  type flood_color = string
  type flood_opacity = string
  type height = string
  type lang = string
  type result = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?color:color Check.value ->
    ?color_interpolation_filters:color_interpolation_filters Check.value ->
    ?flood_color:flood_color Check.value ->
    ?flood_opacity:flood_opacity Check.value ->
    ?height:height Check.value ->
    ?lang:lang Check.value ->
    ?result:result Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type FeFuncSVGAttributes = sig
  include Dom_attributes
  type amplitude = string
  type exponent = string
  type intercept = string
  type lang = string
  type offset = string
  type slope = string
  type table_values = string
  type type_ = [ `table | `discrete | `linear | `identity | `gamma ]
  type xmlns = string
  type 'r check =
    ?amplitude:amplitude Check.value ->
    ?exponent:exponent Check.value ->
    ?intercept:intercept Check.value ->
    ?lang:lang Check.value ->
    ?offset:offset Check.value ->
    ?slope:slope Check.value ->
    ?table_values:table_values Check.value ->
    ?type_:type_ Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type FeGaussianBlurSVGAttributes = sig
  include Dom_attributes
  type color_interpolation_filters = string
  type height = string
  type in_ = string
  type lang = string
  type result = string
  type std_deviation = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?color_interpolation_filters:color_interpolation_filters Check.value ->
    ?height:height Check.value ->
    ?in_:in_ Check.value ->
    ?lang:lang Check.value ->
    ?result:result Check.value ->
    ?std_deviation:std_deviation Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type FeImageSVGAttributes = sig
  include Dom_attributes
  type color_interpolation_filters = string
  type external_resources_required = bool
  type height = string
  type href = string
  type lang = string
  type preserve_aspect_ratio = string
  type result = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?color_interpolation_filters:color_interpolation_filters Check.value ->
    ?external_resources_required:external_resources_required Check.value ->
    ?height:height Check.value ->
    ?href:href Check.value ->
    ?lang:lang Check.value ->
    ?preserve_aspect_ratio:preserve_aspect_ratio Check.value ->
    ?result:result Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type FeMergeNodeSVGAttributes = sig
  include Dom_attributes
  type in_ = string
  type lang = string
  type xmlns = string
  type 'r check =
    ?in_:in_ Check.value ->
    ?lang:lang Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type FeMergeSVGAttributes = sig
  include Dom_attributes
  type color_interpolation_filters = string
  type height = string
  type lang = string
  type result = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?color_interpolation_filters:color_interpolation_filters Check.value ->
    ?height:height Check.value ->
    ?lang:lang Check.value ->
    ?result:result Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type FeMorphologySVGAttributes = sig
  include Dom_attributes
  type color_interpolation_filters = string
  type height = string
  type in_ = string
  type lang = string
  type operator = [ `erode | `dilate ]
  type radius = string
  type result = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?color_interpolation_filters:color_interpolation_filters Check.value ->
    ?height:height Check.value ->
    ?in_:in_ Check.value ->
    ?lang:lang Check.value ->
    ?operator:operator Check.value ->
    ?radius:radius Check.value ->
    ?result:result Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type FeOffsetSVGAttributes = sig
  include Dom_attributes
  type color_interpolation_filters = string
  type dx = string
  type dy = string
  type height = string
  type in_ = string
  type lang = string
  type result = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?color_interpolation_filters:color_interpolation_filters Check.value ->
    ?dx:dx Check.value ->
    ?dy:dy Check.value ->
    ?height:height Check.value ->
    ?in_:in_ Check.value ->
    ?lang:lang Check.value ->
    ?result:result Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type FePointLightSVGAttributes = sig
  include Dom_attributes
  type lang = string
  type x = string
  type xmlns = string
  type y = string
  type z = string
  type 'r check =
    ?lang:lang Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    ?z:z Check.value ->
    'r dom_check
end

module type FeSpecularLightingSVGAttributes = sig
  include Dom_attributes
  type color = string
  type color_interpolation_filters = string
  type height = string
  type in_ = string
  type kernel_unit_length = string
  type lang = string
  type lighting_color = string
  type result = string
  type specular_constant = string
  type specular_exponent = string
  type surface_scale = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?color:color Check.value ->
    ?color_interpolation_filters:color_interpolation_filters Check.value ->
    ?height:height Check.value ->
    ?in_:in_ Check.value ->
    ?kernel_unit_length:kernel_unit_length Check.value ->
    ?lang:lang Check.value ->
    ?lighting_color:lighting_color Check.value ->
    ?result:result Check.value ->
    ?specular_constant:specular_constant Check.value ->
    ?specular_exponent:specular_exponent Check.value ->
    ?surface_scale:surface_scale Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type FeSpotLightSVGAttributes = sig
  include Dom_attributes
  type lang = string
  type limiting_cone_angle = string
  type points_at_x = string
  type points_at_y = string
  type points_at_z = string
  type specular_exponent = string
  type x = string
  type xmlns = string
  type y = string
  type z = string
  type 'r check =
    ?lang:lang Check.value ->
    ?limiting_cone_angle:limiting_cone_angle Check.value ->
    ?points_at_x:points_at_x Check.value ->
    ?points_at_y:points_at_y Check.value ->
    ?points_at_z:points_at_z Check.value ->
    ?specular_exponent:specular_exponent Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    ?z:z Check.value ->
    'r dom_check
end

module type FeTileSVGAttributes = sig
  include Dom_attributes
  type color_interpolation_filters = string
  type height = string
  type in_ = string
  type lang = string
  type result = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?color_interpolation_filters:color_interpolation_filters Check.value ->
    ?height:height Check.value ->
    ?in_:in_ Check.value ->
    ?lang:lang Check.value ->
    ?result:result Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type FeTurbulanceSVGAttributes = sig
  include Dom_attributes
  type base_frequency = string
  type color_interpolation_filters = string
  type height = string
  type lang = string
  type num_octaves = string
  type result = string
  type seed = string
  type stitch_tiles = [ `stitch | `noStitch ]
  type type_ = [ `fractalNoise | `turbulence ]
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?base_frequency:base_frequency Check.value ->
    ?color_interpolation_filters:color_interpolation_filters Check.value ->
    ?height:height Check.value ->
    ?lang:lang Check.value ->
    ?num_octaves:num_octaves Check.value ->
    ?result:result Check.value ->
    ?seed:seed Check.value ->
    ?stitch_tiles:stitch_tiles Check.value ->
    ?type_:type_ Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type FieldsetHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type disabled = bool
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type form = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type name = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?disabled:disabled Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?form:form Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?name:name Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type FilterSVGAttributes = sig
  include Dom_attributes
  type external_resources_required = bool
  type filter_res = string
  type filter_units = [ `userSpaceOnUse | `objectBoundingBox ]
  type height = string
  type lang = string
  type primitive_units = [ `userSpaceOnUse | `objectBoundingBox ]
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?external_resources_required:external_resources_required Check.value ->
    ?filter_res:filter_res Check.value ->
    ?filter_units:filter_units Check.value ->
    ?height:height Check.value ->
    ?lang:lang Check.value ->
    ?primitive_units:primitive_units Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type ForeignObjectSVGAttributes = sig
  include Dom_attributes
  type clip = string
  type display = string
  type external_resources_required = bool
  type height = string
  type lang = string
  type overflow = string
  type required_extensions = string
  type required_features = string
  type system_language = string
  type transform = string
  type view_box = string
  type visibility = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?clip:clip Check.value ->
    ?display:display Check.value ->
    ?external_resources_required:external_resources_required Check.value ->
    ?height:height Check.value ->
    ?lang:lang Check.value ->
    ?overflow:overflow Check.value ->
    ?required_extensions:required_extensions Check.value ->
    ?required_features:required_features Check.value ->
    ?system_language:system_language Check.value ->
    ?transform:transform Check.value ->
    ?view_box:view_box Check.value ->
    ?visibility:visibility Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type FormHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type accept = string
  type accept_charset = string
  type access_key = string
  type accesskey = string
  type action = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocomplete = [ `off | `on ]
  type autocorrect = [ `off | `on ]
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type encoding = string
  type enctype = string
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type method_ = [ `dialog | `post | `get ]
  type name = string
  type no_validate = bool
  type novalidate = bool
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type rel = string
  type resource = string
  type spellcheck = bool
  type target = string
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?accept:accept Check.value ->
    ?accept_charset:accept_charset Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?action:action Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocomplete:autocomplete Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?encoding:encoding Check.value ->
    ?enctype:enctype Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?method_:method_ Check.value ->
    ?name:name Check.value ->
    ?no_validate:no_validate Check.value ->
    ?novalidate:novalidate Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?rel:rel Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?target:target Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type GSVGAttributes = sig
  include Dom_attributes
  type clip_path = string
  type color = string
  type color_interpolation = string
  type color_rendering = string
  type cursor = string
  type display = string
  type enable_background = string
  type external_resources_required = bool
  type fill = string
  type fill_opacity = string
  type fill_rule = string
  type filter = string
  type lang = string
  type mask = string
  type opacity = string
  type path_length = string
  type required_extensions = string
  type required_features = string
  type shape_rendering = string
  type stroke = string
  type stroke_dasharray = string
  type stroke_dashoffset = string
  type stroke_linecap = string
  type stroke_linejoin = string
  type stroke_miterlimit = string
  type stroke_opacity = string
  type stroke_width = string
  type system_language = string
  type transform = string
  type visibility = string
  type xmlns = string
  type 'r check =
    ?clip_path:clip_path Check.value ->
    ?color:color Check.value ->
    ?color_interpolation:color_interpolation Check.value ->
    ?color_rendering:color_rendering Check.value ->
    ?cursor:cursor Check.value ->
    ?display:display Check.value ->
    ?enable_background:enable_background Check.value ->
    ?external_resources_required:external_resources_required Check.value ->
    ?fill:fill Check.value ->
    ?fill_opacity:fill_opacity Check.value ->
    ?fill_rule:fill_rule Check.value ->
    ?filter:filter Check.value ->
    ?lang:lang Check.value ->
    ?mask:mask Check.value ->
    ?opacity:opacity Check.value ->
    ?path_length:path_length Check.value ->
    ?required_extensions:required_extensions Check.value ->
    ?required_features:required_features Check.value ->
    ?shape_rendering:shape_rendering Check.value ->
    ?stroke:stroke Check.value ->
    ?stroke_dasharray:stroke_dasharray Check.value ->
    ?stroke_dashoffset:stroke_dashoffset Check.value ->
    ?stroke_linecap:stroke_linecap Check.value ->
    ?stroke_linejoin:stroke_linejoin Check.value ->
    ?stroke_miterlimit:stroke_miterlimit Check.value ->
    ?stroke_opacity:stroke_opacity Check.value ->
    ?stroke_width:stroke_width Check.value ->
    ?system_language:system_language Check.value ->
    ?transform:transform Check.value ->
    ?visibility:visibility Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type HTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type HTMLSlotElementAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type name = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?name:name Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type IframeHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type adauctionheaders = bool
  type align = string
  type allow = string
  type allowfullscreen = bool
  type allowpaymentrequest = bool
  type allowtransparency = bool
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type browsingtopics = bool
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type credentialless = bool
  type csp = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type frameborder = string
  type height = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type loading = string
  type longdesc = string
  type marginheight = string
  type marginwidth = string
  type name = string
  type part = string
  type popover = string
  type prefix = string
  type privatetoken = string
  type property = string
  type referrer_policy = string
  type referrerpolicy = string
  type resource = string
  type sandbox = string
  type scrolling = [ `auto | `yes | `no ]
  type seamless = bool
  type sharedstoragewritable = bool
  type spellcheck = bool
  type src = string
  type srcdoc = string
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type vocab = string
  type width = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?adauctionheaders:adauctionheaders Check.value ->
    ?align:align Check.value ->
    ?allow:allow Check.value ->
    ?allowfullscreen:allowfullscreen Check.value ->
    ?allowpaymentrequest:allowpaymentrequest Check.value ->
    ?allowtransparency:allowtransparency Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?browsingtopics:browsingtopics Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?credentialless:credentialless Check.value ->
    ?csp:csp Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?frameborder:frameborder Check.value ->
    ?height:height Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?loading:loading Check.value ->
    ?longdesc:longdesc Check.value ->
    ?marginheight:marginheight Check.value ->
    ?marginwidth:marginwidth Check.value ->
    ?name:name Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?privatetoken:privatetoken Check.value ->
    ?property:property Check.value ->
    ?referrer_policy:referrer_policy Check.value ->
    ?referrerpolicy:referrerpolicy Check.value ->
    ?resource:resource Check.value ->
    ?sandbox:sandbox Check.value ->
    ?scrolling:scrolling Check.value ->
    ?seamless:seamless Check.value ->
    ?sharedstoragewritable:sharedstoragewritable Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?src:src Check.value ->
    ?srcdoc:srcdoc Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    ?width:width Check.value ->
    'r dom_check
end

module type ImageSVGAttributes = sig
  include Dom_attributes
  type clip = string
  type clip_path = string
  type clip_rule = string
  type color_interpolation = string
  type color_profile = string
  type color_rendering = string
  type cursor = string
  type display = string
  type filter = string
  type height = string
  type href = string
  type image_rendering = string
  type lang = string
  type mask = string
  type opacity = string
  type overflow = string
  type pointer_events = string
  type preserve_aspect_ratio = string
  type required_extensions = string
  type required_features = string
  type system_language = string
  type transform = string
  type view_box = string
  type visibility = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?clip:clip Check.value ->
    ?clip_path:clip_path Check.value ->
    ?clip_rule:clip_rule Check.value ->
    ?color_interpolation:color_interpolation Check.value ->
    ?color_profile:color_profile Check.value ->
    ?color_rendering:color_rendering Check.value ->
    ?cursor:cursor Check.value ->
    ?display:display Check.value ->
    ?filter:filter Check.value ->
    ?height:height Check.value ->
    ?href:href Check.value ->
    ?image_rendering:image_rendering Check.value ->
    ?lang:lang Check.value ->
    ?mask:mask Check.value ->
    ?opacity:opacity Check.value ->
    ?overflow:overflow Check.value ->
    ?pointer_events:pointer_events Check.value ->
    ?preserve_aspect_ratio:preserve_aspect_ratio Check.value ->
    ?required_extensions:required_extensions Check.value ->
    ?required_features:required_features Check.value ->
    ?system_language:system_language Check.value ->
    ?transform:transform Check.value ->
    ?view_box:view_box Check.value ->
    ?visibility:visibility Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type ImgHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type align = [ `middle | `left | `right | `bottom | `top ]
  type alt = string
  type attributionsrc = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type border = string
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type cross_origin = string
  type crossorigin = string
  type datatype = string
  type decoding = [ `auto | `sync | `async ]
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type fetchpriority = [ `auto | `high | `low ]
  type height = string
  type hidden = string
  type hspace = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type intrinsicsize = string
  type is = string
  type is_map = bool
  type ismap = bool
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type loading = string
  type longdesc = string
  type lowsrc = string
  type name = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type referrer_policy = string
  type referrerpolicy = string
  type resource = string
  type sharedstoragewritable = bool
  type sizes = string
  type spellcheck = bool
  type src = string
  type src_set = string
  type srcset = string
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type use_map = string
  type usemap = string
  type vocab = string
  type vspace = string
  type width = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?align:align Check.value ->
    ?alt:alt Check.value ->
    ?attributionsrc:attributionsrc Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?border:border Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?cross_origin:cross_origin Check.value ->
    ?crossorigin:crossorigin Check.value ->
    ?datatype:datatype Check.value ->
    ?decoding:decoding Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?fetchpriority:fetchpriority Check.value ->
    ?height:height Check.value ->
    ?hidden:hidden Check.value ->
    ?hspace:hspace Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?intrinsicsize:intrinsicsize Check.value ->
    ?is:is Check.value ->
    ?is_map:is_map Check.value ->
    ?ismap:ismap Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?loading:loading Check.value ->
    ?longdesc:longdesc Check.value ->
    ?lowsrc:lowsrc Check.value ->
    ?name:name Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?referrer_policy:referrer_policy Check.value ->
    ?referrerpolicy:referrerpolicy Check.value ->
    ?resource:resource Check.value ->
    ?sharedstoragewritable:sharedstoragewritable Check.value ->
    ?sizes:sizes Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?src:src Check.value ->
    ?src_set:src_set Check.value ->
    ?srcset:srcset Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?use_map:use_map Check.value ->
    ?usemap:usemap Check.value ->
    ?vocab:vocab Check.value ->
    ?vspace:vspace Check.value ->
    ?width:width Check.value ->
    'r dom_check
end

module type InputHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type accept = string
  type access_key = string
  type accesskey = string
  type align = string
  type alpha = bool
  type alt = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocomplete = string
  type autocorrect = [ `off | `on ]
  type capture = [ `user | `environment ]
  type checked = bool
  type colorspace = string
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type dirname = string
  type disabled = bool
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type form = string
  type form_action = string
  type form_enctype = string
  type form_method = [ `dialog | `post | `get ]
  type form_no_validate = bool
  type form_target = string
  type formaction = string
  type formenctype = string
  type formmethod = [ `dialog | `post | `get ]
  type formnovalidate = bool
  type formtarget = string
  type height = string
  type hidden = string
  type incremental = bool
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type list = string
  type max = string
  type max_length = string
  type maxlength = string
  type min = string
  type min_length = string
  type minlength = string
  type multiple = bool
  type name = string
  type part = string
  type pattern = string
  type placeholder = string
  type popover = string
  type popovertarget = string
  type popovertargetaction = [ `hide | `show | `toggle ]
  type prefix = string
  type property = string
  type read_only = bool
  type readonly = bool
  type required = bool
  type resource = string
  type results = int
  type size = string
  type spellcheck = bool
  type src = string
  type step = string
  type title = string
  type translate = [ `yes | `no ]
  type type_ = string
  type typeof = string
  type usemap = string
  type value = string
  type vocab = string
  type width = string
  type 'r check =
    ?about:about Check.value ->
    ?accept:accept Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?align:align Check.value ->
    ?alpha:alpha Check.value ->
    ?alt:alt Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocomplete:autocomplete Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?capture:capture Check.value ->
    ?checked:checked Check.value ->
    ?colorspace:colorspace Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?dirname:dirname Check.value ->
    ?disabled:disabled Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?form:form Check.value ->
    ?form_action:form_action Check.value ->
    ?form_enctype:form_enctype Check.value ->
    ?form_method:form_method Check.value ->
    ?form_no_validate:form_no_validate Check.value ->
    ?form_target:form_target Check.value ->
    ?formaction:formaction Check.value ->
    ?formenctype:formenctype Check.value ->
    ?formmethod:formmethod Check.value ->
    ?formnovalidate:formnovalidate Check.value ->
    ?formtarget:formtarget Check.value ->
    ?height:height Check.value ->
    ?hidden:hidden Check.value ->
    ?incremental:incremental Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?list:list Check.value ->
    ?max:max Check.value ->
    ?max_length:max_length Check.value ->
    ?maxlength:maxlength Check.value ->
    ?min:min Check.value ->
    ?min_length:min_length Check.value ->
    ?minlength:minlength Check.value ->
    ?multiple:multiple Check.value ->
    ?name:name Check.value ->
    ?part:part Check.value ->
    ?pattern:pattern Check.value ->
    ?placeholder:placeholder Check.value ->
    ?popover:popover Check.value ->
    ?popovertarget:popovertarget Check.value ->
    ?popovertargetaction:popovertargetaction Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?read_only:read_only Check.value ->
    ?readonly:readonly Check.value ->
    ?required:required Check.value ->
    ?resource:resource Check.value ->
    ?results:results Check.value ->
    ?size:size Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?src:src Check.value ->
    ?step:step Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?type_:type_ Check.value ->
    ?typeof:typeof Check.value ->
    ?usemap:usemap Check.value ->
    ?value:value Check.value ->
    ?vocab:vocab Check.value ->
    ?width:width Check.value ->
    'r dom_check
end

module type KeygenHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type challenge = string
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type disabled = bool
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type form = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type keyparams = string
  type keytype = string
  type lang = string
  type name = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?challenge:challenge Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?disabled:disabled Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?form:form Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?keyparams:keyparams Check.value ->
    ?keytype:keytype Check.value ->
    ?lang:lang Check.value ->
    ?name:name Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type LabelHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type for_ = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?for_:for_ Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type LiHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type type_ = string
  type typeof = string
  type value = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?type_:type_ Check.value ->
    ?typeof:typeof Check.value ->
    ?value:value Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type LineSVGAttributes = sig
  include Dom_attributes
  type clip_path = string
  type clip_rule = string
  type color = string
  type color_interpolation = string
  type color_rendering = string
  type cursor = string
  type display = string
  type external_resources_required = bool
  type fill = string
  type fill_opacity = string
  type fill_rule = string
  type filter = string
  type lang = string
  type marker_end = string
  type marker_mid = string
  type marker_start = string
  type mask = string
  type opacity = string
  type path_length = string
  type pointer_events = string
  type required_extensions = string
  type required_features = string
  type shape_rendering = string
  type stroke = string
  type stroke_dasharray = string
  type stroke_dashoffset = string
  type stroke_linecap = string
  type stroke_linejoin = string
  type stroke_miterlimit = string
  type stroke_opacity = string
  type stroke_width = string
  type system_language = string
  type transform = string
  type visibility = string
  type x1 = string
  type x2 = string
  type xmlns = string
  type y1 = string
  type y2 = string
  type 'r check =
    ?clip_path:clip_path Check.value ->
    ?clip_rule:clip_rule Check.value ->
    ?color:color Check.value ->
    ?color_interpolation:color_interpolation Check.value ->
    ?color_rendering:color_rendering Check.value ->
    ?cursor:cursor Check.value ->
    ?display:display Check.value ->
    ?external_resources_required:external_resources_required Check.value ->
    ?fill:fill Check.value ->
    ?fill_opacity:fill_opacity Check.value ->
    ?fill_rule:fill_rule Check.value ->
    ?filter:filter Check.value ->
    ?lang:lang Check.value ->
    ?marker_end:marker_end Check.value ->
    ?marker_mid:marker_mid Check.value ->
    ?marker_start:marker_start Check.value ->
    ?mask:mask Check.value ->
    ?opacity:opacity Check.value ->
    ?path_length:path_length Check.value ->
    ?pointer_events:pointer_events Check.value ->
    ?required_extensions:required_extensions Check.value ->
    ?required_features:required_features Check.value ->
    ?shape_rendering:shape_rendering Check.value ->
    ?stroke:stroke Check.value ->
    ?stroke_dasharray:stroke_dasharray Check.value ->
    ?stroke_dashoffset:stroke_dashoffset Check.value ->
    ?stroke_linecap:stroke_linecap Check.value ->
    ?stroke_linejoin:stroke_linejoin Check.value ->
    ?stroke_miterlimit:stroke_miterlimit Check.value ->
    ?stroke_opacity:stroke_opacity Check.value ->
    ?stroke_width:stroke_width Check.value ->
    ?system_language:system_language Check.value ->
    ?transform:transform Check.value ->
    ?visibility:visibility Check.value ->
    ?x1:x1 Check.value ->
    ?x2:x2 Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y1:y1 Check.value ->
    ?y2:y2 Check.value ->
    'r dom_check
end

module type LinearGradientSVGAttributes = sig
  include Dom_attributes
  type external_resources_required = bool
  type gradient_transform = string
  type gradient_units = [ `userSpaceOnUse | `objectBoundingBox ]
  type href = string
  type lang = string
  type spread_method = [ `pad | `reflect | `repeat ]
  type x1 = string
  type x2 = string
  type xmlns = string
  type y1 = string
  type y2 = string
  type 'r check =
    ?external_resources_required:external_resources_required Check.value ->
    ?gradient_transform:gradient_transform Check.value ->
    ?gradient_units:gradient_units Check.value ->
    ?href:href Check.value ->
    ?lang:lang Check.value ->
    ?spread_method:spread_method Check.value ->
    ?x1:x1 Check.value ->
    ?x2:x2 Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y1:y1 Check.value ->
    ?y2:y2 Check.value ->
    'r dom_check
end

module type LinkHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type as_ = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type blocking = [ `render ]
  type charset = string
  type color = string
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type cross_origin = string
  type crossorigin = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type disabled = bool
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type fetchpriority = [ `auto | `high | `low ]
  type hidden = string
  type href = string
  type hreflang = string
  type imagesizes = string
  type imagesrcset = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type integrity = string
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type media = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type referrer_policy = string
  type referrerpolicy = string
  type rel = string
  type resource = string
  type rev = string
  type sizes = string
  type spellcheck = bool
  type target = string
  type title = string
  type translate = [ `yes | `no ]
  type type_ = string
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?as_:as_ Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?blocking:blocking Check.value ->
    ?charset:charset Check.value ->
    ?color:color Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?cross_origin:cross_origin Check.value ->
    ?crossorigin:crossorigin Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?disabled:disabled Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?fetchpriority:fetchpriority Check.value ->
    ?hidden:hidden Check.value ->
    ?href:href Check.value ->
    ?hreflang:hreflang Check.value ->
    ?imagesizes:imagesizes Check.value ->
    ?imagesrcset:imagesrcset Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?integrity:integrity Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?media:media Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?referrer_policy:referrer_policy Check.value ->
    ?referrerpolicy:referrerpolicy Check.value ->
    ?rel:rel Check.value ->
    ?resource:resource Check.value ->
    ?rev:rev Check.value ->
    ?sizes:sizes Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?target:target Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?type_:type_ Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type MPathSVGAttributes = sig
  include Dom_attributes
  type lang = string
  type xmlns = string
  type 'r check =
    ?lang:lang Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type MapHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type name = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?name:name Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type MarkerSVGAttributes = sig
  include Dom_attributes
  type clip = string
  type clip_path = string
  type color = string
  type color_interpolation = string
  type color_rendering = string
  type cursor = string
  type enable_background = string
  type external_resources_required = bool
  type fill = string
  type fill_opacity = string
  type fill_rule = string
  type filter = string
  type lang = string
  type marker_height = string
  type marker_units = [ `userSpaceOnUse | `strokeWidth ]
  type marker_width = string
  type mask = string
  type opacity = string
  type orient = string
  type overflow = string
  type path_length = string
  type preserve_aspect_ratio = string
  type ref_x = string
  type ref_y = string
  type shape_rendering = string
  type stroke = string
  type stroke_dasharray = string
  type stroke_dashoffset = string
  type stroke_linecap = string
  type stroke_linejoin = string
  type stroke_miterlimit = string
  type stroke_opacity = string
  type stroke_width = string
  type view_box = string
  type xmlns = string
  type 'r check =
    ?clip:clip Check.value ->
    ?clip_path:clip_path Check.value ->
    ?color:color Check.value ->
    ?color_interpolation:color_interpolation Check.value ->
    ?color_rendering:color_rendering Check.value ->
    ?cursor:cursor Check.value ->
    ?enable_background:enable_background Check.value ->
    ?external_resources_required:external_resources_required Check.value ->
    ?fill:fill Check.value ->
    ?fill_opacity:fill_opacity Check.value ->
    ?fill_rule:fill_rule Check.value ->
    ?filter:filter Check.value ->
    ?lang:lang Check.value ->
    ?marker_height:marker_height Check.value ->
    ?marker_units:marker_units Check.value ->
    ?marker_width:marker_width Check.value ->
    ?mask:mask Check.value ->
    ?opacity:opacity Check.value ->
    ?orient:orient Check.value ->
    ?overflow:overflow Check.value ->
    ?path_length:path_length Check.value ->
    ?preserve_aspect_ratio:preserve_aspect_ratio Check.value ->
    ?ref_x:ref_x Check.value ->
    ?ref_y:ref_y Check.value ->
    ?shape_rendering:shape_rendering Check.value ->
    ?stroke:stroke Check.value ->
    ?stroke_dasharray:stroke_dasharray Check.value ->
    ?stroke_dashoffset:stroke_dashoffset Check.value ->
    ?stroke_linecap:stroke_linecap Check.value ->
    ?stroke_linejoin:stroke_linejoin Check.value ->
    ?stroke_miterlimit:stroke_miterlimit Check.value ->
    ?stroke_opacity:stroke_opacity Check.value ->
    ?stroke_width:stroke_width Check.value ->
    ?view_box:view_box Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type MaskSVGAttributes = sig
  include Dom_attributes
  type clip_path = string
  type color = string
  type color_interpolation = string
  type color_rendering = string
  type cursor = string
  type enable_background = string
  type external_resources_required = bool
  type fill = string
  type fill_opacity = string
  type fill_rule = string
  type height = string
  type lang = string
  type mask = string
  type mask_content_units = [ `userSpaceOnUse | `objectBoundingBox ]
  type mask_units = [ `userSpaceOnUse | `objectBoundingBox ]
  type path_length = string
  type required_extensions = string
  type required_features = string
  type shape_rendering = string
  type stroke = string
  type stroke_dasharray = string
  type stroke_dashoffset = string
  type stroke_linecap = string
  type stroke_linejoin = string
  type stroke_miterlimit = string
  type stroke_opacity = string
  type stroke_width = string
  type system_language = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?clip_path:clip_path Check.value ->
    ?color:color Check.value ->
    ?color_interpolation:color_interpolation Check.value ->
    ?color_rendering:color_rendering Check.value ->
    ?cursor:cursor Check.value ->
    ?enable_background:enable_background Check.value ->
    ?external_resources_required:external_resources_required Check.value ->
    ?fill:fill Check.value ->
    ?fill_opacity:fill_opacity Check.value ->
    ?fill_rule:fill_rule Check.value ->
    ?height:height Check.value ->
    ?lang:lang Check.value ->
    ?mask:mask Check.value ->
    ?mask_content_units:mask_content_units Check.value ->
    ?mask_units:mask_units Check.value ->
    ?path_length:path_length Check.value ->
    ?required_extensions:required_extensions Check.value ->
    ?required_features:required_features Check.value ->
    ?shape_rendering:shape_rendering Check.value ->
    ?stroke:stroke Check.value ->
    ?stroke_dasharray:stroke_dasharray Check.value ->
    ?stroke_dashoffset:stroke_dashoffset Check.value ->
    ?stroke_linecap:stroke_linecap Check.value ->
    ?stroke_linejoin:stroke_linejoin Check.value ->
    ?stroke_miterlimit:stroke_miterlimit Check.value ->
    ?stroke_opacity:stroke_opacity Check.value ->
    ?stroke_width:stroke_width Check.value ->
    ?system_language:system_language Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type MenuHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type compact = bool
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type label = string
  type lang = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type type_ = [ `toolbar | `context ]
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?compact:compact Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?label:label Check.value ->
    ?lang:lang Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?type_:type_ Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type MetaHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type charset = string
  type content = string
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type http_equiv = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type media = string
  type name = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type scheme = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?charset:charset Check.value ->
    ?content:content Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?http_equiv:http_equiv Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?media:media Check.value ->
    ?name:name Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?scheme:scheme Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type MetadataSVGAttributes = sig
  include Dom_attributes
  type lang = string
  type xmlns = string
  type 'r check =
    ?lang:lang Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type MeterHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type form = string
  type hidden = string
  type high = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type low = string
  type max = string
  type min = string
  type optimum = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type value = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?form:form Check.value ->
    ?hidden:hidden Check.value ->
    ?high:high Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?low:low Check.value ->
    ?max:max Check.value ->
    ?min:min Check.value ->
    ?optimum:optimum Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?value:value Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type ModHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type cite = string
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type date_time = string
  type datetime = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?cite:cite Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?date_time:date_time Check.value ->
    ?datetime:datetime Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type ObjectHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type align = string
  type archive = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type border = string
  type classid = string
  type code = string
  type codebase = string
  type codetype = string
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type data = string
  type datatype = string
  type declare = bool
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type form = string
  type height = string
  type hidden = string
  type hspace = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type name = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type spellcheck = bool
  type standby = string
  type title = string
  type translate = [ `yes | `no ]
  type type_ = string
  type typemustmatch = bool
  type typeof = string
  type use_map = string
  type usemap = string
  type vocab = string
  type vspace = string
  type width = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?align:align Check.value ->
    ?archive:archive Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?border:border Check.value ->
    ?classid:classid Check.value ->
    ?code:code Check.value ->
    ?codebase:codebase Check.value ->
    ?codetype:codetype Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?data:data Check.value ->
    ?datatype:datatype Check.value ->
    ?declare:declare Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?form:form Check.value ->
    ?height:height Check.value ->
    ?hidden:hidden Check.value ->
    ?hspace:hspace Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?name:name Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?standby:standby Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?type_:type_ Check.value ->
    ?typemustmatch:typemustmatch Check.value ->
    ?typeof:typeof Check.value ->
    ?use_map:use_map Check.value ->
    ?usemap:usemap Check.value ->
    ?vocab:vocab Check.value ->
    ?vspace:vspace Check.value ->
    ?width:width Check.value ->
    'r dom_check
end

module type OlHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type compact = bool
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type reversed = bool
  type spellcheck = bool
  type start = string
  type title = string
  type translate = [ `yes | `no ]
  type type_ = string
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?compact:compact Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?reversed:reversed Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?start:start Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?type_:type_ Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type OptgroupHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type disabled = bool
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type label = string
  type lang = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?disabled:disabled Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?label:label Check.value ->
    ?lang:lang Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type OptionHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type disabled = bool
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type label = string
  type lang = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type selected = bool
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type value = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?disabled:disabled Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?label:label Check.value ->
    ?lang:lang Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?selected:selected Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?value:value Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type OutputHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type for_ = string
  type form = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type name = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?for_:for_ Check.value ->
    ?form:form Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?name:name Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type ParamHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type name = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type type_ = string
  type typeof = string
  type value = string
  type valuetype = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?name:name Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?type_:type_ Check.value ->
    ?typeof:typeof Check.value ->
    ?value:value Check.value ->
    ?valuetype:valuetype Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type PathSVGAttributes = sig
  include Dom_attributes
  type clip_path = string
  type clip_rule = string
  type color = string
  type color_interpolation = string
  type color_rendering = string
  type cursor = string
  type d = string
  type display = string
  type external_resources_required = bool
  type fill = string
  type fill_opacity = string
  type fill_rule = string
  type filter = string
  type lang = string
  type marker_end = string
  type marker_mid = string
  type marker_start = string
  type mask = string
  type opacity = string
  type path_length = string
  type pointer_events = string
  type required_extensions = string
  type required_features = string
  type shape_rendering = string
  type stroke = string
  type stroke_dasharray = string
  type stroke_dashoffset = string
  type stroke_linecap = string
  type stroke_linejoin = string
  type stroke_miterlimit = string
  type stroke_opacity = string
  type stroke_width = string
  type system_language = string
  type transform = string
  type visibility = string
  type xmlns = string
  type 'r check =
    ?clip_path:clip_path Check.value ->
    ?clip_rule:clip_rule Check.value ->
    ?color:color Check.value ->
    ?color_interpolation:color_interpolation Check.value ->
    ?color_rendering:color_rendering Check.value ->
    ?cursor:cursor Check.value ->
    ?d:d Check.value ->
    ?display:display Check.value ->
    ?external_resources_required:external_resources_required Check.value ->
    ?fill:fill Check.value ->
    ?fill_opacity:fill_opacity Check.value ->
    ?fill_rule:fill_rule Check.value ->
    ?filter:filter Check.value ->
    ?lang:lang Check.value ->
    ?marker_end:marker_end Check.value ->
    ?marker_mid:marker_mid Check.value ->
    ?marker_start:marker_start Check.value ->
    ?mask:mask Check.value ->
    ?opacity:opacity Check.value ->
    ?path_length:path_length Check.value ->
    ?pointer_events:pointer_events Check.value ->
    ?required_extensions:required_extensions Check.value ->
    ?required_features:required_features Check.value ->
    ?shape_rendering:shape_rendering Check.value ->
    ?stroke:stroke Check.value ->
    ?stroke_dasharray:stroke_dasharray Check.value ->
    ?stroke_dashoffset:stroke_dashoffset Check.value ->
    ?stroke_linecap:stroke_linecap Check.value ->
    ?stroke_linejoin:stroke_linejoin Check.value ->
    ?stroke_miterlimit:stroke_miterlimit Check.value ->
    ?stroke_opacity:stroke_opacity Check.value ->
    ?stroke_width:stroke_width Check.value ->
    ?system_language:system_language Check.value ->
    ?transform:transform Check.value ->
    ?visibility:visibility Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type PatternSVGAttributes = sig
  include Dom_attributes
  type clip = string
  type clip_path = string
  type color = string
  type color_interpolation = string
  type color_rendering = string
  type cursor = string
  type enable_background = string
  type external_resources_required = bool
  type fill = string
  type fill_opacity = string
  type fill_rule = string
  type filter = string
  type height = string
  type href = string
  type lang = string
  type mask = string
  type opacity = string
  type overflow = string
  type path_length = string
  type pattern_content_units = [ `userSpaceOnUse | `objectBoundingBox ]
  type pattern_transform = string
  type pattern_units = [ `userSpaceOnUse | `objectBoundingBox ]
  type preserve_aspect_ratio = string
  type required_extensions = string
  type required_features = string
  type shape_rendering = string
  type stroke = string
  type stroke_dasharray = string
  type stroke_dashoffset = string
  type stroke_linecap = string
  type stroke_linejoin = string
  type stroke_miterlimit = string
  type stroke_opacity = string
  type stroke_width = string
  type system_language = string
  type view_box = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?clip:clip Check.value ->
    ?clip_path:clip_path Check.value ->
    ?color:color Check.value ->
    ?color_interpolation:color_interpolation Check.value ->
    ?color_rendering:color_rendering Check.value ->
    ?cursor:cursor Check.value ->
    ?enable_background:enable_background Check.value ->
    ?external_resources_required:external_resources_required Check.value ->
    ?fill:fill Check.value ->
    ?fill_opacity:fill_opacity Check.value ->
    ?fill_rule:fill_rule Check.value ->
    ?filter:filter Check.value ->
    ?height:height Check.value ->
    ?href:href Check.value ->
    ?lang:lang Check.value ->
    ?mask:mask Check.value ->
    ?opacity:opacity Check.value ->
    ?overflow:overflow Check.value ->
    ?path_length:path_length Check.value ->
    ?pattern_content_units:pattern_content_units Check.value ->
    ?pattern_transform:pattern_transform Check.value ->
    ?pattern_units:pattern_units Check.value ->
    ?preserve_aspect_ratio:preserve_aspect_ratio Check.value ->
    ?required_extensions:required_extensions Check.value ->
    ?required_features:required_features Check.value ->
    ?shape_rendering:shape_rendering Check.value ->
    ?stroke:stroke Check.value ->
    ?stroke_dasharray:stroke_dasharray Check.value ->
    ?stroke_dashoffset:stroke_dashoffset Check.value ->
    ?stroke_linecap:stroke_linecap Check.value ->
    ?stroke_linejoin:stroke_linejoin Check.value ->
    ?stroke_miterlimit:stroke_miterlimit Check.value ->
    ?stroke_opacity:stroke_opacity Check.value ->
    ?stroke_width:stroke_width Check.value ->
    ?system_language:system_language Check.value ->
    ?view_box:view_box Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type PolygonSVGAttributes = sig
  include Dom_attributes
  type clip_path = string
  type clip_rule = string
  type color = string
  type color_interpolation = string
  type color_rendering = string
  type cursor = string
  type display = string
  type external_resources_required = bool
  type fill = string
  type fill_opacity = string
  type fill_rule = string
  type filter = string
  type lang = string
  type marker_end = string
  type marker_mid = string
  type marker_start = string
  type mask = string
  type opacity = string
  type path_length = string
  type pointer_events = string
  type points = string
  type required_extensions = string
  type required_features = string
  type shape_rendering = string
  type stroke = string
  type stroke_dasharray = string
  type stroke_dashoffset = string
  type stroke_linecap = string
  type stroke_linejoin = string
  type stroke_miterlimit = string
  type stroke_opacity = string
  type stroke_width = string
  type system_language = string
  type transform = string
  type visibility = string
  type xmlns = string
  type 'r check =
    ?clip_path:clip_path Check.value ->
    ?clip_rule:clip_rule Check.value ->
    ?color:color Check.value ->
    ?color_interpolation:color_interpolation Check.value ->
    ?color_rendering:color_rendering Check.value ->
    ?cursor:cursor Check.value ->
    ?display:display Check.value ->
    ?external_resources_required:external_resources_required Check.value ->
    ?fill:fill Check.value ->
    ?fill_opacity:fill_opacity Check.value ->
    ?fill_rule:fill_rule Check.value ->
    ?filter:filter Check.value ->
    ?lang:lang Check.value ->
    ?marker_end:marker_end Check.value ->
    ?marker_mid:marker_mid Check.value ->
    ?marker_start:marker_start Check.value ->
    ?mask:mask Check.value ->
    ?opacity:opacity Check.value ->
    ?path_length:path_length Check.value ->
    ?pointer_events:pointer_events Check.value ->
    ?points:points Check.value ->
    ?required_extensions:required_extensions Check.value ->
    ?required_features:required_features Check.value ->
    ?shape_rendering:shape_rendering Check.value ->
    ?stroke:stroke Check.value ->
    ?stroke_dasharray:stroke_dasharray Check.value ->
    ?stroke_dashoffset:stroke_dashoffset Check.value ->
    ?stroke_linecap:stroke_linecap Check.value ->
    ?stroke_linejoin:stroke_linejoin Check.value ->
    ?stroke_miterlimit:stroke_miterlimit Check.value ->
    ?stroke_opacity:stroke_opacity Check.value ->
    ?stroke_width:stroke_width Check.value ->
    ?system_language:system_language Check.value ->
    ?transform:transform Check.value ->
    ?visibility:visibility Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type PolylineSVGAttributes = sig
  include Dom_attributes
  type clip_path = string
  type clip_rule = string
  type color = string
  type color_interpolation = string
  type color_rendering = string
  type cursor = string
  type display = string
  type external_resources_required = bool
  type fill = string
  type fill_opacity = string
  type fill_rule = string
  type filter = string
  type lang = string
  type marker_end = string
  type marker_mid = string
  type marker_start = string
  type mask = string
  type opacity = string
  type path_length = string
  type pointer_events = string
  type points = string
  type required_extensions = string
  type required_features = string
  type shape_rendering = string
  type stroke = string
  type stroke_dasharray = string
  type stroke_dashoffset = string
  type stroke_linecap = string
  type stroke_linejoin = string
  type stroke_miterlimit = string
  type stroke_opacity = string
  type stroke_width = string
  type system_language = string
  type transform = string
  type visibility = string
  type xmlns = string
  type 'r check =
    ?clip_path:clip_path Check.value ->
    ?clip_rule:clip_rule Check.value ->
    ?color:color Check.value ->
    ?color_interpolation:color_interpolation Check.value ->
    ?color_rendering:color_rendering Check.value ->
    ?cursor:cursor Check.value ->
    ?display:display Check.value ->
    ?external_resources_required:external_resources_required Check.value ->
    ?fill:fill Check.value ->
    ?fill_opacity:fill_opacity Check.value ->
    ?fill_rule:fill_rule Check.value ->
    ?filter:filter Check.value ->
    ?lang:lang Check.value ->
    ?marker_end:marker_end Check.value ->
    ?marker_mid:marker_mid Check.value ->
    ?marker_start:marker_start Check.value ->
    ?mask:mask Check.value ->
    ?opacity:opacity Check.value ->
    ?path_length:path_length Check.value ->
    ?pointer_events:pointer_events Check.value ->
    ?points:points Check.value ->
    ?required_extensions:required_extensions Check.value ->
    ?required_features:required_features Check.value ->
    ?shape_rendering:shape_rendering Check.value ->
    ?stroke:stroke Check.value ->
    ?stroke_dasharray:stroke_dasharray Check.value ->
    ?stroke_dashoffset:stroke_dashoffset Check.value ->
    ?stroke_linecap:stroke_linecap Check.value ->
    ?stroke_linejoin:stroke_linejoin Check.value ->
    ?stroke_miterlimit:stroke_miterlimit Check.value ->
    ?stroke_opacity:stroke_opacity Check.value ->
    ?stroke_width:stroke_width Check.value ->
    ?system_language:system_language Check.value ->
    ?transform:transform Check.value ->
    ?visibility:visibility Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type ProgressHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type max = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type value = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?max:max Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?value:value Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type QuoteHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type cite = string
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?cite:cite Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type RadialGradientSVGAttributes = sig
  include Dom_attributes
  type cx = string
  type cy = string
  type external_resources_required = bool
  type fx = string
  type fy = string
  type gradient_transform = string
  type gradient_units = [ `userSpaceOnUse | `objectBoundingBox ]
  type href = string
  type lang = string
  type r = string
  type spread_method = [ `pad | `reflect | `repeat ]
  type xmlns = string
  type 'r check =
    ?cx:cx Check.value ->
    ?cy:cy Check.value ->
    ?external_resources_required:external_resources_required Check.value ->
    ?fx:fx Check.value ->
    ?fy:fy Check.value ->
    ?gradient_transform:gradient_transform Check.value ->
    ?gradient_units:gradient_units Check.value ->
    ?href:href Check.value ->
    ?lang:lang Check.value ->
    ?r:r Check.value ->
    ?spread_method:spread_method Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type RectSVGAttributes = sig
  include Dom_attributes
  type clip_path = string
  type clip_rule = string
  type color = string
  type color_interpolation = string
  type color_rendering = string
  type cursor = string
  type display = string
  type external_resources_required = bool
  type fill = string
  type fill_opacity = string
  type fill_rule = string
  type filter = string
  type height = string
  type lang = string
  type mask = string
  type opacity = string
  type path_length = string
  type pointer_events = string
  type required_extensions = string
  type required_features = string
  type rx = string
  type ry = string
  type shape_rendering = string
  type stroke = string
  type stroke_dasharray = string
  type stroke_dashoffset = string
  type stroke_linecap = string
  type stroke_linejoin = string
  type stroke_miterlimit = string
  type stroke_opacity = string
  type stroke_width = string
  type system_language = string
  type transform = string
  type visibility = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?clip_path:clip_path Check.value ->
    ?clip_rule:clip_rule Check.value ->
    ?color:color Check.value ->
    ?color_interpolation:color_interpolation Check.value ->
    ?color_rendering:color_rendering Check.value ->
    ?cursor:cursor Check.value ->
    ?display:display Check.value ->
    ?external_resources_required:external_resources_required Check.value ->
    ?fill:fill Check.value ->
    ?fill_opacity:fill_opacity Check.value ->
    ?fill_rule:fill_rule Check.value ->
    ?filter:filter Check.value ->
    ?height:height Check.value ->
    ?lang:lang Check.value ->
    ?mask:mask Check.value ->
    ?opacity:opacity Check.value ->
    ?path_length:path_length Check.value ->
    ?pointer_events:pointer_events Check.value ->
    ?required_extensions:required_extensions Check.value ->
    ?required_features:required_features Check.value ->
    ?rx:rx Check.value ->
    ?ry:ry Check.value ->
    ?shape_rendering:shape_rendering Check.value ->
    ?stroke:stroke Check.value ->
    ?stroke_dasharray:stroke_dasharray Check.value ->
    ?stroke_dashoffset:stroke_dashoffset Check.value ->
    ?stroke_linecap:stroke_linecap Check.value ->
    ?stroke_linejoin:stroke_linejoin Check.value ->
    ?stroke_miterlimit:stroke_miterlimit Check.value ->
    ?stroke_opacity:stroke_opacity Check.value ->
    ?stroke_width:stroke_width Check.value ->
    ?system_language:system_language Check.value ->
    ?transform:transform Check.value ->
    ?visibility:visibility Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type ScriptHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type async = bool
  type attributionsrc = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type blocking = [ `render ]
  type charset = string
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type cross_origin = string
  type crossorigin = string
  type datatype = string
  type defer = bool
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type event = string
  type export_parts = string
  type exportparts = string
  type fetchpriority = [ `auto | `high | `low ]
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type integrity = string
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type language = string
  type no_module = bool
  type nomodule = bool
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type referrer_policy = string
  type referrerpolicy = string
  type resource = string
  type spellcheck = bool
  type src = string
  type title = string
  type translate = [ `yes | `no ]
  type type_ = string
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?async:async Check.value ->
    ?attributionsrc:attributionsrc Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?blocking:blocking Check.value ->
    ?charset:charset Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?cross_origin:cross_origin Check.value ->
    ?crossorigin:crossorigin Check.value ->
    ?datatype:datatype Check.value ->
    ?defer:defer Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?event:event Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?fetchpriority:fetchpriority Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?integrity:integrity Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?language:language Check.value ->
    ?no_module:no_module Check.value ->
    ?nomodule:nomodule Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?referrer_policy:referrer_policy Check.value ->
    ?referrerpolicy:referrerpolicy Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?src:src Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?type_:type_ Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type SelectHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocomplete = string
  type autocorrect = [ `off | `on ]
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type disabled = bool
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type form = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type multiple = bool
  type name = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type required = bool
  type resource = string
  type size = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type value = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocomplete:autocomplete Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?disabled:disabled Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?form:form Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?multiple:multiple Check.value ->
    ?name:name Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?required:required Check.value ->
    ?resource:resource Check.value ->
    ?size:size Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?value:value Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type SetSVGAttributes = sig
  include Dom_attributes
  type begin_ = string
  type dur = string
  type end_ = string
  type external_resources_required = bool
  type fill = [ `freeze | `remove ]
  type lang = string
  type max = string
  type min = string
  type on_begin = Dom.event -> unit
  type on_end = Dom.event -> unit
  type on_repeat = Dom.event -> unit
  type repeat_count = string
  type repeat_dur = string
  type required_extensions = string
  type required_features = string
  type restart = [ `always | `whenNotActive | `never ]
  type system_language = string
  type xmlns = string
  type 'r check =
    ?begin_:begin_ Check.value ->
    ?dur:dur Check.value ->
    ?end_:end_ Check.value ->
    ?external_resources_required:external_resources_required Check.value ->
    ?fill:fill Check.value ->
    ?lang:lang Check.value ->
    ?max:max Check.value ->
    ?min:min Check.value ->
    ?on_begin:on_begin ->
    ?on_end:on_end ->
    ?on_repeat:on_repeat ->
    ?repeat_count:repeat_count Check.value ->
    ?repeat_dur:repeat_dur Check.value ->
    ?required_extensions:required_extensions Check.value ->
    ?required_features:required_features Check.value ->
    ?restart:restart Check.value ->
    ?system_language:system_language Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type SourceHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type height = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type media = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type sizes = string
  type spellcheck = bool
  type src = string
  type srcset = string
  type title = string
  type translate = [ `yes | `no ]
  type type_ = string
  type typeof = string
  type vocab = string
  type width = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?height:height Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?media:media Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?sizes:sizes Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?src:src Check.value ->
    ?srcset:srcset Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?type_:type_ Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    ?width:width Check.value ->
    'r dom_check
end

module type StopSVGAttributes = sig
  include Dom_attributes
  type color = string
  type lang = string
  type offset = string
  type stop_color = string
  type stop_opacity = string
  type xmlns = string
  type 'r check =
    ?color:color Check.value ->
    ?lang:lang Check.value ->
    ?offset:offset Check.value ->
    ?stop_color:stop_color Check.value ->
    ?stop_opacity:stop_opacity Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type StyleHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type blocking = [ `render ]
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type media = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type scoped = bool
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type type_ = string
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?blocking:blocking Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?media:media Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?scoped:scoped Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?type_:type_ Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type SvgSVGAttributes = sig
  include Dom_attributes
  type alignment_baseline = string
  type base_profile = string
  type baseline_shift = string
  type clip = string
  type clip_path = string
  type clip_rule = string
  type color = string
  type color_interpolation = string
  type color_interpolation_filters = string
  type color_profile = string
  type color_rendering = string
  type content_script_type = string
  type content_style_type = string
  type cursor = string
  type direction = string
  type display = string
  type dominant_baseline = string
  type enable_background = string
  type external_resources_required = bool
  type fill = string
  type fill_opacity = string
  type fill_rule = string
  type filter = string
  type flood_color = string
  type flood_opacity = string
  type font_family = string
  type font_size = string
  type font_size_adjust = string
  type font_stretch = string
  type font_style = string
  type font_variant = string
  type font_weight = string
  type glyph_orientation_horizontal = string
  type glyph_orientation_vertical = string
  type height = string
  type image_rendering = string
  type kerning = string
  type lang = string
  type letter_spacing = string
  type lighting_color = string
  type marker_end = string
  type marker_mid = string
  type marker_start = string
  type mask = string
  type on_after_print = Dom.event -> unit
  type on_before_print = Dom.event -> unit
  type on_before_unload = Dom.beforeUnloadEvent -> unit
  type on_gamepad_connected = Dom.event -> unit
  type on_gamepad_disconnected = Dom.event -> unit
  type on_hashchange = Dom.event -> unit
  type on_language_change = Dom.event -> unit
  type on_message = Dom.messageEvent -> unit
  type on_message_error = Dom.messageEvent -> unit
  type on_offline = Dom.event -> unit
  type on_online = Dom.event -> unit
  type on_page_hide = Dom.pageTransitionEvent -> unit
  type on_page_reveal = Dom.event -> unit
  type on_page_show = Dom.pageTransitionEvent -> unit
  type on_page_swap = Dom.event -> unit
  type on_popstate = Dom.popStateEvent -> unit
  type on_rejection_handled = Dom.event -> unit
  type on_storage = Dom.storageEvent -> unit
  type on_unhandled_rejection = Dom.event -> unit
  type on_unload = Dom.event -> unit
  type opacity = string
  type overflow = string
  type path_length = string
  type pointer_events = string
  type preserve_aspect_ratio = string
  type required_extensions = string
  type required_features = string
  type shape_rendering = string
  type stop_color = string
  type stop_opacity = string
  type stroke = string
  type stroke_dasharray = string
  type stroke_dashoffset = string
  type stroke_linecap = string
  type stroke_linejoin = string
  type stroke_miterlimit = string
  type stroke_opacity = string
  type stroke_width = string
  type system_language = string
  type text_anchor = string
  type text_decoration = string
  type text_rendering = string
  type unicode_bidi = string
  type version = string
  type view_box = string
  type visibility = string
  type width = string
  type word_spacing = string
  type writing_mode = string
  type x = string
  type xmlns = string
  type y = string
  type zoom_and_pan = [ `disable | `magnify ]
  type 'r check =
    ?alignment_baseline:alignment_baseline Check.value ->
    ?base_profile:base_profile Check.value ->
    ?baseline_shift:baseline_shift Check.value ->
    ?clip:clip Check.value ->
    ?clip_path:clip_path Check.value ->
    ?clip_rule:clip_rule Check.value ->
    ?color:color Check.value ->
    ?color_interpolation:color_interpolation Check.value ->
    ?color_interpolation_filters:color_interpolation_filters Check.value ->
    ?color_profile:color_profile Check.value ->
    ?color_rendering:color_rendering Check.value ->
    ?content_script_type:content_script_type Check.value ->
    ?content_style_type:content_style_type Check.value ->
    ?cursor:cursor Check.value ->
    ?direction:direction Check.value ->
    ?display:display Check.value ->
    ?dominant_baseline:dominant_baseline Check.value ->
    ?enable_background:enable_background Check.value ->
    ?external_resources_required:external_resources_required Check.value ->
    ?fill:fill Check.value ->
    ?fill_opacity:fill_opacity Check.value ->
    ?fill_rule:fill_rule Check.value ->
    ?filter:filter Check.value ->
    ?flood_color:flood_color Check.value ->
    ?flood_opacity:flood_opacity Check.value ->
    ?font_family:font_family Check.value ->
    ?font_size:font_size Check.value ->
    ?font_size_adjust:font_size_adjust Check.value ->
    ?font_stretch:font_stretch Check.value ->
    ?font_style:font_style Check.value ->
    ?font_variant:font_variant Check.value ->
    ?font_weight:font_weight Check.value ->
    ?glyph_orientation_horizontal:glyph_orientation_horizontal Check.value ->
    ?glyph_orientation_vertical:glyph_orientation_vertical Check.value ->
    ?height:height Check.value ->
    ?image_rendering:image_rendering Check.value ->
    ?kerning:kerning Check.value ->
    ?lang:lang Check.value ->
    ?letter_spacing:letter_spacing Check.value ->
    ?lighting_color:lighting_color Check.value ->
    ?marker_end:marker_end Check.value ->
    ?marker_mid:marker_mid Check.value ->
    ?marker_start:marker_start Check.value ->
    ?mask:mask Check.value ->
    ?on_after_print:on_after_print ->
    ?on_before_print:on_before_print ->
    ?on_before_unload:on_before_unload ->
    ?on_gamepad_connected:on_gamepad_connected ->
    ?on_gamepad_disconnected:on_gamepad_disconnected ->
    ?on_hashchange:on_hashchange ->
    ?on_language_change:on_language_change ->
    ?on_message:on_message ->
    ?on_message_error:on_message_error ->
    ?on_offline:on_offline ->
    ?on_online:on_online ->
    ?on_page_hide:on_page_hide ->
    ?on_page_reveal:on_page_reveal ->
    ?on_page_show:on_page_show ->
    ?on_page_swap:on_page_swap ->
    ?on_popstate:on_popstate ->
    ?on_rejection_handled:on_rejection_handled ->
    ?on_storage:on_storage ->
    ?on_unhandled_rejection:on_unhandled_rejection ->
    ?on_unload:on_unload ->
    ?opacity:opacity Check.value ->
    ?overflow:overflow Check.value ->
    ?path_length:path_length Check.value ->
    ?pointer_events:pointer_events Check.value ->
    ?preserve_aspect_ratio:preserve_aspect_ratio Check.value ->
    ?required_extensions:required_extensions Check.value ->
    ?required_features:required_features Check.value ->
    ?shape_rendering:shape_rendering Check.value ->
    ?stop_color:stop_color Check.value ->
    ?stop_opacity:stop_opacity Check.value ->
    ?stroke:stroke Check.value ->
    ?stroke_dasharray:stroke_dasharray Check.value ->
    ?stroke_dashoffset:stroke_dashoffset Check.value ->
    ?stroke_linecap:stroke_linecap Check.value ->
    ?stroke_linejoin:stroke_linejoin Check.value ->
    ?stroke_miterlimit:stroke_miterlimit Check.value ->
    ?stroke_opacity:stroke_opacity Check.value ->
    ?stroke_width:stroke_width Check.value ->
    ?system_language:system_language Check.value ->
    ?text_anchor:text_anchor Check.value ->
    ?text_decoration:text_decoration Check.value ->
    ?text_rendering:text_rendering Check.value ->
    ?unicode_bidi:unicode_bidi Check.value ->
    ?version:version Check.value ->
    ?view_box:view_box Check.value ->
    ?visibility:visibility Check.value ->
    ?width:width Check.value ->
    ?word_spacing:word_spacing Check.value ->
    ?writing_mode:writing_mode Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    ?zoom_and_pan:zoom_and_pan Check.value ->
    'r dom_check
end

module type SwitchSVGAttributes = sig
  include Dom_attributes
  type clip_path = string
  type color = string
  type color_interpolation = string
  type color_rendering = string
  type cursor = string
  type display = string
  type enable_background = string
  type external_resources_required = bool
  type fill = string
  type fill_opacity = string
  type fill_rule = string
  type filter = string
  type lang = string
  type mask = string
  type opacity = string
  type path_length = string
  type required_extensions = string
  type required_features = string
  type shape_rendering = string
  type stroke = string
  type stroke_dasharray = string
  type stroke_dashoffset = string
  type stroke_linecap = string
  type stroke_linejoin = string
  type stroke_miterlimit = string
  type stroke_opacity = string
  type stroke_width = string
  type system_language = string
  type transform = string
  type visibility = string
  type xmlns = string
  type 'r check =
    ?clip_path:clip_path Check.value ->
    ?color:color Check.value ->
    ?color_interpolation:color_interpolation Check.value ->
    ?color_rendering:color_rendering Check.value ->
    ?cursor:cursor Check.value ->
    ?display:display Check.value ->
    ?enable_background:enable_background Check.value ->
    ?external_resources_required:external_resources_required Check.value ->
    ?fill:fill Check.value ->
    ?fill_opacity:fill_opacity Check.value ->
    ?fill_rule:fill_rule Check.value ->
    ?filter:filter Check.value ->
    ?lang:lang Check.value ->
    ?mask:mask Check.value ->
    ?opacity:opacity Check.value ->
    ?path_length:path_length Check.value ->
    ?required_extensions:required_extensions Check.value ->
    ?required_features:required_features Check.value ->
    ?shape_rendering:shape_rendering Check.value ->
    ?stroke:stroke Check.value ->
    ?stroke_dasharray:stroke_dasharray Check.value ->
    ?stroke_dashoffset:stroke_dashoffset Check.value ->
    ?stroke_linecap:stroke_linecap Check.value ->
    ?stroke_linejoin:stroke_linejoin Check.value ->
    ?stroke_miterlimit:stroke_miterlimit Check.value ->
    ?stroke_opacity:stroke_opacity Check.value ->
    ?stroke_width:stroke_width Check.value ->
    ?system_language:system_language Check.value ->
    ?transform:transform Check.value ->
    ?visibility:visibility Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type SymbolSVGAttributes = sig
  include Dom_attributes
  type clip = string
  type clip_path = string
  type color = string
  type color_interpolation = string
  type color_rendering = string
  type cursor = string
  type enable_background = string
  type external_resources_required = bool
  type fill = string
  type fill_opacity = string
  type fill_rule = string
  type filter = string
  type height = string
  type lang = string
  type mask = string
  type opacity = string
  type overflow = string
  type path_length = string
  type preserve_aspect_ratio = string
  type ref_x = string
  type ref_y = string
  type shape_rendering = string
  type stroke = string
  type stroke_dasharray = string
  type stroke_dashoffset = string
  type stroke_linecap = string
  type stroke_linejoin = string
  type stroke_miterlimit = string
  type stroke_opacity = string
  type stroke_width = string
  type view_box = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?clip:clip Check.value ->
    ?clip_path:clip_path Check.value ->
    ?color:color Check.value ->
    ?color_interpolation:color_interpolation Check.value ->
    ?color_rendering:color_rendering Check.value ->
    ?cursor:cursor Check.value ->
    ?enable_background:enable_background Check.value ->
    ?external_resources_required:external_resources_required Check.value ->
    ?fill:fill Check.value ->
    ?fill_opacity:fill_opacity Check.value ->
    ?fill_rule:fill_rule Check.value ->
    ?filter:filter Check.value ->
    ?height:height Check.value ->
    ?lang:lang Check.value ->
    ?mask:mask Check.value ->
    ?opacity:opacity Check.value ->
    ?overflow:overflow Check.value ->
    ?path_length:path_length Check.value ->
    ?preserve_aspect_ratio:preserve_aspect_ratio Check.value ->
    ?ref_x:ref_x Check.value ->
    ?ref_y:ref_y Check.value ->
    ?shape_rendering:shape_rendering Check.value ->
    ?stroke:stroke Check.value ->
    ?stroke_dasharray:stroke_dasharray Check.value ->
    ?stroke_dashoffset:stroke_dashoffset Check.value ->
    ?stroke_linecap:stroke_linecap Check.value ->
    ?stroke_linejoin:stroke_linejoin Check.value ->
    ?stroke_miterlimit:stroke_miterlimit Check.value ->
    ?stroke_opacity:stroke_opacity Check.value ->
    ?stroke_width:stroke_width Check.value ->
    ?view_box:view_box Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type TSpanSVGAttributes = sig
  include Dom_attributes
  type alignment_baseline = string
  type baseline_shift = string
  type color = string
  type direction = string
  type display = string
  type dominant_baseline = string
  type dx = string
  type dy = string
  type external_resources_required = bool
  type fill = string
  type fill_opacity = string
  type fill_rule = string
  type font_family = string
  type font_size = string
  type font_size_adjust = string
  type font_stretch = string
  type font_style = string
  type font_variant = string
  type font_weight = string
  type glyph_orientation_horizontal = string
  type glyph_orientation_vertical = string
  type kerning = string
  type lang = string
  type length_adjust = [ `spacing | `spacingAndGlyphs ]
  type letter_spacing = string
  type required_extensions = string
  type required_features = string
  type rotate = string
  type stroke = string
  type stroke_dasharray = string
  type stroke_dashoffset = string
  type stroke_linecap = string
  type stroke_linejoin = string
  type stroke_miterlimit = string
  type stroke_opacity = string
  type stroke_width = string
  type system_language = string
  type text_anchor = string
  type text_decoration = string
  type text_length = string
  type unicode_bidi = string
  type visibility = string
  type word_spacing = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?alignment_baseline:alignment_baseline Check.value ->
    ?baseline_shift:baseline_shift Check.value ->
    ?color:color Check.value ->
    ?direction:direction Check.value ->
    ?display:display Check.value ->
    ?dominant_baseline:dominant_baseline Check.value ->
    ?dx:dx Check.value ->
    ?dy:dy Check.value ->
    ?external_resources_required:external_resources_required Check.value ->
    ?fill:fill Check.value ->
    ?fill_opacity:fill_opacity Check.value ->
    ?fill_rule:fill_rule Check.value ->
    ?font_family:font_family Check.value ->
    ?font_size:font_size Check.value ->
    ?font_size_adjust:font_size_adjust Check.value ->
    ?font_stretch:font_stretch Check.value ->
    ?font_style:font_style Check.value ->
    ?font_variant:font_variant Check.value ->
    ?font_weight:font_weight Check.value ->
    ?glyph_orientation_horizontal:glyph_orientation_horizontal Check.value ->
    ?glyph_orientation_vertical:glyph_orientation_vertical Check.value ->
    ?kerning:kerning Check.value ->
    ?lang:lang Check.value ->
    ?length_adjust:length_adjust Check.value ->
    ?letter_spacing:letter_spacing Check.value ->
    ?required_extensions:required_extensions Check.value ->
    ?required_features:required_features Check.value ->
    ?rotate:rotate Check.value ->
    ?stroke:stroke Check.value ->
    ?stroke_dasharray:stroke_dasharray Check.value ->
    ?stroke_dashoffset:stroke_dashoffset Check.value ->
    ?stroke_linecap:stroke_linecap Check.value ->
    ?stroke_linejoin:stroke_linejoin Check.value ->
    ?stroke_miterlimit:stroke_miterlimit Check.value ->
    ?stroke_opacity:stroke_opacity Check.value ->
    ?stroke_width:stroke_width Check.value ->
    ?system_language:system_language Check.value ->
    ?text_anchor:text_anchor Check.value ->
    ?text_decoration:text_decoration Check.value ->
    ?text_length:text_length Check.value ->
    ?unicode_bidi:unicode_bidi Check.value ->
    ?visibility:visibility Check.value ->
    ?word_spacing:word_spacing Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type TdHTMLAttributes = sig
  include Dom_attributes
  type abbr = string
  type about = string
  type access_key = string
  type accesskey = string
  type align = [ `left | `center | `right | `justify | `char ]
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type axis = string
  type bgcolor = string
  type char = string
  type charoff = string
  type col_span = string
  type colspan = string
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type headers = string
  type height = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type nowrap = bool
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type row_span = string
  type rowspan = string
  type scope = [ `row | `rowgroup | `col | `colgroup ]
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type valign = [ `baseline | `middle | `bottom | `top ]
  type vocab = string
  type width = string
  type 'r check =
    ?abbr:abbr Check.value ->
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?align:align Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?axis:axis Check.value ->
    ?bgcolor:bgcolor Check.value ->
    ?char:char Check.value ->
    ?charoff:charoff Check.value ->
    ?col_span:col_span Check.value ->
    ?colspan:colspan Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?headers:headers Check.value ->
    ?height:height Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?nowrap:nowrap Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?row_span:row_span Check.value ->
    ?rowspan:rowspan Check.value ->
    ?scope:scope Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?valign:valign Check.value ->
    ?vocab:vocab Check.value ->
    ?width:width Check.value ->
    'r dom_check
end

module type TemplateHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type shadowrootclonable = bool
  type shadowrootcustomelementregistry = bool
  type shadowrootdelegatesfocus = bool
  type shadowrootmode = string
  type shadowrootserializable = bool
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?shadowrootclonable:shadowrootclonable Check.value ->
    ?shadowrootcustomelementregistry:shadowrootcustomelementregistry Check.value ->
    ?shadowrootdelegatesfocus:shadowrootdelegatesfocus Check.value ->
    ?shadowrootmode:shadowrootmode Check.value ->
    ?shadowrootserializable:shadowrootserializable Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type TextPathSVGAttributes = sig
  include Dom_attributes
  type alignment_baseline = string
  type baseline_shift = string
  type color = string
  type direction = string
  type display = string
  type dominant_baseline = string
  type external_resources_required = bool
  type fill = string
  type fill_opacity = string
  type fill_rule = string
  type font_family = string
  type font_size = string
  type font_size_adjust = string
  type font_stretch = string
  type font_style = string
  type font_variant = string
  type font_weight = string
  type glyph_orientation_horizontal = string
  type glyph_orientation_vertical = string
  type href = string
  type kerning = string
  type lang = string
  type letter_spacing = string
  type method_ = [ `align | `stretch ]
  type required_extensions = string
  type required_features = string
  type spacing = [ `auto | `exact ]
  type start_offset = string
  type stroke = string
  type stroke_dasharray = string
  type stroke_dashoffset = string
  type stroke_linecap = string
  type stroke_linejoin = string
  type stroke_miterlimit = string
  type stroke_opacity = string
  type stroke_width = string
  type system_language = string
  type text_anchor = string
  type text_decoration = string
  type unicode_bidi = string
  type visibility = string
  type word_spacing = string
  type xmlns = string
  type 'r check =
    ?alignment_baseline:alignment_baseline Check.value ->
    ?baseline_shift:baseline_shift Check.value ->
    ?color:color Check.value ->
    ?direction:direction Check.value ->
    ?display:display Check.value ->
    ?dominant_baseline:dominant_baseline Check.value ->
    ?external_resources_required:external_resources_required Check.value ->
    ?fill:fill Check.value ->
    ?fill_opacity:fill_opacity Check.value ->
    ?fill_rule:fill_rule Check.value ->
    ?font_family:font_family Check.value ->
    ?font_size:font_size Check.value ->
    ?font_size_adjust:font_size_adjust Check.value ->
    ?font_stretch:font_stretch Check.value ->
    ?font_style:font_style Check.value ->
    ?font_variant:font_variant Check.value ->
    ?font_weight:font_weight Check.value ->
    ?glyph_orientation_horizontal:glyph_orientation_horizontal Check.value ->
    ?glyph_orientation_vertical:glyph_orientation_vertical Check.value ->
    ?href:href Check.value ->
    ?kerning:kerning Check.value ->
    ?lang:lang Check.value ->
    ?letter_spacing:letter_spacing Check.value ->
    ?method_:method_ Check.value ->
    ?required_extensions:required_extensions Check.value ->
    ?required_features:required_features Check.value ->
    ?spacing:spacing Check.value ->
    ?start_offset:start_offset Check.value ->
    ?stroke:stroke Check.value ->
    ?stroke_dasharray:stroke_dasharray Check.value ->
    ?stroke_dashoffset:stroke_dashoffset Check.value ->
    ?stroke_linecap:stroke_linecap Check.value ->
    ?stroke_linejoin:stroke_linejoin Check.value ->
    ?stroke_miterlimit:stroke_miterlimit Check.value ->
    ?stroke_opacity:stroke_opacity Check.value ->
    ?stroke_width:stroke_width Check.value ->
    ?system_language:system_language Check.value ->
    ?text_anchor:text_anchor Check.value ->
    ?text_decoration:text_decoration Check.value ->
    ?unicode_bidi:unicode_bidi Check.value ->
    ?visibility:visibility Check.value ->
    ?word_spacing:word_spacing Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type TextSVGAttributes = sig
  include Dom_attributes
  type clip_path = string
  type clip_rule = string
  type color = string
  type color_interpolation = string
  type color_rendering = string
  type cursor = string
  type direction = string
  type display = string
  type dominant_baseline = string
  type dx = string
  type dy = string
  type external_resources_required = bool
  type fill = string
  type fill_opacity = string
  type fill_rule = string
  type filter = string
  type font_family = string
  type font_size = string
  type font_size_adjust = string
  type font_stretch = string
  type font_style = string
  type font_variant = string
  type font_weight = string
  type glyph_orientation_horizontal = string
  type glyph_orientation_vertical = string
  type kerning = string
  type lang = string
  type length_adjust = [ `spacing | `spacingAndGlyphs ]
  type letter_spacing = string
  type mask = string
  type opacity = string
  type pointer_events = string
  type required_extensions = string
  type required_features = string
  type rotate = string
  type stroke = string
  type stroke_dasharray = string
  type stroke_dashoffset = string
  type stroke_linecap = string
  type stroke_linejoin = string
  type stroke_miterlimit = string
  type stroke_opacity = string
  type stroke_width = string
  type system_language = string
  type text_anchor = string
  type text_decoration = string
  type text_length = string
  type text_rendering = string
  type transform = string
  type unicode_bidi = string
  type visibility = string
  type word_spacing = string
  type writing_mode = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?clip_path:clip_path Check.value ->
    ?clip_rule:clip_rule Check.value ->
    ?color:color Check.value ->
    ?color_interpolation:color_interpolation Check.value ->
    ?color_rendering:color_rendering Check.value ->
    ?cursor:cursor Check.value ->
    ?direction:direction Check.value ->
    ?display:display Check.value ->
    ?dominant_baseline:dominant_baseline Check.value ->
    ?dx:dx Check.value ->
    ?dy:dy Check.value ->
    ?external_resources_required:external_resources_required Check.value ->
    ?fill:fill Check.value ->
    ?fill_opacity:fill_opacity Check.value ->
    ?fill_rule:fill_rule Check.value ->
    ?filter:filter Check.value ->
    ?font_family:font_family Check.value ->
    ?font_size:font_size Check.value ->
    ?font_size_adjust:font_size_adjust Check.value ->
    ?font_stretch:font_stretch Check.value ->
    ?font_style:font_style Check.value ->
    ?font_variant:font_variant Check.value ->
    ?font_weight:font_weight Check.value ->
    ?glyph_orientation_horizontal:glyph_orientation_horizontal Check.value ->
    ?glyph_orientation_vertical:glyph_orientation_vertical Check.value ->
    ?kerning:kerning Check.value ->
    ?lang:lang Check.value ->
    ?length_adjust:length_adjust Check.value ->
    ?letter_spacing:letter_spacing Check.value ->
    ?mask:mask Check.value ->
    ?opacity:opacity Check.value ->
    ?pointer_events:pointer_events Check.value ->
    ?required_extensions:required_extensions Check.value ->
    ?required_features:required_features Check.value ->
    ?rotate:rotate Check.value ->
    ?stroke:stroke Check.value ->
    ?stroke_dasharray:stroke_dasharray Check.value ->
    ?stroke_dashoffset:stroke_dashoffset Check.value ->
    ?stroke_linecap:stroke_linecap Check.value ->
    ?stroke_linejoin:stroke_linejoin Check.value ->
    ?stroke_miterlimit:stroke_miterlimit Check.value ->
    ?stroke_opacity:stroke_opacity Check.value ->
    ?stroke_width:stroke_width Check.value ->
    ?system_language:system_language Check.value ->
    ?text_anchor:text_anchor Check.value ->
    ?text_decoration:text_decoration Check.value ->
    ?text_length:text_length Check.value ->
    ?text_rendering:text_rendering Check.value ->
    ?transform:transform Check.value ->
    ?unicode_bidi:unicode_bidi Check.value ->
    ?visibility:visibility Check.value ->
    ?word_spacing:word_spacing Check.value ->
    ?writing_mode:writing_mode Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type TextareaHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocomplete = string
  type autocorrect = [ `off | `on ]
  type cols = string
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type dirname = string
  type disabled = bool
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type form = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type max_length = string
  type maxlength = string
  type min_length = string
  type minlength = string
  type name = string
  type part = string
  type placeholder = string
  type popover = string
  type prefix = string
  type property = string
  type read_only = bool
  type readonly = bool
  type required = bool
  type resource = string
  type rows = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type value = string
  type vocab = string
  type wrap = [ `off | `hard | `soft ]
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocomplete:autocomplete Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?cols:cols Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?dirname:dirname Check.value ->
    ?disabled:disabled Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?form:form Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?max_length:max_length Check.value ->
    ?maxlength:maxlength Check.value ->
    ?min_length:min_length Check.value ->
    ?minlength:minlength Check.value ->
    ?name:name Check.value ->
    ?part:part Check.value ->
    ?placeholder:placeholder Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?read_only:read_only Check.value ->
    ?readonly:readonly Check.value ->
    ?required:required Check.value ->
    ?resource:resource Check.value ->
    ?rows:rows Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?value:value Check.value ->
    ?vocab:vocab Check.value ->
    ?wrap:wrap Check.value ->
    'r dom_check
end

module type ThHTMLAttributes = sig
  include Dom_attributes
  type abbr = string
  type about = string
  type access_key = string
  type accesskey = string
  type align = [ `left | `center | `right | `justify | `char ]
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type axis = string
  type bgcolor = string
  type char = string
  type charoff = string
  type col_span = string
  type colspan = string
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type headers = string
  type height = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type nowrap = bool
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type row_span = string
  type rowspan = string
  type scope = [ `row | `rowgroup | `col | `colgroup ]
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type valign = [ `baseline | `middle | `bottom | `top ]
  type vocab = string
  type width = string
  type 'r check =
    ?abbr:abbr Check.value ->
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?align:align Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?axis:axis Check.value ->
    ?bgcolor:bgcolor Check.value ->
    ?char:char Check.value ->
    ?charoff:charoff Check.value ->
    ?col_span:col_span Check.value ->
    ?colspan:colspan Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?headers:headers Check.value ->
    ?height:height Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?nowrap:nowrap Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?row_span:row_span Check.value ->
    ?rowspan:rowspan Check.value ->
    ?scope:scope Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?valign:valign Check.value ->
    ?vocab:vocab Check.value ->
    ?width:width Check.value ->
    'r dom_check
end

module type TimeHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type date_time = string
  type datetime = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?date_time:date_time Check.value ->
    ?datetime:datetime Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type TrackHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type default = bool
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type kind = string
  type label = string
  type lang = string
  type media_group = string
  type mediagroup = string
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type resource = string
  type spellcheck = bool
  type src = string
  type srclang = string
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type vocab = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?default:default Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?kind:kind Check.value ->
    ?label:label Check.value ->
    ?lang:lang Check.value ->
    ?media_group:media_group Check.value ->
    ?mediagroup:mediagroup Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?src:src Check.value ->
    ?srclang:srclang Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    'r dom_check
end

module type UseSVGAttributes = sig
  include Dom_attributes
  type alignment_baseline = string
  type baseline_shift = string
  type clip = string
  type clip_path = string
  type clip_rule = string
  type color = string
  type color_interpolation = string
  type color_interpolation_filters = string
  type color_profile = string
  type color_rendering = string
  type cursor = string
  type direction = string
  type display = string
  type dominant_baseline = string
  type enable_background = string
  type external_resources_required = bool
  type fill = string
  type fill_opacity = string
  type fill_rule = string
  type filter = string
  type flood_color = string
  type flood_opacity = string
  type font_family = string
  type font_size = string
  type font_size_adjust = string
  type font_stretch = string
  type font_style = string
  type font_variant = string
  type font_weight = string
  type glyph_orientation_horizontal = string
  type glyph_orientation_vertical = string
  type height = string
  type href = string
  type image_rendering = string
  type kerning = string
  type lang = string
  type letter_spacing = string
  type lighting_color = string
  type marker_end = string
  type marker_mid = string
  type marker_start = string
  type mask = string
  type opacity = string
  type overflow = string
  type path_length = string
  type pointer_events = string
  type required_extensions = string
  type required_features = string
  type shape_rendering = string
  type stop_color = string
  type stop_opacity = string
  type stroke = string
  type stroke_dasharray = string
  type stroke_dashoffset = string
  type stroke_linecap = string
  type stroke_linejoin = string
  type stroke_miterlimit = string
  type stroke_opacity = string
  type stroke_width = string
  type system_language = string
  type text_anchor = string
  type text_decoration = string
  type text_rendering = string
  type transform = string
  type unicode_bidi = string
  type visibility = string
  type width = string
  type word_spacing = string
  type writing_mode = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?alignment_baseline:alignment_baseline Check.value ->
    ?baseline_shift:baseline_shift Check.value ->
    ?clip:clip Check.value ->
    ?clip_path:clip_path Check.value ->
    ?clip_rule:clip_rule Check.value ->
    ?color:color Check.value ->
    ?color_interpolation:color_interpolation Check.value ->
    ?color_interpolation_filters:color_interpolation_filters Check.value ->
    ?color_profile:color_profile Check.value ->
    ?color_rendering:color_rendering Check.value ->
    ?cursor:cursor Check.value ->
    ?direction:direction Check.value ->
    ?display:display Check.value ->
    ?dominant_baseline:dominant_baseline Check.value ->
    ?enable_background:enable_background Check.value ->
    ?external_resources_required:external_resources_required Check.value ->
    ?fill:fill Check.value ->
    ?fill_opacity:fill_opacity Check.value ->
    ?fill_rule:fill_rule Check.value ->
    ?filter:filter Check.value ->
    ?flood_color:flood_color Check.value ->
    ?flood_opacity:flood_opacity Check.value ->
    ?font_family:font_family Check.value ->
    ?font_size:font_size Check.value ->
    ?font_size_adjust:font_size_adjust Check.value ->
    ?font_stretch:font_stretch Check.value ->
    ?font_style:font_style Check.value ->
    ?font_variant:font_variant Check.value ->
    ?font_weight:font_weight Check.value ->
    ?glyph_orientation_horizontal:glyph_orientation_horizontal Check.value ->
    ?glyph_orientation_vertical:glyph_orientation_vertical Check.value ->
    ?height:height Check.value ->
    ?href:href Check.value ->
    ?image_rendering:image_rendering Check.value ->
    ?kerning:kerning Check.value ->
    ?lang:lang Check.value ->
    ?letter_spacing:letter_spacing Check.value ->
    ?lighting_color:lighting_color Check.value ->
    ?marker_end:marker_end Check.value ->
    ?marker_mid:marker_mid Check.value ->
    ?marker_start:marker_start Check.value ->
    ?mask:mask Check.value ->
    ?opacity:opacity Check.value ->
    ?overflow:overflow Check.value ->
    ?path_length:path_length Check.value ->
    ?pointer_events:pointer_events Check.value ->
    ?required_extensions:required_extensions Check.value ->
    ?required_features:required_features Check.value ->
    ?shape_rendering:shape_rendering Check.value ->
    ?stop_color:stop_color Check.value ->
    ?stop_opacity:stop_opacity Check.value ->
    ?stroke:stroke Check.value ->
    ?stroke_dasharray:stroke_dasharray Check.value ->
    ?stroke_dashoffset:stroke_dashoffset Check.value ->
    ?stroke_linecap:stroke_linecap Check.value ->
    ?stroke_linejoin:stroke_linejoin Check.value ->
    ?stroke_miterlimit:stroke_miterlimit Check.value ->
    ?stroke_opacity:stroke_opacity Check.value ->
    ?stroke_width:stroke_width Check.value ->
    ?system_language:system_language Check.value ->
    ?text_anchor:text_anchor Check.value ->
    ?text_decoration:text_decoration Check.value ->
    ?text_rendering:text_rendering Check.value ->
    ?transform:transform Check.value ->
    ?unicode_bidi:unicode_bidi Check.value ->
    ?visibility:visibility Check.value ->
    ?width:width Check.value ->
    ?word_spacing:word_spacing Check.value ->
    ?writing_mode:writing_mode Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type VideoHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type autoplay = bool
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type controls = bool
  type controlslist = string
  type cross_origin = string
  type crossorigin = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type disablepictureinpicture = bool
  type disableremoteplayback = bool
  type draggable = bool
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type height = string
  type hidden = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type loop = bool
  type media_group = string
  type mediagroup = string
  type muted = bool
  type on_encrypted = Dom.event -> unit
  type on_enter_picture_in_picture = Dom.event -> unit
  type on_leave_picture_in_picture = Dom.event -> unit
  type on_waiting_for_key = Dom.event -> unit
  type part = string
  type playsinline = bool
  type popover = string
  type poster = string
  type prefix = string
  type preload = string
  type property = string
  type resource = string
  type spellcheck = bool
  type src = string
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type vocab = string
  type width = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?autoplay:autoplay Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?controls:controls Check.value ->
    ?controlslist:controlslist Check.value ->
    ?cross_origin:cross_origin Check.value ->
    ?crossorigin:crossorigin Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?disablepictureinpicture:disablepictureinpicture Check.value ->
    ?disableremoteplayback:disableremoteplayback Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?height:height Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?loop:loop Check.value ->
    ?media_group:media_group Check.value ->
    ?mediagroup:mediagroup Check.value ->
    ?muted:muted Check.value ->
    ?on_encrypted:on_encrypted ->
    ?on_enter_picture_in_picture:on_enter_picture_in_picture ->
    ?on_leave_picture_in_picture:on_leave_picture_in_picture ->
    ?on_waiting_for_key:on_waiting_for_key ->
    ?part:part Check.value ->
    ?playsinline:playsinline Check.value ->
    ?popover:popover Check.value ->
    ?poster:poster Check.value ->
    ?prefix:prefix Check.value ->
    ?preload:preload Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?src:src Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?vocab:vocab Check.value ->
    ?width:width Check.value ->
    'r dom_check
end

module type ViewSVGAttributes = sig
  include Dom_attributes
  type external_resources_required = bool
  type lang = string
  type preserve_aspect_ratio = string
  type view_box = string
  type view_target = string
  type xmlns = string
  type zoom_and_pan = [ `disable | `magnify ]
  type 'r check =
    ?external_resources_required:external_resources_required Check.value ->
    ?lang:lang Check.value ->
    ?preserve_aspect_ratio:preserve_aspect_ratio Check.value ->
    ?view_box:view_box Check.value ->
    ?view_target:view_target Check.value ->
    ?xmlns:xmlns Check.value ->
    ?zoom_and_pan:zoom_and_pan Check.value ->
    'r dom_check
end

module type WebViewHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type access_key = string
  type accesskey = string
  type allowfullscreen = bool
  type allowpopups = bool
  type auto_capitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type autosize = bool
  type blinkfeatures = string
  type content_editable = string
  type contenteditable = string
  type context_menu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type disableblinkfeatures = string
  type disableguestresize = bool
  type disablewebsecurity = bool
  type draggable = bool
  type enableblinkfeatures = string
  type enterkeyhint = string
  type export_parts = string
  type exportparts = string
  type guestinstance = string
  type hidden = string
  type httpreferrer = string
  type inert = bool
  type inner_text = string
  type input_mode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type item_id = string
  type item_prop = string
  type item_ref = string
  type item_scope = bool
  type item_type = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type nodeintegration = bool
  type nodeintegrationinsubframes = bool
  type part = string
  type partition = string
  type plugins = bool
  type popover = string
  type prefix = string
  type preload = string
  type property = string
  type resource = string
  type spellcheck = bool
  type src = string
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type useragent = string
  type vocab = string
  type webpreferences = string
  type 'r check =
    ?about:about Check.value ->
    ?access_key:access_key Check.value ->
    ?accesskey:accesskey Check.value ->
    ?allowfullscreen:allowfullscreen Check.value ->
    ?allowpopups:allowpopups Check.value ->
    ?auto_capitalize:auto_capitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?autosize:autosize Check.value ->
    ?blinkfeatures:blinkfeatures Check.value ->
    ?content_editable:content_editable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?context_menu:context_menu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?disableblinkfeatures:disableblinkfeatures Check.value ->
    ?disableguestresize:disableguestresize Check.value ->
    ?disablewebsecurity:disablewebsecurity Check.value ->
    ?draggable:draggable Check.value ->
    ?enableblinkfeatures:enableblinkfeatures Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?export_parts:export_parts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?guestinstance:guestinstance Check.value ->
    ?hidden:hidden Check.value ->
    ?httpreferrer:httpreferrer Check.value ->
    ?inert:inert Check.value ->
    ?inner_text:inner_text Check.value ->
    ?input_mode:input_mode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?item_id:item_id Check.value ->
    ?item_prop:item_prop Check.value ->
    ?item_ref:item_ref Check.value ->
    ?item_scope:item_scope Check.value ->
    ?item_type:item_type Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?nodeintegration:nodeintegration Check.value ->
    ?nodeintegrationinsubframes:nodeintegrationinsubframes Check.value ->
    ?part:part Check.value ->
    ?partition:partition Check.value ->
    ?plugins:plugins Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?preload:preload Check.value ->
    ?property:property Check.value ->
    ?resource:resource Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?src:src Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?useragent:useragent Check.value ->
    ?vocab:vocab Check.value ->
    ?webpreferences:webpreferences Check.value ->
    'r dom_check
end

module A : AnchorHTMLAttributes with type element = Dom.htmlAnchorElement

module Abbr : HTMLAttributes with type element = Dom.htmlElement

module Address : HTMLAttributes with type element = Dom.htmlElement

module Area : AreaHTMLAttributes with type element = Dom.htmlAreaElement

module Article : HTMLAttributes with type element = Dom.htmlElement

module Aside : HTMLAttributes with type element = Dom.htmlElement

module Audio : AudioHTMLAttributes with type element = Dom.htmlAudioElement

module B : HTMLAttributes with type element = Dom.htmlElement

module Base : BaseHTMLAttributes with type element = Dom.htmlBaseElement

module Bdi : HTMLAttributes with type element = Dom.htmlElement

module Bdo : BdoHTMLAttributes with type element = Dom.htmlElement

module Blockquote : BlockquoteHTMLAttributes with type element = Dom.htmlQuoteElement

module Body : BodyHTMLAttributes with type element = Dom.htmlBodyElement

module Br : HTMLAttributes with type element = Dom.element

module Button : ButtonHTMLAttributes with type element = Dom.htmlButtonElement

module Canvas : CanvasHTMLAttributes with type element = Dom.htmlCanvasElement

module Caption : CaptionHTMLAttributes with type element = Dom.htmlTableCaptionElement

module Cite : HTMLAttributes with type element = Dom.htmlElement

module Code : HTMLAttributes with type element = Dom.htmlElement

module Col : ColHTMLAttributes with type element = Dom.htmlTableColElement

module Colgroup : ColgroupHTMLAttributes with type element = Dom.htmlTableColElement

module Data : DataHTMLAttributes with type element = Dom.htmlDataElement

module Datalist : HTMLAttributes with type element = Dom.htmlDataListElement

module Dd : HTMLAttributes with type element = Dom.htmlElement

module Del : ModHTMLAttributes with type element = Dom.htmlModElement

module Details : DetailsHtmlAttributes with type element = Dom.element

module Dfn : HTMLAttributes with type element = Dom.htmlElement

module Dialog : DialogHtmlAttributes with type element = Dom.htmlDialogElement

module Div : HTMLAttributes with type element = Dom.htmlDivElement

module Dl : HTMLAttributes with type element = Dom.element

module Dt : HTMLAttributes with type element = Dom.htmlElement

module Em : HTMLAttributes with type element = Dom.htmlElement

module Embed : EmbedHTMLAttributes with type element = Dom.htmlEmbedElement

module Fieldset : FieldsetHTMLAttributes with type element = Dom.htmlFieldSetElement

module Figcaption : HTMLAttributes with type element = Dom.htmlElement

module Figure : HTMLAttributes with type element = Dom.htmlElement

module Footer : HTMLAttributes with type element = Dom.htmlElement

module Form : FormHTMLAttributes with type element = Dom.htmlFormElement

module H1 : HTMLAttributes with type element = Dom.htmlHeadingElement

module H2 : HTMLAttributes with type element = Dom.htmlHeadingElement

module H3 : HTMLAttributes with type element = Dom.htmlHeadingElement

module H4 : HTMLAttributes with type element = Dom.htmlHeadingElement

module H5 : HTMLAttributes with type element = Dom.htmlHeadingElement

module H6 : HTMLAttributes with type element = Dom.htmlHeadingElement

module Head : HTMLAttributes with type element = Dom.htmlHeadElement

module Header : HTMLAttributes with type element = Dom.htmlElement

module Hgroup : HTMLAttributes with type element = Dom.htmlElement

module Hr : HTMLAttributes with type element = Dom.element

module Html : HTMLAttributes with type element = Dom.htmlHtmlElement

module I : HTMLAttributes with type element = Dom.htmlElement

module Iframe : IframeHTMLAttributes with type element = Dom.element

module Img : ImgHTMLAttributes with type element = Dom.htmlImageElement

module Input : InputHTMLAttributes with type element = Dom.htmlInputElement

module Ins : ModHTMLAttributes with type element = Dom.htmlModElement

module Kbd : HTMLAttributes with type element = Dom.htmlElement

module Label : LabelHTMLAttributes with type element = Dom.htmlLabelElement

module Legend : HTMLAttributes with type element = Dom.htmlLegendElement

module Li : LiHTMLAttributes with type element = Dom.element

module Link : LinkHTMLAttributes with type element = Dom.htmlLinkElement

module Main : HTMLAttributes with type element = Dom.htmlElement

module Map : MapHTMLAttributes with type element = Dom.htmlMapElement

module Mark : HTMLAttributes with type element = Dom.htmlElement

module Menu : MenuHTMLAttributes with type element = Dom.htmlMenuElement

module Meta : MetaHTMLAttributes with type element = Dom.htmlMetaElement

module Meter : MeterHTMLAttributes with type element = Dom.htmlMeterElement

module Nav : HTMLAttributes with type element = Dom.htmlElement

module Noscript : HTMLAttributes with type element = Dom.htmlElement

module Object : ObjectHTMLAttributes with type element = Dom.htmlObjectElement

module Ol : OlHTMLAttributes with type element = Dom.htmlOListElement

module Optgroup : OptgroupHTMLAttributes with type element = Dom.htmlOptGroupElement

module Option : OptionHTMLAttributes with type element = Dom.htmlOptionElement

module Output : OutputHTMLAttributes with type element = Dom.htmlOutputElement

module P : HTMLAttributes with type element = Dom.htmlParagraphElement

module Picture : HTMLAttributes with type element = Dom.element

module Pre : HTMLAttributes with type element = Dom.htmlPreElement

module Progress : ProgressHTMLAttributes with type element = Dom.htmlProgressElement

module Q : QuoteHTMLAttributes with type element = Dom.htmlQuoteElement

module Rp : HTMLAttributes with type element = Dom.htmlElement

module Rt : HTMLAttributes with type element = Dom.htmlElement

module Ruby : HTMLAttributes with type element = Dom.htmlElement

module S : HTMLAttributes with type element = Dom.htmlElement

module Samp : HTMLAttributes with type element = Dom.htmlElement

module Script : ScriptHTMLAttributes with type element = Dom.htmlScriptElement

module Search : HTMLAttributes with type element = Dom.htmlElement

module Section : HTMLAttributes with type element = Dom.htmlElement

module Select : SelectHTMLAttributes with type element = Dom.htmlSelectElement

module Slot : HTMLSlotElementAttributes with type element = Dom.htmlSlotElement

module Small : HTMLAttributes with type element = Dom.htmlElement

module Source : SourceHTMLAttributes with type element = Dom.htmlSourceElement

module Span : HTMLAttributes with type element = Dom.htmlSpanElement

module Strong : HTMLAttributes with type element = Dom.htmlElement

module Style : StyleHTMLAttributes with type element = Dom.htmlStyleElement

module Sub : HTMLAttributes with type element = Dom.htmlElement

module Summary : HTMLAttributes with type element = Dom.htmlElement

module Sup : HTMLAttributes with type element = Dom.htmlElement

module Table : HTMLAttributes with type element = Dom.htmlTableElement

module Tbody : HTMLAttributes with type element = Dom.htmlTableSectionElement

module Td : TdHTMLAttributes with type element = Dom.htmlTableCellElement

module Template : TemplateHTMLAttributes with type element = Dom.element

module Textarea : TextareaHTMLAttributes with type element = Dom.htmlTextAreaElement

module Tfoot : HTMLAttributes with type element = Dom.htmlTableSectionElement

module Th : ThHTMLAttributes with type element = Dom.htmlTableCellElement

module Thead : HTMLAttributes with type element = Dom.htmlTableSectionElement

module Time : TimeHTMLAttributes with type element = Dom.htmlTimeElement

module Title : HTMLAttributes with type element = Dom.htmlTitleElement

module Tr : HTMLAttributes with type element = Dom.htmlTableRowElement

module Track : TrackHTMLAttributes with type element = Dom.htmlTrackElement

module U : HTMLAttributes with type element = Dom.htmlElement

module Ul : HTMLAttributes with type element = Dom.element

module Var : HTMLAttributes with type element = Dom.htmlElement

module Video : VideoHTMLAttributes with type element = Dom.htmlVideoElement

module Wbr : HTMLAttributes with type element = Dom.htmlElement

module Webview : WebViewHTMLAttributes with type element = Dom.htmlElement

module Big : HTMLAttributes with type element = Dom.htmlElement

module Keygen : KeygenHTMLAttributes with type element = Dom.htmlUnknownElement

module Menuitem : HTMLAttributes with type element = Dom.htmlUnknownElement

module Param : ParamHTMLAttributes with type element = Dom.htmlParamElement

module Animate : AnimateSVGAttributes with type element = Dom.element

module AnimateMotion : AnimateMotionSVGAttributes with type element = Dom.element

module AnimateTransform : AnimateTransformSVGAttributes with type element = Dom.element

module Circle : CircleSVGAttributes with type element = Dom.element

module ClipPath : ClipPathSVGAttributes with type element = Dom.element

module Defs : DefsSVGAttributes with type element = Dom.element

module Desc : DescSVGAttributes with type element = Dom.element

module Ellipse : EllipseSVGAttributes with type element = Dom.element

module FeBlend : FeBlendSVGAttributes with type element = Dom.element

module FeColorMatrix : FeColorMatrixSVGAttributes with type element = Dom.element

module FeComponentTransfer : FeComponentTransferSVGAttributes with type element = Dom.element

module FeComposite : FeCompositeSVGAttributes with type element = Dom.element

module FeConvolveMatrix : FeConvolveMatrixSVGAttributes with type element = Dom.element

module FeDiffuseLighting : FeDiffuseLightingSVGAttributes with type element = Dom.element

module FeDisplacementMap : FeDisplacementMapSVGAttributes with type element = Dom.element

module FeDistantLight : FeDistantLightSVGAttributes with type element = Dom.element

module FeDropShadow : FeDropShadowSVGAttributes with type element = Dom.element

module FeFlood : FeFloodSVGAttributes with type element = Dom.element

module FeFuncA : FeFuncSVGAttributes with type element = Dom.element

module FeFuncB : FeFuncSVGAttributes with type element = Dom.element

module FeFuncG : FeFuncSVGAttributes with type element = Dom.element

module FeFuncR : FeFuncSVGAttributes with type element = Dom.element

module FeGaussianBlur : FeGaussianBlurSVGAttributes with type element = Dom.element

module FeImage : FeImageSVGAttributes with type element = Dom.element

module FeMerge : FeMergeSVGAttributes with type element = Dom.element

module FeMergeNode : FeMergeNodeSVGAttributes with type element = Dom.element

module FeMorphology : FeMorphologySVGAttributes with type element = Dom.element

module FeOffset : FeOffsetSVGAttributes with type element = Dom.element

module FePointLight : FePointLightSVGAttributes with type element = Dom.element

module FeSpecularLighting : FeSpecularLightingSVGAttributes with type element = Dom.element

module FeSpotLight : FeSpotLightSVGAttributes with type element = Dom.element

module FeTile : FeTileSVGAttributes with type element = Dom.element

module FeTurbulence : FeTurbulanceSVGAttributes with type element = Dom.element

module Filter : FilterSVGAttributes with type element = Dom.element

module ForeignObject : ForeignObjectSVGAttributes with type element = Dom.element

module G : GSVGAttributes with type element = Dom.element

module Image : ImageSVGAttributes with type element = Dom.element

module Line : LineSVGAttributes with type element = Dom.element

module LinearGradient : LinearGradientSVGAttributes with type element = Dom.element

module Marker : MarkerSVGAttributes with type element = Dom.element

module Mask : MaskSVGAttributes with type element = Dom.element

module Metadata : MetadataSVGAttributes with type element = Dom.element

module Mpath : MPathSVGAttributes with type element = Dom.element

module Path : PathSVGAttributes with type element = Dom.element

module Pattern : PatternSVGAttributes with type element = Dom.element

module Polygon : PolygonSVGAttributes with type element = Dom.element

module Polyline : PolylineSVGAttributes with type element = Dom.element

module RadialGradient : RadialGradientSVGAttributes with type element = Dom.element

module Rect : RectSVGAttributes with type element = Dom.element

module Set : SetSVGAttributes with type element = Dom.element

module Stop : StopSVGAttributes with type element = Dom.element

module Svg : SvgSVGAttributes with type element = Dom.element

module Switch : SwitchSVGAttributes with type element = Dom.element

module Symbol : SymbolSVGAttributes with type element = Dom.element

module Text : TextSVGAttributes with type element = Dom.element

module TextPath : TextPathSVGAttributes with type element = Dom.element

module Tspan : TSpanSVGAttributes with type element = Dom.element

module Use : UseSVGAttributes with type element = Dom.element

module View : ViewSVGAttributes with type element = Dom.element

(** An element whose tag is known only as the page runs: the attributes
    every HTML element takes. *)
module Element : HTMLAttributes with type element = Dom.htmlElement
