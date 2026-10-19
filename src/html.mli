(** Each element's attributes, as their types: [Html.Div.class_] is
    [string]. Generated from the JSX types of solid-js 1.9.17 by
    [generate/html.ts]; never edited by hand.

    An attribute named after an OCaml keyword takes a trailing underscore,
    [class_], and a hyphen is an underscore, [aria_label]. *)

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
  type classList = bool Js.Dict.t
  type class_ = string
  type elementtiming = string
  type id = string
  type innerHTML = string
  type nonce = string
  type onAbort = Dom.uiEvent -> unit
  type onAnimationCancel = Dom.animationEvent -> unit
  type onAnimationEnd = Dom.animationEvent -> unit
  type onAnimationIteration = Dom.animationEvent -> unit
  type onAnimationStart = Dom.animationEvent -> unit
  type onAuxClick = Dom.pointerEvent -> unit
  type onBeforeCopy = Dom.clipboardEvent -> unit
  type onBeforeCut = Dom.clipboardEvent -> unit
  type onBeforeInput = Dom.inputEvent -> unit
  type onBeforeMatch = Dom.event -> unit
  type onBeforePaste = Dom.clipboardEvent -> unit
  type onBeforeToggle = Dom.event -> unit
  type onBeforeXRSelect = Dom.event -> unit
  type onBlur = Dom.focusEvent -> unit
  type onCanPlay = Dom.event -> unit
  type onCanPlayThrough = Dom.event -> unit
  type onCancel = Dom.event -> unit
  type onChange = Dom.event -> unit
  type onClick = Dom.mouseEvent -> unit
  type onClose = Dom.event -> unit
  type onCommand = Dom.event -> unit
  type onCompositionEnd = Dom.compositionEvent -> unit
  type onCompositionStart = Dom.compositionEvent -> unit
  type onCompositionUpdate = Dom.compositionEvent -> unit
  type onContentVisibilityAutoStateChange = Dom.event -> unit
  type onContextLost = Dom.event -> unit
  type onContextMenu = Dom.pointerEvent -> unit
  type onContextRestored = Dom.event -> unit
  type onCopy = Dom.clipboardEvent -> unit
  type onCueChange = Dom.event -> unit
  type onCut = Dom.clipboardEvent -> unit
  type onDblClick = Dom.mouseEvent -> unit
  type onDrag = Dom.dragEvent -> unit
  type onDragEnd = Dom.dragEvent -> unit
  type onDragEnter = Dom.dragEvent -> unit
  type onDragExit = Dom.dragEvent -> unit
  type onDragLeave = Dom.dragEvent -> unit
  type onDragOver = Dom.dragEvent -> unit
  type onDragStart = Dom.dragEvent -> unit
  type onDrop = Dom.dragEvent -> unit
  type onDurationChange = Dom.event -> unit
  type onEmptied = Dom.event -> unit
  type onEnded = Dom.event -> unit
  type onError = Dom.errorEvent -> unit
  type onFocus = Dom.focusEvent -> unit
  type onFocusIn = Dom.focusEvent -> unit
  type onFocusOut = Dom.focusEvent -> unit
  type onFormData = Dom.event -> unit
  type onFullscreenChange = Dom.event -> unit
  type onFullscreenError = Dom.event -> unit
  type onGotPointerCapture = Dom.pointerEvent -> unit
  type onInput = Dom.inputEvent -> unit
  type onInvalid = Dom.event -> unit
  type onKeyDown = Dom.keyboardEvent -> unit
  type onKeyPress = Dom.keyboardEvent -> unit
  type onKeyUp = Dom.keyboardEvent -> unit
  type onLoad = Dom.event -> unit
  type onLoadStart = Dom.event -> unit
  type onLoadedData = Dom.event -> unit
  type onLoadedMetadata = Dom.event -> unit
  type onLostPointerCapture = Dom.pointerEvent -> unit
  type onMouseDown = Dom.mouseEvent -> unit
  type onMouseEnter = Dom.mouseEvent -> unit
  type onMouseLeave = Dom.mouseEvent -> unit
  type onMouseMove = Dom.mouseEvent -> unit
  type onMouseOut = Dom.mouseEvent -> unit
  type onMouseOver = Dom.mouseEvent -> unit
  type onMouseUp = Dom.mouseEvent -> unit
  type onPaste = Dom.clipboardEvent -> unit
  type onPause = Dom.event -> unit
  type onPlay = Dom.event -> unit
  type onPlaying = Dom.event -> unit
  type onPointerCancel = Dom.pointerEvent -> unit
  type onPointerDown = Dom.pointerEvent -> unit
  type onPointerEnter = Dom.pointerEvent -> unit
  type onPointerLeave = Dom.pointerEvent -> unit
  type onPointerMove = Dom.pointerEvent -> unit
  type onPointerOut = Dom.pointerEvent -> unit
  type onPointerOver = Dom.pointerEvent -> unit
  type onPointerRawUpdate = Dom.pointerEvent -> unit
  type onPointerUp = Dom.pointerEvent -> unit
  type onProgress = Dom.progressEvent -> unit
  type onRateChange = Dom.event -> unit
  type onReset = Dom.event -> unit
  type onResize = Dom.uiEvent -> unit
  type onScroll = Dom.event -> unit
  type onScrollEnd = Dom.event -> unit
  type onScrollSnapChange = Dom.event -> unit
  type onScrollSnapChanging = Dom.event -> unit
  type onSecurityPolicyViolation = Dom.event -> unit
  type onSeeked = Dom.event -> unit
  type onSeeking = Dom.event -> unit
  type onSelect = Dom.event -> unit
  type onSelectStart = Dom.event -> unit
  type onSelectionChange = Dom.event -> unit
  type onSlotChange = Dom.event -> unit
  type onStalled = Dom.event -> unit
  type onSubmit = Dom.event -> unit
  type onSuspend = Dom.event -> unit
  type onTimeUpdate = Dom.event -> unit
  type onToggle = Dom.event -> unit
  type onTouchCancel = Dom.touchEvent -> unit
  type onTouchEnd = Dom.touchEvent -> unit
  type onTouchMove = Dom.touchEvent -> unit
  type onTouchStart = Dom.touchEvent -> unit
  type onTransitionCancel = Dom.transitionEvent -> unit
  type onTransitionEnd = Dom.transitionEvent -> unit
  type onTransitionRun = Dom.transitionEvent -> unit
  type onTransitionStart = Dom.transitionEvent -> unit
  type onVolumeChange = Dom.event -> unit
  type onWaiting = Dom.event -> unit
  type onWheel = Dom.wheelEvent -> unit
  type onabort = Dom.uiEvent -> unit
  type onanimationcancel = Dom.animationEvent -> unit
  type onanimationend = Dom.animationEvent -> unit
  type onanimationiteration = Dom.animationEvent -> unit
  type onanimationstart = Dom.animationEvent -> unit
  type onauxclick = Dom.pointerEvent -> unit
  type onbeforecopy = Dom.clipboardEvent -> unit
  type onbeforecut = Dom.clipboardEvent -> unit
  type onbeforeinput = Dom.inputEvent -> unit
  type onbeforematch = Dom.event -> unit
  type onbeforepaste = Dom.clipboardEvent -> unit
  type onbeforetoggle = Dom.event -> unit
  type onbeforexrselect = Dom.event -> unit
  type onblur = Dom.focusEvent -> unit
  type oncancel = Dom.event -> unit
  type oncanplay = Dom.event -> unit
  type oncanplaythrough = Dom.event -> unit
  type onchange = Dom.event -> unit
  type onclick = Dom.mouseEvent -> unit
  type onclose = Dom.event -> unit
  type oncommand = Dom.event -> unit
  type oncompositionend = Dom.compositionEvent -> unit
  type oncompositionstart = Dom.compositionEvent -> unit
  type oncompositionupdate = Dom.compositionEvent -> unit
  type oncontentvisibilityautostatechange = Dom.event -> unit
  type oncontextlost = Dom.event -> unit
  type oncontextmenu = Dom.pointerEvent -> unit
  type oncontextrestored = Dom.event -> unit
  type oncopy = Dom.clipboardEvent -> unit
  type oncuechange = Dom.event -> unit
  type oncut = Dom.clipboardEvent -> unit
  type ondblclick = Dom.mouseEvent -> unit
  type ondrag = Dom.dragEvent -> unit
  type ondragend = Dom.dragEvent -> unit
  type ondragenter = Dom.dragEvent -> unit
  type ondragexit = Dom.dragEvent -> unit
  type ondragleave = Dom.dragEvent -> unit
  type ondragover = Dom.dragEvent -> unit
  type ondragstart = Dom.dragEvent -> unit
  type ondrop = Dom.dragEvent -> unit
  type ondurationchange = Dom.event -> unit
  type onemptied = Dom.event -> unit
  type onended = Dom.event -> unit
  type onerror = Dom.errorEvent -> unit
  type onfocus = Dom.focusEvent -> unit
  type onfocusin = Dom.focusEvent -> unit
  type onfocusout = Dom.focusEvent -> unit
  type onformdata = Dom.event -> unit
  type onfullscreenchange = Dom.event -> unit
  type onfullscreenerror = Dom.event -> unit
  type ongotpointercapture = Dom.pointerEvent -> unit
  type oninput = Dom.inputEvent -> unit
  type oninvalid = Dom.event -> unit
  type onkeydown = Dom.keyboardEvent -> unit
  type onkeypress = Dom.keyboardEvent -> unit
  type onkeyup = Dom.keyboardEvent -> unit
  type onload = Dom.event -> unit
  type onloadeddata = Dom.event -> unit
  type onloadedmetadata = Dom.event -> unit
  type onloadstart = Dom.event -> unit
  type onlostpointercapture = Dom.pointerEvent -> unit
  type onmousedown = Dom.mouseEvent -> unit
  type onmouseenter = Dom.mouseEvent -> unit
  type onmouseleave = Dom.mouseEvent -> unit
  type onmousemove = Dom.mouseEvent -> unit
  type onmouseout = Dom.mouseEvent -> unit
  type onmouseover = Dom.mouseEvent -> unit
  type onmouseup = Dom.mouseEvent -> unit
  type onpaste = Dom.clipboardEvent -> unit
  type onpause = Dom.event -> unit
  type onplay = Dom.event -> unit
  type onplaying = Dom.event -> unit
  type onpointercancel = Dom.pointerEvent -> unit
  type onpointerdown = Dom.pointerEvent -> unit
  type onpointerenter = Dom.pointerEvent -> unit
  type onpointerleave = Dom.pointerEvent -> unit
  type onpointermove = Dom.pointerEvent -> unit
  type onpointerout = Dom.pointerEvent -> unit
  type onpointerover = Dom.pointerEvent -> unit
  type onpointerrawupdate = Dom.pointerEvent -> unit
  type onpointerup = Dom.pointerEvent -> unit
  type onprogress = Dom.progressEvent -> unit
  type onratechange = Dom.event -> unit
  type onreset = Dom.event -> unit
  type onresize = Dom.uiEvent -> unit
  type onscroll = Dom.event -> unit
  type onscrollend = Dom.event -> unit
  type onscrollsnapchange = Dom.event -> unit
  type onscrollsnapchanging = Dom.event -> unit
  type onsecuritypolicyviolation = Dom.event -> unit
  type onseeked = Dom.event -> unit
  type onseeking = Dom.event -> unit
  type onselect = Dom.event -> unit
  type onselectionchange = Dom.event -> unit
  type onselectstart = Dom.event -> unit
  type onslotchange = Dom.event -> unit
  type onstalled = Dom.event -> unit
  type onsubmit = Dom.event -> unit
  type onsuspend = Dom.event -> unit
  type ontimeupdate = Dom.event -> unit
  type ontoggle = Dom.event -> unit
  type ontouchcancel = Dom.touchEvent -> unit
  type ontouchend = Dom.touchEvent -> unit
  type ontouchmove = Dom.touchEvent -> unit
  type ontouchstart = Dom.touchEvent -> unit
  type ontransitioncancel = Dom.transitionEvent -> unit
  type ontransitionend = Dom.transitionEvent -> unit
  type ontransitionrun = Dom.transitionEvent -> unit
  type ontransitionstart = Dom.transitionEvent -> unit
  type onvolumechange = Dom.event -> unit
  type onwaiting = Dom.event -> unit
  type onwheel = Dom.wheelEvent -> unit
  type ref = element -> unit
  type role = [ `none | `list | `link | `menu | `listbox | `tree | `grid | `dialog | `alert | `alertdialog | `application | `article | `banner | `button | `cell | `checkbox | `columnheader | `combobox | `complementary | `contentinfo | `definition | `directory | `document | `feed | `figure | `form | `gridcell | `group | `heading | `img | `listitem | `log | `main | `marquee | `math | `menubar | `menuitem | `menuitemcheckbox | `menuitemradio | `meter | `navigation | `note | `option | `presentation | `progressbar | `radio | `radiogroup | `region | `row | `rowgroup | `rowheader | `scrollbar | `search | `searchbox | `separator | `slider | `spinbutton | `status | `switch | `tab | `table | `tablist | `tabpanel | `term | `textbox | `timer | `toolbar | `tooltip | `treegrid | `treeitem ]
  type slot = string
  type style = string
  type tabIndex = string
  type tabindex = string
  type textContent = string
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
    ?classList:classList Check.value ->
    ?class_:class_ Check.value ->
    ?elementtiming:elementtiming Check.value ->
    ?id:id Check.value ->
    ?innerHTML:innerHTML Check.value ->
    ?nonce:nonce Check.value ->
    ?onAbort:onAbort ->
    ?onAnimationCancel:onAnimationCancel ->
    ?onAnimationEnd:onAnimationEnd ->
    ?onAnimationIteration:onAnimationIteration ->
    ?onAnimationStart:onAnimationStart ->
    ?onAuxClick:onAuxClick ->
    ?onBeforeCopy:onBeforeCopy ->
    ?onBeforeCut:onBeforeCut ->
    ?onBeforeInput:onBeforeInput ->
    ?onBeforeMatch:onBeforeMatch ->
    ?onBeforePaste:onBeforePaste ->
    ?onBeforeToggle:onBeforeToggle ->
    ?onBeforeXRSelect:onBeforeXRSelect ->
    ?onBlur:onBlur ->
    ?onCanPlay:onCanPlay ->
    ?onCanPlayThrough:onCanPlayThrough ->
    ?onCancel:onCancel ->
    ?onChange:onChange ->
    ?onClick:onClick ->
    ?onClose:onClose ->
    ?onCommand:onCommand ->
    ?onCompositionEnd:onCompositionEnd ->
    ?onCompositionStart:onCompositionStart ->
    ?onCompositionUpdate:onCompositionUpdate ->
    ?onContentVisibilityAutoStateChange:onContentVisibilityAutoStateChange ->
    ?onContextLost:onContextLost ->
    ?onContextMenu:onContextMenu ->
    ?onContextRestored:onContextRestored ->
    ?onCopy:onCopy ->
    ?onCueChange:onCueChange ->
    ?onCut:onCut ->
    ?onDblClick:onDblClick ->
    ?onDrag:onDrag ->
    ?onDragEnd:onDragEnd ->
    ?onDragEnter:onDragEnter ->
    ?onDragExit:onDragExit ->
    ?onDragLeave:onDragLeave ->
    ?onDragOver:onDragOver ->
    ?onDragStart:onDragStart ->
    ?onDrop:onDrop ->
    ?onDurationChange:onDurationChange ->
    ?onEmptied:onEmptied ->
    ?onEnded:onEnded ->
    ?onError:onError ->
    ?onFocus:onFocus ->
    ?onFocusIn:onFocusIn ->
    ?onFocusOut:onFocusOut ->
    ?onFormData:onFormData ->
    ?onFullscreenChange:onFullscreenChange ->
    ?onFullscreenError:onFullscreenError ->
    ?onGotPointerCapture:onGotPointerCapture ->
    ?onInput:onInput ->
    ?onInvalid:onInvalid ->
    ?onKeyDown:onKeyDown ->
    ?onKeyPress:onKeyPress ->
    ?onKeyUp:onKeyUp ->
    ?onLoad:onLoad ->
    ?onLoadStart:onLoadStart ->
    ?onLoadedData:onLoadedData ->
    ?onLoadedMetadata:onLoadedMetadata ->
    ?onLostPointerCapture:onLostPointerCapture ->
    ?onMouseDown:onMouseDown ->
    ?onMouseEnter:onMouseEnter ->
    ?onMouseLeave:onMouseLeave ->
    ?onMouseMove:onMouseMove ->
    ?onMouseOut:onMouseOut ->
    ?onMouseOver:onMouseOver ->
    ?onMouseUp:onMouseUp ->
    ?onPaste:onPaste ->
    ?onPause:onPause ->
    ?onPlay:onPlay ->
    ?onPlaying:onPlaying ->
    ?onPointerCancel:onPointerCancel ->
    ?onPointerDown:onPointerDown ->
    ?onPointerEnter:onPointerEnter ->
    ?onPointerLeave:onPointerLeave ->
    ?onPointerMove:onPointerMove ->
    ?onPointerOut:onPointerOut ->
    ?onPointerOver:onPointerOver ->
    ?onPointerRawUpdate:onPointerRawUpdate ->
    ?onPointerUp:onPointerUp ->
    ?onProgress:onProgress ->
    ?onRateChange:onRateChange ->
    ?onReset:onReset ->
    ?onResize:onResize ->
    ?onScroll:onScroll ->
    ?onScrollEnd:onScrollEnd ->
    ?onScrollSnapChange:onScrollSnapChange ->
    ?onScrollSnapChanging:onScrollSnapChanging ->
    ?onSecurityPolicyViolation:onSecurityPolicyViolation ->
    ?onSeeked:onSeeked ->
    ?onSeeking:onSeeking ->
    ?onSelect:onSelect ->
    ?onSelectStart:onSelectStart ->
    ?onSelectionChange:onSelectionChange ->
    ?onSlotChange:onSlotChange ->
    ?onStalled:onStalled ->
    ?onSubmit:onSubmit ->
    ?onSuspend:onSuspend ->
    ?onTimeUpdate:onTimeUpdate ->
    ?onToggle:onToggle ->
    ?onTouchCancel:onTouchCancel ->
    ?onTouchEnd:onTouchEnd ->
    ?onTouchMove:onTouchMove ->
    ?onTouchStart:onTouchStart ->
    ?onTransitionCancel:onTransitionCancel ->
    ?onTransitionEnd:onTransitionEnd ->
    ?onTransitionRun:onTransitionRun ->
    ?onTransitionStart:onTransitionStart ->
    ?onVolumeChange:onVolumeChange ->
    ?onWaiting:onWaiting ->
    ?onWheel:onWheel ->
    ?onabort:onabort ->
    ?onanimationcancel:onanimationcancel ->
    ?onanimationend:onanimationend ->
    ?onanimationiteration:onanimationiteration ->
    ?onanimationstart:onanimationstart ->
    ?onauxclick:onauxclick ->
    ?onbeforecopy:onbeforecopy ->
    ?onbeforecut:onbeforecut ->
    ?onbeforeinput:onbeforeinput ->
    ?onbeforematch:onbeforematch ->
    ?onbeforepaste:onbeforepaste ->
    ?onbeforetoggle:onbeforetoggle ->
    ?onbeforexrselect:onbeforexrselect ->
    ?onblur:onblur ->
    ?oncancel:oncancel ->
    ?oncanplay:oncanplay ->
    ?oncanplaythrough:oncanplaythrough ->
    ?onchange:onchange ->
    ?onclick:onclick ->
    ?onclose:onclose ->
    ?oncommand:oncommand ->
    ?oncompositionend:oncompositionend ->
    ?oncompositionstart:oncompositionstart ->
    ?oncompositionupdate:oncompositionupdate ->
    ?oncontentvisibilityautostatechange:oncontentvisibilityautostatechange ->
    ?oncontextlost:oncontextlost ->
    ?oncontextmenu:oncontextmenu ->
    ?oncontextrestored:oncontextrestored ->
    ?oncopy:oncopy ->
    ?oncuechange:oncuechange ->
    ?oncut:oncut ->
    ?ondblclick:ondblclick ->
    ?ondrag:ondrag ->
    ?ondragend:ondragend ->
    ?ondragenter:ondragenter ->
    ?ondragexit:ondragexit ->
    ?ondragleave:ondragleave ->
    ?ondragover:ondragover ->
    ?ondragstart:ondragstart ->
    ?ondrop:ondrop ->
    ?ondurationchange:ondurationchange ->
    ?onemptied:onemptied ->
    ?onended:onended ->
    ?onerror:onerror ->
    ?onfocus:onfocus ->
    ?onfocusin:onfocusin ->
    ?onfocusout:onfocusout ->
    ?onformdata:onformdata ->
    ?onfullscreenchange:onfullscreenchange ->
    ?onfullscreenerror:onfullscreenerror ->
    ?ongotpointercapture:ongotpointercapture ->
    ?oninput:oninput ->
    ?oninvalid:oninvalid ->
    ?onkeydown:onkeydown ->
    ?onkeypress:onkeypress ->
    ?onkeyup:onkeyup ->
    ?onload:onload ->
    ?onloadeddata:onloadeddata ->
    ?onloadedmetadata:onloadedmetadata ->
    ?onloadstart:onloadstart ->
    ?onlostpointercapture:onlostpointercapture ->
    ?onmousedown:onmousedown ->
    ?onmouseenter:onmouseenter ->
    ?onmouseleave:onmouseleave ->
    ?onmousemove:onmousemove ->
    ?onmouseout:onmouseout ->
    ?onmouseover:onmouseover ->
    ?onmouseup:onmouseup ->
    ?onpaste:onpaste ->
    ?onpause:onpause ->
    ?onplay:onplay ->
    ?onplaying:onplaying ->
    ?onpointercancel:onpointercancel ->
    ?onpointerdown:onpointerdown ->
    ?onpointerenter:onpointerenter ->
    ?onpointerleave:onpointerleave ->
    ?onpointermove:onpointermove ->
    ?onpointerout:onpointerout ->
    ?onpointerover:onpointerover ->
    ?onpointerrawupdate:onpointerrawupdate ->
    ?onpointerup:onpointerup ->
    ?onprogress:onprogress ->
    ?onratechange:onratechange ->
    ?onreset:onreset ->
    ?onresize:onresize ->
    ?onscroll:onscroll ->
    ?onscrollend:onscrollend ->
    ?onscrollsnapchange:onscrollsnapchange ->
    ?onscrollsnapchanging:onscrollsnapchanging ->
    ?onsecuritypolicyviolation:onsecuritypolicyviolation ->
    ?onseeked:onseeked ->
    ?onseeking:onseeking ->
    ?onselect:onselect ->
    ?onselectionchange:onselectionchange ->
    ?onselectstart:onselectstart ->
    ?onslotchange:onslotchange ->
    ?onstalled:onstalled ->
    ?onsubmit:onsubmit ->
    ?onsuspend:onsuspend ->
    ?ontimeupdate:ontimeupdate ->
    ?ontoggle:ontoggle ->
    ?ontouchcancel:ontouchcancel ->
    ?ontouchend:ontouchend ->
    ?ontouchmove:ontouchmove ->
    ?ontouchstart:ontouchstart ->
    ?ontransitioncancel:ontransitioncancel ->
    ?ontransitionend:ontransitionend ->
    ?ontransitionrun:ontransitionrun ->
    ?ontransitionstart:ontransitionstart ->
    ?onvolumechange:onvolumechange ->
    ?onwaiting:onwaiting ->
    ?onwheel:onwheel ->
    ?ref:ref ->
    ?role:role Check.value ->
    ?slot:slot Check.value ->
    ?style:style Check.value ->
    ?tabIndex:tabIndex Check.value ->
    ?tabindex:tabindex Check.value ->
    ?textContent:textContent Check.value ->
    'r
