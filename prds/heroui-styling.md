# A port styled and composed as HeroUI's

**Status: Accepted** — the whole shape, `[@@element]` spelt so; whether `as_` is typed by its element is open; stages 1, 2 and 3a have landed.
Date: 2026-11-02

## The problem

HeroUI's getting-started pages -- Theming, Colors, Styling, Composition,
Animation, Dark Mode -- describe what an application does to make HeroUI its
own. Measured against them, the ports hold everything that is CSS: their
classes are HeroUI's, so its variables, themes, BEM classes, data-attribute
switches and motion apply unchanged. What falls short is what a part takes:

- **A part takes `class_`, its own props and `data_` attributes, never the
  rest of its element's.** `<Button style="..." title="...">` does not
  compile, where HeroUI's `<Button>` takes any of a `<button>`'s props. Of
  295 checks in `heroui/`, only `Input`, `Text_area` and `Field`'s end in
  their element's `Html` check; two parts that draw an element,
  `Close_button.Icon` and `List_box.Load_more_item`, take no `class_` at all.
  The headless parts already take every attribute, by hand.
- **A part cannot be drawn as another element or component.** HeroUI's
  `render` puts a router's link or an animated element in a part's place;
  Kobalte does the same with `as`, which `generate/kobalte.ts` leaves out
  with the rest of `polymorphic`.
- **A part's state reaches a caller only as attributes.** HeroUI gives
  children and `className` as functions of `isPressed`, `isSelected`; only a
  list item's `render` does so here.
- **Nothing switches the theme.** HeroUI's `useTheme` keeps the choice --
  light, dark, system, or a theme of the application's own -- and writes it
  on `<html>`; an application here writes its own script.
- **The components HeroUI ships no stylesheet for cannot be restyled by
  their class.** HeroUI's look is a stylesheet of BEM rules in Tailwind's
  `components` layer, and an application restyles a component by writing
  its own rule for the class, `.radio { ... }`. `Segment`, `Trend_chip` and
  `Text_shimmer` write their look on the element as utilities beside the
  class -- `segment__item rounded-3xl h-8 px-4` -- and a utility is in a
  later layer, so `.segment__item { border-radius: ... }` loses whatever it
  says. An application using them found this; it also has to point
  Tailwind at the library as Melange compiled it.
- **A toast's own motion ignores `data-reduce-motion`**, which HeroUI's
  styles honour beside `prefers-reduced-motion`
  (`heroui/toast.mlx`, `reduced_motion`).

`heroui.md` left HeroUI's React-only machinery out of scope. The owner has
asked that a port be aligned with HeroUI wherever Solid and Kobalte allow
it, and that the documentation say how to theme and style one; the
documentation landed apart, its "Not yet" sections naming this work.

## Scope

It covers every part of `solidtype-heroui`, the ppx's `let%component`, the
Kobalte binding's `as`, and a theme hook. It touches this repository alone.

It does not cover `tv`, HeroUI's way to extend a variant function: a
caller's class already wins over HeroUI's, which are in Tailwind's
`components` layer (the Composition page shows it). Nor `className` as a
function of state.

## User scenarios

1. **An inline style and a title on a button.** `<Button style="--x: 1"
   title="Save">` compiles, and both reach the `<button>`.
   Accepted when: every part that draws an element takes each attribute of
   that element, typed as `Solidtype.Html` types it, and passes it on.
2. **A caller's handler beside the port's.** `<Tabs.Tab on_key_down=f>`
   calls `f` and still moves between tabs by the arrows.
   Accepted when: a test gives every part `on_click`, `on_key_down`, a `ref`,
   `style` and `title`, finds each on its element, and the part's own
   behaviour holds.
3. **A router's link as a `Link`.** `<Link as_=Router_link href="/about">`
   draws the router's anchor with HeroUI's classes, state and Kobalte's
   behaviour.
   Accepted when: the component given receives the part's props, and a part
   given none draws its own element as today.
