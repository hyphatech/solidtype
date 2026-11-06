# Changes

## Unreleased

- Every HeroUI port's part that draws an element takes `as_`, HeroUI's `render`:
  a function of the part's props and, where the part has a state record, its
  state, which draws what takes the part's place, `<Button as_=(fun p s -> ...)>`.
  A part given none draws its element as before. Kobalte's parts and those of
  `solidtype-headless` take it too, a function of their props.

- `Segment.Item`'s wrapping element has its look in `segment.css`,
  `.segment__item-control`, where it wrote a utility.

- `let%component ... [@@element button]` gives the component `as_`, and
  `Html.Button.props` is what its function is given; `Dynamic.Drawn` is an
  element drawn by a tag or a function, `Jsx.drawn_as`.

- `Solidtype_heroui.Theme.use`, HeroUI's `useTheme`: the chosen theme, the one
  shown, and a setter that writes `<html>`'s class and `data-theme` and keeps
  the choice under `heroui-theme`.

- A toast closed under `data-reduce-motion="true"` is gone at once, as it is
  under `prefers-reduced-motion`, where it stayed for an exit that HeroUI's
  styles do not play.

- Every HeroUI port's part that HeroUI gives a render function takes its
  children as a function of its state, a record named as HeroUI's render
  props are: `<Button>(fun s -> ... S.get s.is_pressed ...)</Button>`. The
  close triggers and Toast's close button take children too, HeroUI's cross
  where they are given none. Breaking: `Select.Value`, `Combo_box.Value` and
  `Autocomplete.Value` give their function a record, `s.selected_keys` and
  `s.selected_text`, in place of the keys alone.

- A slider's, a colour slider's and a colour area's thumb is dragged only
  while a pointer holds it, as React Aria's is: Enter or Space held marked it
  `data-dragging`, and a released drag could leave it so.

- `Link` takes `aria_current` and writes `data-current`, as React Aria's
  does.

- `Jsx.of_content` gives content where an element is taken, and
  `Jsx.is_function` tells children that are a function of state.

- A component may take children of either kind, elements or a function of
  its state, `~(children : state Jsx.children)`, and draws them with
  `Jsx.draw`.

- A function child reads a record's fields by name, `s.is_on`, though the
  record's module is not open, and a prop's type error points at the
  caller's own expression rather than a name the ppx made.

- A component given its element, `let%component ... [@@element button]`,
  takes that element's attributes after its own props and passes them on,
  its own props taking the place of the element's of the same name.

- Every HeroUI port's part that draws an element takes every attribute of
  that element, `style`, `title`, handlers and `ref` among them, and passes
  it on, as HeroUI's parts do. A handler or `ref` given is called beside the
  part's own, and a `style` written after the part's; what the part's
  behaviour rests on, Kobalte's `on_change` or the id a trigger names, stays
  the part's.

- A `Form` refusing a submit focuses an invalid time field's first segment
  and an autocomplete's button, which it left unfocused before.

- An expanded disclosure's or accordion's panel keeps its size as a style
  given it changes, and a part's state no longer listens twice to an element
  Kobalte hands its ref again.

- `Input` and `Text_area` inside a field show the `title` they are given, in
  place of the empty one React Aria gives a field's input.

- A `let%component` prop may be read by a name of the body's own,
  `?ref:(given : ...)`; before, the body read it by its label whatever the
  pattern named.

- `Segment`, `Trend_chip` and `Text_shimmer` have their look in stylesheets
  of their own, `segment.css`, `trend-chip.css` and `text-shimmer.css`,
  which `solidtype-heroui` ships beside its JavaScript; a rule for a part's
  class restyles it, as it does any other port. Breaking: an application
  imports the three into its `components` layer, as the Theming page shows,
  in place of the `@source` of the compiled library.

## 0.5.0 (2026-11-02)

- `Solidtype_heroui.Text_shimmer`, a clean reimplementation of HeroUI Pro's
  TextShimmer.

- `Solidtype_heroui.Trend_chip`, a clean reimplementation of HeroUI Pro's
  TrendChip.

- `Solidtype_heroui.Segment`, a clean reimplementation of HeroUI Pro's
  segmented control. Its classes are Tailwind utilities, so an application's
  Tailwind needs an `@source` of the compiled `solidtype-heroui`.

- `Solidtype_heroui.Styles.cn`, HeroUI's merge of class strings, the one its
  variant functions merge a `class` by.

- `Solidtype_heroui.Autocomplete`'s button is described only by a
  description it has, where it named one it lacked.

- `Solidtype_heroui.Checkbox_group` is named by its label and described by its
  description in a page rendered on the server, and once it hydrates, where it
  wrote neither, since it made its element before its label.

- `Solidtype_heroui.List_box`, and the list of `Select`, `Combo_box` and
  `Autocomplete`, write `data-layout="stack"` and `data-orientation="vertical"`
  as React Aria's list does, for a style that reads them.

- `Solidtype_heroui.Color_swatch_picker`, HeroUI's ColorSwatchPicker: a palette
  of swatches, one chosen by a press, Space or Enter, value controlled or kept
  and told as a colour, its sizes, variants and layouts, disabled swatches,
  and HeroUI's checkmark, black over a light colour, or an indicator given.
  HeroUI's examples. `Solidtype_headless.Color_swatch_picker` beneath it,
  which Kobalte lacks, made of Kobalte's list hooks: a listbox of options each
  named by its swatch, walked in a grid by where each option is, Left and Right
  as the page's direction reads them, or in a stack by Up and Down, a disabled
  option passed over, and reached by typing a colour's name.

- `Solidtype_heroui.Number_field` takes `is_wheel_disabled`, HeroUI's
  `isWheelDisabled`; and its wheel, and `Color_field`'s on a channel, turn as
  React Aria's: down steps up, and a field read-only, a turn mostly sideways
  and one with Control held step nothing, where Kobalte's turned the other way
  and stepped on each. `Solidtype_headless.Number_field`, Kobalte's fixed so,
  beneath it; `Solidtype_headless.Color_channel_field`'s wheel is its.

- `Solidtype_heroui.Color_field`, HeroUI's ColorField on Kobalte's: a hex
  typed and committed as React Aria commits it, on blur and by Enter, or one
  channel of a colour in a colour space; stepped by the arrow keys, Page Up and
  Page Down, Home and End, and the wheel unless `is_wheel_disabled`; value
  controlled or kept, the group's variants, full width, a prefix and a suffix,
  required, invalid, disabled, read-only, its label, description and error, a
  form's field. HeroUI's examples. `Solidtype_headless.Color_field` beneath
  it, Kobalte's fixed: its value a colour, told once committed and only where
  it changed, Enter committing, and the keys and the wheel stepping its hex;
  and `Solidtype_headless.Color_channel_field`, its input's `aria-valuenow`
  the channel's number and `on_change` told only a change.

- `Solidtype_heroui.Color_slider`, HeroUI's ColorSlider on Kobalte's: one
  channel of a colour along a track of its range, over a checkerboard, its ends
  capped, horizontal or vertical, value controlled or kept, a channel asked of
  a space without it corrected as HeroUI corrects it. HeroUI's examples.
  `Solidtype_headless.Color_slider` beneath it, Kobalte's fixed: paged by the
  colour's page, its value told with the colour's name in lower case,
  `on_change` told only a change, and no `pagesize` attribute on its element.

