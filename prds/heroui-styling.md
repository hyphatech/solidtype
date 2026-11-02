# A port styled and composed as HeroUI's

**Status: Draft** — nothing accepted; it revises `heroui.md`'s exclusion of HeroUI's render props and `render`.
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

## Design

### Every attribute: `let%component` given its element

`let%component` gains the element its component draws:

```ocaml
let%component make ?(variant : variant = `primary) ?(on_click : ...) ...
    () = ...
[@@element button]
```

Its `Props.check` then ends in that element's check, `Html.Button.check`,
as `Input`'s hand-written one does today. An own parameter whose name is
one of the element's attributes -- `class_`, `id`, `on_click` -- is read
from that tail, not added before it, since a label cannot appear twice; its
getter takes the attribute's type from `Html`, so a port cannot narrow it
unseen. `generate/html.ts` writes the ppx a table of each element's
attribute names, `ppx/html_attributes.ml`, as it writes `html_names.ml`.

A part that sets a handler or a `ref` on its element names it as its own
parameter and calls the caller's beside its own, as the headless parts do
by hand; `Props.others` spreads the rest after the part's attributes, which
already happens in 68 of 70 modules. A HeroUI prop whose name is an
attribute of another meaning -- none today; `<input size>` would be one --
is a compile error at the check, and decided where it arises.

Rejected: **writing each check by hand**, as the headless parts are -- some
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

## Rules it adds

- **A port's part takes every attribute of its element** (revises "A
  component Kobalte lacks is made headless first", which says it of
  headless parts): its check ends in its element's `Html` check, given by
  `[@@element]`, a caller's handler and `ref` called beside its own. Why:
  HeroUI's parts take every DOM prop, and an attribute a port refuses is
  one an application cannot set. Test: `test/heroui/attributes_test.mlx`,
  every part given a style, a title, a handler and a `ref`.
- **A part takes `as_`, Kobalte's `as`** (revises "Kobalte's building
  blocks ... polymorphic ... are not bound"). Why: HeroUI's `render`, a
  router's link in a link's place. Test: each port's `as_` in its test.

## Stages

- [ ] 1. `[@@element]` in the ppx and the attribute table from
  `generate/html.ts`; `test/ppx` and `test/does_not_compile.t` for a label
  given twice and a narrowed type.
- [ ] 2. Every port's part given its element, handlers composed,
  `Close_button.Icon` and `List_box.Load_more_item` given `class_`; the
  attributes test over every part. Styling's "Not yet" goes.
- [ ] 3. `as_` in the Kobalte binding and on every port's part; a
  router-link example on Link's and Button's pages. Composition's "Not yet"
  goes.
- [ ] 4. Children of state on each part HeroUI gives a render function,
  tested against the React twin's render function.
- [ ] 5. `Theme`, its example on the Theming page, tested in jsdom.
- [ ] 6. A toast's motion under `data-reduce-motion`.

## Verification

`make test` and `make lint`; the attributes test over every part; each
port's twin test unchanged; the docs pages' examples of `style`, `as_`, a
state child and `Theme` built and seen in a browser beside heroui.com's.

## Open

- **The spelling of the element**: `[@@element button]` beside the
  function, or a parameter of the extension. Blocks stage 1.
- **Whether `as_` is typed by its element**, a component of a `<button>`'s
  props for a button, or of any props. A typed one refuses an `<a>` where a
  `<button>` belongs, as HeroUI only warns; it needs the element's props as
  a type, which `Html` does not yet give. Blocks stage 3.

## Where the facts go

| Fact | Goes to |
|---|---|
| that a part takes every attribute, `as_` and a state child | `README.md`, and the Styling and Composition pages |
| each part's element, state record and `as_` | its `.mli` |
| the two rules | `AGENTS.md` |
| `[@@element]` | `ppx/ppx_solidtype.mli` |
| `Theme` | its `.mli` and the Theming page |
| each release's change | `CHANGES.md` |