end

module type AnchorHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type accessKey = string
  type accesskey = string
  type attributionsrc = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type charset = string
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type coords = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type download = string
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type href = string
  type hreflang = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
  type referrerPolicy = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?attributionsrc:attributionsrc Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?charset:charset Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?coords:coords Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?download:download Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?href:href Check.value ->
    ?hreflang:hreflang Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
    ?referrerPolicy:referrerPolicy Check.value ->
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
  type attributeName = string
  type begin_ = string
  type by = string
  type calcMode = [ `discrete | `linear | `paced | `spline ]
  type dur = string
  type end_ = string
  type externalResourcesRequired = bool
  type fill = [ `freeze | `remove ]
  type from = string
  type keyPoints = string
  type keySplines = string
  type keyTimes = string
  type lang = string
  type max = string
  type min = string
  type onBegin = Dom.event -> unit
  type onEnd = Dom.event -> unit
  type onRepeat = Dom.event -> unit
  type onbegin = Dom.event -> unit
  type onend = Dom.event -> unit
  type onrepeat = Dom.event -> unit
  type origin = [ `default ]
  type path = string
  type repeatCount = string
  type repeatDur = string
  type requiredExtensions = string
  type requiredFeatures = string
  type restart = [ `always | `whenNotActive | `never ]
  type rotate = string
  type systemLanguage = string
  type to_ = string
  type values = string
  type xmlns = string
  type 'r check =
    ?accumulate:accumulate Check.value ->
    ?additive:additive Check.value ->
    ?attributeName:attributeName Check.value ->
    ?begin_:begin_ Check.value ->
    ?by:by Check.value ->
    ?calcMode:calcMode Check.value ->
    ?dur:dur Check.value ->
    ?end_:end_ Check.value ->
    ?externalResourcesRequired:externalResourcesRequired Check.value ->
    ?fill:fill Check.value ->
    ?from:from Check.value ->
    ?keyPoints:keyPoints Check.value ->
    ?keySplines:keySplines Check.value ->
    ?keyTimes:keyTimes Check.value ->
    ?lang:lang Check.value ->
    ?max:max Check.value ->
    ?min:min Check.value ->
    ?onBegin:onBegin ->
    ?onEnd:onEnd ->
    ?onRepeat:onRepeat ->
    ?onbegin:onbegin ->
    ?onend:onend ->
    ?onrepeat:onrepeat ->
    ?origin:origin Check.value ->
    ?path:path Check.value ->
    ?repeatCount:repeatCount Check.value ->
    ?repeatDur:repeatDur Check.value ->
    ?requiredExtensions:requiredExtensions Check.value ->
    ?requiredFeatures:requiredFeatures Check.value ->
    ?restart:restart Check.value ->
    ?rotate:rotate Check.value ->
    ?systemLanguage:systemLanguage Check.value ->
    ?to_:to_ Check.value ->
    ?values:values Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type AnimateSVGAttributes = sig
  include Dom_attributes
  type accumulate = [ `none | `sum ]
  type additive = [ `sum | `replace ]
  type attributeName = string
  type attributeType = [ `auto | `CSS | `XML ]
  type begin_ = string
  type by = string
  type calcMode = [ `discrete | `linear | `paced | `spline ]
  type dur = string
  type end_ = string
  type externalResourcesRequired = bool
  type fill = [ `freeze | `remove ]
  type from = string
  type keySplines = string
  type keyTimes = string
  type lang = string
  type max = string
  type min = string
  type onBegin = Dom.event -> unit
  type onEnd = Dom.event -> unit
  type onRepeat = Dom.event -> unit
  type onbegin = Dom.event -> unit
  type onend = Dom.event -> unit
  type onrepeat = Dom.event -> unit
  type repeatCount = string
  type repeatDur = string
  type requiredExtensions = string
  type requiredFeatures = string
  type restart = [ `always | `whenNotActive | `never ]
  type systemLanguage = string
  type to_ = string
  type values = string
  type xmlns = string
  type 'r check =
    ?accumulate:accumulate Check.value ->
    ?additive:additive Check.value ->
    ?attributeName:attributeName Check.value ->
    ?attributeType:attributeType Check.value ->
    ?begin_:begin_ Check.value ->
    ?by:by Check.value ->
    ?calcMode:calcMode Check.value ->
    ?dur:dur Check.value ->
    ?end_:end_ Check.value ->
    ?externalResourcesRequired:externalResourcesRequired Check.value ->
    ?fill:fill Check.value ->
    ?from:from Check.value ->
    ?keySplines:keySplines Check.value ->
    ?keyTimes:keyTimes Check.value ->
    ?lang:lang Check.value ->
    ?max:max Check.value ->
    ?min:min Check.value ->
    ?onBegin:onBegin ->
    ?onEnd:onEnd ->
    ?onRepeat:onRepeat ->
    ?onbegin:onbegin ->
    ?onend:onend ->
    ?onrepeat:onrepeat ->
    ?repeatCount:repeatCount Check.value ->
    ?repeatDur:repeatDur Check.value ->
    ?requiredExtensions:requiredExtensions Check.value ->
    ?requiredFeatures:requiredFeatures Check.value ->
    ?restart:restart Check.value ->
    ?systemLanguage:systemLanguage Check.value ->
    ?to_:to_ Check.value ->
    ?values:values Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type AnimateTransformSVGAttributes = sig
  include Dom_attributes
  type accumulate = [ `none | `sum ]
  type additive = [ `sum | `replace ]
  type attributeName = string
  type attributeType = [ `auto | `CSS | `XML ]
  type begin_ = string
  type by = string
  type calcMode = [ `discrete | `linear | `paced | `spline ]
  type dur = string
  type end_ = string
  type externalResourcesRequired = bool
  type fill = [ `freeze | `remove ]
  type from = string
  type keySplines = string
  type keyTimes = string
  type lang = string
  type max = string
  type min = string
  type onBegin = Dom.event -> unit
  type onEnd = Dom.event -> unit
  type onRepeat = Dom.event -> unit
  type onbegin = Dom.event -> unit
  type onend = Dom.event -> unit
  type onrepeat = Dom.event -> unit
  type repeatCount = string
  type repeatDur = string
  type requiredExtensions = string
  type requiredFeatures = string
  type restart = [ `always | `whenNotActive | `never ]
  type systemLanguage = string
  type to_ = string
  type type_ = [ `translate | `scale | `rotate | `skewX | `skewY ]
  type values = string
  type xmlns = string
  type 'r check =
    ?accumulate:accumulate Check.value ->
    ?additive:additive Check.value ->
    ?attributeName:attributeName Check.value ->
    ?attributeType:attributeType Check.value ->
    ?begin_:begin_ Check.value ->
    ?by:by Check.value ->
    ?calcMode:calcMode Check.value ->
    ?dur:dur Check.value ->
    ?end_:end_ Check.value ->
    ?externalResourcesRequired:externalResourcesRequired Check.value ->
    ?fill:fill Check.value ->
    ?from:from Check.value ->
    ?keySplines:keySplines Check.value ->
    ?keyTimes:keyTimes Check.value ->
    ?lang:lang Check.value ->
    ?max:max Check.value ->
    ?min:min Check.value ->
    ?onBegin:onBegin ->
    ?onEnd:onEnd ->
    ?onRepeat:onRepeat ->
    ?onbegin:onbegin ->
    ?onend:onend ->
    ?onrepeat:onrepeat ->
    ?repeatCount:repeatCount Check.value ->
    ?repeatDur:repeatDur Check.value ->
    ?requiredExtensions:requiredExtensions Check.value ->
    ?requiredFeatures:requiredFeatures Check.value ->
    ?restart:restart Check.value ->
    ?systemLanguage:systemLanguage Check.value ->
    ?to_:to_ Check.value ->
    ?type_:type_ Check.value ->
    ?values:values Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type AreaHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type accessKey = string
  type accesskey = string
  type alt = string
  type attributionsrc = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type coords = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type download = string
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type href = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
  type referrerPolicy = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?alt:alt Check.value ->
    ?attributionsrc:attributionsrc Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?coords:coords Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?download:download Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?href:href Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
    ?referrerPolicy:referrerPolicy Check.value ->
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
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type autoplay = bool
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type controls = bool
  type controlslist = string
  type crossOrigin = string
  type crossorigin = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type disableremoteplayback = bool
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type loop = bool
  type mediaGroup = string
  type mediagroup = string
  type muted = bool
  type onEncrypted = Dom.event -> unit
  type onWaitingForKey = Dom.event -> unit
  type onencrypted = Dom.event -> unit
  type onwaitingforkey = Dom.event -> unit
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?autoplay:autoplay Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?controls:controls Check.value ->
    ?controlslist:controlslist Check.value ->
    ?crossOrigin:crossOrigin Check.value ->
    ?crossorigin:crossorigin Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?disableremoteplayback:disableremoteplayback Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?loop:loop Check.value ->
    ?mediaGroup:mediaGroup Check.value ->
    ?mediagroup:mediagroup Check.value ->
    ?muted:muted Check.value ->
    ?onEncrypted:onEncrypted ->
    ?onWaitingForKey:onWaitingForKey ->
    ?onencrypted:onencrypted ->
    ?onwaitingforkey:onwaitingforkey ->
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
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type href = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?href:href Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type cite = string
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?cite:cite Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type onAfterPrint = Dom.event -> unit
  type onBeforePrint = Dom.event -> unit
  type onBeforeUnload = Dom.beforeUnloadEvent -> unit
  type onGamepadConnected = Dom.event -> unit
  type onGamepadDisconnected = Dom.event -> unit
  type onHashchange = Dom.event -> unit
  type onLanguageChange = Dom.event -> unit
  type onMessage = Dom.messageEvent -> unit
  type onMessageError = Dom.messageEvent -> unit
  type onOffline = Dom.event -> unit
  type onOnline = Dom.event -> unit
  type onPageHide = Dom.pageTransitionEvent -> unit
  type onPageReveal = Dom.event -> unit
  type onPageShow = Dom.pageTransitionEvent -> unit
  type onPageSwap = Dom.event -> unit
  type onPopstate = Dom.popStateEvent -> unit
  type onRejectionHandled = Dom.event -> unit
  type onStorage = Dom.storageEvent -> unit
  type onUnhandledRejection = Dom.event -> unit
  type onUnload = Dom.event -> unit
  type onafterprint = Dom.event -> unit
  type onbeforeprint = Dom.event -> unit
  type onbeforeunload = Dom.beforeUnloadEvent -> unit
  type ongamepadconnected = Dom.event -> unit
  type ongamepaddisconnected = Dom.event -> unit
  type onhashchange = Dom.event -> unit
  type onlanguagechange = Dom.event -> unit
  type onmessage = Dom.messageEvent -> unit
  type onmessageerror = Dom.messageEvent -> unit
  type onoffline = Dom.event -> unit
  type ononline = Dom.event -> unit
  type onpagehide = Dom.pageTransitionEvent -> unit
  type onpagereveal = Dom.event -> unit
  type onpageshow = Dom.pageTransitionEvent -> unit
  type onpageswap = Dom.event -> unit
  type onpopstate = Dom.popStateEvent -> unit
  type onrejectionhandled = Dom.event -> unit
  type onstorage = Dom.storageEvent -> unit
  type onunhandledrejection = Dom.event -> unit
  type onunload = Dom.event -> unit
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?onAfterPrint:onAfterPrint ->
    ?onBeforePrint:onBeforePrint ->
    ?onBeforeUnload:onBeforeUnload ->
    ?onGamepadConnected:onGamepadConnected ->
    ?onGamepadDisconnected:onGamepadDisconnected ->
    ?onHashchange:onHashchange ->
    ?onLanguageChange:onLanguageChange ->
    ?onMessage:onMessage ->
    ?onMessageError:onMessageError ->
    ?onOffline:onOffline ->
    ?onOnline:onOnline ->
    ?onPageHide:onPageHide ->
    ?onPageReveal:onPageReveal ->
    ?onPageShow:onPageShow ->
    ?onPageSwap:onPageSwap ->
    ?onPopstate:onPopstate ->
    ?onRejectionHandled:onRejectionHandled ->
    ?onStorage:onStorage ->
    ?onUnhandledRejection:onUnhandledRejection ->
    ?onUnload:onUnload ->
    ?onafterprint:onafterprint ->
    ?onbeforeprint:onbeforeprint ->
    ?onbeforeunload:onbeforeunload ->
    ?ongamepadconnected:ongamepadconnected ->
    ?ongamepaddisconnected:ongamepaddisconnected ->
    ?onhashchange:onhashchange ->
    ?onlanguagechange:onlanguagechange ->
    ?onmessage:onmessage ->
    ?onmessageerror:onmessageerror ->
    ?onoffline:onoffline ->
    ?ononline:ononline ->
    ?onpagehide:onpagehide ->
    ?onpagereveal:onpagereveal ->
    ?onpageshow:onpageshow ->
    ?onpageswap:onpageswap ->
    ?onpopstate:onpopstate ->
    ?onrejectionhandled:onrejectionhandled ->
    ?onstorage:onstorage ->
    ?onunhandledrejection:onunhandledrejection ->
    ?onunload:onunload ->
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
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type command = string
  type commandfor = string
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type disabled = bool
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type form = string
  type formAction = string
  type formEnctype = string
  type formMethod = [ `dialog | `post | `get ]
  type formNoValidate = bool
  type formTarget = string
  type formaction = string
  type formenctype = string
  type formmethod = [ `dialog | `post | `get ]
  type formnovalidate = bool
  type formtarget = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type name = string
  type part = string
  type popover = string
  type popoverTarget = string
  type popoverTargetAction = [ `hide | `show | `toggle ]
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?command:command Check.value ->
    ?commandfor:commandfor Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?disabled:disabled Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?form:form Check.value ->
    ?formAction:formAction Check.value ->
    ?formEnctype:formEnctype Check.value ->
    ?formMethod:formMethod Check.value ->
    ?formNoValidate:formNoValidate Check.value ->
    ?formTarget:formTarget Check.value ->
    ?formaction:formaction Check.value ->
    ?formenctype:formenctype Check.value ->
    ?formmethod:formmethod Check.value ->
    ?formnovalidate:formnovalidate Check.value ->
    ?formtarget:formtarget Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?name:name Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?popoverTarget:popoverTarget Check.value ->
    ?popoverTargetAction:popoverTargetAction Check.value ->
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
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type height = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?height:height Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type accessKey = string
  type accesskey = string
  type align = [ `left | `center | `right ]
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?align:align Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type cx = string
  type cy = string
  type lang = string
  type r = string
  type requiredExtensions = string
  type requiredFeatures = string
  type systemLanguage = string
  type transform = string
  type xmlns = string
  type 'r check =
    ?cx:cx Check.value ->
    ?cy:cy Check.value ->
    ?lang:lang Check.value ->
    ?r:r Check.value ->
    ?requiredExtensions:requiredExtensions Check.value ->
    ?requiredFeatures:requiredFeatures Check.value ->
    ?systemLanguage:systemLanguage Check.value ->
    ?transform:transform Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type ClipPathSVGAttributes = sig
  include Dom_attributes
  type clipPathUnits = [ `userSpaceOnUse | `objectBoundingBox ]
  type externalResourcesRequired = bool
  type lang = string
  type requiredExtensions = string
  type requiredFeatures = string
  type systemLanguage = string
  type transform = string
  type xmlns = string
  type 'r check =
    ?clipPathUnits:clipPathUnits Check.value ->
    ?externalResourcesRequired:externalResourcesRequired Check.value ->
    ?lang:lang Check.value ->
    ?requiredExtensions:requiredExtensions Check.value ->
    ?requiredFeatures:requiredFeatures Check.value ->
    ?systemLanguage:systemLanguage Check.value ->
    ?transform:transform Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type ColHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type accessKey = string
  type accesskey = string
  type align = [ `left | `center | `right | `justify | `char ]
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type bgcolor = string
  type char = string
  type charoff = string
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
  type valign = [ `baseline | `bottom | `middle | `top ]
  type vocab = string
  type width = string
  type 'r check =
    ?about:about Check.value ->
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?align:align Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?bgcolor:bgcolor Check.value ->
    ?char:char Check.value ->
    ?charoff:charoff Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type accessKey = string
  type accesskey = string
  type align = [ `left | `center | `right | `justify | `char ]
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type bgcolor = string
  type char = string
  type charoff = string
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
  type valign = [ `baseline | `bottom | `middle | `top ]
  type vocab = string
  type width = string
  type 'r check =
    ?about:about Check.value ->
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?align:align Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?bgcolor:bgcolor Check.value ->
    ?char:char Check.value ->
    ?charoff:charoff Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type externalResourcesRequired = bool
  type lang = string
  type requiredExtensions = string
  type requiredFeatures = string
  type systemLanguage = string
  type transform = string
  type xmlns = string
  type 'r check =
    ?externalResourcesRequired:externalResourcesRequired Check.value ->
    ?lang:lang Check.value ->
    ?requiredExtensions:requiredExtensions Check.value ->
    ?requiredFeatures:requiredFeatures Check.value ->
    ?systemLanguage:systemLanguage Check.value ->
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
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type closedby = [ `none | `any | `closerequest ]
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?closedby:closedby Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type cx = string
  type cy = string
  type externalResourcesRequired = bool
  type lang = string
  type requiredExtensions = string
  type requiredFeatures = string
  type rx = string
  type ry = string
  type systemLanguage = string
  type transform = string
  type xmlns = string
  type 'r check =
    ?cx:cx Check.value ->
    ?cy:cy Check.value ->
    ?externalResourcesRequired:externalResourcesRequired Check.value ->
    ?lang:lang Check.value ->
    ?requiredExtensions:requiredExtensions Check.value ->
    ?requiredFeatures:requiredFeatures Check.value ->
    ?rx:rx Check.value ->
    ?ry:ry Check.value ->
    ?systemLanguage:systemLanguage Check.value ->
    ?transform:transform Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type EmbedHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type accessKey = string
  type accesskey = string
  type align = [ `left | `center | `right | `justify ]
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type height = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?align:align Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?height:height Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type height = string
  type in_ = string
  type lang = string
  type result = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
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
  type divisor = string
  type edgeMode = [ `none | `duplicate | `wrap ]
  type height = string
  type in_ = string
  type kernelMatrix = string
  type kernelUnitLength = string
  type lang = string
  type order = string
  type preserveAlpha = bool
  type result = string
  type targetX = string
  type targetY = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?bias:bias Check.value ->
    ?divisor:divisor Check.value ->
    ?edgeMode:edgeMode Check.value ->
    ?height:height Check.value ->
    ?in_:in_ Check.value ->
    ?kernelMatrix:kernelMatrix Check.value ->
    ?kernelUnitLength:kernelUnitLength Check.value ->
    ?lang:lang Check.value ->
    ?order:order Check.value ->
    ?preserveAlpha:preserveAlpha Check.value ->
    ?result:result Check.value ->
    ?targetX:targetX Check.value ->
    ?targetY:targetY Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type FeDiffuseLightingSVGAttributes = sig
  include Dom_attributes
  type diffuseConstant = string
  type height = string
  type in_ = string
  type kernelUnitLength = string
  type lang = string
  type result = string
  type surfaceScale = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?diffuseConstant:diffuseConstant Check.value ->
    ?height:height Check.value ->
    ?in_:in_ Check.value ->
    ?kernelUnitLength:kernelUnitLength Check.value ->
    ?lang:lang Check.value ->
    ?result:result Check.value ->
    ?surfaceScale:surfaceScale Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type FeDisplacementMapSVGAttributes = sig
  include Dom_attributes
  type height = string
  type in2 = string
  type in_ = string
  type lang = string
  type result = string
  type scale = string
  type width = string
  type x = string
  type xChannelSelector = [ `R | `G | `B | `A ]
  type xmlns = string
  type y = string
  type yChannelSelector = [ `R | `G | `B | `A ]
  type 'r check =
    ?height:height Check.value ->
    ?in2:in2 Check.value ->
    ?in_:in_ Check.value ->
    ?lang:lang Check.value ->
    ?result:result Check.value ->
    ?scale:scale Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xChannelSelector:xChannelSelector Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    ?yChannelSelector:yChannelSelector Check.value ->
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
  type dx = string
  type dy = string
  type height = string
  type lang = string
  type result = string
  type stdDeviation = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?dx:dx Check.value ->
    ?dy:dy Check.value ->
    ?height:height Check.value ->
    ?lang:lang Check.value ->
    ?result:result Check.value ->
    ?stdDeviation:stdDeviation Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type FeFloodSVGAttributes = sig
  include Dom_attributes
  type height = string
  type lang = string
  type result = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
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
  type tableValues = string
  type type_ = [ `table | `discrete | `linear | `identity | `gamma ]
  type xmlns = string
  type 'r check =
    ?amplitude:amplitude Check.value ->
    ?exponent:exponent Check.value ->
    ?intercept:intercept Check.value ->
    ?lang:lang Check.value ->
    ?offset:offset Check.value ->
    ?slope:slope Check.value ->
    ?tableValues:tableValues Check.value ->
    ?type_:type_ Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type FeGaussianBlurSVGAttributes = sig
  include Dom_attributes
  type height = string
  type in_ = string
  type lang = string
  type result = string
  type stdDeviation = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?height:height Check.value ->
    ?in_:in_ Check.value ->
    ?lang:lang Check.value ->
    ?result:result Check.value ->
    ?stdDeviation:stdDeviation Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type FeImageSVGAttributes = sig
  include Dom_attributes
  type externalResourcesRequired = bool
  type height = string
  type href = string
  type lang = string
  type preserveAspectRatio = string
  type result = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?externalResourcesRequired:externalResourcesRequired Check.value ->
    ?height:height Check.value ->
    ?href:href Check.value ->
    ?lang:lang Check.value ->
    ?preserveAspectRatio:preserveAspectRatio Check.value ->
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
  type height = string
  type lang = string
  type result = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
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
  type height = string
  type in_ = string
  type kernelUnitLength = string
  type lang = string
  type result = string
  type specularConstant = string
  type specularExponent = string
  type surfaceScale = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?height:height Check.value ->
    ?in_:in_ Check.value ->
    ?kernelUnitLength:kernelUnitLength Check.value ->
    ?lang:lang Check.value ->
    ?result:result Check.value ->
    ?specularConstant:specularConstant Check.value ->
    ?specularExponent:specularExponent Check.value ->
    ?surfaceScale:surfaceScale Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type FeSpotLightSVGAttributes = sig
  include Dom_attributes
  type lang = string
  type limitingConeAngle = string
  type pointsAtX = string
  type pointsAtY = string
  type pointsAtZ = string
  type specularExponent = string
  type x = string
  type xmlns = string
  type y = string
  type z = string
  type 'r check =
    ?lang:lang Check.value ->
    ?limitingConeAngle:limitingConeAngle Check.value ->
    ?pointsAtX:pointsAtX Check.value ->
    ?pointsAtY:pointsAtY Check.value ->
    ?pointsAtZ:pointsAtZ Check.value ->
    ?specularExponent:specularExponent Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    ?z:z Check.value ->
    'r dom_check