- A `Solidtype_heroui.Table`, and a `Solidtype_headless.Table`, inside a
  `Virtualizer` given `Virtualizer.table_layout`, HeroUI's `TableLayout`, draws
  only the rows in view and a third more, the focused row wherever it is, each
  part a `<div>` placed as React Aria's TableLayout places it, the header kept
  over the rows; the keys reach every row, scrolled into view below the
  header. HeroUI's Virtualization example. A table's columns are laid out from
  their sizes as they are made, so a prerendered page lays a resizable table
  out as the browser does.

- `Solidtype_headless.Virtualizer`, React Aria's Virtualizer, behaviour alone:
  what `Solidtype_heroui.Virtualizer` was, which is now it, unchanged.

- `Solidtype_heroui.Table`'s expandable rows, HeroUI's: given `tree_column`,
  the table is a tree grid whose rows hold the rows written inside them, drawn
  while `expanded_keys`, or `default_expanded_keys`, say, and
  `on_expanded_change` told; a `Button` of `slot=`chevron` expands and
  collapses its row, and so do the arrow keys on it, the arrow back reaching
  the row it is in. `Table.use_row_context` and `Table.use_cell_context`, what
  HeroUI's cell's render function is given. HeroUI's Expandable Rows example.
  `Solidtype_headless.Table` beneath it, with `use_row_context` and
  `use_cell_context` for a style's attributes. `Solidtype.Jsx.Token.others`,
  the elements among a component's children a token module did not make.

- `Solidtype_heroui.Table.Resizable_container` and `Table.Column_resizer`,
  HeroUI's: the columns laid out at a fixed width, each as its `width`, or
  `default_width` until resized, asks, `Pixels`, a `Percent` or a `Fraction`,
  within `min_width` and `max_width`, as React Stately lays them out; a
  resizer dragged, or reached by Tab from its column's header and stepped by
  its keys, and `on_resize_start`, `on_resize` and `on_resize_end` told every
  column's size. HeroUI's Column Resizing example.
  `Solidtype_headless.Table.Resizable_container` and `Table.Column_resizer`
  beneath them, and `Table.context`'s `resizing_column`.

- `Solidtype_heroui.Table.Load_more` and `Table.Load_more_content`, HeroUI's:
  at the end of a table's body, more rows are asked for as it scrolls into
  view, `on_load_more`, `scroll_offset`, and while `is_loading` a row across
  every column shows its content. It never asks while loading, where React
  Aria's does and HeroUI's example guards against it. HeroUI's Async Loading
  example. `Solidtype_headless.Table.Load_more` beneath it, and
  `Solidtype_headless.Load_more_sentinel`, what asks, which
  `Solidtype_heroui.List_box.Load_more_item` now places too.

- `Solidtype_headless.Table`, and so `Solidtype_heroui.Table`: a cell given
  focus, by a press or by code, keeps it, and an arrow that reaches no cell --
  down from the last row, up from the header, past a header's ends -- moves
  nothing, as React Aria's grid does, where Kobalte's list of rows took the
  focus to a row of its own choosing.

- `Solidtype_heroui.Virtualizer`, React Aria's: around a `List_box`, alone or
  in a `Select`, a `Combo_box` or an `Autocomplete`, it draws only the entries
  in view of what scrolls the list, each placed by
  `Virtualizer.list_layout`, React Aria's `ListLayout` and its options; the
  option with the focus stays drawn, one the keys move to is scrolled into
  view, and a prerendered page holds the list's first entries.
  `Virtualizer.window`, the same placing for any collection of rows. HeroUI's
  ListBox and Autocomplete Virtualization examples.
- `Solidtype_heroui.Select`, `Combo_box` and `Autocomplete`, and a
  `List_box`: the option the keys move to is scrolled into view of a long
  list, where Kobalte, told the list is virtualized so the port may draw it,
  scrolled nothing.

- `Solidtype_heroui.Button`: `is_pending`, as React Aria's: focusable but
  pressed by nothing, its click and a trigger's reaching nothing, a submit
  button submitting nothing, `aria-disabled` and `data-pending`, and
  announced as it comes to be pending or stops while it has the focus; a
  `Spinner` inside it names it beside its `aria_label`, by
  `Solidtype_heroui.Spinner.Progress`, an id the spinner takes. `id`, which
  names it so. HeroUI's Loading and Loading State examples.

- `Solidtype_headless.Color_swatch` and `Solidtype_headless.Color_area`:
  Kobalte's, fixed, for any style to dress. A swatch and an area's thumb,
  `--kb-color-current`, write a colour less than opaque as `rgba`, where
  Kobalte's `rgb(4, 133, 247 / 0.5)` is read by no browser; a disabled area's
  thumb is out of the page's order, its inputs disabled, and its root,
  background and thumb `data-disabled`, where Kobalte's root keeps
  `disabled` from its state. `Solidtype_heroui.Color_swatch` and
  `Solidtype_heroui.Color_area` dress them.

- `Solidtype_heroui.Time_field` on a prerendered page shows one colon
  between its parts, where it showed two until it hydrated: the colon
  Kobalte's segment writes of its own is drawn inside a hidden span, on the
  server as in the browser.

- `Solidtype_headless.Table`, and so `Solidtype_heroui.Table`: a column, or
  a cell, added between two or taken away, by a `For` or a `Show`, moves
  those after it, its `aria-colindex`, its cells' column and the column that
  names each row with it, where it was numbered last and the others kept
  their numbers; a column's and a cell's `ref` is called beside the
  table's own.

- `Solidtype.Jsx.Token`: a value that stands in an element's place among a
  component's children, never rendered, read by the component that
  resolves them in their order on the page, as Solid's `Match` stands among
  a `Switch`'s.
- `Solidtype_heroui.List_box` keeps its options, sections and separators in
  their order on the page, where one added between two, by a `For` or a
  `Show`, was drawn last; and a list box on a prerendered page holds its
  options from the start.
- `Solidtype_heroui.Select` on a prerendered page shows the option it is
  given, `value` or `default_value`, once it has hydrated, where it showed its
  placeholder until an option was chosen: it takes its `List_box` once it
  is on the page, after the page has hydrated. A selection
  Kobalte tells as it was is no change, never told to `on_change`.
- `Solidtype_headless.Table` and `Solidtype_heroui.Table`: sorted by their
  columns, `sort_descriptor` and `on_sort_change` on the root,
  `allows_sorting` and `id` on a column, pressed or given Enter or Space,
  `aria-sort`; `Solidtype_headless.Table.use_column_context`, a column's
  direction; and `Solidtype_heroui.Table.Sortable_column_header`, a column's
  label and HeroUI's chevron for its direction, read from its column.
- `solidtype-headless`, a package of its own: the components Kobalte lacks,
  made as Kobalte makes its own, of its hooks, with no style, a part taking
  every attribute its element does. `Solidtype_headless.Table` first: a grid
  of rows and cells, its rows Kobalte's list, selected by it, walked by the
  keys, its state a context a style reads.
- `Solidtype_heroui.Table` is built on `Solidtype_headless.Table`, HeroUI's
  classes and React Aria's state over it; a press in any control inside a
  row, a button or a link as well as a checkbox, is the control's, never the
  row's.
- `Solidtype_heroui.Table`: rows selected, one or many, by Kobalte's list --
  a press, Space or Enter, Shift and the platform's key -- controlled or
  kept, disabled rows left out, `selection_mode`, `selection_behavior`,
  `selected_keys`, `default_selected_keys`, `on_selection_change`,
  `disabled_keys` and `disallow_empty_selection` on `Table.Content`.
- `Solidtype_heroui.Checkbox`: `slot=`selection`, the checkbox of the part
  above it, React Aria's selection slot: a table's row, or all of them in
  its header.
