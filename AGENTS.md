# AGENTS.md

solidtype is an OCaml library of Hypha Stack: Solid, typed, for OCaml front
ends on SolidJS and Kobalte, compiled by Melange. A component is written in
OCaml's JSX (`.mlx`), and reaches the browser as the code Solid's own
compiler emits for the same JSX. `ppx_solidtype` lowers the JSX;
`vite-plugin-solidtype` hands it to Solid's compiler. Each JavaScript
library bound is an opam package of its own: `solidtype` binds Solid,
`solidtype-kobalte` Kobalte; `solidtype-heroui` ports HeroUI's design onto
Kobalte by hand, since HeroUI's components are React's. This file is for anyone changing it, human or
agent. Users start at [README.md](README.md).

## Commands

```sh
make setup    # once: the switch hypha-solidtype, all dependencies, and Bun's
make test     # the ppx's lowering, each island against its twin, the example's tests
make lint     # formatting, the plugin's and the generators' types, the release
              # build, and the generated bindings
make fmt      # format in place
make example  # the board, built by Vite into _build/example-dist, and its
              # Astro page, into _build/example-astro
make serve    # the board and its API, served on http://localhost:4420
make dev      # the three commands that run the board in development
make docs     # the documentation, built by Astro into _build/docs
make docs-serve # the documentation, served on DOCS_PORT as it changes
```

The plugin and the example run on Bun 1.3 or later: JavaScript here only
builds and tests, and Bun installs, runs and tests it as one binary.

## Layout

