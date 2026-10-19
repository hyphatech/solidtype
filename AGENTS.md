# AGENTS.md

solidtype is Solid, typed: OCaml front ends on SolidJS and Kobalte,
compiled by Melange. A component is written in OCaml's JSX (`.mlx`), and
reaches the browser as the code Solid's own compiler emits for the same
JSX. `ppx_solidtype` lowers the JSX; `vite-plugin-solidtype` hands it to
Solid's compiler. Each JavaScript library bound is an opam package of
its own: `solidtype` binds Solid, `solidtype-kobalte` Kobalte. This file is for anyone changing it, human or agent.
Users start at [README.md](README.md).

## Commands

```sh
make setup    # once: the switch hypha-solidtype, all dependencies, and Bun's
make test     # the ppx's lowering, each island against its twin, the example's tests
make lint     # formatting, the plugin's types, the release build, and the generated bindings
make fmt      # format in place
make example  # the example site, built by Astro into _build/example-dist
make serve    # the example site and its notes, served on http://localhost:4321
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
generate/            what writes the generated bindings from Solid's and
                     Kobalte's own types: `make generate`
  names              the one spelling of a name, shared by both
ppx/                 ppx_solidtype: MLX's JSX lowered to the markers
  html_names         the attributes and props whose JavaScript name the
  kobalte_names      rule's inverse does not give, generated
vite-plugin/         vite-plugin-solidtype, strict TypeScript over Babel
  src/rewrite        the markers rewritten into Solid's JSX
  src/markers        what a build without the plugin reaches: an error
  pack               the plugin compiled and packed, as a release ships it
  test/twin          each example island through Solid's compiler -- for
                     the browser, hydratable, and for the server -- beside
                     its TSX twin
  test/rewrite       what the plugin writes for a marker form
  test/browser       every module of the libraries built for the browser,
                     each import found in Solid's and Kobalte's browser build
  test/astro         the example site built: its page holds the
                     prerendered island, and the client:only one's mount
astro.config.mjs     the example site: Astro, its Solid integration and
                     the plugin, rooted here so a page reaches _build
example/
  pages/             the site's page, Astro: wiring alone, mounting each
                     island from Melange's output
  src/               islands in .mlx, and api.ml, the notes' client printed
                     from server/ as the build runs
  server/            the notes, a Spindle app: their routes, what the
                     notes island is called against and `make serve`
                     serves, and their command line, Spindle's, which
                     prints the island's client and the twin's schemas
  twin/              each island's TSX twin, read by the twin test alone;
                     notes.gen.ts, the server's Zod schemas, compared
  test/              the islands' behaviour, in OCaml, run by vitest, the
                     notes against the server server.ts starts
test/browser/        Solid's bindings in a browser, in OCaml, run by vitest
test/kobalte/        each Kobalte component in OCaml beside its TSX twin in
                     twins/, the same checks and an axe scan on both
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
an element, a handler (`on_` and its event) or a function static,
anything else a thunk, so a read outside a thunk does not compile; a
name is given back its JavaScript spelling, and a value wrapped in one
of Solid's namespaces, `Jsx.native` and the others, its namespace; a function prop that takes no
argument is therefore written `(fun _ -> ...)`. A string literal becomes a
JavaScript string, `{js|...|js}`, since Melange reads an OCaml one as
bytes. An element's attributes are
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
conditional -- and `vite-plugin-solid` compiles that JSX as
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
  from Melange's output, `<Counter.make client:load />`; the page holds
  wiring alone. Why: Astro builds the pages an application on the stack
  serves, and the plugin must run under its server build as under its
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
- **Kobalte's binding is generated from its declarations**, by
  `generate/kobalte.ts` into `kobalte/solidtype_kobalte.ml`, read with TypeScript's
  checker from Kobalte's real path, so a package manager that keeps
  dependencies beside each package resolves them. A part is a module of
  its component and its check: its own options, then its children by
  kind, then its element's attributes' `check`, an `external` nothing
  calls. Its options map as an element's attributes do, and further: a
  number is a `float`, since a slider's value is fractional; `null` is
  `Js.Nullable.t`, since Kobalte reads `undefined` as uncontrolled and
  `null` as controlled and empty; `undefined` is absence for an optional
  prop and an `option` anywhere else; members of different JavaScript
  kinds are `Types.Either.t`, built by `left` and `right`, which is each
  value as it is; an option accessor that takes a key or a function
  takes the function, and one that takes only a key,
  `optionGroupChildren`, a `string`; a root whose value turns on
  `multiple` is two modules, `Root` and `Root_multiple`; a named object
  type is a module of `Types`, with a getter per field, a curried
  wrapper per function it holds and a constructor where it has neither
  methods nor a class. A member typed `any` is not bound, and nor are
  Kobalte's building blocks, menu, popper, dismissable-layer and
  polymorphic. Why: Kobalte's parts are hundreds, and a binding by hand
  would be a second copy of its types. Test: `make lint` runs the
  generator with `--check`.
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
  to build the AST it writes. Symptom: `rg -n '\bopen ' src ppx example`
  finds any other.

## House style

The house style, the OCaml checklist and the OCaml tools are
[OCAML.md](OCAML.md), the same in every Hypha OCaml repository and changed
in all of them together, never in one. It is imported here, so it is read
with this file:

@OCAML.md

## Git

How work becomes a commit -- its format, where it happens, what is pushed
-- is [GIT.md](GIT.md), the same in every Hypha repository and changed in
all of them together, never in one. It is imported here, so it is read
with this file:

@GIT.md

## Changes and releases

How a change reaches the library's users -- its line in `CHANGES.md`, what
is breaking, how a release is tagged and published -- is
[LIBRARY.md](LIBRARY.md), the same in every Hypha library and changed in
all of them together, never in one. It is imported here, so it is read
with this file:

@LIBRARY.md

Its opam packages and the Vite plugin are released together, at one
version, so a binding and the plugin that reads its markers never
disagree. The plugin is compiled and packed by `vite-plugin/pack.ts` and
attached to the GitHub release by `.github/workflows/release.yml`, which
an application names by its URL.