- `Solidtype_heroui.Table`: HeroUI's Table, its rows a list of Kobalte's
  list hooks, focused and moved between by the keys as React Aria's grid
  is, and its cells moved through by the port: every part, both variants,
  rows and columns given by data as `For`s, row headers, an empty state
  across every column, and a footer.
- `Solidtype_kobalte.Selection`: the hooks Kobalte's lists are made of,
  `create_list_state`, `create_selectable_list`, `create_selectable_item`,
  `create_selectable_collection` and `create_type_select`, for a component
  Kobalte lacks. A list's state is over the caller's own data, its props'
  type variable `'data`, read by the caller's `get_key` and
  `get_text_value`; a hook takes any element; and `SelectionManager` is a
  `MultipleSelectionManager` by `to_multiple_selection_manager`.
- Breaking: `Solidtype_kobalte.Types`' context handlers that took Solid's
  handler argument -- `ColorFieldContextValue.on_blur`, and the `on_input`
  and `on_input_key_down` of the combo box's, number field's and text
  field's -- take the plain event, `Dom.focusEvent`, `Dom.inputEvent` or
  `Dom.keyboardEvent`, as an element's handler does; the modules of the
  handler arguments are gone.
- `Solidtype_heroui.Color_area`: HeroUI's ColorArea on Kobalte's, two
  channels of a colour across and up, in any colour space, its thumb dragged
  or stepped by the keys, with dots over it or disabled; disabled in the
  port's layer, since Kobalte's area never is.
- `Solidtype_heroui.Color_swatch`: HeroUI's ColorSwatch on Kobalte's, a
  colour of Kobalte's `Types.Color` in each of HeroUI's sizes and shapes, one
  less than opaque over a checkerboard, named for a reader by Kobalte or by
  its `color_name`.
- `vite-plugin-solidtype` names `vite-plugin-solid` as a peer, beside Vite,
  since what it writes is Solid's compiler's to compile next: installing
  the plugin installs Solid's.
- Breaking: `Solidtype_heroui.Time_field` takes and gives
  @internationalized/date's `Time`, from `solidtype-internationalized-date`,
  in place of Kobalte's `Types.Time`: `value`, `default_value`,
  `placeholder_value`, `min_value`, `max_value` and `on_change`, whose numbers
  are `int`s now. `solidtype-heroui` depends on
  `solidtype-internationalized-date`.
- `Solidtype_heroui.Time_field.Date_time` and `Time_field.Zoned`: HeroUI's
  TimeField given a `CalendarDateTime` or a `ZonedDateTime`, each editing the
  time alone and giving back the value of its own kind, its date and zone
  kept; the date and zone a time typed while empty is put on is its
  `placeholder_value`, which each requires. A zoned field shows its zone's
  name, as the reader's locale writes it at the time shown, unless
  `hide_time_zone`, and moves a time its clocks skip to the one after it.
- `Solidtype_heroui.Time_field`: a form is sent its value as
  @internationalized/date writes it, `09:30:00`, and a dated or zoned value
  whole, where Kobalte's input sent a clock's text, `9:30 AM`; and a time typed
  again as it was is no change, so `on_change` is not told it.
- `Solidtype_heroui.Time_field`: one colon between an hour and a minute, and
  a minute and a second, where Kobalte's own was drawn beside it, `9 :: 30`.
- Each opam package names what its library imports from npm, at the range
  it is tested against, in `x-npm-depends`: `solidtype` Solid,
  `solidtype-kobalte` Kobalte, `solidtype-heroui` HeroUI's styles,
  `solidtype-rhp` rhp and `solidtype-internationalized-date`
  @internationalized/date. `opam show <package> --field x-npm-depends`
  prints them as `bun add` takes them.
- Breaking: `Solidtype_rhp.Plot`'s `animate` is a `Solidtype_rhp.Animate.t`,
  which also names the fields that move, as rhp's own Plot takes them:
  `Animate.all`, `Animate.groups [| "points" |]`, or `Animate.make` with
  `groups` and the timing. `Types.Either.left true` is `Animate.all`, and
  `Types.Either.right (Types.Timing.make ~duration ())` is `Animate.make
  ~duration ()`.

## 0.4.0 (2026-10-30)

- `solidtype-internationalized-date`, a package of its own:
  @internationalized/date 3.12 bound whole, generated from its declarations
  -- dates, times, date-times and zoned date-times, their calendars,
  arithmetic, time zones and formatter -- the values HeroUI's date
  components take. Its value classes are kinds of one `Types.Value.t`, so a
  function that takes several takes any of them as it is.
- `Solidtype_kobalte.Types.Color`: `to_format_opt`, `get_channel_value_opt`
  and `with_channel_value_opt`, beside the methods that raise: a method
  that throws has an `_opt`, as a function does.
- `Solidtype_heroui.Modal.Backdrop` and `Alert_dialog.Backdrop`:
  `portal_container`, React Aria's `UNSTABLE_portalContainer`, the element
  the backdrop is drawn inside instead of the page's body.
- `Solidtype_heroui.Accordion.Trigger`: `on_press`, called as it is pressed,
  by a pointer, Enter or Space, and `is_disabled`, which disables the trigger
  alone, its item's state left as it is; the arrows pass a disabled trigger by.
- `Solidtype_heroui.Tabs.Tab`: `href`, which makes the tab a link, an `<a>`
  that a press or Enter follows and never selects: the tab selected is the
  one `selected_key` names, as a router says which route is open. A disabled
  one has no `href`.
- `Solidtype_heroui.Form`: `on_invalid`, called once a submit is refused,
  with a cancelable `invalid` event on the form; preventing it keeps the
  first invalid field from being focused, for the application to move focus
  as it chooses.
- `solidtype-rhp`, a new package: rhp 2.2's reactive charts of HTML, bound
  whole, its components and functions generated from rhp's own declarations,
  and `Plot`, `Scale`, `Many_dots`, `Row`, `Slat`, `Order`, `Color`, `Ticks`,
  `Ease`, `Shape`, and `series`, `cycle`, `stack_up`, `shares` and `running`
  written in OCaml: a plot's rows are an array of an OCaml record, and its slat
  a function of that record's row.