end

module type FeTileSVGAttributes = sig
  include Dom_attributes
  type height = string
  type in_ = string
  type lang = string
  type result = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
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
  type baseFrequency = string
  type height = string
  type lang = string
  type numOctaves = string
  type result = string
  type seed = string
  type stitchTiles = [ `stitch | `noStitch ]
  type type_ = [ `fractalNoise | `turbulence ]
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?baseFrequency:baseFrequency Check.value ->
    ?height:height Check.value ->
    ?lang:lang Check.value ->
    ?numOctaves:numOctaves Check.value ->
    ?result:result Check.value ->
    ?seed:seed Check.value ->
    ?stitchTiles:stitchTiles Check.value ->
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
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type disabled = bool
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type form = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?disabled:disabled Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?form:form Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type externalResourcesRequired = bool
  type filterRes = string
  type filterUnits = [ `userSpaceOnUse | `objectBoundingBox ]
  type height = string
  type lang = string
  type primitiveUnits = [ `userSpaceOnUse | `objectBoundingBox ]
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?externalResourcesRequired:externalResourcesRequired Check.value ->
    ?filterRes:filterRes Check.value ->
    ?filterUnits:filterUnits Check.value ->
    ?height:height Check.value ->
    ?lang:lang Check.value ->
    ?primitiveUnits:primitiveUnits Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type ForeignObjectSVGAttributes = sig
  include Dom_attributes
  type externalResourcesRequired = bool
  type height = string
  type lang = string
  type requiredExtensions = string
  type requiredFeatures = string
  type systemLanguage = string
  type transform = string
  type viewBox = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?externalResourcesRequired:externalResourcesRequired Check.value ->
    ?height:height Check.value ->
    ?lang:lang Check.value ->
    ?requiredExtensions:requiredExtensions Check.value ->
    ?requiredFeatures:requiredFeatures Check.value ->
    ?systemLanguage:systemLanguage Check.value ->
    ?transform:transform Check.value ->
    ?viewBox:viewBox Check.value ->
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
  type accessKey = string
  type accesskey = string
  type action = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocomplete = [ `off | `on ]
  type autocorrect = [ `off | `on ]
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type encoding = string
  type enctype = string
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type method_ = [ `dialog | `post | `get ]
  type name = string
  type noValidate = bool
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?action:action Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocomplete:autocomplete Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?encoding:encoding Check.value ->
    ?enctype:enctype Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?method_:method_ Check.value ->
    ?name:name Check.value ->
    ?noValidate:noValidate Check.value ->
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
  type externalResourcesRequired = bool
  type lang = string
  type requiredExtensions = string
  type requiredFeatures = string
  type systemLanguage = string
  type transform = string
  type xmlns = string
  type 'r check =
    ?externalResourcesRequired:externalResourcesRequired Check.value ->
    ?lang:lang Check.value ->
    ?requiredExtensions:requiredExtensions Check.value ->
    ?requiredFeatures:requiredFeatures Check.value ->
    ?systemLanguage:systemLanguage Check.value ->
    ?transform:transform Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type HTMLAttributes = sig
  include Dom_attributes
  type about = string
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type accessKey = string
  type accesskey = string
  type adauctionheaders = bool
  type align = string
  type allow = string
  type allowfullscreen = bool
  type allowpaymentrequest = bool
  type allowtransparency = bool
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type browsingtopics = bool
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type credentialless = bool
  type csp = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type frameborder = string
  type height = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
  type referrerPolicy = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?adauctionheaders:adauctionheaders Check.value ->
    ?align:align Check.value ->
    ?allow:allow Check.value ->
    ?allowfullscreen:allowfullscreen Check.value ->
    ?allowpaymentrequest:allowpaymentrequest Check.value ->
    ?allowtransparency:allowtransparency Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?browsingtopics:browsingtopics Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?credentialless:credentialless Check.value ->
    ?csp:csp Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?frameborder:frameborder Check.value ->
    ?height:height Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
    ?referrerPolicy:referrerPolicy Check.value ->
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
  type height = string
  type href = string
  type lang = string
  type preserveAspectRatio = string
  type requiredExtensions = string
  type requiredFeatures = string
  type systemLanguage = string
  type transform = string
  type viewBox = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?height:height Check.value ->
    ?href:href Check.value ->
    ?lang:lang Check.value ->
    ?preserveAspectRatio:preserveAspectRatio Check.value ->
    ?requiredExtensions:requiredExtensions Check.value ->
    ?requiredFeatures:requiredFeatures Check.value ->
    ?systemLanguage:systemLanguage Check.value ->
    ?transform:transform Check.value ->
    ?viewBox:viewBox Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type ImgHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type accessKey = string
  type accesskey = string
  type align = [ `left | `right | `bottom | `middle | `top ]
  type alt = string
  type attributionsrc = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type border = string
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type crossOrigin = string
  type crossorigin = string
  type datatype = string
  type decoding = [ `auto | `sync | `async ]
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type fetchpriority = [ `auto | `high | `low ]
  type height = string
  type hidden = string
  type hspace = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type intrinsicsize = string
  type is = string
  type isMap = bool
  type ismap = bool
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
  type referrerPolicy = string
  type referrerpolicy = string
  type resource = string
  type sharedstoragewritable = bool
  type sizes = string
  type spellcheck = bool
  type src = string
  type srcSet = string
  type srcset = string
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type useMap = string
  type usemap = string
  type vocab = string
  type vspace = string
  type width = string
  type 'r check =
    ?about:about Check.value ->
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?align:align Check.value ->
    ?alt:alt Check.value ->
    ?attributionsrc:attributionsrc Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?border:border Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?crossOrigin:crossOrigin Check.value ->
    ?crossorigin:crossorigin Check.value ->
    ?datatype:datatype Check.value ->
    ?decoding:decoding Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?fetchpriority:fetchpriority Check.value ->
    ?height:height Check.value ->
    ?hidden:hidden Check.value ->
    ?hspace:hspace Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?intrinsicsize:intrinsicsize Check.value ->
    ?is:is Check.value ->
    ?isMap:isMap Check.value ->
    ?ismap:ismap Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
    ?referrerPolicy:referrerPolicy Check.value ->
    ?referrerpolicy:referrerpolicy Check.value ->
    ?resource:resource Check.value ->
    ?sharedstoragewritable:sharedstoragewritable Check.value ->
    ?sizes:sizes Check.value ->
    ?spellcheck:spellcheck Check.value ->
    ?src:src Check.value ->
    ?srcSet:srcSet Check.value ->
    ?srcset:srcset Check.value ->
    ?title:title Check.value ->
    ?translate:translate Check.value ->
    ?typeof:typeof Check.value ->
    ?useMap:useMap Check.value ->
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
  type accessKey = string
  type accesskey = string
  type align = string
  type alpha = bool
  type alt = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocomplete = string
  type autocorrect = [ `off | `on ]
  type capture = [ `user | `environment ]
  type checked = bool
  type colorspace = string
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type dirname = string
  type disabled = bool
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type form = string
  type formAction = string
  type formEnctype = string
  type formMethod = [ `dialog | `post | `get ]
  type formNoValidate = bool
  type formTarget = string
  type formaction = string
  type formenctype = string
  type formmethod = [ `dialog | `post | `get ]
  type formnovalidate = bool
  type formtarget = string
  type height = string
  type hidden = string
  type incremental = bool
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type list = string
  type max = string
  type maxLength = string
  type maxlength = string
  type min = string
  type minLength = string
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
  type readOnly = bool
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?align:align Check.value ->
    ?alpha:alpha Check.value ->
    ?alt:alt Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocomplete:autocomplete Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?capture:capture Check.value ->
    ?checked:checked Check.value ->
    ?colorspace:colorspace Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?dirname:dirname Check.value ->
    ?disabled:disabled Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?form:form Check.value ->
    ?formAction:formAction Check.value ->
    ?formEnctype:formEnctype Check.value ->
    ?formMethod:formMethod Check.value ->
    ?formNoValidate:formNoValidate Check.value ->
    ?formTarget:formTarget Check.value ->
    ?formaction:formaction Check.value ->
    ?formenctype:formenctype Check.value ->
    ?formmethod:formmethod Check.value ->
    ?formnovalidate:formnovalidate Check.value ->
    ?formtarget:formtarget Check.value ->
    ?height:height Check.value ->
    ?hidden:hidden Check.value ->
    ?incremental:incremental Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?list:list Check.value ->
    ?max:max Check.value ->
    ?maxLength:maxLength Check.value ->
    ?maxlength:maxlength Check.value ->
    ?min:min Check.value ->
    ?minLength:minLength Check.value ->
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
    ?readOnly:readOnly Check.value ->
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
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type challenge = string
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type disabled = bool
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type form = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?challenge:challenge Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?disabled:disabled Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?form:form Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type for_ = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?for_:for_ Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type externalResourcesRequired = bool
  type lang = string
  type requiredExtensions = string
  type requiredFeatures = string
  type systemLanguage = string
  type transform = string
  type x1 = string
  type x2 = string
  type xmlns = string
  type y1 = string
  type y2 = string
  type 'r check =
    ?externalResourcesRequired:externalResourcesRequired Check.value ->
    ?lang:lang Check.value ->
    ?requiredExtensions:requiredExtensions Check.value ->
    ?requiredFeatures:requiredFeatures Check.value ->
    ?systemLanguage:systemLanguage Check.value ->
    ?transform:transform Check.value ->
    ?x1:x1 Check.value ->
    ?x2:x2 Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y1:y1 Check.value ->
    ?y2:y2 Check.value ->
    'r dom_check
