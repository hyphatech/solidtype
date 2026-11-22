# Coverage

Which of HeroUI's components solidtype has ported.

Each of HeroUI's components, and what its port does. Each component's page
shows it beside the same component in React.

| Component | Status |
|---|---|
| [Accordion](accordion.md) | ported: one or several expanded, controlled or kept, disabled with an item's own, surface, no separator, its own icon, a button given its slot, panels animated by their height and found by find in page, focus moved by the arrows, a trigger's own `on_press` and `is_disabled` |
| [Alert](alert.md) | ported: statuses and their icons, indicator, title, description, as a surface |
| [AlertDialog](alert-dialog.md) | ported: as Modal, its dialog an `alertdialog` that only its buttons close unless its backdrop says otherwise; statuses and their icons, placements, sizes, a custom portal container |
| [Autocomplete](autocomplete.md) | ported: one or many chosen, controlled or kept, its search a SearchField filtering its ListBox, a filter given, its search's text controlled, an empty state, open controlled or kept, empty collection, clear button, variants, full width, disabled, disabled options, sections, label, description and error, a form's errors; a value drawn as tags not yet |
| [Avatar](avatar.md) | ported: sizes, colors, variants, image once loaded, fallback |
| [AvatarGroup](avatar-group.md) | ported: sizes, colors, variants, max and its count, grid, overlaps |
| [Badge](badge.md) | ported: colors, placements, sizes, variants, anchor, label |
| [Breadcrumbs](breadcrumbs.md) | ported: the last item the page, prerendered so too, disabled whole or an item at a time, a separator of its own, an item's press told by its id |
| [Button](button.md) | ported: variants, sizes, full width, icon only, disabled |
| [ButtonGroup](button-group.md) | ported: variants, sizes, orientations, full width, disabled, separator |
| [Calendar](calendar.md) | ported: one date or several, controlled or kept, the focused date controlled or kept, in the locale's order, first day and calendar; moved through by the keys and paged by its buttons, a page or a unit at a time; a month, weeks or days shown, several months side by side, a fixed number of weeks; min and max and unavailable days, disabled, read-only, invalid; its year picker; cell indicators, custom navigation icons |
| [Card](card.md) | ported: variants, header, title, description, content, footer, as a surface |
| [Checkbox](checkbox.md) | ported: variants, selected, indeterminate, disabled, invalid, interaction state |
| [CheckboxGroup](checkbox-group.md) | ported: values controlled or kept, variants, disabled, invalid, read-only, required, its label and descriptions |
| [Chip](chip.md) | ported: colors, sizes, variants, label |
| [CloseButton](close-button.md) | ported: icon or custom children, disabled, interaction state |
| [ColorArea](color-area.md) | ported: value controlled or kept, colour space and channels, dots, disabled, dragged or stepped by the keys, its thumb's colour and state |
| [ColorField](color-field.md) | ported: a hex typed and committed as React Aria commits it, or one channel in a colour space, stepped by the keys and the wheel; value controlled or kept, variants, full width, prefix and suffix, required, invalid, disabled, read-only, label, description and error, a form's field |
| [ColorPicker](color-picker.md) | ported: one colour shared by the colour components inside it, controlled or kept, each given its own value where it says so; its trigger, a button given as its trigger; its popover's placements, offset and flip, open controlled or kept, focus kept inside and given back, enter and exit animations |
| [ColorSlider](color-slider.md) | ported: a channel's range, over a checkerboard, its ends capped; horizontal or vertical, value controlled or kept, a channel corrected to its space, disabled, paged by the channel's page, a form's field |
| [ColorSwatch](color-swatch.md) | ported: sizes, shapes, a colour less than opaque over a checkerboard, its name given or Kobalte's, style |
| [ColorSwatchPicker](color-swatch-picker.md) | ported: a palette chosen from by a press or the keys, in a grid by where each swatch is or a stack, value controlled or kept, sizes, variants, layouts, disabled swatches, the checkmark or an indicator given, black over a light colour |
| [ComboBox](combo-box.md) | ported: one or many chosen, controlled or kept, its text controlled or kept, filtered as typed or by a filter given, opened by focus, typing or only its trigger, custom values, its list a ListBox, sections, disabled options, its value listed, variants, full width, disabled, read-only, label, description and error, a form sent its ids or its text, its list's empty state while nothing matches |
| [DateField](date-field.md) | ported: a date, a date with a time and one in a zone, each given back as its kind, in the reader's locale's order and calendar; typed, stepped by the keys, erased, a date that is none made one as focus leaves; value controlled or kept, placeholder, granularity, hour cycle, leading zeros, its zone shown or hidden, min and max and unavailable days, variants, full width, prefix and suffix, disabled, read-only, required, invalid, label, description and error, a form sent its value whole |
| [DatePicker](date-picker.md) | ported: a date field whose trigger opens a calendar in a popover, of a date, a date with a time or one in a zone, the time kept as a day is chosen and drawn in the popover from its state; controlled or kept, open controlled or kept, closed on a day chosen unless not; disabled, read-only, required, invalid and validated in a form; a custom indicator, render functions, international calendars |
| [DateRangePicker](date-range-picker.md) | ported: a date field's group of a start and an end, whose trigger opens a range calendar in a popover, of dates, dates with times or ones in a zone, the times kept and drawn in the popover from its state; a range told once both ends are there, invalid with its end before its start; controlled or kept, open controlled or kept; disabled, read-only, required, invalid and validated in a form, each end sent by its name; a custom indicator, render functions, international calendars |
| [Description](description.md) | ported: standalone, and a radio group's, a radio's or a text field's |
| [Disclosure](disclosure.md) | ported: expanded controlled or kept, disabled, its own trigger or a button given its slot, indicator, content animated by its height and found by find in page |
| [DisclosureGroup](disclosure-group.md) | ported: one or several expanded, controlled or kept, disabled with a disclosure's own, navigation by previous and next |
| [Drawer](drawer.md) | ported: as Modal, sliding in from any edge, its handle, dragged toward its edge to close; backdrop variants, dismissable or not |
| [Dropdown](dropdown.md) | ported: on a button or a trigger of its own, or a long press; actions, a selection of one or many in the menu or a section, indicators, sections and headers, descriptions, keyboard shortcuts, separators, submenus, disabled items, placements, open controlled or kept, enter and exit animations |
| [EmptyState](empty-state.md) | ported: its text, HeroUI's or its own |
| [ErrorMessage](error-message.md) | ported: a tag group's error, describing its list |
| [InputGroup](input-group.md) | ported: prefix, suffix, input or text area, variants, full width, a text field's |
| [Kbd](kbd.md) | ported: variants, every key's symbol and name, content |
| [FieldError](field-error.md) | ported: shown while its text field is invalid, a form's server error in place of its own |
| [Fieldset](fieldset.md) | ported: legend, group, actions, and its disabled state given to buttons, links and radio groups |
| [Form](form.md) | ported: a submit refused while a field is invalid, the first focused, server errors by name, `on_invalid` told of a refused submit and able to keep the focus where it is |
| [Input](input.md) | ported: variants, full width, alone or a text field's, interaction state |
| [Label](label.md) | ported: required, disabled, invalid; inline in a control's content, a radio group's, a text field's |
| [Link](link.md) | ported: icon, disabled, interaction state |
| [ListBox](list-box.md) | ported: a selection of one or many, controlled or kept, actions, disabled options, sections and headers, descriptions, separators, variants, indicators of its own, virtualized by a `Virtualizer` |
| [Meter](meter.md) | ported: value within a range, colors, sizes, output, format options |
| [Modal](modal.md) | ported: on a button or a trigger of its own, or a backdrop alone and controlled; backdrop variants, dismissable or not by a press or Escape; placements, sizes, scroll inside or outside; header, icon, heading, body, footer, close trigger and `` slot=`close ``; focus kept inside and given back, the page hidden from a reader and kept from scrolling, enter and exit animations, a custom portal container |
| [NumberField](number-field.md) | ported: value controlled or kept, step and range snapped, stepped by the wheel, variants, disabled, invalid, read-only, its label, description and error, format options |
| [Pagination](pagination.md) | ported: sizes, summary, pages, previous and next, ellipsis, disabled, custom icons; its page kept by the application, as in HeroUI |
| [Popover](popover.md) | ported: on a button or a trigger of its own, dialog and heading, placements, arrow, offset, flip, open controlled or kept, focus kept inside and given back, the page hidden from a reader while open, enter and exit animations |
| [ProgressBar](progress-bar.md) | ported: value within a range, indeterminate, colors, sizes, output, format options |
| [ProgressCircle](progress-circle.md) | ported: value within a range, indeterminate, colors, sizes, format options, a circle of any size its arc measured on its own radius |
| [Radio Group](radio-group.md) | ported: variants, orientations, controlled, disabled, invalid, descriptions, interaction state |
| [RangeCalendar](range-calendar.md) | ported: a range begun by a press or Enter and shown to the day hovered or focused, ended by a second; chosen by a drag, an end moved by one; let go by Escape, and ended as `commit_behavior` says; reaching no further than an unavailable day unless non-contiguous, its predicate given the range's anchor; controlled or kept, min and max, disabled, read-only, invalid; weeks or days shown, several months side by side; its year picker; cell indicators |
| [ScrollShadow](scroll-shadow.md) | ported: orientations, sizes, offset, visibility given or measured, hidden scrollbar |
| [SearchField](search-field.md) | ported: query controlled or kept, cleared by Escape or its button, submitted by Enter, variants, disabled, invalid |
| [Select](select.md) | ported: one or many chosen, controlled or kept, its list a ListBox, placeholder, value drawn as the option or by a function, clear button and Backspace, variants, full width, disabled, disabled options, sections, open controlled or kept, label, description and error, a form's errors; required, its error the application's to show, as a text field's |
| [Separator](separator.md) | ported: orientations, variants |
| [Skeleton](skeleton.md) | ported: animation types, and the page's `--skeleton-animation` |
| [Slider](slider.md) | ported: one value or a range, controlled or kept, step and range, vertical, disabled, output, format options |
| [Spinner](spinner.md) | ported: colors, sizes, its icon's gradients unique per spinner |
| [Surface](surface.md) | ported: variants, and the variant it gives what is inside it |
| [Switch](switch.md) | ported: sizes, selected, disabled, invalid, interaction state, with HeroUI's Label |
| [SwitchGroup](switch.md#group) | ported: orientations |
| [Table](table.md) | ported: variants, static rows or rows of data, columns of data, row headers, an empty state, a footer, rows and cells moved through by the keys, rows selected one or many, by a press, the keys or a checkbox, all by the header's, disabled rows, sorted by a column pressed or keyed, its sortable header's chevron, more rows loaded as its end scrolls into view, columns resized by a drag or the keys, columns pinned to either side, a header kept in view, rows reordered by a drag or the keys, rows that hold rows expanded by a chevron or the keys, virtualized, only the rows in view drawn; a tree virtualized not yet |
| [Tabs](tabs.md) | ported: selection controlled or kept, horizontal or vertical, primary or secondary, aligned, disabled, manual activation, separators, an indicator that slides between tabs, a list that scrolls by its chevrons, a tab as a link, `href` |
| [TagGroup](tag-group.md) | ported: tags chosen none, one or many, by a press or the keys, selection controlled or kept, disabled tags by their own or the group's keys, the group disabled, removed by their buttons or Delete and Backspace with the focus moved on, a remove button of one's own, render props, an empty state, sizes, variants, label, description and error |
| [TextArea](text-area.md) | ported: variants, full width, alone or a text field's, interaction state |
| [TextField](text-field.md) | ported: value controlled or kept, required, disabled, invalid, read-only, its label, description and error; invalid as `is_invalid` says, with no `validate` of its own |
| [TimeField](time-field.md) | ported: value controlled or kept, granularity, hour cycle and leading zeros by the locale, min and max, variants, full width, disabled, invalid, read-only, required, prefix and suffix, its label, description and error; a time on a date and a time in a zone, its zone shown or hidden, a form sent its value whole |
| [Toast](toast.md) | ported: provider, placements, the stack collapsed and expanded, its hotkey, variants, indicators, action, loading, custom rendering, queues of its own, update, promise, pause and resume |
| [ToggleButton](toggle-button.md) | ported: variants, sizes, icon only, selected controlled or kept, disabled, interaction state |
| [ToggleButtonGroup](toggle-button-group.md) | ported: single or multiple selection controlled or kept, empty selection disallowed, sizes, orientations, detached, full width, disabled with a button's own override, separator |
| [Tooltip](tooltip.md) | ported: on a button or a trigger of its own, placements, arrow, offset, flip, delays of its own or the page's, hover or focus, disabled, open controlled or kept, enter and exit animations |
| [Typography](typography.md) | ported: every type and its element, alignments, colors, weights, truncation, primitives, prose |

## Not yet ported

These 2 components of HeroUI 3.2 are not ported yet; each name links to
HeroUI's own page. What a ported component does not do yet is in its row
above and on its page.

| Group | Components |
|---|---|
| Not yet ported | [InputOTP](https://heroui.com/en/docs/react/components/input-otp), [Toolbar](https://heroui.com/en/docs/react/components/toolbar) |

## Beyond HeroUI's set

Widgets most kits have, in HeroUI's look. Each has a stylesheet of its own,
imported as [Theming](theming.md#setup) shows.

| Component | Status |
|---|---|
| [Command](command.md) | made: a search that filters a menu of commands in a dialog, kept or controlled, by its text or a filter given, the focus kept in the search while the keys move through the commands shown, groups, separators, an empty state, a header and a footer, sizes, backdrops |
| [Data Grid](data-grid.md) | made: rows as data and columns as definitions, sorted in the browser by text in the page's order or a comparison, or by the application, selection checkboxes, columns resized, pinned to either side and aligned, a header kept in view, rows dragged by a handle and the keys, cells of any control, an empty state, loading more, virtualized, a footer |
| [NumberStepper](number-stepper.md) | made: a number field's value, range, step, format and keys, sizes, a value that rolls, a custom value, custom icons and buttons, reversed, disabled |
| [Segment](segment.md) | made: one option always selected, controlled or kept, default and ghost, sizes, disabled whole or by option, separators, icons, options that show their label only while selected, an indicator that slides between options |
| [TextShimmer](text-shimmer.md) | made: its text's colour, still under reduced motion |
| [TrendChip](trend-chip.md) | made: trends, sizes, variants, prefix and suffix, a custom indicator, tabular figures |