4. **Children of the button's state.** `<Button>(fun s -> if s.is_pressed ()
   then ... else ...)</Button>` changes as it is pressed.
   Accepted when: each part HeroUI gives a render function takes children
   as elements or a function of a record of its state's accessors, named as
   HeroUI's render props are.
5. **A theme switch.** `let t = Theme.use ~default:"system" ()` gives the
   chosen theme, the resolved one, and a setter that writes the class and
   `data-theme` on `<html>` and keeps the choice across visits.
   Accepted when: it behaves as HeroUI's `useTheme`, storage key included,
   so a page moved from React keeps its visitor's choice.
6. **Less motion.** Under `data-reduce-motion="true"` a toast enters and
   leaves as it does under `prefers-reduced-motion`.

## Requirements

- **FR-1** A part that draws an element takes every attribute of it,
  `style`, handlers and `ref` among them, and `class_`.
- **FR-2** A caller's handler and `ref` are called beside a part's own; a
  part's own attribute is never replaced by the caller's.
- **FR-3** A part that draws an element can be given a component to draw in
  its place, which receives the part's props.
- **FR-4** A part HeroUI gives a render function takes its children as a
  function of its state.
- **FR-5** The theme is chosen, resolved, written and kept as HeroUI's
  `useTheme` does.
- **FR-6** A toast's motion honours `data-reduce-motion`.
- **FR-7** Every component's look is a rule for its BEM class in the
  `components` layer, so a rule of the application's for the class
  restyles it, and a utility given in `class_` wins over it.

## Design

### Every attribute: `let%component` given its element

`let%component` gains the element its component draws:

```ocaml
let%component make ?(variant : variant = `primary) ?(on_click : ...) ...
    () = ...
[@@element button]
```

Its `Props.check` then ends in that element's, `Html.Button.check`,
after its own props, and an interface says so in one line, `(unit -> unit)
Solidtype.Html.Button.check`. An own prop of an attribute's name is the
component's, whatever the element means by it, as HeroUI types a part,
`Omit<DOMProps, keyof OwnProps> & OwnProps`: OCaml lets a function type
name a label twice and an application fills the first, so the own prop,
which comes first, takes the caller's value and the element's is never
filled. A switch's `on_change` takes its state and a part's `size` its
variant, where the element's would take an event and a string; some twenty
ports have such a prop.

A part that sets a handler or a `ref` on its element names it as its own
parameter and calls the caller's beside its own, as the headless parts do
by hand; `Props.others` spreads the rest after the part's attributes, which
already happens in 68 of 70 modules. A port that means the element's
own attribute by its prop, `class_`, passes it on itself.

Rejected: **an own prop held to the element's type**, the first shape built
-- some twenty ports, every field with a typed `on_change`, could not use it;
**the element's attributes written out by the ppx, but those an own prop
names**, the second -- each part's interface would have to list them all;
**writing each check by hand**, as the headless parts are -- some
260 parts, each a copy of its element's attributes the generator already
writes; **a `style` prop alone** -- HeroUI's parts take every DOM prop, and
`title`, `tab_index` and the handlers are asked for as often; **an
extension per element, `let%component.button`** -- one name per element
in the ppx's registry for what one attribute says.

### `as_`: Kobalte's polymorphism, HeroUI's `render`

The Kobalte binding takes `as` on every part, `?as_:_ Jsx.component`, and
a port passes it to the Kobalte part beneath, or draws it by `Dynamic`
where it draws a plain element. The component receives the part's props,
`ref` and handlers among them, and must spread them on one element of the
same kind -- HeroUI's rules for `render`, said in each `.mli`.

Rejected: **`render`, HeroUI's name** -- the ppx gives `render=f` to a
component's function child already (rhp's slat), and a second meaning
would be read wrongly; Kobalte's and Solid's `Dynamic` both take a
component, not a function of props and state, so `as_` is what the part
beneath understands. **State as `as_`'s second argument** -- Kobalte gives
none; the props carry the state attributes, and scenario 4 gives it
otherwise.

### Children of state

Each part HeroUI gives a render function takes `children` of
`` [ `nodes | `function ] ``: elements, or a function of a record of
accessors -- `is_pressed`, `is_hovered`, `is_focus_visible`,
`is_disabled`, and the part's own, `is_selected`, `is_pending` --
named by the one rule from HeroUI's render props, read where Solid tracks
them. `Interaction` and the part's own state make it; nothing is computed
twice.

Rejected: **`class_` as a function of state** -- Tailwind's data variants
read the same attributes with no second form of `class_`, which would
become a sum type on every part.

### `Theme`

`Solidtype_heroui.Theme.use : ?default:string -> unit -> t`, with
`theme`, `resolved` (an accessor, `None` on the server) and `set_theme`,
storing under `heroui-theme`, resolving `"system"` by
`prefers-color-scheme` and following it as it changes, and swapping the
class and `data-theme` on `<html>` as HeroUI's hook does. One per
application, as HeroUI says of its own.

