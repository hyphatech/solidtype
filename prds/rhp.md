# rhp's charts, bound

**Status: Accepted** — a new package, `solidtype-rhp`, half generated from rhp's declarations and half ported by hand, with a docs page per component; the first stage, the main components and their pages, has landed.
Date: 2026-10-30

## The problem

solidtype has Solid, Kobalte and HeroUI's design, but nothing to draw a
chart with. The owner wants rhp, "reactive html plots" (`@bezda/rhp`
2.2), in the ecosystem beside Kobalte and HeroUI. rhp draws a chart as
HTML elements placed by CSS, from Solid components: a `Chart` holds
`Plot`s, a `Plot` draws one **slat**, a function of one row `d`, for each
row of its data, and a slat is made of **blocks**, `Bar`, `Dot`, `Tick`,
`Label`, `Cell`, `Place`, `Area` and `Line`.

rhp is Solid's own, as Kobalte is, so its components can be bound and
compiled as Solid compiles them, rather than ported as HeroUI's are. The
owner also sees it as the chance to make the generator serve a second
library of a different shape: Kobalte's declarations follow Kobalte's
conventions, `<Part>Options` and `ComponentProps<"div">`, which the
binding core reads today as if every library had them.

## Scope

It covers rhp's whole public surface, `@bezda/rhp`'s `index.d.ts` and
`manydots.d.ts` at 2.2: its fourteen components, its functions -- the
data helpers, `shape`, `slat`, `restyle`, the page-wide switches, the
timing functions -- its theme and the types they name, as one opam
package, `solidtype-rhp`, released with the others; a documentation
section for it; and the generator's changes it needs. It touches this
repository alone.

It does not cover `@bezda/rhp/standalone` or `@bezda/rhp-react`, which
bundle Solid or wrap it in React; rhp's AI kit, its skill and its
checker; `posters.css`'s looks, which a page links itself; or changes to
rhp: no fork, no patch, no upstream work.

## User scenarios

1. **An application draws a bar chart.** It gives a `Plot` an array of
   OCaml records as its rows and a slat that reads `d`'s fields, and the
   chart redraws only what a changed row reads. *Accepted when* the
   example in rhp's README, written in OCaml, compiles to the templates
   and calls rhp's own JSX compiles to, the three ways Astro compiles it.
2. **A slat reads a field its row lacks**, or gives `Bar` a string where
   `to` takes a number. *Accepted when* both are compile errors, held in
   `test/does_not_compile.t`.
3. **An application draws a scatter plot and a line chart** on a
   `Chart` with a `cross` scale, with `Dot`, `Line` and `ManyDots`, its
   ticks a step, `every 5.`, and its colors theme keys. *Accepted when*
   its test renders it beside the same chart in rhp's JSX, and each
   element's attributes and CSS variables agree.
4. **A chart is prerendered.** An Astro page holds a chart rendered on
   the server, with the CSS rhp's server writes, and hydrates it.
   *Accepted when* the hydration project renders and hydrates it with no
   mismatch, and the docs' build prerenders each chart page.
5. **rhp releases a version.** *Accepted when* `make generate` either
   writes the new types or fails naming each declaration it can no
   longer bind whole, and nothing is bound half.

## Requirements

- **FR-1** Every component and function rhp exports has a binding, its
  props and arguments named as rhp's documentation names them, by
  solidtype's one spelling rule.
- **FR-2** A slat's row is typed: its fields are the row type's, and a
  read of one is the plain property read rhp's proxy tracks.
- **FR-3** A chart compiles to what rhp's own JSX compiles to, for the
  browser, hydratable and for the server.
- **FR-4** What can be generated from rhp's declarations is, and is
  checked by `make lint`; what cannot be generated robustly is ported by
  hand, and the generator knows which, so no binding is ever half
  generated.
- **FR-5** The generator's core serves a library of plain `Props`
  interfaces as it serves Kobalte, and Kobalte's binding is unchanged by
  the work.
- **FR-6** Each component has a page in the docs, as each HeroUI port
  has: its live examples, their source, its props, and a link to the
  page of rhp's own documentation it follows, which stays the reference
  for what a prop does.
- **FR-7** A value a chart may lack is written as OCaml writes one it
  may lack, an option, and draws nothing, as rhp's missing value does.

## Design

### What rhp's declarations are