```
src/                 solidtype, for Melange alone
  jsx                the markers the ppx writes and the plugin rewrites
  check              the types of a component's props check
  solid              Solid's reactive core, solid-js
  web                its renderer in the browser, solid-js/web
  server             its rendering on the server, a module of its own so a
                     browser build never names what Solid's browser build lacks
  store              its stores, solid-js/store
  for index show switch match suspense suspenseList errorBoundary
  dynamic portal noHydration hydration hydrationScript assets
                     Solid's components, one module each, named as Solid
                     names them
  context            a context, as a module made by a functor
  html               each element's attributes, generated
kobalte/             solidtype-kobalte: Kobalte's components part by part,
                     its hooks, values and the types they name, generated
heroui/              solidtype-heroui: HeroUI's components ported by hand onto
                     Kobalte's, one module each
  styles             HeroUI's variant functions, the classes of each look,
                     generated
  interaction        the state React Aria writes on an element and HeroUI's
                     styles read, kept as React Aria keeps it
  field              what a switch, a checkbox and a radio share: the state
                     their content declares, a value controlled or kept, and
                     the content, on a Kobalte component's label and input
docs/                the documentation, a Starlight site: each port's page
                     shows it beside the same component in React, with its
                     source
  islands/           the pages' OCaml: each demo, and the comparison of a
                     port's element with React's, attribute by attribute
  islands/react/     HeroUI's components in React, rendered into a host
                     an island owns: the one place the documentation runs
                     React
generate/            what writes the generated bindings from Solid's and
                     Kobalte's own types: `make generate`
  names              the one spelling of a name, shared by both
  program            the browser's library both read declarations under,
                     with no ambient types: Bun's own would join it
  melange            what both read of Melange and write for it: Dom's
                     types, a type that admits any string, a literal a tag
  output             a generator's files written, or checked by `--check`
  ocaml              an OCaml type as a generator builds it, and its one
                     printer
  source             an OCaml file and its interface, written side by side
  binding            the core of a binding of a TypeScript library of Solid
                     components: its types mapped, its parts, functions and
                     values bound, and the types they name, each a module;
                     a library's generator says only what is its own
  kobalte            Kobalte's: which entries, how its parts and options are
                     named, its shared props, roots split by `multiple`
  heroui             HeroUI's variant functions, from @heroui/styles
ppx/                 ppx_solidtype: MLX's JSX lowered to the markers
  html_names         the attributes and props whose JavaScript name the
  kobalte_names      rule's inverse does not give, generated
vite-plugin/         vite-plugin-solidtype, strict TypeScript over Babel
  src/index          the plugin Vite runs: a .jsx module's markers rewritten
  src/rewrite        the markers rewritten into Solid's JSX
  src/markers        what a build without the plugin reaches: an error
  pack               the plugin compiled and packed, as a release ships it
  test/twin          each example island through Solid's compiler -- for
                     the browser, hydratable, and for the server -- beside
                     its TSX twin
  test/rewrite       what the plugin writes for a marker form
  test/browser       every module of the libraries built for the browser,
                     each import found in Solid's and Kobalte's browser build
  test/astro         the example's Astro page built: it holds the board
                     prerendered, to hydrate
  test/docs          the documentation built, React's compiler beside
                     Solid's: a port's page holds it prerendered, to hydrate
astro.config.mjs     the example's Astro page: Astro, its Solid
                     integration and the plugin, rooted here so a page
                     reaches _build
vitest.config.ts     the OCaml tests, as three projects: the browser's in
                     jsdom, the example's server started for them; the
                     server's in Node; and hydration, compiled hydratable
example/             a kanban board: a whole application on the
                     stack, its README the map and the rough edges found
                     building it
  index.html         the page, built by Vite with vite.config.ts
  pages/             the same board as an Astro page: wiring alone
  src/               the board's islands in .mlx, and api.ml, its client
                     printed from server/ as the build runs
  server/            a Spindle app: the tasks' store, the routes over it,
                     which the board is called against and `make serve`
                     serves, their tests, and their command line,
                     Spindle's, which prints the board's client and the
                     twins' schemas
  twin/              each island's TSX twin, read by the twin test alone;
                     board.gen.ts, the server's Zod schemas, compared
  test/              the board's behaviour, in OCaml, run by vitest
                     against the server server.ts starts
test/jsdom.ts        what jsdom lacks, stood in for in every vitest file
test/browser/        Solid's bindings in a browser, in OCaml, run by vitest
test/server/         Solid's rendering on the server, in OCaml, run by vitest
                     in Node
test/hydration/      an island rendered on the server and hydrated by
                     Web.hydrate, in a vitest project of Solid's hydratable
                     compile; setup.ts renders it through Vite's server loading
test/kobalte/        each Kobalte component in OCaml beside its TSX twin in
                     twins/, the same checks and an axe scan on both
test/heroui/         each HeroUI port's classes and behaviour, in OCaml, run
                     by vitest, and its state beside the same component in
                     React, its twin in twins/; and the variant functions,
                     each against HeroUI's own call
test/ppx/            what the ppx writes for each JSX form
test/does_not_compile.t
                     each mistake the types refuse, built against the
                     installed library, with the error a user reads
```

Each module's contract is its `.mli`. Read the `.mli` before changing a
module.

## The pipeline

MLX parses `.mlx` into OCaml with each element marked `[@JSX]`.
`ppx_solidtype` lowers each one to a call of `Solidtype.Jsx`: a literal,
an element, a handler (`on_` and its event), a function or a name static,
anything else a thunk, so a read outside a thunk does not compile; an
optional prop, `?name=`, a thunk of an option, `undefined` while it is
`None`, and `?name:` in the check, so a required prop refuses it; a
name is given back its JavaScript spelling, and a value wrapped in one
of Solid's namespaces, `Jsx.native` and the others, its namespace; a function prop that takes no
argument is therefore written `(fun _ -> ...)`. A string literal, however
quoted, becomes a JavaScript string, `{js|...|js}`, its backslashes
doubled, since Melange reads any other as bytes and reads escapes in
that one; one written `{js|...|js}` is left as it is. An element's attributes are
annotated with their types; a component's element also applies the
component's `Props.check` to its props under `if false`, which the
compiler checks and Melange drops, and binds each prop that can hold JSX
once, to name it in both. `let%component` writes a component's `Props`
from its labelled parameters. The library's own components are `.mlx`
too, lowered with `ppx_solidtype -internal`, which names the library's
modules without `Solidtype.`, a name the library itself cannot use. Melange compiles the calls as
calls, through one import of `vite-plugin-solidtype/markers`. The plugin
rewrites each into JSX -- a function the ppx bound back where it is
used, a thunk into what it returns, a return-only `if` into a
conditional, a string into JSX's own text or quoted attribute only where
JSX reads it back unchanged, else `{"..."}` -- and `vite-plugin-solid` compiles that JSX as
it compiles TSX: for the browser, and under Astro's build for the server
and hydratable too, so an island is prerendered and hydrates as its twin
would.

