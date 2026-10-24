# HeroUI's whole set on Kobalte

**Status: Accepted** — the full set, in OCaml on Kobalte, is decided, and how a form validates, and that a port lands on looking and behaving as HeroUI's; groups 1 to 3 have landed but for ErrorMessage, which waits for Calendar; group 4 has ToggleButton, ToggleButtonGroup, Disclosure and DisclosureGroup.
Date: 2026-10-23

## The problem

`solidtype-heroui` ports HeroUI 3.2's design onto Kobalte by hand. Until
this work it held 11 of HeroUI's roughly 75 web components, too few for an
application to build its interface on: no fields beyond a switch, a
checkbox and a radio, no overlays, no lists, no navigation. The owner asked
for HeroUI's full set, a complete UI kit for solidtype.

## Scope

It covers every web component HeroUI 3.2 ships in `@heroui/react`, each as a
module of `solidtype-heroui` with its interface, its test against HeroUI's
React component and its documentation page. It touches this repository
alone.

It does not cover HeroUI Native, HeroUI's React-only machinery (render
props, `asChild`, `render`), a form's state -- its values, rules, touched
fields and slow checks, which an application keeps in Solid's store,
bound as `Store` -- or changes to Kobalte: no fork, no patch, no
upstream work. A component Kobalte lacks is built in this repository from
the primitives Kobalte exports.

## User scenarios

1. **An application builds a form.** It lays out a `Fieldset` of
   `Text_field`s, a `Number_field`, a `Checkbox_group` and a `Slider`, and
   submits it; each field's label names its input, its description
   describes it, and a disabled fieldset disables what is inside it. A
   submit while a field is invalid is refused and focuses that field.
   *Accepted when* each field's test holds its parts, names and state
   against React's, and the form's test submits it valid and invalid.
2. **An application shows status.** It shows an `Alert`, a `Meter`, a
   `Progress_bar` and a `Spinner`. *Accepted when* each renders HeroUI's
   classes and its value as React's does.
3. **An application opens an overlay.** It opens a `Modal`, a `Popover`, a
   `Tooltip` or a `Dropdown`, and chooses from a `Select` or a `Combo_box`.
   *Accepted when* each opens, traps or returns focus and dismisses as
   Kobalte's does, with HeroUI's classes and state.
4. **An application picks a date.** It picks a date from a `Date_picker`
   and a time from a `Time_field`. *Accepted when* each is keyboard- and
   reader-accessible and shows HeroUI's classes.
5. **A page is prerendered.** Every port renders on the server as in the
   browser, and hydrates. *Accepted when* the documentation's build
   prerenders each page with its state attributes.

## Requirements

- **FR-1** Each HeroUI web component has a port, its props named as HeroUI's
  documentation names them, by solidtype's one spelling rule.
- **FR-2** A port's classes are HeroUI's own, from `Styles`, which is
  generated from `@heroui/styles`; never a copy of them.
- **FR-3** A port declares the state HeroUI's styles read --
  `data-hovered`, `data-focus-visible`, `data-selected` and the rest -- as
  React Aria writes it, `"true"` or absent, so it is in a prerendered page.
- **FR-4** A port's behaviour and accessibility are Kobalte's where Kobalte
  has the component, and built from Kobalte's primitives where it has none.
- **FR-5** Each port is tested beside HeroUI's React component, its twin,
  under the same props and the same steps.
- **FR-6** Each port has a documentation page laid out as HeroUI's, its
  examples, its comparison with React's, and what of HeroUI's it does not
  do yet.
- **FR-7** Where a port differs from HeroUI's React component, it says so in
  its `.mli` and its page.
- **FR-8** Every field can be driven wholly from outside -- its value, its
  change, its blur, its name, whether it is invalid and its error -- so
  the application's state, in Solid's store or its signals, validates it.
- **FR-9** A `Form` refuses a submit while a field inside it is invalid,
  focuses the first such field, and shows a server's errors on the fields
  they name.
- **FR-10** A number a port shows is formatted as HeroUI's
  `formatOptions` asks, for the reader's locale.
- **FR-11** Each port is judged by four parities with HeroUI's React
  component, in this order: it looks the same, it behaves the same, its
  usage carries across, and its types refuse what TypeScript refuses in
  HeroUI's. A port is HeroUI when it meets the first two; the
  last two say how well it reads in OCaml.

## Design

### Parity

A user of HeroUI expects its look and its behaviour first, so those two
are what a port must meet before it lands, and the other two are judged
after them.

- **Visual**: HeroUI's classes, from `Styles`, on the parts HeroUI renders,
  and the state attributes they read, at each step a user takes.
- **Behavioural**: what HeroUI's component does for a user -- its keys,
  its value as it changes, what a reader is told -- reached through
  Kobalte's component, never React Aria's rebuilt; a gap Kobalte leaves is
  closed in the port's layer on top of it.