`index.d.ts` is written by hand, 418 lines, over rhp's JavaScript. It is
regular where it matters: each component is `export function X(props:
XProps)` or `export const X: (props: XProps) => JSX.Element`, each props
interface its own, a block's extending `Omit<JSX.HTMLAttributes<
HTMLDivElement>, "color" | "style">` and `Line`'s and `Area`'s
`JSX.SvgSVGAttributes<SVGSVGElement>`. Most props are numbers, string
literals, booleans, functions and object types the core maps today. A
few are not, and they are where this design splits the work.

### Generated, or ported by hand

The line is robustness, not effort: a declaration is generated when the
core's existing mappings, made general, bind it whole and would bind
rhp's next version the same way; anything else is a careful hand port,
reviewed as code, with a test against rhp's own JSX. A part is generated
whole or ported whole: the generator fails, naming the member, where a
part it is asked to generate has a member it cannot map, rather than
leaving the member out as it does today for Kobalte's `any`.

**Generated**, into `rhp/solidtype_rhp.ml` and `rhp/types.ml`, each with
its `.mli`, as Kobalte's are:

- `Chart`, `Bar`, `Dot`, `Tick`, `Cell`, `Place`, `Label`, `Line`,
  `Area`, `Poster`, `Theme`, `Axis`: each a module, its `Props.check` its
  own props, then children, then its element's attributes' `check`,
  `Html.Div`, `Html.Svg` or `Html.Figure`; `Chart`, `Theme` and `Axis`,
  which pass no attributes on, their own props alone.
- The data helpers, `extent`, `every`, `nice`, `summary`, `bins`,
  `density`; and `linked_css`, `no_css_guard`, `inherit_position`,
  `drawing`, `animated`, `curve`, `at`, `use_orientation`, `theme`.
- The object types they name: `ThemeValues`, `RequiredThemeValues`,
  `Timing`, and the options and results of the helpers, each a module of
  `Types` with getters and `make`.

**Ported by hand**, a module each beside the generated file, each named
to the generator so it neither binds them nor fails on them:

| Module | Why by hand |
|---|---|
| `Row` | `Row<T>` is `Readonly<T> & { index; position }`, the row proxy: an OCaml `'r Row.t`, with `data : 'r Row.t -> 'r` (`%identity`, so `(Row.data d).sold` is `d.sold`, the tracked read), `index` and `position`. A mapping of "an intersection with a type parameter" would be a rule written for this one type. |
| `Plot` | Its props are its settings and **any other name, a data group**, `[group: string]: unknown`: no declaration says which, so no generator can. Its children are `Slat<T> \| ((d: Row<T>) => JSX.Element)`, its rows `readonly object[]` untyped. The port's check ties `rows: 'r array` to `children: 'r Row.t -> element`. |
| `Scale` | Children a slat over `Row<ScaleTick>`, the same machinery as `Plot`'s. |
| `Slat` | `slat` is two overloads, `slat(fn)` returning `fn` and `slat(layout, fn)` a new function; an external with an optional first argument would call `slat(undefined, fn)`, which throws. Its result is a function with properties attached, its layout's sizes a number, a CSS length, or one of either per orientation. The port is `Slat.make ?css ?thickness ?inset ?room fn`, and a slat is the function, `'r Row.t -> Jsx.element`. |
| `Shape` | `ShapeCommand` is a union of tuples headed by literals, `["M", x, y]`; the port is a constructor per command, `Shape.l x y`, and `Shape.make x y commands`, which starts with the move rhp throws without, so it cannot fail. |
| `Ticks`, `Ease` | Unions of three and four JavaScript kinds: ticks are values, a count, a function of the scale, or `false`. A constructor per kind, `Ticks.values`, `Ticks.count`, `Ticks.custom`, `Ticks.none`. |
| `Color` | `` `series-${number}` `` and seven keys beside `string & {}`: any string, by the rule, which would lose the keys a user should find. `Color.series 1`, `Color.positive`, `Color.css "#c00"`. |
| `stack_up`, `shares`, `running` | Each two overloads, one over numbers and one over values that may be missing, whose results differ; the port is the second, taking and giving `float option array`. |
| `Many_dots` | Experimental in rhp, each prop a value or a function of the row, generic over the row: the same row machinery as `Plot`'s. |

The generator is told these as types it does not map -- `Row`, `Shape`,
`Ticks`, `Ease`, `Color`, and `Value`, `Point` and rhp's `Ref` -- and maps
each to the hand module's `t` or its OCaml type, so `Chart`'s `ticks` is
generated as `Ticks.t` and `Bar`'s `shape` as `Shape.t`: a generated part
names a hand-ported type without being ported itself. The exports it does
not bind -- `Plot`, `Scale`, `ManyDots`, `slat`, `shape`, `restyle`,
`stackUp`, `shares`, `running`, `sortBy`, `series`, `cycle` -- are a list in
`generate/rhp.ts`, beside the reason.

### What the generator gains

Each a general rule, written once in `generate/binding.ts`, under which
Kobalte's and HeroUI's output stays byte for byte as it was:

- **A part's element and props given by its library.** `part` takes them
  from the library's generator, which knows them, in place of Kobalte's
  shapes of a declaration: rhp's reads the element from the attributes a
  props type extends, `JSX.HTMLAttributes<HTMLDivElement>` a `div` and
  `JSX.SvgSVGAttributes<SVGSVGElement>` an `svg`, under `Omit` too, and its
  own props, those declared in rhp's file, come first in the check, so an
  omitted attribute of the same name is shadowed, since OCaml applies the
  first of two equal labels.
- **Types a library ports by hand**: a function from a declared type to
  an OCaml type, which the mapping asks before its rules, and asks of an
  optional prop's or parameter's declared type too, whose alias the union
  with `undefined` has lost.
- **`Required<T>`** is a type of its own, named for both,
  `RequiredThemeValues`, its fields not options.
- **A function that returns one**, `every(step)`: Melange counts an
  external's arguments through the parentheses of its result, so the
  external returns it uncurried and the binding wraps it once, curried, and
  one that may throw raises where it is called.
- **A package a comment names**, `@bezda/rhp/rhp.css`, is kept in the
  comment, where TypeScript reads it as a tag.
- **`throws` read in any case**: rhp documents `every` as "throws".
- **A names table per library**, `ppx/rhp_names.ml` beside
  `kobalte_names.ml`, which the ppx reads with the others.

The failure on what no rule maps is `generate/rhp.ts`'s own, after the
core has bound what it can.

A literal set with a keyword in it, `Label`'s `"start" | "end"`, stays a
`string`, as `generate/html.ts` has it: a tag `` `end_ `` named
`[@mel.as "end"]` would be written as `"end_"` in a prop, since Melange
reads `[@mel.as]` in an external's own arguments alone.