## Rules that must hold

Each rule comes with why it exists and the test or search that catches a
break.

- **An island compiles as its TSX twin does.** Solid's compiler makes the
  same templates and the same runtime calls, in order, from an island's
  rewritten output as from its twin, the three ways Astro's integration
  runs it: for the browser, hydratable, and for the server. Why: the
  library promises Solid's own output, and a rewrite that drifts is a
  slower or a wrong page nobody sees in a type; a prerendered island
  hydrates because its server and client outputs agree with the twin's.
  Test: `vite-plugin/test/twin.test.ts`; an island added to `example/src`
  gets a twin and a row there.
- **An island mounts in an Astro page as any Solid island does**,
  `client:only` or prerendered `client:load`, imported by its namespace
  from Melange's output, `<App.make client:load />`; the page holds
  wiring alone. Why: an application on the stack may build its pages
  with Astro, and the plugin must run under its server build as under its
  client's. Test: `vite-plugin/test/astro.test.ts`, which builds the site.
- **A reactive value in a dynamic position is a thunk, and the types say
  so.** Why: a read hoisted out of Solid's tracking scope stops updating
  without a sound. Test: `test/does_not_compile.t`.
- **A component's props are its `Props.check`**, a function with one
  labelled argument per prop, optional where the prop is, ending in
  `()`: a value prop as a `Check.value`, a function prop as the
  function, children as `Check.children` of the kinds the component
  takes -- elements, a function it calls, or either. The ppx applies it under
  `if false`, so it writes nothing. Why: a prop left out, a prop the
  component does not take, and two props of one type variable that
  disagree are compile errors, as in TSX, and a function given where a
  thunk belongs cannot be called as one. Test: `test/does_not_compile.t`.
- **Only the ppx writes a marker, and the plugin reads only markers.**
  The plugin finds them by their import alone. It reads Melange's shapes
  only to put a function back where it is used -- a thunk's returned
  expression, a return-only `if`, a `const` bound to a function and used
  once -- and calls any function it does not recognise, which is always
  correct. Why: the rewrite keeps its meaning because it reads
  one shape it owns. Symptom: `rg -n 'Jsx\.(el|c|s|d|spread|dynamic|render)\b'
  example src` finds a call written by hand.
- **A reactive read is a plain call.** An accessor is an uncurried
  JavaScript function and `Solid.get` is inlined, so `Solid.get count`
  is `count()`, the call Solid's own JSX makes. Why: a curried read is
  `Curry._1(count, undefined)`, an arity check on every read. Test: the
  twin test.
- **The library has no private modules.** Why: Melange then loses what it
  knows of a module across libraries, so a user's every call into the
  library goes through `Curry` and `Solid.get` is no longer inlined. A
  helper two modules need is public, or a copy in each. Symptom:
  `rg -n Curry _build/default/example/out/example/src` finds a call into
  `Solidtype__`.
- **A test Solid reads for truth is a `bool`, never an OCaml value.**
  `Show`, `Match` and a resource's source take a `bool` or an `option`
  the binding boxes. Why: Melange writes `Some 0`, `Some ""` and a first
  constant constructor as values JavaScript reads as false. Test:
  `test/browser/flow_test.mlx`, `Show.Some` given `Some 0`.