- **API**: HeroUI's props and usage carry across by the spelling rule,
  except where this document decides otherwise, as it does `validate`.
- **Type-level**: a prop left out, misspelt, or of the wrong kind is a
  compile error, as in TSX; what OCaml refuses beyond it is a gain, and an
  invariant no type can hold, a value on a number field's step grid, is a
  runtime policy its test holds.

### Layering

OCaml, compiled by Melange, on Kobalte, in HeroUI's design. A port is one
module of `heroui/`: its `.mli` the contract, its parts submodules
(`Card.Header`), its props labelled parameters by `let%component`, or a
check written by hand where it passes an element's every attribute on, as
`Input` does.

### What a port is made of

- **Classes**: `Styles.<Component>`, generated, a class string or a string
  per slot.
- **State**: `Interaction` keeps hovered, pressed, focused and
  focus-visible as React Aria does -- a pointer, but no touch, hovers; a key
  typed into a text shows no ring; the page's last input, a key or a
  pointer, is one signal every element reads -- and a port declares each as
  a `data-` attribute.
- **Parts that name each other**: `Label.Slot`, `Description.Slot` and
  `Field_error.Slot` let the part above give a label, a description or an
  error its element, as React Aria's contexts do; `Field.Slots` gives a
  Kobalte field's three at once; `Field.As_span` renders a Kobalte part as
  the span React Aria's is.
- **What a group gives**: a context per group -- `Button_group`,
  `Avatar_group`, `Checkbox_group`, `Radio_group`, `Fieldset`,
  `Surface` -- read by the components inside it after their own props.
  Solid cannot single out a group's own children, so every component inside
  a group reads it.
- **Values a port keeps**: `Field.controlled`, a value controlled or kept,
  where Kobalte's own does not behave as React Aria's -- a number field
  snapped to its step, a slider's values -- and Kobalte is given it.

### Forms

Kobalte decides a field's validity by `validationState` alone, and has
nothing above a field; React Aria's `validate`, `validationBehavior` and
`Form` are not the baseline. A port keeps Kobalte's model, and what a form
needs is added above it, never inside each field:

- **A field is driven from outside.** It takes `value`, `on_change`,
  `on_blur`, `name`, `is_invalid` and its `Field_error`, which the
  application's state drives, and validates nothing itself. Its value may
  still be kept, for a field nothing drives. Every field takes `value`,
  `on_change`, `name` and `on_blur`, called once focus leaves the field,
  and all but `Slider`, whose HeroUI has none, `is_invalid`.
- **A `Form` is a `<form>` and a context.** A field inside one registers
  its name, whether it is invalid, and how it is focused -- a radio group
  its checked radio or its first -- in the order of the page. On submit
  the form refuses while one is invalid and focuses the first; given
  `validation_errors`, a server's errors by name, each field shows its own
  as invalid, until it is changed and then left, as React Aria commits a
  change. The form sets `novalidate`. A field outside a `Form` behaves as
  it does today.
- **Values, rules and their timing are the application's**, in Solid's
  store: a field reads its value and its validity from it, and a rule
  across fields reads both. A form library is no part of this work; one
  is weighed, in a PRD of its own, only once applications on the stack
  repeat the same form code.

```ocaml
<Form on_submit=save validation_errors=(fun () -> S.get server_errors)>
  <Text_field name="email" value=(fun () -> S.get email)
    on_change=set_email on_blur=touch
    is_invalid=(fun () -> Option.is_some (email_error ()))>
    <Label>"Email"</Label> <Input />
    <Field_error>(fun () -> Option.value ~default:"" (email_error ()))</Field_error>
  </Text_field>
</Form>
```

### Numbers

Kobalte formats what it shows: `NumberField` takes `formatOptions`, and
`Meter` and `Progress` a `getValueLabel`, which a port builds from
`I18n.create_number_formatter` and HeroUI's `formatOptions`, in the
locale Kobalte reads. Kobalte's `Slider` tells a thumb's value as a
decimal alone, so a port gives each thumb its `aria-valuetext`, which
Kobalte takes after its own, and its output, from the same formatter.
The generator binds the options `@internationalized/number` declares and
Intl's as one type, since TypeScript takes either for the other.

### Where Kobalte and React Aria differ

A port keeps Kobalte's accessible pattern where both are accessible -- a
number field's spinbutton, a slider's `role="slider"` thumb -- and HeroUI's
element where Kobalte's has another meaning: HeroUI's `Alert` and
`Skeleton` have no role, so they are not Kobalte's. Kobalte's own state
attributes, present and empty, which no style of HeroUI's reads, are left as
Kobalte writes them, since a part cannot take them away; the tests leave
them out by name.

### Tests