Rejected: **a theme context** -- the state is `<html>`'s, one per page.

### A component made here: its look, a stylesheet

`Segment`, `Trend_chip` and `Text_shimmer` each move their utilities into a
stylesheet of rules for their BEM classes, `heroui/segment.css` and the
others, written as HeroUI writes `@heroui/styles/components/*.css`:
`@apply` of the same utilities on HeroUI's tokens, a state by its data
attribute, `.segment__item[data-selected="true"]`. The element carries its
BEM classes alone, and `class_` after them. The library ships the files
beside its JavaScript, `melange.runtime_deps`, and an application imports
them into the `components` layer as it imports HeroUI's,
`@import ".../solidtype-heroui/segment.css" layer(components)`; the
`@source` of the compiled library is no longer needed.

Rejected: **utilities marked important or in a lower layer** -- the first
beats an application's rule too, and Tailwind decides the second; **a
caller's override by `class_` alone** -- HeroUI's model is the rule for the
class, which restyles every instance at once.

## Rules it adds

- **A port's part takes every attribute of its element** (revises "A
  component Kobalte lacks is made headless first", which says it of
  headless parts): its check ends in its element's `Html` check, given by
  `[@@element]`, a caller's handler and `ref` called beside its own. Why:
  HeroUI's parts take every DOM prop, and an attribute a port refuses is
  one an application cannot set. Test: `test/heroui/attributes_test.mlx`,
  every part given a style, a title, a handler and a `ref`.
- **A component HeroUI ships no stylesheet for has one of its own**
  (revises the rule for those components, which writes
  its look as utilities on its parts): rules for its BEM classes, in
  `heroui/<name>.css`, imported into the `components` layer. Why: every
  component is restyled alike, by a rule for its class, which a utility on
  the element would beat. Test: each such part's test pins its classes,
  its BEM classes alone, and the documentation's build compiles each
  stylesheet.
- **A part takes `as_`, Kobalte's `as`** (revises "Kobalte's building
  blocks ... polymorphic ... are not bound"). Why: HeroUI's `render`, a
  router's link in a link's place. Test: each port's `as_` in its test.

## Stages

- [x] 1. `[@@element]` in the ppx and the attribute table from
  `generate/html.ts`; `test/ppx` for the check, `test/does_not_compile.t`
  for an attribute the element lacks, an own prop shadowing the element's,
  and an unknown element.
- [x] 2. `Segment`, `Trend_chip` and `Text_shimmer`'s look in stylesheets,
  shipped and imported into the `components` layer; the Theming page's
  `@source` of the library goes.
- [x] 3a. Every port's part that spreads onto a plain element given that
  element -- 114 of them -- `Close_button.Icon` and
  `List_box.Load_more_item` taking a class so; the data-attributes test
  gives each a title, found on its element.
- [ ] 3b. The parts that spread onto a Kobalte part or another port, those
  that draw one of several elements, and those that set a handler on their
  element, each handler composed with the caller's; the attributes test
  over every part. Styling's "Not yet" goes.
- [ ] 4. `as_` in the Kobalte binding and on every port's part; a
  router-link example on Link's and Button's pages. Composition's "Not yet"
  goes.
- [ ] 5. Children of state on each part HeroUI gives a render function,
  tested against the React twin's render function.
- [ ] 6. `Theme`, its example on the Theming page, tested in jsdom.
- [ ] 7. A toast's motion under `data-reduce-motion`.
- [ ] 8. Every component checked alike: each part's look a rule for its
  class, restyled by one; each takes its element's attributes, `class_`
  and `as_`.

## Verification

`make test` and `make lint`; the attributes test over every part; each
port's twin test unchanged; the docs pages' examples of `style`, `as_`, a
state child and `Theme` built and seen in a browser beside heroui.com's.

## Open

- **Whether `as_` is typed by its element**, a component of a `<button>`'s
  props for a button, or of any props. A typed one refuses an `<a>` where a
  `<button>` belongs, as HeroUI only warns; it needs the element's props as
  a type, which `Html` does not yet give. Blocks stage 4.

## Where the facts go

| Fact | Goes to |
|---|---|
| that a part takes every attribute, `as_` and a state child | `README.md`, and the Styling and Composition pages |
| each part's element, state record and `as_` | its `.mli` |
| the two rules | `AGENTS.md` |
| `[@@element]` | `ppx/ppx_solidtype.mli` |
| `Theme` | its `.mli` and the Theming page |
| each release's change | `CHANGES.md` |