- **An attribute's type is generated from Solid's JSX types**, by
  `generate/html.ts` into `src/html.mli`, which nothing else writes and
  `ocamlformat` leaves alone. A TypeScript type that admits any string
  is `string`; a closed set of literals OCaml can name is a polymorphic
  variant, which Melange writes as those strings; a boolean, alone or as
  `"true"` and `"false"`, is `bool`; a number alone is `int`; a handler
  takes Melange's `Dom` event type, its generic one when Melange has
  none, and one Solid also takes in lower case, `onclick`, is bound once,
  `on_click`. Each element's signature also gives `'r check`, its attributes
  as optional arguments before `'r`, the tail of a check for a
  component that passes them on. Why: a hand-typed copy drifts from the
  version it binds. Test: `make lint` runs the generator with `--check`.
- **Every name a user writes is snake case, made by one rule** from the
  name in Solid's or Kobalte's documentation: a capital is an underscore
  and the lower case, a run of capitals one word, a hyphen an
  underscore, and a keyword takes a trailing underscore. The ppx gives a
  name back by the rule's inverse -- a capital after each underscore,
  but a hyphen after `aria_` and `data_` -- and by the tables the
  generators write of the names the inverse does not give,
  `stroke_width` and `is_svg`; a hand-written check names its props so
  too. Why: one convention reads as OCaml, and one rule lets the
  documentation read across. Test: the generators fail on a name two
  JavaScript names share, and `test/ppx` holds what each is given back.
- **A namespace of Solid's wraps the value, never the name**:
  `on_click=(Jsx.native f)` is `on:click={f}`, read by the ppx where it
  is written, in an element's attribute; each wrapper types its value.
  Why: a wrapper left out is Solid's default, never another namespace,
  and a label that spelt the namespace would let a slip change it
  unseen. Test: `test/does_not_compile.t`.
- **A `data-` attribute is declared, never written by hand.** Its value is
  a `Jsx.data`, a string or JavaScript's `undefined`, which Solid leaves
  out: `Jsx.flag b` is `"true"` or nothing, React Aria's convention. The
  ppx takes `data_*` on an element and on a component, which passes it on
  to its element, outside the component's check, as TSX leaves a
  hyphenated attribute unchecked. A port's state -- `data-hovered`,
  `data-selected` -- is so declared, and `heroui/interaction` only
  listens. Why: an attribute Solid writes is in the HTML a page is
  prerendered with and never races one the component writes itself; one
  set from a `ref` is neither. Test: `test/server/data_attributes_test.mlx`,
  `test/does_not_compile.t`, and each port's test against its React twin.
- **A spread is `props=p`, and no prop is named `props`.** MLX has no
  syntax for TSX's `{...p}` and writes every attribute as an OCaml label,
  so a spread takes one name: the ppx reads it as a spread on an element
  or a component, each check takes it beside the props, `Dynamic` is
  given its component's props by it, and a component's parameter may not
  take it. Why: one name kept from props, as JSX keeps `key` and `ref`,
  lets a spread read as JSX; a prop of the same name would be a duplicate
  label, reported far from its cause. Test: `test/does_not_compile.t`.
