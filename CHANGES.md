# Changes

## Unreleased

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