end

module type LinearGradientSVGAttributes = sig
  include Dom_attributes
  type externalResourcesRequired = bool
  type gradientTransform = string
  type gradientUnits = [ `userSpaceOnUse | `objectBoundingBox ]
  type href = string
  type lang = string
  type spreadMethod = [ `pad | `reflect | `repeat ]
  type x1 = string
  type x2 = string
  type xmlns = string
  type y1 = string
  type y2 = string
  type 'r check =
    ?externalResourcesRequired:externalResourcesRequired Check.value ->
    ?gradientTransform:gradientTransform Check.value ->
    ?gradientUnits:gradientUnits Check.value ->
    ?href:href Check.value ->
    ?lang:lang Check.value ->
    ?spreadMethod:spreadMethod Check.value ->
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
  type accessKey = string
  type accesskey = string
  type as_ = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type blocking = [ `render ]
  type charset = string
  type color = string
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type crossOrigin = string
  type crossorigin = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type disabled = bool
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type fetchpriority = [ `auto | `high | `low ]
  type hidden = string
  type href = string
  type hreflang = string
  type imagesizes = string
  type imagesrcset = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type integrity = string
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
  type referrerPolicy = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?as_:as_ Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?blocking:blocking Check.value ->
    ?charset:charset Check.value ->
    ?color:color Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?crossOrigin:crossOrigin Check.value ->
    ?crossorigin:crossorigin Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?disabled:disabled Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?fetchpriority:fetchpriority Check.value ->
    ?hidden:hidden Check.value ->
    ?href:href Check.value ->
    ?hreflang:hreflang Check.value ->
    ?imagesizes:imagesizes Check.value ->
    ?imagesrcset:imagesrcset Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?integrity:integrity Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
    ?referrerPolicy:referrerPolicy Check.value ->
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
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type externalResourcesRequired = bool
  type lang = string
  type markerHeight = string
  type markerUnits = [ `userSpaceOnUse | `strokeWidth ]
  type markerWidth = string
  type orient = string
  type preserveAspectRatio = string
  type refX = string
  type refY = string
  type viewBox = string
  type xmlns = string
  type 'r check =
    ?externalResourcesRequired:externalResourcesRequired Check.value ->
    ?lang:lang Check.value ->
    ?markerHeight:markerHeight Check.value ->
    ?markerUnits:markerUnits Check.value ->
    ?markerWidth:markerWidth Check.value ->
    ?orient:orient Check.value ->
    ?preserveAspectRatio:preserveAspectRatio Check.value ->
    ?refX:refX Check.value ->
    ?refY:refY Check.value ->
    ?viewBox:viewBox Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type MaskSVGAttributes = sig
  type element
  type class_ = string
  type externalResourcesRequired = bool
  type height = string
  type maskContentUnits = [ `userSpaceOnUse | `objectBoundingBox ]
  type maskUnits = [ `userSpaceOnUse | `objectBoundingBox ]
  type requiredExtensions = string
  type requiredFeatures = string
  type style = string
  type systemLanguage = string
  type width = string
  type x = string
  type y = string
  type 'r check =
    ?class_:class_ Check.value ->
    ?externalResourcesRequired:externalResourcesRequired Check.value ->
    ?height:height Check.value ->
    ?maskContentUnits:maskContentUnits Check.value ->
    ?maskUnits:maskUnits Check.value ->
    ?requiredExtensions:requiredExtensions Check.value ->
    ?requiredFeatures:requiredFeatures Check.value ->
    ?style:style Check.value ->
    ?systemLanguage:systemLanguage Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?y:y Check.value ->
    'r
end

module type MenuHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type compact = bool
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?compact:compact Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type charset = string
  type content = string
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type http_equiv = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?charset:charset Check.value ->
    ?content:content Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?http_equiv:http_equiv Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type form = string
  type hidden = string
  type high = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?form:form Check.value ->
    ?hidden:hidden Check.value ->
    ?high:high Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type cite = string
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dateTime = string
  type datetime = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?cite:cite Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dateTime:dateTime Check.value ->
    ?datetime:datetime Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type accessKey = string
  type accesskey = string
  type align = string
  type archive = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type border = string
  type classid = string
  type code = string
  type codebase = string
  type codetype = string
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type data = string
  type datatype = string
  type declare = bool
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type form = string
  type height = string
  type hidden = string
  type hspace = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
  type useMap = string
  type usemap = string
  type vocab = string
  type vspace = string
  type width = string
  type 'r check =
    ?about:about Check.value ->
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?align:align Check.value ->
    ?archive:archive Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?border:border Check.value ->
    ?classid:classid Check.value ->
    ?code:code Check.value ->
    ?codebase:codebase Check.value ->
    ?codetype:codetype Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?data:data Check.value ->
    ?datatype:datatype Check.value ->
    ?declare:declare Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?form:form Check.value ->
    ?height:height Check.value ->
    ?hidden:hidden Check.value ->
    ?hspace:hspace Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
    ?useMap:useMap Check.value ->
    ?usemap:usemap Check.value ->
    ?vocab:vocab Check.value ->
    ?vspace:vspace Check.value ->
    ?width:width Check.value ->
    'r dom_check
end

module type OlHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type compact = bool
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?compact:compact Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type disabled = bool
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?disabled:disabled Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type disabled = bool
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?disabled:disabled Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type for_ = string
  type form = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?for_:for_ Check.value ->
    ?form:form Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type d = string
  type externalResourcesRequired = bool
  type lang = string
  type pathLength = string
  type requiredExtensions = string
  type requiredFeatures = string
  type systemLanguage = string
  type transform = string
  type xmlns = string
  type 'r check =
    ?d:d Check.value ->
    ?externalResourcesRequired:externalResourcesRequired Check.value ->
    ?lang:lang Check.value ->
    ?pathLength:pathLength Check.value ->
    ?requiredExtensions:requiredExtensions Check.value ->
    ?requiredFeatures:requiredFeatures Check.value ->
    ?systemLanguage:systemLanguage Check.value ->
    ?transform:transform Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type PatternSVGAttributes = sig
  include Dom_attributes
  type externalResourcesRequired = bool
  type height = string
  type href = string
  type lang = string
  type patternContentUnits = [ `userSpaceOnUse | `objectBoundingBox ]
  type patternTransform = string
  type patternUnits = [ `userSpaceOnUse | `objectBoundingBox ]
  type preserveAspectRatio = string
  type requiredExtensions = string
  type requiredFeatures = string
  type systemLanguage = string
  type viewBox = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?externalResourcesRequired:externalResourcesRequired Check.value ->
    ?height:height Check.value ->
    ?href:href Check.value ->
    ?lang:lang Check.value ->
    ?patternContentUnits:patternContentUnits Check.value ->
    ?patternTransform:patternTransform Check.value ->
    ?patternUnits:patternUnits Check.value ->
    ?preserveAspectRatio:preserveAspectRatio Check.value ->
    ?requiredExtensions:requiredExtensions Check.value ->
    ?requiredFeatures:requiredFeatures Check.value ->
    ?systemLanguage:systemLanguage Check.value ->
    ?viewBox:viewBox Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type PolygonSVGAttributes = sig
  include Dom_attributes
  type externalResourcesRequired = bool
  type lang = string
  type points = string
  type requiredExtensions = string
  type requiredFeatures = string
  type systemLanguage = string
  type transform = string
  type xmlns = string
  type 'r check =
    ?externalResourcesRequired:externalResourcesRequired Check.value ->
    ?lang:lang Check.value ->
    ?points:points Check.value ->
    ?requiredExtensions:requiredExtensions Check.value ->
    ?requiredFeatures:requiredFeatures Check.value ->
    ?systemLanguage:systemLanguage Check.value ->
    ?transform:transform Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type PolylineSVGAttributes = sig
  include Dom_attributes
  type externalResourcesRequired = bool
  type lang = string
  type points = string
  type requiredExtensions = string
  type requiredFeatures = string
  type systemLanguage = string
  type transform = string
  type xmlns = string
  type 'r check =
    ?externalResourcesRequired:externalResourcesRequired Check.value ->
    ?lang:lang Check.value ->
    ?points:points Check.value ->
    ?requiredExtensions:requiredExtensions Check.value ->
    ?requiredFeatures:requiredFeatures Check.value ->
    ?systemLanguage:systemLanguage Check.value ->
    ?transform:transform Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type ProgressHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type cite = string
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?cite:cite Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type externalResourcesRequired = bool
  type fx = string
  type fy = string
  type gradientTransform = string
  type gradientUnits = [ `userSpaceOnUse | `objectBoundingBox ]
  type href = string
  type lang = string
  type r = string
  type spreadMethod = [ `pad | `reflect | `repeat ]
  type xmlns = string
  type 'r check =
    ?cx:cx Check.value ->
    ?cy:cy Check.value ->
    ?externalResourcesRequired:externalResourcesRequired Check.value ->
    ?fx:fx Check.value ->
    ?fy:fy Check.value ->
    ?gradientTransform:gradientTransform Check.value ->
    ?gradientUnits:gradientUnits Check.value ->
    ?href:href Check.value ->
    ?lang:lang Check.value ->
    ?r:r Check.value ->
    ?spreadMethod:spreadMethod Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type RectSVGAttributes = sig
  include Dom_attributes
  type externalResourcesRequired = bool
  type height = string
  type lang = string
  type requiredExtensions = string
  type requiredFeatures = string
  type rx = string
  type ry = string
  type systemLanguage = string
  type transform = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?externalResourcesRequired:externalResourcesRequired Check.value ->
    ?height:height Check.value ->
    ?lang:lang Check.value ->
    ?requiredExtensions:requiredExtensions Check.value ->
    ?requiredFeatures:requiredFeatures Check.value ->
    ?rx:rx Check.value ->
    ?ry:ry Check.value ->
    ?systemLanguage:systemLanguage Check.value ->
    ?transform:transform Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type ScriptHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type accessKey = string
  type accesskey = string
  type async = bool
  type attributionsrc = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type blocking = [ `render ]
  type charset = string
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type crossOrigin = string
  type crossorigin = string
  type datatype = string
  type defer = bool
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type event = string
  type exportParts = string
  type exportparts = string
  type fetchpriority = [ `auto | `high | `low ]
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type integrity = string
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type language = string
  type noModule = bool
  type nomodule = bool
  type part = string
  type popover = string
  type prefix = string
  type property = string
  type referrerPolicy = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?async:async Check.value ->
    ?attributionsrc:attributionsrc Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?blocking:blocking Check.value ->
    ?charset:charset Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?crossOrigin:crossOrigin Check.value ->
    ?crossorigin:crossorigin Check.value ->
    ?datatype:datatype Check.value ->
    ?defer:defer Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?event:event Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?fetchpriority:fetchpriority Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?integrity:integrity Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?language:language Check.value ->
    ?noModule:noModule Check.value ->
    ?nomodule:nomodule Check.value ->
    ?part:part Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?referrerPolicy:referrerPolicy Check.value ->
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
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocomplete = string
  type autocorrect = [ `off | `on ]
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type disabled = bool
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type form = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocomplete:autocomplete Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?disabled:disabled Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?form:form Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type externalResourcesRequired = bool
  type fill = [ `freeze | `remove ]
  type lang = string
  type max = string
  type min = string
  type onBegin = Dom.event -> unit
  type onEnd = Dom.event -> unit
  type onRepeat = Dom.event -> unit
  type onbegin = Dom.event -> unit
  type onend = Dom.event -> unit
  type onrepeat = Dom.event -> unit
  type repeatCount = string
  type repeatDur = string
  type requiredExtensions = string
  type requiredFeatures = string
  type restart = [ `always | `whenNotActive | `never ]
  type systemLanguage = string
  type xmlns = string
  type 'r check =
    ?begin_:begin_ Check.value ->
    ?dur:dur Check.value ->
    ?end_:end_ Check.value ->
    ?externalResourcesRequired:externalResourcesRequired Check.value ->
    ?fill:fill Check.value ->
    ?lang:lang Check.value ->
    ?max:max Check.value ->
    ?min:min Check.value ->
    ?onBegin:onBegin ->
    ?onEnd:onEnd ->
    ?onRepeat:onRepeat ->
    ?onbegin:onbegin ->
    ?onend:onend ->
    ?onrepeat:onrepeat ->
    ?repeatCount:repeatCount Check.value ->
    ?repeatDur:repeatDur Check.value ->
    ?requiredExtensions:requiredExtensions Check.value ->
    ?requiredFeatures:requiredFeatures Check.value ->
    ?restart:restart Check.value ->
    ?systemLanguage:systemLanguage Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type SourceHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type height = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?height:height Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type lang = string
  type offset = string
  type xmlns = string
  type 'r check =
    ?lang:lang Check.value ->
    ?offset:offset Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type StyleHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type blocking = [ `render ]
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?blocking:blocking Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type baseProfile = string
  type baseline_shift = string
  type clip = string
  type clip_path = string
  type clip_rule = string
  type color = string
  type color_interpolation = string
  type color_interpolation_filters = string
  type color_profile = string
  type color_rendering = string
  type contentScriptType = string
  type contentStyleType = string
  type cursor = string
  type direction = string
  type display = string
  type dominant_baseline = string
  type enable_background = string
  type externalResourcesRequired = bool
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
  type onAfterPrint = Dom.event -> unit
  type onBeforePrint = Dom.event -> unit
  type onBeforeUnload = Dom.beforeUnloadEvent -> unit
  type onGamepadConnected = Dom.event -> unit
  type onGamepadDisconnected = Dom.event -> unit
  type onHashchange = Dom.event -> unit
  type onLanguageChange = Dom.event -> unit
  type onMessage = Dom.messageEvent -> unit
  type onMessageError = Dom.messageEvent -> unit
  type onOffline = Dom.event -> unit
  type onOnline = Dom.event -> unit
  type onPageHide = Dom.pageTransitionEvent -> unit
  type onPageReveal = Dom.event -> unit
  type onPageShow = Dom.pageTransitionEvent -> unit
  type onPageSwap = Dom.event -> unit
  type onPopstate = Dom.popStateEvent -> unit
  type onRejectionHandled = Dom.event -> unit
  type onStorage = Dom.storageEvent -> unit
  type onUnhandledRejection = Dom.event -> unit
  type onUnload = Dom.event -> unit
  type onafterprint = Dom.event -> unit
  type onbeforeprint = Dom.event -> unit
  type onbeforeunload = Dom.beforeUnloadEvent -> unit
  type ongamepadconnected = Dom.event -> unit
  type ongamepaddisconnected = Dom.event -> unit
  type onhashchange = Dom.event -> unit
  type onlanguagechange = Dom.event -> unit
  type onmessage = Dom.messageEvent -> unit
  type onmessageerror = Dom.messageEvent -> unit
  type onoffline = Dom.event -> unit
  type ononline = Dom.event -> unit
  type onpagehide = Dom.pageTransitionEvent -> unit
  type onpagereveal = Dom.event -> unit
  type onpageshow = Dom.pageTransitionEvent -> unit
  type onpageswap = Dom.event -> unit
  type onpopstate = Dom.popStateEvent -> unit
  type onrejectionhandled = Dom.event -> unit
  type onstorage = Dom.storageEvent -> unit
  type onunhandledrejection = Dom.event -> unit
  type onunload = Dom.event -> unit
  type opacity = string
  type overflow = string
  type pathLength = string
  type pointer_events = string
  type preserveAspectRatio = string
  type requiredExtensions = string
  type requiredFeatures = string
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
  type systemLanguage = string
  type text_anchor = string
  type text_decoration = string
  type text_rendering = string
  type unicode_bidi = string
  type version = string
  type viewBox = string
  type visibility = string
  type width = string
  type word_spacing = string
  type writing_mode = string
  type x = string
  type xmlns = string
  type y = string
  type zoomAndPan = [ `disable | `magnify ]
  type 'r check =
    ?alignment_baseline:alignment_baseline Check.value ->
    ?baseProfile:baseProfile Check.value ->
    ?baseline_shift:baseline_shift Check.value ->
    ?clip:clip Check.value ->
    ?clip_path:clip_path Check.value ->
    ?clip_rule:clip_rule Check.value ->
    ?color:color Check.value ->
    ?color_interpolation:color_interpolation Check.value ->
    ?color_interpolation_filters:color_interpolation_filters Check.value ->
    ?color_profile:color_profile Check.value ->
    ?color_rendering:color_rendering Check.value ->
    ?contentScriptType:contentScriptType Check.value ->
    ?contentStyleType:contentStyleType Check.value ->
    ?cursor:cursor Check.value ->
    ?direction:direction Check.value ->
    ?display:display Check.value ->
    ?dominant_baseline:dominant_baseline Check.value ->
    ?enable_background:enable_background Check.value ->
    ?externalResourcesRequired:externalResourcesRequired Check.value ->
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
    ?onAfterPrint:onAfterPrint ->
    ?onBeforePrint:onBeforePrint ->
    ?onBeforeUnload:onBeforeUnload ->
    ?onGamepadConnected:onGamepadConnected ->
    ?onGamepadDisconnected:onGamepadDisconnected ->
    ?onHashchange:onHashchange ->
    ?onLanguageChange:onLanguageChange ->
    ?onMessage:onMessage ->
    ?onMessageError:onMessageError ->
    ?onOffline:onOffline ->
    ?onOnline:onOnline ->
    ?onPageHide:onPageHide ->
    ?onPageReveal:onPageReveal ->
    ?onPageShow:onPageShow ->
    ?onPageSwap:onPageSwap ->
    ?onPopstate:onPopstate ->
    ?onRejectionHandled:onRejectionHandled ->
    ?onStorage:onStorage ->
    ?onUnhandledRejection:onUnhandledRejection ->
    ?onUnload:onUnload ->
    ?onafterprint:onafterprint ->
    ?onbeforeprint:onbeforeprint ->
    ?onbeforeunload:onbeforeunload ->
    ?ongamepadconnected:ongamepadconnected ->
    ?ongamepaddisconnected:ongamepaddisconnected ->
    ?onhashchange:onhashchange ->
    ?onlanguagechange:onlanguagechange ->
    ?onmessage:onmessage ->
    ?onmessageerror:onmessageerror ->
    ?onoffline:onoffline ->
    ?ononline:ononline ->
    ?onpagehide:onpagehide ->
    ?onpagereveal:onpagereveal ->
    ?onpageshow:onpageshow ->
    ?onpageswap:onpageswap ->
    ?onpopstate:onpopstate ->
    ?onrejectionhandled:onrejectionhandled ->
    ?onstorage:onstorage ->
    ?onunhandledrejection:onunhandledrejection ->
    ?onunload:onunload ->
    ?opacity:opacity Check.value ->
    ?overflow:overflow Check.value ->
    ?pathLength:pathLength Check.value ->
    ?pointer_events:pointer_events Check.value ->
    ?preserveAspectRatio:preserveAspectRatio Check.value ->
    ?requiredExtensions:requiredExtensions Check.value ->
    ?requiredFeatures:requiredFeatures Check.value ->
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
    ?systemLanguage:systemLanguage Check.value ->
    ?text_anchor:text_anchor Check.value ->
    ?text_decoration:text_decoration Check.value ->
    ?text_rendering:text_rendering Check.value ->
    ?unicode_bidi:unicode_bidi Check.value ->
    ?version:version Check.value ->
    ?viewBox:viewBox Check.value ->
    ?visibility:visibility Check.value ->
    ?width:width Check.value ->
    ?word_spacing:word_spacing Check.value ->
    ?writing_mode:writing_mode Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    ?zoomAndPan:zoomAndPan Check.value ->
    'r dom_check