- **Kobalte's binding is generated from its declarations**, by
  `generate/kobalte.ts` into `kobalte/solidtype_kobalte.ml` and the types it
  names into `kobalte/types.ml`, a file of their own so Melange calls their
  functions directly from another library, each with its `.mli`, which
  leaves out the raw external under a wrapper, read with TypeScript's
  checker from Kobalte's real path, so a package manager that keeps
  dependencies beside each package resolves them. A part is a module of
  its component and its check: its own options, then its children by
  kind, then its element's attributes' `check`, an `external` nothing
  calls. Its options map as an element's attributes do, and further: a
  number is a `float`, since a slider's value is fractional; `null` is
  `Js.Nullable.t`, since Kobalte reads `undefined` as uncontrolled and
  `null` as controlled and empty; `undefined` is absence for an optional
  prop, an optional argument, `?name`, then `()`, for a function the user
  calls, and an `option` anywhere else; members of different JavaScript
  kinds are `Types.Either.t`, built by `left` and `right`, which is each
  value as it is; an option accessor that takes a key or a function
  takes the function, and one that takes only a key,
  `optionGroupChildren`, a `string`; a root whose value turns on
  `multiple` is two modules, `Root` and `Root_multiple`; a named object
  type is a module of `Types`, with a getter per field, a curried
  wrapper per function it holds and a constructor where it has neither
  methods nor a class. A member typed `any` is not bound, nor one whose
  value would be a type its caller chooses, an unchecked cast, and nor are
  Kobalte's building blocks, menu, popper, dismissable-layer and
  polymorphic. Why: Kobalte's parts are hundreds, and a binding by hand
  would be a second copy of its types. Test: `make lint` runs the
  generator with `--check`.
- **HeroUI's variant functions are generated from @heroui/styles'
  declarations**, by `generate/heroui.ts` into `heroui/styles.ml` and its
  `.mli`, on the same core as Kobalte's: a module per function,
  `buttonVariants` is `Styles.Button`, with `options`, its variants as
  optional arguments and `class_`, and `classes`, its class string, or for
  a component of several parts `slots` and a string per part. A variant
  whose keys are `true` and `false` is a `bool`; any other is its keys as
  tags by the one spelling rule, a space taken as a hyphen, each named by
  `[@mel.as]`, since Melange writes `undefined` for a tag left unnamed where
  others are. HeroUI's components are React's and are ported by hand;
  only their classes are bound. Why: a port's look is HeroUI's own
  classes, never a copy of them. Test: `make lint` runs the generator with
  `--check`, and `test/heroui/styles_test.ml` checks calls against
  HeroUI's own.
- **Each Kobalte component is tested against its TSX twin.** Its test
  renders the OCaml island and the twin and runs one check on both --
  roles, names, state attributes, the pattern's keys -- and axe on both;
  a twin imports Kobalte's namespace, `import * as Switch`, whose
  members are the parts. Why: the library promises Kobalte's behaviour
  and accessibility, which only a running component shows. Symptom: a
  component of `kobalte/solidtype_kobalte.ml` with no
  `test/kobalte/*_test.mlx`.
- **A component is a value.** A binding's part is an `external` of type
  `_ Jsx.component`, never a function type, and an OCaml component is
  `Jsx.component make`. Why: Melange wraps an external function used as
  a value in a closure, which no JSX tag can name.
- **Tests of what runs in a browser are OCaml, run by vitest.** Alcotest
  does not build for Melange; `melange-jest` reaches the globals vitest
  shares with Jest. The ppx, native, is tested by its expectations. Why:
  a test in TypeScript would reach a component through the names Melange
  emits. Symptom: a `.test.ts` or `.test.tsx` that imports an OCaml
  module.
- **The opens are the ppx's `Ppxlib`**, which every ppxlib rewriter opens
  to build the AST it writes, and its `Result.Syntax`, whose `let*` chains
  the results it builds, **and a test library's `Syntax`**
  (`Testing.Syntax`, `Harness.Syntax`), whose `let*` awaits a promise as
  `MELANGE.md` lets a test. Symptom: `rg -n '^\s*open ' src ppx example
  test | rg -v 'open (Ppxlib|Syntax|\w+\.Syntax)$'` finds any other.

## Changes and releases

Its opam packages and the Vite plugin are released together, at one
version, so a binding and the plugin that reads its markers never
disagree. The plugin is compiled and packed by `vite-plugin/pack.ts` and
attached to the GitHub release by `.github/workflows/release.yml`, which
an application names by its URL.