Each port's test renders the port and its twin, `test/heroui/twins/*.tsx`,
and compares every part's attributes, references between parts written as
the slot they point to, through the same steps; what one framework writes
for itself (ids, React's controlled `value` attribute) is left out by name.
A test is seen failing on a stub before the port is written. Its type-level
parity is entries in `test/does_not_compile.t`: the misuses TypeScript
refuses in HeroUI's component, each with the error a user reads.

### Alternatives rejected

- **Generating the components** from `@heroui/react`: its components are
  React Aria's, and its CSS reads React Aria's state; only `Styles` is
  generated.
- **Copying React Aria's hooks** for what Kobalte lacks: the port is
  HeroUI reimplemented on Kobalte, so a missing component is crafted from
  Kobalte's primitives.
- **Extending or forking Kobalte**, or contributing upstream first: a
  second copy to maintain, or releases that wait on another project.
- **Kobalte's `Search`** for SearchField: it is a combobox; HeroUI's is a
  text field, built on Kobalte's.
- **A `validate` on each field**, as HeroUI's API names it: a second
  source of a field's validity beside a store's, typed anew for each
  field's value, and narrower than a store's validators, which know when
  they run, wait on a server and read other fields.
- **A form library, bound or our own**, TanStack Form's model: its
  string paths are its types, which OCaml cannot check, its store a second
  beside Solid's, and nothing in a field needs it.
- **The browser's own validation as the base**: its rules alone, nothing
  across fields, and on a field whose input Kobalte hides -- a number
  field's, a slider's -- a bubble that points at nothing.

## Rules it adds

Drafted here; they reach `AGENTS.md` when the work lands.

- **Each HeroUI port is tested against its React twin**, every part's
  attributes through the same steps, and anything left out is named with
  its reason. Why: the library promises HeroUI's look and behaviour, which
  only the two side by side show.
- **A port where Kobalte has no component is built from Kobalte's
  primitives**, and its `.mli` and page say it is not a Kobalte component.
  Why: one layering, OCaml on Kobalte, for every port.

- **A field is driven from outside and validates nothing itself**: its
  value, change, blur, name, validity and error are props, and a `Form`
  adds only what a form alone can do. Why: a field's validity has one
  source, the store's, and any store drives every field.

## Stages

Each port is one worktree from `main` and one commit, with its test, its
page, its line in `coverage.mdx` and `CHANGES.md`.

### Group 1: no behaviour to port
- [x] CloseButton, ButtonGroup, Surface, Card, Kbd, Spinner, Skeleton,
  Avatar, AvatarGroup, Typography, EmptyState, ScrollShadow

### Group 2: forms
- [x] TextField with Input, TextArea and FieldError; Label's required,
  disabled and invalid
- [x] Fieldset, SwitchGroup, CheckboxGroup, NumberField, Slider,
  SearchField, InputGroup
- [x] Every field driven from outside: `on_blur` on each, `is_invalid` on
  `Switch`
- [x] Form: a field's registration, a submit refused and the first invalid
  field focused, `validation_errors` by name
- [x] TimeField, on Kobalte's
- [ ] ErrorMessage, with Calendar in group 7

### Group 3: status
- [x] Alert, Meter
- [x] ProgressBar
- [x] Format options: NumberField's `formatOptions`, Kobalte's; Meter's and
  ProgressBar's through `getValueLabel`; Slider's output and thumbs, by
  Kobalte's number formatter
- [x] ProgressCircle
- [x] Toast

### Group 4: navigation and disclosure
- [x] ToggleButton, ToggleButtonGroup
- [x] Disclosure, DisclosureGroup
- [ ] Breadcrumbs, Pagination, Tabs, Accordion

### Group 5: overlays and lists
- [ ] Tooltip, Popover, Modal, AlertDialog, Drawer, Dropdown, ListBox,
  Select, ComboBox, Autocomplete

### Group 6: color
- [ ] ColorSwatch, ColorArea, ColorSlider, ColorField, ColorSwatchPicker,
  ColorPicker

### Group 7: built from Kobalte's primitives
- [ ] Kobalte's primitives bound: `createSelectableList`,
  `createSelectableItem`, `createListState`, `createFocusScope`, the
  popper, the dismissable layer, `createDateFormatter`
- [ ] TagGroup, Toolbar, InputOTP, Table, DateField, Calendar,
  RangeCalendar, DatePicker, DateRangePicker

## Verification

`make lint`, `make test` and `make docs` pass with every port; each port's
twin test passes, so it looks and behaves as HeroUI's; its misuses fail to
compile in `test/does_not_compile.t`; and the documentation, served,
shows each port beside HeroUI's React component with no marked row but
those its page explains.

## Where the facts go

| Fact | Goes to |
|---|---|
| which components are ported, and what of each is not yet | `coverage.mdx` |
| each port's contract | its `.mli` |
| each port's use and its differences from React's | its page |
| the layering, the twin test, a port built from primitives, a field driven from outside | `AGENTS.md`, its *Rules that must hold* |
| how a form is validated from Solid's store | the `Form` page |
| what changed for a user | `CHANGES.md` |
| that the full set is ported | `README.md` |