end

module type SwitchSVGAttributes = sig
  include Dom_attributes
  type externalResourcesRequired = bool
  type lang = string
  type requiredExtensions = string
  type requiredFeatures = string
  type systemLanguage = string
  type transform = string
  type xmlns = string
  type 'r check =
    ?externalResourcesRequired:externalResourcesRequired Check.value ->
    ?lang:lang Check.value ->
    ?requiredExtensions:requiredExtensions Check.value ->
    ?requiredFeatures:requiredFeatures Check.value ->
    ?systemLanguage:systemLanguage Check.value ->
    ?transform:transform Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type SymbolSVGAttributes = sig
  include Dom_attributes
  type externalResourcesRequired = bool
  type height = string
  type lang = string
  type preserveAspectRatio = string
  type refX = string
  type refY = string
  type viewBox = string
  type width = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?externalResourcesRequired:externalResourcesRequired Check.value ->
    ?height:height Check.value ->
    ?lang:lang Check.value ->
    ?preserveAspectRatio:preserveAspectRatio Check.value ->
    ?refX:refX Check.value ->
    ?refY:refY Check.value ->
    ?viewBox:viewBox Check.value ->
    ?width:width Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type TSpanSVGAttributes = sig
  include Dom_attributes
  type dx = string
  type dy = string
  type externalResourcesRequired = bool
  type lang = string
  type lengthAdjust = [ `spacing | `spacingAndGlyphs ]
  type requiredExtensions = string
  type requiredFeatures = string
  type rotate = string
  type systemLanguage = string
  type textLength = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?dx:dx Check.value ->
    ?dy:dy Check.value ->
    ?externalResourcesRequired:externalResourcesRequired Check.value ->
    ?lang:lang Check.value ->
    ?lengthAdjust:lengthAdjust Check.value ->
    ?requiredExtensions:requiredExtensions Check.value ->
    ?requiredFeatures:requiredFeatures Check.value ->
    ?rotate:rotate Check.value ->
    ?systemLanguage:systemLanguage Check.value ->
    ?textLength:textLength Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type TdHTMLAttributes = sig
  include Dom_attributes
  type abbr = string
  type about = string
  type accessKey = string
  type accesskey = string
  type align = [ `left | `center | `right | `justify | `char ]
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type axis = string
  type bgcolor = string
  type char = string
  type charoff = string
  type colSpan = string
  type colspan = string
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type headers = string
  type height = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
  type rowSpan = string
  type rowspan = string
  type scope = [ `row | `rowgroup | `col | `colgroup ]
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type valign = [ `baseline | `bottom | `middle | `top ]
  type vocab = string
  type width = string
  type 'r check =
    ?abbr:abbr Check.value ->
    ?about:about Check.value ->
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?align:align Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?axis:axis Check.value ->
    ?bgcolor:bgcolor Check.value ->
    ?char:char Check.value ->
    ?charoff:charoff Check.value ->
    ?colSpan:colSpan Check.value ->
    ?colspan:colspan Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?headers:headers Check.value ->
    ?height:height Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
    ?rowSpan:rowSpan Check.value ->
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
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type externalResourcesRequired = bool
  type href = string
  type lang = string
  type method_ = [ `align | `stretch ]
  type requiredExtensions = string
  type requiredFeatures = string
  type spacing = [ `auto | `exact ]
  type startOffset = string
  type systemLanguage = string
  type xmlns = string
  type 'r check =
    ?externalResourcesRequired:externalResourcesRequired Check.value ->
    ?href:href Check.value ->
    ?lang:lang Check.value ->
    ?method_:method_ Check.value ->
    ?requiredExtensions:requiredExtensions Check.value ->
    ?requiredFeatures:requiredFeatures Check.value ->
    ?spacing:spacing Check.value ->
    ?startOffset:startOffset Check.value ->
    ?systemLanguage:systemLanguage Check.value ->
    ?xmlns:xmlns Check.value ->
    'r dom_check
end

module type TextSVGAttributes = sig
  include Dom_attributes
  type dx = string
  type dy = string
  type externalResourcesRequired = bool
  type lang = string
  type lengthAdjust = [ `spacing | `spacingAndGlyphs ]
  type requiredExtensions = string
  type requiredFeatures = string
  type rotate = string
  type systemLanguage = string
  type textLength = string
  type transform = string
  type x = string
  type xmlns = string
  type y = string
  type 'r check =
    ?dx:dx Check.value ->
    ?dy:dy Check.value ->
    ?externalResourcesRequired:externalResourcesRequired Check.value ->
    ?lang:lang Check.value ->
    ?lengthAdjust:lengthAdjust Check.value ->
    ?requiredExtensions:requiredExtensions Check.value ->
    ?requiredFeatures:requiredFeatures Check.value ->
    ?rotate:rotate Check.value ->
    ?systemLanguage:systemLanguage Check.value ->
    ?textLength:textLength Check.value ->
    ?transform:transform Check.value ->
    ?x:x Check.value ->
    ?xmlns:xmlns Check.value ->
    ?y:y Check.value ->
    'r dom_check
end

module type TextareaHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocomplete = string
  type autocorrect = [ `off | `on ]
  type cols = string
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type dirname = string
  type disabled = bool
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type form = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type maxLength = string
  type maxlength = string
  type minLength = string
  type minlength = string
  type name = string
  type part = string
  type placeholder = string
  type popover = string
  type prefix = string
  type property = string
  type readOnly = bool
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocomplete:autocomplete Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?cols:cols Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?dirname:dirname Check.value ->
    ?disabled:disabled Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?form:form Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?maxLength:maxLength Check.value ->
    ?maxlength:maxlength Check.value ->
    ?minLength:minLength Check.value ->
    ?minlength:minlength Check.value ->
    ?name:name Check.value ->
    ?part:part Check.value ->
    ?placeholder:placeholder Check.value ->
    ?popover:popover Check.value ->
    ?prefix:prefix Check.value ->
    ?property:property Check.value ->
    ?readOnly:readOnly Check.value ->
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
  type accessKey = string
  type accesskey = string
  type align = [ `left | `center | `right | `justify | `char ]
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type axis = string
  type bgcolor = string
  type char = string
  type charoff = string
  type colSpan = string
  type colspan = string
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type headers = string
  type height = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
  type rowSpan = string
  type rowspan = string
  type scope = [ `row | `rowgroup | `col | `colgroup ]
  type spellcheck = bool
  type title = string
  type translate = [ `yes | `no ]
  type typeof = string
  type valign = [ `baseline | `bottom | `middle | `top ]
  type vocab = string
  type width = string
  type 'r check =
    ?abbr:abbr Check.value ->
    ?about:about Check.value ->
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?align:align Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?axis:axis Check.value ->
    ?bgcolor:bgcolor Check.value ->
    ?char:char Check.value ->
    ?charoff:charoff Check.value ->
    ?colSpan:colSpan Check.value ->
    ?colspan:colspan Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?headers:headers Check.value ->
    ?height:height Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
    ?rowSpan:rowSpan Check.value ->
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
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dateTime = string
  type datetime = string
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dateTime:dateTime Check.value ->
    ?datetime:datetime Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type default = bool
  type dir = [ `ltr | `rtl | `auto ]
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type kind = string
  type label = string
  type lang = string
  type mediaGroup = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?default:default Check.value ->
    ?dir:dir Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?kind:kind Check.value ->
    ?label:label Check.value ->
    ?lang:lang Check.value ->
    ?mediaGroup:mediaGroup Check.value ->
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
  type externalResourcesRequired = bool
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
  type pathLength = string
  type pointer_events = string
  type requiredExtensions = string
  type requiredFeatures = string
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
  type systemLanguage = string
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
    ?externalResourcesRequired:externalResourcesRequired Check.value ->
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
    ?pathLength:pathLength Check.value ->
    ?pointer_events:pointer_events Check.value ->
    ?requiredExtensions:requiredExtensions Check.value ->
    ?requiredFeatures:requiredFeatures Check.value ->
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
    ?systemLanguage:systemLanguage Check.value ->
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
  type accessKey = string
  type accesskey = string
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type autoplay = bool
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type controls = bool
  type controlslist = string
  type crossOrigin = string
  type crossorigin = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type disablepictureinpicture = bool
  type disableremoteplayback = bool
  type draggable = bool
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type height = string
  type hidden = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
  type itemid = string
  type itemprop = string
  type itemref = string
  type itemscope = bool
  type itemtype = string
  type lang = string
  type loop = bool
  type mediaGroup = string
  type mediagroup = string
  type muted = bool
  type onEncrypted = Dom.event -> unit
  type onEnterPictureInPicture = Dom.event -> unit
  type onLeavePictureInPicture = Dom.event -> unit
  type onWaitingForKey = Dom.event -> unit
  type onencrypted = Dom.event -> unit
  type onenterpictureinpicture = Dom.event -> unit
  type onleavepictureinpicture = Dom.event -> unit
  type onwaitingforkey = Dom.event -> unit
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?autoplay:autoplay Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?controls:controls Check.value ->
    ?controlslist:controlslist Check.value ->
    ?crossOrigin:crossOrigin Check.value ->
    ?crossorigin:crossorigin Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?disablepictureinpicture:disablepictureinpicture Check.value ->
    ?disableremoteplayback:disableremoteplayback Check.value ->
    ?draggable:draggable Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?height:height Check.value ->
    ?hidden:hidden Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
    ?itemid:itemid Check.value ->
    ?itemprop:itemprop Check.value ->
    ?itemref:itemref Check.value ->
    ?itemscope:itemscope Check.value ->
    ?itemtype:itemtype Check.value ->
    ?lang:lang Check.value ->
    ?loop:loop Check.value ->
    ?mediaGroup:mediaGroup Check.value ->
    ?mediagroup:mediagroup Check.value ->
    ?muted:muted Check.value ->
    ?onEncrypted:onEncrypted ->
    ?onEnterPictureInPicture:onEnterPictureInPicture ->
    ?onLeavePictureInPicture:onLeavePictureInPicture ->
    ?onWaitingForKey:onWaitingForKey ->
    ?onencrypted:onencrypted ->
    ?onenterpictureinpicture:onenterpictureinpicture ->
    ?onleavepictureinpicture:onleavepictureinpicture ->
    ?onwaitingforkey:onwaitingforkey ->
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
  type externalResourcesRequired = bool
  type lang = string
  type preserveAspectRatio = string
  type viewBox = string
  type viewTarget = string
  type xmlns = string
  type zoomAndPan = [ `disable | `magnify ]
  type 'r check =
    ?externalResourcesRequired:externalResourcesRequired Check.value ->
    ?lang:lang Check.value ->
    ?preserveAspectRatio:preserveAspectRatio Check.value ->
    ?viewBox:viewBox Check.value ->
    ?viewTarget:viewTarget Check.value ->
    ?xmlns:xmlns Check.value ->
    ?zoomAndPan:zoomAndPan Check.value ->
    'r dom_check
end

module type WebViewHTMLAttributes = sig
  include Dom_attributes
  type about = string
  type accessKey = string
  type accesskey = string
  type allowfullscreen = bool
  type allowpopups = bool
  type autoCapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocapitalize = [ `none | `off | `on | `sentences | `words | `characters ]
  type autocorrect = [ `off | `on ]
  type autosize = bool
  type blinkfeatures = string
  type contentEditable = string
  type contenteditable = string
  type contextMenu = string
  type contextmenu = string
  type datatype = string
  type dir = [ `ltr | `rtl | `auto ]
  type disableblinkfeatures = string
  type disableguestresize = bool
  type disablewebsecurity = bool
  type draggable = bool
  type enableblinkfeatures = string
  type enterkeyhint = string
  type exportParts = string
  type exportparts = string
  type guestinstance = string
  type hidden = string
  type httpreferrer = string
  type inert = bool
  type innerText = string
  type inputMode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type inputmode = [ `none | `text | `search | `decimal | `email | `numeric | `tel | `url ]
  type is = string
  type itemId = string
  type itemProp = string
  type itemRef = string
  type itemScope = bool
  type itemType = string
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
    ?accessKey:accessKey Check.value ->
    ?accesskey:accesskey Check.value ->
    ?allowfullscreen:allowfullscreen Check.value ->
    ?allowpopups:allowpopups Check.value ->
    ?autoCapitalize:autoCapitalize Check.value ->
    ?autocapitalize:autocapitalize Check.value ->
    ?autocorrect:autocorrect Check.value ->
    ?autosize:autosize Check.value ->
    ?blinkfeatures:blinkfeatures Check.value ->
    ?contentEditable:contentEditable Check.value ->
    ?contenteditable:contenteditable Check.value ->
    ?contextMenu:contextMenu Check.value ->
    ?contextmenu:contextmenu Check.value ->
    ?datatype:datatype Check.value ->
    ?dir:dir Check.value ->
    ?disableblinkfeatures:disableblinkfeatures Check.value ->
    ?disableguestresize:disableguestresize Check.value ->
    ?disablewebsecurity:disablewebsecurity Check.value ->
    ?draggable:draggable Check.value ->
    ?enableblinkfeatures:enableblinkfeatures Check.value ->
    ?enterkeyhint:enterkeyhint Check.value ->
    ?exportParts:exportParts Check.value ->
    ?exportparts:exportparts Check.value ->
    ?guestinstance:guestinstance Check.value ->
    ?hidden:hidden Check.value ->
    ?httpreferrer:httpreferrer Check.value ->
    ?inert:inert Check.value ->
    ?innerText:innerText Check.value ->
    ?inputMode:inputMode Check.value ->
    ?inputmode:inputmode Check.value ->
    ?is:is Check.value ->
    ?itemId:itemId Check.value ->
    ?itemProp:itemProp Check.value ->
    ?itemRef:itemRef Check.value ->
    ?itemScope:itemScope Check.value ->
    ?itemType:itemType Check.value ->
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