- `ppx_solidtype`: a component's render function given by name,
  `<Plot render=fruit />`, is checked and passed as a function child is.
- The documentation's chart gallery: rhp's waterfall, pie, heatmap, Gantt
  chart and candlesticks, written in OCaml from rhp's own
  gallery code, each drawing what rhp's JSX draws, before and after it is
  pointed at or clicked.
- The documentation's Charts section, the binding of rhp: how a chart is
  made, a page for each component and for rhp's helpers, each linking to the
  page of rhp's documentation it follows.
- `vite-plugin-solidtype`: a thunk whose element holds a thunk of its own,
  `(fun () -> if open_ () then <b>(fun () -> name ())</b> else ...)`, is
  written as the expression it returns, as TSX writes it, rather than a
  function called in place: Solid's compiler then memoises its condition and
  escapes its text on the server, as it does the same JSX in TSX.
- The documentation's tabs each open with an overview at their root, what
  that part of solidtype is: Solid, its core; Kobalte, its accessible
  components, every one listed, with a slider and a dialog added to its
  examples; HeroUI, its design system, a maintained port onto Kobalte; and
  the charts, whose overview moves from `rhp/overview/` to `rhp/`.
- The documentation's Many dots example is rhp's own: twelve hundred points,
  three ways of colouring them, a point read on hover and selected by a
  click, through one handler on the collection.

## 0.3.0 (2026-10-27)

- `Solidtype_heroui.Autocomplete`: HeroUI's Autocomplete on Kobalte's combo
  box, a select whose popover filters its `List_box` by a `Search_field`, one
  or many chosen, a filter given, its search's text controlled, with HeroUI's
  clear button, variants and animations, its label, description and error,
  in a `Form` too.
- `Solidtype_heroui.Search_field` inside an `Autocomplete.Filter` is its
  search.
- `Solidtype_heroui.List_box`: `render_empty_state`, what it shows while it
  holds no option, and its children are optional.
- `Solidtype_heroui.Combo_box`: HeroUI's ComboBox on Kobalte's, an input that
  filters a `List_box` as it is typed into, one or many chosen, its text
  controlled or kept, a filter given, opened by focus, typing or its trigger,
  custom values, its chosen listed by `Combo_box.Value`, with HeroUI's
  variants and animations, its label, description and error, in a `Form`
  too, which is sent its ids or its text.
- `Solidtype_heroui.Input` inside a `Combo_box` is its input.
- `Solidtype_heroui.List_box`: an option is drawn while its holder's list
  holds it, so a combo box's filter hides it, and a section while one of its
  options is; `List_box.listing` says how an option is focused.
- `Solidtype_heroui.Select`: HeroUI's Select on Kobalte's, its list a
  `List_box`, one or many chosen, its value drawn as the option chosen or by a
  function, with HeroUI's clear button, variants and animations, its label,
  description and error, in a `Form` too.
- `Solidtype_heroui.List_box.Host`: where a part takes the list box inside it
  to draw as its own, as a select does.
- `Solidtype_heroui.List_box`: HeroUI's ListBox on Kobalte's, its options
  selected one or many at a time, or acted on, with HeroUI's indicators,
  sections and their `Header`, descriptions and separators.
- `Solidtype_heroui.Separator.Slot`: where a part above draws the
  separators inside it.
- `Solidtype_heroui.Dropdown`: HeroUI's Dropdown on Kobalte's menu, opened by
  a `Button` inside it or a `Dropdown.Trigger`, or by a long press; its
  items acted on, or selected one or many at a time in the menu or in a
  section, with HeroUI's indicators, sections and their `Header`,
  descriptions, keyboard shortcuts, separators and submenus, and HeroUI's
  enter and exit animations.
- `Solidtype_heroui.Header`: HeroUI's Header, a menu section's label.
- Breaking: `Solidtype_heroui.Button.trigger` takes `described_by`, the
  trigger's `aria-describedby`, and `element`, given the button's element
  as it is made.
- Fixed: `Solidtype_heroui.Separator` had no `data-slot`, which HeroUI's
  menus read, and was an `<hr>` where it is vertical, which React Aria's
  draws as a `<div>`; inside a menu it is a `<div>`, as React Aria's is.
- `Solidtype_heroui.Drawer`: HeroUI's Drawer on Kobalte's dialog, sliding in
  from any edge, with HeroUI's handle, and dragged toward its edge to close
  while it may be dismissed, as HeroUI's is.
- Fixed: `Solidtype_heroui.Toast` was shorter than its content, which slid
  within it as it entered, its action button small where HeroUI's is
  medium; it is measured and entered as HeroUI's is.
- Fixed: `Solidtype_heroui.Accordion`'s panels and `Disclosure`'s content
  opened the first time with no animation, as Kobalte keeps transitions
  off its content until it has opened once.
- `Solidtype_heroui.Alert_dialog`: HeroUI's AlertDialog on Kobalte's
  dialog, an `alertdialog` only its buttons close unless its backdrop says
  otherwise, with HeroUI's statuses and their icons, placements and sizes.
- `Solidtype_heroui.Modal`: HeroUI's Modal on Kobalte's dialog, opened by a
  `Button` inside it or a `Modal.Trigger`, or a `Modal.Backdrop` alone and
  controlled; HeroUI's backdrop variants, placements, sizes and scroll, its
  header, icon, heading, body, footer and close trigger, dismissed by a
  press on the backdrop or Escape unless told not to, the focus kept inside
  and given back, and HeroUI's enter and exit animations.