Rejected here, as too clever for what they buy: mapping an intersection
with a type parameter, discriminated tuple unions, unions of three or
more kinds as generated modules, and choosing among overloads by
assignability. Each would be one library's type turned into a rule, and
each has one or two uses in rhp, ported above.

### Rows

A row is an OCaml record, which Melange writes as a JavaScript object of
the same fields, and `rows` takes an array of them; rhp's proxy reads a
field when the slat reads it, so a field read inside a thunk tracks:

```ocaml
type fruit = { name : string; sold : float }

let fruit =
  Slat.make ~thickness:(Slat.number 32.)
    ~room:(Slat.room ~start:(Slat.px 80.) ~end_:(Slat.px 40.) ())
    (fun d ->
      let f = Row.data d in
      <div>
        <Label edge="start">(fun () -> Jsx.string f.name)</Label>
        <Bar to_=(fun () -> f.sold) />
      </div>)

let make () =
  <Chart scale=(fun () -> (0., 30.))>
    <Plot rows=(fun () -> fruits) render=fruit />
  </Chart>
```

`let f = Row.data d` is the identity, so `f.sold` is still `d.sold` on the
proxy, read when the thunk runs. A slat's layout is its labelled
arguments, each size a number or a CSS length, for both orientations or
for each, which a phantom kind keeps from being given per orientation
twice.

A slat made by `Slat.make` is given by name, `render=fruit`, since rhp
reads its layout from the function itself, which a function child written
in place, `(fun d -> fruit d)`, would not have. The ppx reads `render=f` as
the component's only child, its render function, checked and passed as a
function child is. `children=f` was tried first and refused: MLX names a
component's children `children`, and ocamlformat cannot print an attribute
of the same name beside them.

A row is all a `Plot` takes, for now. rhp also takes **columns**: any
prop a `Plot` does not know is a data group, a list with one item per
row, `<Plot name={["Apples", "Bananas"]} sold={[12, 18]}>`, or one value
for every row, or a function of the row, `color={series()}`; a slat
reads `d.sold` either way. A column's name is any name, which no check
can know, so typing them needs a JSX form of the ppx's own, relating each
column's list to a field of the row. Every chart rows draw, columns draw
too, and a column computed from the row is a field read in the slat; the
form waits for an application that asks.

### Missing values

rhp's `Value` is a number, or `null`, `undefined`, `NaN` or an infinity,
each a missing value, for which a block draws nothing. OCaml says a
value it may lack with an option, so the binding does:

- **A block's prop** is a `float`, and a value that may be missing is
  the optional prop, `?to_=(fun () -> sold)` with `sold : float option`,
  which the ppx already writes as `undefined` while it is `None`. Nothing
  new: a prop given a `float` reads as one.
- **A list of values**, a helper's samples or a line's points, is a
  `float option array`, which Melange writes as numbers and `undefined`.
- **A result that holds rhp's `null`**, `stack_up`'s, is converted by
  its hand port to a `float option array`, since Melange reads `null` as
  `Some`.

`generate/rhp.ts` maps `Value` so, a type it is told rather than one it
works out, and the core's `float Js.Nullable.t`, which every value would
have to be wrapped into, is not used.

### Documentation

A section of the docs, `docs/src/content/docs/rhp/`, a page per
component as HeroUI's section has: `Chart`, `Plot`, `Scale`, `Slat`,
each block, `Many_dots`, `Poster`, `Theme`, the helpers, and a page per
kind of chart rhp's examples draw -- a bar chart, a pie chart, a heatmap,
a candlestick, a waterfall and the others -- ported as islands. A page
shows each example live, its `.mlx` source, compiled by the build as
every island is, and its props; it holds no comparison with rhp's JSX,
since the binding draws what rhp draws and the twin test proves it.

Each page links to the page of rhp's documentation it follows, at
`rhp.vercel.app`: `Bar`'s to its reference of blocks and the guide to
blocks, the bar chart's to rhp's bar chart. rhp's pages stay the
reference for what a prop does; ours say how it is written in OCaml and
what of it differs, and never restate the rest.

### Tests

rhp is Solid's, so its twin is rhp's own JSX: each chart island in
`example/` or `docs/islands/` has its twin, and the twin test compiles
both the three ways and compares them, as it does the board's. A
behaviour test renders the island and the twin in jsdom and compares
each element's attributes and inline CSS variables; the hydration
project renders one chart on the server and hydrates it.

### Alternatives rejected

- **Generating everything**, `Plot` included: its data groups are no
  declaration, and its rows are `object`; the binding would be `Js.t`
  and casts, the types the library promises gone.
- **Porting everything by hand**: two thirds of rhp's surface maps by
  rules the core already has, and a hand copy drifts from rhp's
  declarations as a generated one cannot.
- **Data groups as columns**, rhp's `name={[...]} sold={[...]}`, typed by
  a ppx that relates each column's array to the row's field: a second
  JSX form for one component, and rows draw the same charts. Deferred,
  not refused: see Rows.
- **`float Js.Nullable.t` for a missing value**, as the core maps
  `null`: every value of every block wrapped, where an option is how
  OCaml already says it.
- **Pages beside rhp's own JSX**, as HeroUI's ports are beside React's:
  rhp is Solid, so both draw the same elements, which the twin test
  holds; the page links to rhp's instead.
- **A wrapper library of our own over rhp**, a chart API in OCaml's
  idiom: a second design to document, where rhp's documentation should
  read across.

## Stages

Reordered as the owner asked: the documentation and the main components
first, then the rest.

- [x] **The core, the package and the main components**: the core made
  general; `rhp/`, `generate/rhp.ts`, `solidtype-rhp`'s opam package; the
  hand ports `Row`, `Slat`, `Plot`, `Color`, `Ticks`, `Ease`, `Shape`, and
  `Value`'s mapping; the ppx's `render=f`; the docs' rhp section, with
  Chart, Plot, Slat, Bar and Label, each chart an island beside its twin.
- [ ] **The rest**: `Scale`, `Many_dots`, a plot's `order` with `sort_by`,
  `stack_up`, `shares`, `running`, `series`, `cycle` and `restyle`, each a
  hand port; a page for Dot, Tick, Cell, Place, Line, Area, Poster, Theme
  and the helpers, and one per kind of chart rhp's examples draw, ported as
  islands; a chart rendered on the server and hydrated in
  `test/hydration`.

## Verification

`make test` and `make lint` pass; `make generate` against rhp 2.2 writes
the generated half and fails on a scratch copy of `index.d.ts` given an
unmappable prop; `make docs` prerenders every chart page with no
warning; and each page seen in Chrome beside rhp.vercel.app's same chart
looks the same.

## Where the facts go

| Fact | Document |
|---|---|
| that charts can be drawn, and the package's state | `README.md` |
| the new package | `CHANGES.md` |
| the rules, the layout of `rhp/`, `generate/rhp.ts` and `test/rhp/` | `AGENTS.md` |
| each hand port's contract | its `.mli` |
| how a chart is written, each block, what differs from rhp's JSX | the pages under `docs/src/content/docs/rhp/` |