- `Solidtype_heroui.Button` takes `slot=`close`, which closes the dialog
  it is in, as React Aria's close slot does.
- `Solidtype_heroui.Popover`: HeroUI's Popover on Kobalte's, opened by a
  `Button` inside it or a `Popover.Trigger`, its dialog given the focus and
  named by its heading, with HeroUI's arrow, placements, offset and flip,
  the focus kept inside and given back to the trigger, and HeroUI's enter
  and exit animations.
- `Solidtype_heroui.Button.trigger` takes `pressed`, and `Button.no_trigger`
  makes the buttons inside an overlay's content buttons again: a button
  inside a tooltip's content is no longer its trigger.
- `Solidtype_heroui.Tooltip`: HeroUI's Tooltip on Kobalte's, opened by a
  `Button` inside it or a `Tooltip.Trigger` around anything else, with
  HeroUI's arrow, placements, offset and flip, delays of its own or the
  page's `--tooltip-delay`, and HeroUI's enter and exit animations.
- `Solidtype_heroui.Button.trigger` takes `is_disabled` and `controls` as
  options and `needs_slot`, so a part may give any button below it its
  trigger, as a tooltip does. Breaking for a part outside the library that
  builds one.
- `Solidtype_heroui.Pagination`: HeroUI's Pagination, its parts HeroUI's and
  its buttons Kobalte's -- a summary, pages, previous and next, an ellipsis,
  in three sizes -- its page kept by the application, as in HeroUI.
- `Solidtype_heroui`'s ports show no hover, press or focus on a button
  disabled while it had one, and a hover or press held as it was disabled is
  over, as React Aria's: Next pressed onto the last page no longer shows
  focused, nor hovered once enabled again under a resting pointer.
- `Solidtype_heroui.Breadcrumbs`: HeroUI's Breadcrumbs on Kobalte's, a
  `<nav>` named for a reader around HeroUI's list, the last item the page
  itself -- marked so in a prerendered page too -- disabled whole or an item
  at a time, with HeroUI's chevron or a separator of its own between items,
  and `on_action` told the `id` of an item whose link is pressed.
- Fixed: `Solidtype_heroui.Form` showed no server error that came after its
  field was changed and left -- the answer to a submit clicked, which takes
  the focus from the field first. The names a change cleared are kept with
  the errors they were cleared from, so errors given again are shown whole;
  the effect that cleared them read the errors in a way Melange dropped, and
  never ran again.
- `Solidtype_heroui.Badge`, `Checkbox`, `Chip`, `Disclosure_group`, `Link`,
  `Radio` and `Switch` keep the `class_` they are given, after HeroUI's
  classes, where they dropped it.
- `Solidtype_heroui.Badge` takes no children, HeroUI's dot.
- `Solidtype_heroui.Checkbox` shows a `Field_error` inside it while it is
  invalid, Kobalte's error message, as HeroUI's does; it raised there.
- Breaking: `Solidtype_heroui.Number_field` keeps a value on its step's grid
  only while it is given a `step`, else within its range alone, as React
  Aria does, where it rounded 99.99 to 100; its buttons then step by 1, or
  by a hundredth for a percent. Its input tells a reader the value now as a
  number, where Kobalte's told the text it shows once the value changed.
- Breaking: `Solidtype_heroui.Time_field`'s `value` is a
  `Time.t Js.Nullable.t`, null to control it empty, as React's `null` does,
  and its `on_change` is told a `Time.t option`, `None` once every segment
  is erased; a field emptied by its owner went on showing its time.
- `Solidtype_heroui.Search_field.Clear_button` draws the children it is
  given in place of HeroUI's icon, as React's does.
- `Solidtype_heroui.Label` takes a `for_` and `Description` an `id`, as
  HeroUI's examples give them where a label names its input.
- `Solidtype_heroui.Toast.action` takes a `class_`, added after HeroUI's
  classes on the action's button, as React's `actionProps` take a
  `className`.
- `Solidtype_heroui.Tabs`: HeroUI's Tabs on Kobalte's, selection controlled
  or kept, horizontal or vertical, primary or secondary, aligned, disabled
  whole or a tab at a time, selected by focus or by Enter; each tab's
  indicator slides from the tab selected before, as React Aria's selection
  indicator does, and `Tabs.List_container` scrolls a list too long for it
  by its chevrons, fading the edges. A tab and its panel each take the `id`
  that pairs them.
- `Solidtype_heroui.Disclosure`'s content and `Accordion`'s panel take their
  sizes as React Aria's disclosure gives them, its style read between the two
  so the transition starts, where they waited a frame between.
- A component takes an attribute's namespace, `Jsx.attr`, `Jsx.bool` and
  `Jsx.named`, and passes it on to its element, as a `data_` attribute; an
  element and a component take one optional,
  `?hidden=(Jsx.attr (fun () -> o))`. A collapsed
  `Solidtype_heroui.Disclosure`'s content and `Accordion`'s panel are now
  prerendered `hidden="until-found"`, so find in page reaches them before
  the page hydrates, where Solid's server wrote a bare `hidden`.
- `Solidtype_heroui.Accordion`: HeroUI's Accordion on Kobalte's, one item
  expanded at a time or several, controlled or kept, disabled with an item's
  own, on a surface or with no separator, an item told its own change after
  the accordion's; a panel stays on the page while collapsed, found by find
  in page, and grows and shrinks as a disclosure's content does. The arrows,
  Home and End move focus between its triggers, which Kobalte's accordion
  means to and does not, since its root never tells its list it has focus.
  An indicator takes an icon of its own, in a span with HeroUI's classes.
  `Solidtype_heroui.Panel` is what an accordion's panel and a disclosure's
  content share.
- `Solidtype_heroui.Disclosure_group`: HeroUI's DisclosureGroup on the
  port's Disclosure, one expanded at a time or several, controlled or kept,
  disabled with each disclosure inside; `Disclosure` takes an `id`, its key
  in a group. `Disclosure_group.navigation` is HeroUI's
  `useDisclosureGroupNavigation`, whose next and previous, where several
  expand, reach another with each press, where HeroUI's reaches the same
  one twice.
- `Solidtype_heroui.Number_field` keeps a fractional step's values exact: a
  tenth added to 0.2 is 0.3, where it was 0.30000000000000004, and the last
  step of 0.3 below 1 is 0.9; a value halfway between steps snaps away from
  the minimum, and a step that is not positive keeps the value within the
  range alone, where it was lost.
- `Solidtype_heroui.Disclosure`: HeroUI's Disclosure on Kobalte's
  Collapsible, expanded controlled or kept, its heading, trigger, chevron,
  content and body; its content stays on the page while collapsed, hidden
  until find in page reaches it, which expands it, and grows and shrinks by
  the height HeroUI's styles animate.
- `Solidtype_heroui.Button` takes `` slot=`trigger ``, as React Aria's
  slots do: inside a disclosure's heading it is the disclosure's trigger, in
  a button's look.

## 0.2.0 (2026-10-23)

- `Solidtype_heroui.Toggle_button` and `Toggle_button_group`: HeroUI's
  ToggleButton and ToggleButtonGroup on Kobalte's toggle button and toggle
  group, selected controlled or kept, one or several in a group, the group's
  size and disabled state given to its buttons; a button's own
  `is_disabled=false` holds in a disabled group, as HeroUI documents and its
  own does not.
- Every HeroUI port passes on a `data-` attribute it is given, `data_testid`
  and the rest, to its own element, after its own attributes as HeroUI's
  React components spread theirs, so a caller's `data-slot` wins; until now
  each one dropped it. A component written by `let%component` passes them
  on likewise by spreading `Props.others props`, the props it does not name,
  and `Solid.others` is that rest for a component written by hand.
- Breaking: a component's check takes a spread as a rest of its own props,
  `Props.omit` or `Props.others`, no longer as its whole props; every
  Kobalte part, `Dynamic.Element`, `Input` and `Text_area` now take a spread,
  any component's rest. A label's, a description's and an error's `slot` is
  also given the part's rest, to spread on the element it renders.
- `Solidtype_heroui.Toast`: HeroUI's Toast on Kobalte's, its provider, its
  stack collapsed and expanded, its parts, and `Toast.show`, the variant
  helpers, `update`, `promise`, `close`, `clear`, `pause_all` and
  `resume_all` on HeroUI's queue or one of its own. An update keeps what it
  does not name, as HeroUI documents and its own does not; a promise's
  failure and a failing `success` are told apart; its hotkey fires with its
  own modifiers alone.
- `Solidtype_heroui.Progress_circle`: HeroUI's ProgressCircle on Kobalte's
  Progress, an arc round a circle, determinate or indeterminate, its colors,
  sizes and format options; a circle of another radius draws its arc on that
  radius, where HeroUI's measures it on the default one.
- `Solidtype_heroui.Time_field`: HeroUI's TimeField on Kobalte's, a time of
  day in segments typed or stepped, its group, input, segments, prefix and
  suffix, its clock and leading zeros the locale's, its separators the
  locale's, as React Aria's, and its value told once every segment has its
  part.
- `Solidtype.Jsx.fragment`: several elements side by side where one is
  given, as JSX's `<>...</>` is.
- `Solidtype_kobalte.Types.DateTimeFormatPart` reads a part's `type_` and
  `value`, for `I18n.create_date_formatter`'s `format_to_parts`.
- `Solidtype_heroui.Form`: HeroUI's Form, a `<form>` that refuses a submit
  while a field inside it is invalid and focuses the first, and shows a
  server's `validation_errors` on the fields they name until each is changed
  and left. Every field joins the form it is in; `Field_error` takes no
  children where a server's error is all it shows.
- `on_blur` on every HeroUI field -- `Text_field`, `Number_field`,
  `Search_field`, `Checkbox`, `Checkbox_group`, `Radio_group`, `Switch`
  and `Slider` -- called once focus leaves the field for an element outside
  it, so a form tells a field left. `Field.on_leave` is that handler, for a
  field of an application's own.
- `Solidtype_heroui.Switch` takes `is_invalid`, as HeroUI's does.
- `format_options` on `Solidtype_heroui.Number_field`, `Meter`,
  `Progress_bar` and `Slider`, HeroUI's `formatOptions`: a currency, a
  percent or a unit, in Kobalte's locale. A slider's output and thumbs show
  its values in the reader's locale by default, `1,500` where they showed
  `1500`.
- Breaking: `Solidtype_kobalte.Types.NumberFormatOptions2` is gone;
  `NumberField`'s `format_options` takes `Types.NumberFormatOptions.t`, the
  type `I18n.create_number_formatter` takes, since the generator binds two
  declarations of a name TypeScript takes for each other as one type.
- `Solidtype_heroui.Progress_bar`: HeroUI's ProgressBar on Kobalte's
  Progress, determinate or indeterminate, its colors and sizes, its output
  Kobalte's formatting of its value.
- `Solidtype_heroui.Meter`: HeroUI's Meter on Kobalte's, a quantity within a
  range, its colors and sizes, its output Kobalte's formatting of its value.
- `Solidtype_heroui.Alert`: HeroUI's Alert, its statuses and their icons,
  its indicator, title and description, a default surface to what is inside
  it.
- `Solidtype_heroui.Input_group`: HeroUI's InputGroup, an input or a text
  area with its prefix and suffix, alone or a text field's. `Input.input`
  and `Text_area.text_area` render either as a part with classes of its
  own.
- `Solidtype_heroui.Search_field`: HeroUI's SearchField on Kobalte's text
  field, its query cleared by Escape or its button and submitted by Enter.
  `Close_button.Icon` is HeroUI's cross, and `Field.Slots` the label,
  description and error any Kobalte field gives the parts inside it.
- `Solidtype_heroui.Interaction` keeps the page's last input, a key or a
  pointer, for every element it watches, so a pointer pressed anywhere hides
  the focus ring of what has the focus, as React Aria does.
- `Solidtype_heroui.Slider`: HeroUI's Slider on Kobalte's, one value or a
  range, controlled or kept, horizontal or vertical, its output and fill
  drawn and its thumbs placed as React Aria draws and places them.
- `Solidtype_heroui.Number_field`: HeroUI's NumberField on Kobalte's, its
  value a number, controlled or kept, on its step's grid within its range as
  React Aria keeps it, its group, input and buttons, and its label,
  description and error as Kobalte's. `Field_error` is any field's, given
  its element by the field it is in, as `Label` and `Description` are.
- `Solidtype_heroui.Interaction` shows no focus ring for a key typed into a
  text, but Tab and Escape, as React Aria does.
- `Solidtype_heroui.Checkbox_group`: HeroUI's CheckboxGroup, on Kobalte's
  checkboxes, which keeps the values they check, controlled or its own, and
  gives them its variant and state; its label names it and its description
  describes it and each checkbox. A `Description` in a `Checkbox` is the
  checkbox's own.
- `Solidtype_heroui.Switch_group`: HeroUI's SwitchGroup, switches laid out
  vertically or horizontally.
- `Solidtype_heroui.Fieldset`: HeroUI's Fieldset, its legend, group and
  actions, which while disabled disables the `Button`s, `Link`s and
  `Radio_group`s inside it, where their own `is_disabled` says nothing.
- `Solidtype_heroui.Text_field`: HeroUI's TextField on Kobalte's, its value
  controlled or kept, required, disabled, invalid and read-only, and the
  parts inside it as Kobalte's: a `Label` names its input, a `Description`
  describes it, and a `Field_error`, HeroUI's FieldError, shows while it is
  invalid. `Solidtype_heroui.Input` and `Text_area`: HeroUI's Input and
  TextArea, each element's every attribute passed on, alone or a field's.
- `Solidtype_heroui.Label` takes `is_required`, `is_disabled` and
  `is_invalid`.
- `Solidtype_heroui.Scroll_shadow`: HeroUI's ScrollShadow, faded at each edge
  it hides content at, measured as it scrolls, as it is resized and as its
  content changes, or at the edges its `visibility` gives.
- `Solidtype_heroui.Empty_state`: HeroUI's EmptyState, which says "No
  results found" unless it is given children.
- `Solidtype_heroui.Typography`: HeroUI's Typography, each type the element
  it means, or the one `element_type` gives, its alignments, colors,
  weights and truncation, and its primitives, `Heading`, `Paragraph`,
  `Code` and `Prose`.
- `Solidtype_heroui.Avatar_group`: HeroUI's AvatarGroup and its count,
  stacked or in a grid, that gives its avatars its size, color and variant,
  each where an avatar sets none, and shows the first `max` of them and
  counts the rest. `Avatar` reads its group.
- `Solidtype_heroui.Avatar`: HeroUI's Avatar on Kobalte's Image, its sizes,
  colors and variants, its image once it has loaded and its fallback until
  then.
- `Solidtype_heroui.Skeleton`: HeroUI's Skeleton, its animations, and the
  page's `--skeleton-animation` where it is given none, read once it is in
  the browser.
- `Solidtype_heroui.Spinner`: HeroUI's Spinner, its colors and sizes, a
  status named "Loading" that draws HeroUI's icon, its gradients given ids
  of their own.
- `Solidtype_heroui.Kbd`: HeroUI's Kbd, its variants, each key HeroUI draws
  by its symbol and names, and its text.
- `Solidtype_heroui.Card`: HeroUI's Card, its variants and its parts --
  header, title, description, content and footer -- a surface to what is
  inside it, but while transparent.
- `Solidtype_heroui.Surface`: HeroUI's Surface, its variants, and
  `Surface.Context`, the variant a part inside it reads as it changes.
- `Solidtype_heroui.Button_group`: HeroUI's ButtonGroup and its separator, a
  group of buttons it gives its variant, size, disabled state and full
  width, each where a button sets none itself, horizontal or vertical.
- `Solidtype_heroui.Close_button`: HeroUI's CloseButton on Kobalte's button,
  named "Close" unless given an `aria_label`, drawing HeroUI's cross or the
  children it is given, its state kept as Button's is.
- `Solidtype_heroui.Switch`, `Checkbox` and `Radio_group` take
  `is_read_only`, `is_required` and `name`, and `Switch` and `Checkbox`
  `value`, so they submit with a form; `Switch`, `Checkbox`, `Radio` and
  `Button` take `aria_label`, for one no text names. A read-only field is
  not hovered and, but for a radio, no pointer presses it, as React Aria's;
  a read-only radio group keeps its choice and moves the focus by the
  arrow keys. `Interaction.create` takes `?no_hover` and
  `?no_pointer_press` for them.
- An optional prop is passed on as it is: `?title=(fun () -> o)`, or a
  component's optional parameter by its name, `?name`, present while the
  option is `Some` and absent while it is `None`. The compiler refuses it
  on a prop that is not optional.
- `Solidtype_heroui.Radio_group` and `Radio`: HeroUI's RadioGroup on
  Kobalte's, in HeroUI's anatomy, its value controlled or kept, horizontal
  or vertical, disabled and invalid. A `Label` in the group names it.
- `Solidtype_heroui.Description`: HeroUI's Description, a span, or inside a
  radio group or a radio the description its input is described by.
- `Solidtype_heroui.Interaction.create` takes `?keys`: `` `element `` judges
  a key by the element watched, as React Aria's radio presses its label by
  Enter as by Space.
- `Solidtype_heroui.Field`: what a switch, a checkbox and a radio share --
  the state their content declares, a value controlled or kept, and the
  content, made by a functor over a Kobalte component's label and input.
- Breaking: `Solidtype_heroui.Label.Slot` replaces `Label.Inline`. The part
  above a label says how it renders, as React Aria's `LabelContext` does:
  a span in a control's content, a radio group's own label in the group.
- A component bound in a function, as a functor's argument is, renders:
  the plugin gave its lower-case name an alias it declared out of reach.

- `Solidtype_heroui.Checkbox`: HeroUI's Checkbox on Kobalte's, in HeroUI's
  anatomy, its check and dash drawn as HeroUI draws them, selected,
  indeterminate, disabled and invalid.
- Breaking: `Solidtype_heroui.Button` and `Link` take `is_disabled`, as
  HeroUI's documentation names it and as `Switch` does, where they took
  Kobalte's `disabled`.
- `Solidtype_heroui.Switch`: HeroUI's Switch on Kobalte's, in HeroUI's
  anatomy, its props named as HeroUI's documentation names them; and
  `Solidtype_heroui.Label`, HeroUI's Label. `Interaction` decides by what a
  key went to, as React Aria does: Enter presses no checkbox or radio, and
  it follows the focus into an element, a switch's input inside its label.
- Breaking: a `data-` attribute's value is a `Jsx.data`, where it was a
  `string`: present, `Jsx.data s`, or `"true"` while a flag is up and
  absent while it is down, `Jsx.flag b`. A string literal is still written
  as it is, `data_slot="badge"`; any other string is `Jsx.data s`.
- A component takes `data-` attributes, `<Button.Root data_slot="button" />`,
  outside its check, and passes them to its element, as in TSX.
- Breaking: `Solidtype_heroui.Interaction` keeps an element's state and
  writes no attribute: `create`, `watch` from the element's `ref`, and a
  read per state, which a port declares as its `data-` attributes, so they
  are in a prerendered page; `track` is gone.
- `Solidtype_heroui.Link`: HeroUI's Link and its icon on Kobalte's link, its
  state kept as React Aria keeps it. `Interaction` no longer presses a link
  by Space, as React Aria does not.
- An SVG shape takes the presentation attributes Solid's types pick for it --
  a `<path>`'s `fill`, `stroke`, `fill_rule` and the rest -- which the
  attributes generated from those types left out, as every `Pick<...>` and
  `Omit<...>` an interface extends was.
- `Solidtype_heroui.Chip`: HeroUI's Chip and its label, its colors, sizes and
  variants.
- `Solidtype_heroui.Badge`: HeroUI's Badge, its anchor and its label, its
  colors, placements, sizes and variants.
- `Solidtype_heroui.Separator`: HeroUI's Separator on Kobalte's, its
  orientations and variants.
- A Kobalte root split by `multiple`, `Root` and `Root_multiple`, has
  Kobalte's documentation, as every other part has.
- `solidtype-heroui`, a package of HeroUI's components ported onto Kobalte's:
  `Button`, with HeroUI's variants, sizes, full width and icon only, its
  classes from `@heroui/styles`, which an application installs beside
  `@kobalte/core`, and the state HeroUI's styles read -- hovered, pressed,
  focused, focus-visible, disabled -- kept as React Aria keeps it, by
  `Interaction`, which a port gives the element Kobalte renders; and
  `Styles`, every variant function of `@heroui/styles`, generated from its
  declarations: `Styles.Button.classes (Styles.Button.options ~variant:`ghost
  ())`, and for a component of several parts a class string per part,
  `Styles.Checkbox.base (Styles.Checkbox.slots options)`.
- Breaking: Kobalte's types are read as a browser has them, so
  `Solidtype_kobalte.Types` no longer holds Bun's server types (`BunFile`,
  `S3File`, `Buffer`, `Stats`, `Archive`, its `Image`) or Node's, and
  `Types.File` no longer has `image` or `form_data`, which no browser's
  `File` has and which threw when called.
- Breaking: a name given to a prop or an attribute is passed as it is,
  `<Row changed />` a callback whatever it is named, `class_=cls` a
  constant; a changing value is written as the thunk it is,
  `(fun () -> count ())`, where a bare name was taken for one.
- A component's callback prop that takes nothing, `~(on_remove : unit -> unit)`,
  compiles and is called, where `let%component` refused it with an error
  over the whole component.
- Breaking: a page streamed on the server goes into a web `WritableStream`,
  which `Server.writable ~write ~close ()` makes, each part given as text,
  and `Server.pipe_to` resolves once it is all written; the Node-only
  `pipe`, `pipe_to_node_writable` and `node_writable` are gone, and nothing
  could make a writable before.
- A component written without its last parameter, `()`, is reported where
  it is defined, where the error named no file.
- Breaking: a resource's `ssr_load_from` is `` `server`` or `` `initial``,
  the polymorphic variant every other closed set of Solid's strings is,
  where it was a variant of its own, `Server` or `Initial`.
- Breaking: a Kobalte function's parameter that may be left out is an
  optional argument, as the stdlib's are: `I18n.create_filter ()`,
  ``Color.to_string c ~format:`hex ()``, `Toaster.show toaster render ()`,
  where each was a positional `option` a caller wrote `None` for.
- Breaking: a Kobalte value's conversion to its DOM type is named as the
  stdlib names one, `to_html_div_element`, `to_focus_event`, where it was
  `htmlDivElement`, `focusEvent`, the one camel-case name a user wrote.
- `solidtype-kobalte` has an interface, generated with the binding: the
  raw externals under its wrappers, `*_js`, are no longer reachable, so
  no call skips what a wrapper adds.
- Breaking: what JavaScript threw is a type of its own, `Solid.thrown`,
  so `exn_of_thrown` takes only that, never any value; and a Kobalte
  value that would read as whatever type its caller names,
  `Context_Provider.value`, `FlowProps.value`, is no longer bound.
- Every function of Kobalte's `Types` is called directly from an
  application, its wrappers included, where those went through Melange's
  `Curry`: the types are a file of their own, `kobalte/types.ml`.
- A function a Kobalte object holds, `toggle_color_mode`, `Toaster.show`,
  is called directly, as a method of its object, where every call went
  through Melange's `Curry`; its `_js` getter is gone with the wrapper.
- Breaking: a Kobalte function that throws, as its documentation or a test
  says, raises `Invalid_argument` with Kobalte's message, where it threw a
  JavaScript error: `Colors.parse_color` on a string that is no colour,
  `Color.get_channel_value` and `with_channel_value` on a channel the
  format lacks, `Color.to_format` from HSL to hex. `Colors.parse_color_opt`
  parses input from outside to an option.
- Breaking: `Server.render_to_string_async` resolves to a `result`,
  ``Error `Timed_out`` when the render outlasts `timeout_ms`, where its
  promise rejected; Solid's rendering on the server is tested, in Node.
- `catch_error` and `run_with_owner` give `Some` of what the function
  returned, `()` and `None` among it, and `None` only when it raised:
  a function returning either read as one that raised.
- `Store.track` subscribes the computation that calls it to every field of
  the store, as Solid's `$TRACK` does: Melange had dropped its read, so it
  did nothing.
- Breaking: a toast's `SwipeEvent` binds `init_event` and
  `init_custom_event` as the methods they are, where reading either gave
  a function typed as an event, and has no `make`, since an event is
  Kobalte's to create.
- A callback given to a Kobalte constructor, such as a context value's
  `register_title_id`, reaches Kobalte in the shape its type declares
  however OCaml writes it: `fun id () -> ...` no longer runs its cleanup
  at once and hands Kobalte `undefined` for it.
- Breaking: `Dynamic` requires its `props`, typed by its component, so a
  prop the component needs is no longer left out unseen, and
  `Dynamic.Element` takes the attributes every HTML element takes,
  `Html.Element`'s, each typed, in place of any value as `props`.
- Breaking: a spread is written `props=p`, TSX's `{...p}`, where it was
  `spread=p`, and `props` is the name of no prop: a component's
  parameter named `props` is refused, saying so, where a prop named
  `spread` was a duplicate label far from its cause.
- A string in JSX reaches the page as it reads in OCaml: a backslash, as
  in `"C:\\new"`, is no longer read again as an escape, nor is a lone one
  a build error; text quoted `{|...|}` is no longer bytes; and an
  attribute or prop that is not plain ASCII, `placeholder="Rechercher…"`,
  holds an entity or a quote, or a string with a tab or a run of spaces,
  is no longer shown as escape codes, read as entities or collapsed.
- The example is a kanban board on the whole stack: a Spindle server, a
  Kobalte board printed against its routes and styled with
  Tailwind, served as a Vite page and mounted as an Astro one, with the
  rough edges found building it in its README.

## 0.1.0 (2026-10-19)

- The example is a whole stack: a notes island typed from a client
  Spindle prints from the example's own routes as the build runs, so a
  route's answer gaining a case breaks the island that matches it, tested
  against that server, and `make serve` serving the site and the notes on
  one origin.
- An island mounts in an Astro page as any Solid island does,
  `client:only` or prerendered as `client:load`: `vite-plugin-solidtype`
  runs under Astro's server build as under the client's, and the example
  is an Astro site.
- OCaml's JSX on Solid: `ppx_solidtype` lowers MLX's JSX, and
  `vite-plugin-solidtype` hands it to Solid's own compiler, so an island
  compiles as its TSX twin does. A reactive read outside a thunk does not
  compile.
- Solid 1.9 bound whole: `Solid` -- signals, memos, effects, roots,
  ownership, errors as OCaml exceptions, transitions, resources, arrays,
  observables, `merge_props` and `omit` -- `Web` -- rendering and
  hydration -- `Server` -- rendering on the server -- and `Store`, its
  state a record. Its components are `For`, `Index`, `Show`, `Switch`,
  `Match`, `Suspense`, `SuspenseList`, `ErrorBoundary`, `Dynamic`,
  `Portal`, `NoHydration`, `Hydration`, `HydrationScript` and `Assets`,
  and `Context.Make` makes a context. What Solid's compiler alone emits is
  not bound.
- `Show.Some` and `Match.Some` show an `option`, `Some 0` too, and
  `Show.Keyed` and `Match.Keyed` give their child the value.
- A `Switch` whose only child is a thunk of a `match` shows the case that
  holds, and a case left out is the compiler's warning.
- Each element's attributes are typed, generated from Solid's JSX types:
  an attribute the element does not take does not compile, and a closed
  set of values is a polymorphic variant, ``type_=`button``, and a
  handler takes its event's type, `on_click` a `Dom.mouseEvent`.
- Every name a user writes is snake case, made by one rule from Solid's
  or Kobalte's: a capital is an underscore and the lower case, a hyphen
  an underscore, and a keyword takes a trailing underscore -- `on_click`,
  `read_only`, `aria_label`, `default_value`, `class_list`. One of
  Solid's namespaces wraps the value: `on_click=(Jsx.native f)` is
  `on:click`, and `Jsx.capture`, `Jsx.prop`, `Jsx.attr` and `Jsx.bool`
  name the others; `Jsx.listen` and `Jsx.named` give a name the rule
  cannot keep.
- `let%component` also writes `Props.make`, a component's props as a
  value, and `Props.omit`, which names the props it leaves out by a
  variant.
- Kobalte 0.13 bound whole, generated from its declarations: each
  component part by part, its check its own options, then its children,
  then its element's attributes; its `use…Context` hooks, `toaster`,
  colors, i18n and color mode; and the types they name, under
  `Types`. It is a package of its own, `solidtype-kobalte`, its module
  `Solidtype_kobalte`. A Select, Combobox or ToggleGroup of many values
  is `Root_multiple`.
- `vite-plugin-solidtype` is compiled to JavaScript and attached to each
  GitHub release, released with the opam packages at one version.
- A component's props are checked: a prop left out, a prop the
  component does not take, and props that disagree on a type do not
  compile. `let%component make ~(text : string) ?(count : int = 0) ()`
  writes the component's `Props` from its parameters, and a prop is
  read where it is used, `text ()`, as a live read of Solid's props.
- A function literal given as a prop or as a component's only child,
  `ref=(fun el -> ...)` or `For`'s `(fun item -> ...)`, is passed as it
  is, and so is a JSX element given as a prop.
- A component's check names the kinds of children it takes: elements, a
  function it calls, or either, so children of the wrong kind do not
  compile.
- A string literal in JSX, a text child or a prop, reaches the page as
  written, also where it is not ASCII.
