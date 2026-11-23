# AGENTS.md

solidtype is an OCaml library of Hypha Stack: Solid, typed, for OCaml front
ends on SolidJS and Kobalte, compiled by Melange. A component is written in
OCaml's JSX (`.mlx`), and reaches the browser as the code Solid's own
compiler emits for the same JSX. `ppx_solidtype` lowers the JSX;
`vite-plugin-solidtype` hands it to Solid's compiler. This file is for anyone
changing it, human or agent. Users start at [README.md](README.md).

Each JavaScript library bound is an opam package of its own:

- `solidtype` binds Solid, and types each element's attributes;
- `solidtype-kobalte` binds Kobalte;
- `solidtype-headless` holds the components Kobalte lacks, made as Kobalte
  makes its own, of its hooks, with no style, and Kobalte's own where they
  need a fix;
- `solidtype-heroui` is a maintained port of HeroUI's components onto
  Kobalte's and those, since HeroUI's are React's;
- `solidtype-rhp` binds rhp's charts;
- `solidtype-internationalized-date` binds the dates HeroUI's date
  components take;
- `solidtype-gravity-icons` holds Gravity UI's icons, the set HeroUI's
  examples draw.

## Commands

```sh
make setup          # once: the switch solidtype, all dependencies, and Bun's
make test           # the ppx's lowering, the plugin's rewrite, the
                    # libraries' tests and the example's
make lint           # formatting, the plugin's and the generators' types,
                    # litany, the release build and the generated bindings
make fmt            # format in place
make generate       # write the generated bindings
make example        # the board, built by Vite into _build/example-dist, and
                    # its Astro page, into _build/example-astro
make example-serve  # the board and its API on http://localhost:4420, its
                    # tasks in BOARD_DB, example/board.db, migrated first
make docs           # the documentation site, built by Astro into
                    # _build/docs with odoc's reference, and agents/ from
                    # its pages
make docs-serve     # the site built, served on DOCS_PORT with search
make release VERSION=1.2.3  # tag and release
```

The plugin and the example run on Bun 1.3 or later: JavaScript here only
builds and tests, and Bun installs, runs and tests it as one binary.

## Layout

A module's `.mli` says what it is; this says where things are and what no
file says of itself.

```
src/               solidtype, for Melange alone: jsx, the markers; check, a
                   props check's types; arity, a JavaScript component's
                   function props of several arguments, called as OCaml
                   calls a function; solid, web, store and context;
                   server, apart so a browser build never names what Solid's
                   browser build lacks; Solid's components, a module each,
                   named as Solid names them; html, generated
kobalte/           solidtype-kobalte, generated: solidtype_kobalte, and
                   types, a file of its own so Melange calls its functions
                   directly from another library
headless/          solidtype-headless, a module per component: one Kobalte
                   lacks, or Kobalte's own under a fix
heroui/            solidtype-heroui, a module per port
  styles           HeroUI's variant functions, generated
  interaction field panel theme overlay dialog_frame status_icon
  selection_indicator
                   what several ports share
  <name>.css       the look of a component HeroUI ships no stylesheet for;
                   table.css, what HeroUI's table stylesheet does not draw
  extras.css       those stylesheets in the components layer
rhp/               solidtype-rhp: solidtype_rhp and types, generated, and a
                   module per declaration no rule maps, ported by hand
internationalized_date/ gravity_icons/
                   their packages, generated
generate/          the generators, `make generate`: a file per library
                   bound, saying only what is that library's own
  binding          what they share, which a generator binds a library by:
                   in library, the library and what a run has met of it;
                   in mapping, each rule that maps a type; in emit, a
                   part, a function and a value written; in types_file,
                   the types they name, each a module
  names ocaml output package program melange opam
                   the one spelling of a name; an OCaml type and a
                   declaration, and the one printer of each; files laid
                   out by ocamlformat, written or checked, and a run
                   refused; a package's
                   declarations and what they export; the browser's
                   library with no ambient types; what is read of
                   Melange; the switch
  generator        a generator as far as every one is alike: a package
                   read, its library bound, its files written or refused
  solid_html       Solid's elements and their attributes, which html
                   writes and a binding asks for an element's module
  test             what the core writes for a declaration, a rule each
ppx/               ppx_solidtype, and html_names, kobalte_names and
                   rhp_names, generated: the names whose JavaScript
                   spelling the rule's inverse does not give
vite-plugin/       vite-plugin-solidtype, strict TypeScript over Babel
  src/rewrite      the markers rewritten into Solid's JSX
  src/markers      what a build without the plugin reaches: an error
  heroui-extras.css  heroui/extras.css, reached through this file, since an
                   export names no file outside its package
  pack             the plugin compiled and packed, as a release ships it,
                   with heroui/'s stylesheets
docs/              the documentation, a Starlight site in Hypha's look, a
                   member of the root's Bun workspace; built into
                   _build/docs, where a link to a page or heading that is
                   not there fails it
  islands/         the pages' OCaml. Every whole program a page shows is a
                   file the repository builds, here or in example/,
                   imported as @islands/<name>.mlx?raw, its demo as
                   @islands/<name>.jsx, never by a path up the tree
  islands/react/   HeroUI's components in React, beside each port: the one
                   place the documentation runs React
  src/mlx.mjs      MLX's JSX highlighted, a grammar injected into Shiki's
                   OCaml
  src/pages/demo/  the Astro page's demo, outside Starlight
  agents.md        what an agent knows before any page, the head of
                   llms.txt
agents/            the documentation for a user's agent, generated:
                   llms.txt and pages/, installed into
                   $(opam var solidtype:doc), llms.txt alone into every
                   other package's doc/
prds/              the PRDs of work being decided and built, and which
                   document owns each kind of fact once it lands
example/           a kanban board, a whole application on the stack: its
                   islands in src/, a Spindle server on SQLite in server/,
                   the same board as an Astro page in pages/; its README
                   the map
```

The tests, each beside what it tests or in `test/`:

```
test/ppx/                what the ppx writes for each JSX form
test/does_not_compile.t  each mistake the types refuse, built against the
                         installed library, with the error a user reads
test/browser/ server/ hydration/
                         Solid's bindings in jsdom, in Node, and rendered
                         on the server then hydrated, in three vitest
                         projects; test/jsdom.ts stands in for what jsdom
                         lacks
test/kobalte/            each Kobalte component beside its TSX twin
test/headless/           each headless component as a caller meets it
test/heroui/             each port beside the same component in React, and
                         the variant functions against HeroUI's own calls
test/rhp/ internationalized_date/
                         each binding as a caller meets it
test/test_docs.ml        every island on a page, every rhp page linked to
                         rhp's, every port's to HeroUI's, and the plugin a
                         page installs the newest release's
vite-plugin/test/        rewrite, what the plugin writes for a marker form;
                         browser, every import found in the browser builds;
                         npm, each package's x-npm-depends; pack, the
                         release's tarball installed; astro and docs, the
                         example's page and the documentation built
example/test/            the board's behaviour against its own server
```

## The pipeline

1. **MLX** parses `.mlx` into OCaml, each element marked `[@JSX]`.
2. **`ppx_solidtype`** lowers each element to a call of `Solidtype.Jsx`, a
   marker, reading each value as Solid's compiler reads JSX:
   - a literal, an element, a handler (`on_` and its event), a function or
     a name is static; any other expression is a thunk the ppx writes;
   - a handler an expression makes, `on_click=(remove id)`, and a spread
     are a thunk too, made once as their element is, since Melange
     evaluates an expression before the element it is written in;
   - `?name=` is an option, `undefined` while it is `None`;
   - a child is a `Jsx.element`: a node, `Jsx.string`, `Jsx.int`;
   - a render function given by name is `render=f`, and one written in
     place is the only child, `<C>(fun ...)</C>`, since ocamlformat cannot
     print an attribute named `children` beside MLX's own;
   - a string literal becomes `{js|...|js}`, its backslashes doubled, since
     Melange reads any other as bytes; one written so is left as it is;
   - a component's element also applies its `Props.check` under `if false`,
     which the compiler checks and Melange drops.

   `let%component` writes a component's `Props` from its labelled
   parameters, and with `[@@element button]` a check that ends in
   `Html.Button.check`, an own prop taking the place of the element's of
   its name, as TSX's `Omit` types a part. The library's own `.mlx` is
   lowered with `-internal`, which names its modules without `Solidtype.`.
3. **Melange** compiles the markers as calls, through one import of
   `vite-plugin-solidtype/markers`.
4. **The plugin** rewrites each call into JSX: a function the ppx bound
   goes back where it is used, a thunk becomes what it returns, a
   return-only `if` a conditional, and a string JSX's own text or quoted
   attribute only where JSX reads it back unchanged, else `{"..."}`.
5. **`vite-plugin-solid`** compiles that JSX as it compiles TSX: for the
   browser, and under Astro for the server and hydratable.

## Rules that must hold

Each rule comes with why it exists and the test or search that catches a
break.

### JSX

- **An island compiles as the same JSX in TSX does.** The plugin writes
  the JSX a TSX author would, and Solid's compiler compiles it the three
  ways Astro runs it: for the browser, hydratable, and for the server.
  Why: the library promises Solid's own output, and a rewrite that drifts
  is a slower or a wrong page nobody sees in a type. Test:
  `vite-plugin/test/rewrite.test.ts`, `test/hydration/`.
- **An island mounts in an Astro page as any Solid island does**,
  `client:only` or prerendered `client:load`, imported by its namespace
  from Melange's output, `<App.make client:load />`; the page holds wiring
  alone. Why: the plugin must run under Astro's server build as under its
  client's. Test: `vite-plugin/test/astro.test.ts`.
- **In JSX a value is written as itself, and Solid keeps it current;
  outside JSX a thunk is written.** `title=(S.get note)` is
  `title={note()}`; a function is a function, never a thunk. Outside JSX
  -- a memo, an effect, a function's parameter, a record a part gives
  another -- the caller writes `fun () -> e`, as Solid's API takes
  `() => e`. Why: a read hoisted out of Solid's tracking scope stops
  updating without a sound. Test: `test/does_not_compile.t`, a thunk
  refused where a value belongs and every form that compiles.
- **What the library hands out is a `Solid.accessor`, read by `S.get`**: a
  signal, a memo, a component's value prop, a field of a part's state or
  context. A part that hands on what it derives writes
  `S.accessor (fun () -> e)`, which Melange writes as a plain JavaScript
  function. In a component's body `S.get name` is the read itself,
  `props.name`. Why: a thunk read as a call, `label ()`, looks like
  calling a string, and an accessor asked of a caller makes them build
  Melange's uncurried function by hand. Test: `test/ppx`. Symptom:
  `rg -n '^\s+\w+ : unit -> [a-tv-z]' heroui/*.mli headless/*.mli`, a
  public field read as a call;
  `rg -n '^\s+\??\w+:[^:]*accessor ->' heroui/*.mli headless/*.mli`, a
  parameter that asks for an accessor.
- **`[@u]` is a binding's alone.** Outside `src/`, which binds Solid
  itself, it is written only in an `external`, or a `type` an external
  names. Why: an uncurried function written by hand is Melange's calling
  convention leaking into code that means something else. Symptom:
  `rg -n --glob '*.{ml,mlx,mli}' '\[@u\]' heroui headless test docs example
  | rg -v ':\s*(external|type) '`.
- **Every thunk the ppx hands Solid is a function of no argument**: each
  written uncurried, a function it gives bound apart. Why: Solid calls a
  thunk with no argument, and Melange writes a curried
  `fun () -> fun h -> e` as one function of two, which that call would run
  at once. Test: `test/browser/flow_test.mlx`, `test/ppx`.
- **A component's props are its `Props.check`**, a function with one
  labelled argument per prop, optional where the prop is, ending in `()`:
  a value prop a `Check.value`, a function prop the function, children a
  `Check.children` of the kinds the component takes -- elements, a
  function it calls, or either. An optional prop is given as OCaml gives
  an optional argument, `count=3` or `?count=o`. Why: a prop left out, a
  prop the component does not take, two props of one type variable that
  disagree and a function where a value belongs are compile errors, as in
  TSX. Test: `test/does_not_compile.t`, `test/browser/optional_test.mlx`.
- **A component is a value.** A binding's part is an `external` of type
  `_ Jsx.component`, and an OCaml component is `Jsx.component make`. Why:
  Melange wraps an external function used as a value in a closure, which
  no JSX tag can name.
- **A function of several arguments is applied by whoever receives it.**
  A JavaScript component that takes one is bound through `Solidtype.Arity`,
  and a function JavaScript hands to OCaml is wrapped at its binding; the
  generator and the ppx do both, so only a binding written by hand has it
  to keep. Why: `fun a b -> e` and a function that takes `a`, then gives a
  function of `b`, are one type and two JavaScript functions, and a caller
  cannot be asked which it wrote. Test: `test/browser/flow_test.mlx`,
  `test/kobalte/combobox_test.mlx`, `generate/test/rules.test.ts`.
- **Only the ppx writes a marker, and the plugin reads only markers**,
  found by their import alone. It reads Melange's shapes only to put a
  function back where it is used -- a thunk's returned expression, a
  return-only `if`, a `const` bound to a function and used once -- and
  calls any function it does not recognise, which is always correct. It
  moves a bound function only where every name it reads means the same at
  its use, and a marker it cannot read, or one left outside an element,
  fails the build where it is written. Why: the rewrite keeps its meaning
  because it reads one shape it owns. Test:
  `vite-plugin/test/rewrite.test.ts`. Symptom:
  `rg -n 'Jsx\.(el|c|s|d|spread|dynamic|render)\b' example src`.
- **Every name a user writes is snake case, made by one rule** from the
  name in the library's documentation: a capital is an underscore and the
  lower case, a run of capitals one word, a hyphen an underscore, and a
  keyword takes a trailing underscore. The ppx gives a name back by the
  rule's inverse -- a capital after each underscore, a hyphen after
  `aria_` and `data_` -- and by the tables the generators write of the
  names the inverse does not give, `stroke_width` and `is_svg`. Why: one
  convention reads as OCaml, and one rule lets the documentation read
  across. Test: the generators fail on a name two JavaScript names share;
  `test/ppx`.
- **A namespace of Solid's wraps the value, never the name**:
  `on_click=(Jsx.native f)` is `on:click={f}`. A component takes an
  attribute's, `Jsx.attr`, `Jsx.bool` and `Jsx.named`, outside its check
  and passes it on to its element: `?hidden=(Jsx.attr o)` is the one way
  to write `hidden="until-found"` that Solid's server keeps. A handler's
  and a property's stay an element's. Why: a wrapper left out is Solid's
  default, never another namespace, and a label that spelt the namespace
  would let a slip change it unseen. Test: `test/does_not_compile.t`,
  `test/server/panels_test.mlx`.
- **A `data-` attribute is declared, never written by hand.** Its value is
  a `Jsx.data`, a string or `undefined`, which Solid leaves out:
  `Jsx.flag b` is `"true"` or nothing, React Aria's convention. An element
  and a component take `data_*`, a component outside its check: it spreads
  `Props.others props`, the props it does not name, on its element after
  its own attributes. A port's state -- `data-hovered`, `data-selected` --
  is so declared, and `heroui/interaction` only listens. Why: an attribute
  Solid writes is in the HTML a page is prerendered with and never races
  one the component writes itself; one set from a `ref` is neither. Test:
  `test/server/data_attributes_test.mlx`, `test/does_not_compile.t`,
  `test/heroui/attributes_test.mlx`.
- **A spread is `props=p`, and no prop is named `props`.** The ppx reads
  it as a spread on an element or a component; each check takes it beside
  the props -- a component's as a rest of its own props, `Props.omit`, or
  the rest any component passes on, `Props.others`, a Kobalte part's as
  any rest -- and `Dynamic` is given its component's props by it. Why: MLX
  has no syntax for `{...p}`, and a prop of the same name would be a
  duplicate label, reported far from its cause. Test:
  `test/does_not_compile.t`.

### Melange's output

- **A reactive read is a plain call.** An accessor is an uncurried
  JavaScript function and `Solid.get` is inlined, so `Solid.get count` is
  `count()`. Why: a curried read is `Curry._1(count, undefined)`, an arity
  check on every read. Symptom:
  `rg -n Curry _build/default/example/out/example/src`.
- **The library has no private modules.** Why: Melange then loses what it
  knows of a module across libraries, so a user's every call into the
  library goes through `Curry`. A helper two modules need is public, or a
  copy in each. Symptom: the search above finds a call into `Solidtype__`.
- **A test Solid reads for truth is a `bool`, never an OCaml value.**
  `Show`, `Match` and a resource's source take a `bool` or an `option` the
  binding boxes. Why: Melange writes `Some 0`, `Some ""` and a first
  constant constructor as values JavaScript reads as false. Test:
  `test/browser/flow_test.mlx`.

### Generated bindings

A binding of more than a few TypeScript declarations is written by its
generator, `generate/<library>.ts`, checked by `make lint` with `--check`,
and never edited by hand. A generator says what a file declares, each
declaration with its comment, and one printer writes the file and its
interface from that; ocamlformat lays both out, so `dune fmt` holds them
as it holds any file. A variant's tags are written in the order of
their names, since TypeScript lists a union's members in the order it first
met each. Why: a hand-typed copy drifts from the version it binds.

- **A generated binding is whole, or says what it lacks.** A declaration
  no rule maps fails its generator, unless the generator names it as left
  out, by where the core meets it, with why, `leftOut`; and a name left out
  that is bound, or no longer declared, fails it too. Why: a prop dropped
  without a word is one a user cannot reach and nobody knows is missing,
  and a reason nothing checks outlives what it excused. Test:
  `generate/test/rules.test.ts`.
- **A module of `Types` is named by one rule, and never numbered.** A type
  its library names keeps the name; one it does not is named by the path
  of names to where it is met -- a part's prop,
  `Combobox_Root_Translations`; what a function gives, `Bins`; what it
  takes, the parameter after it, `Bins_Options`. Two types of one name
  fail the generator until it names each, `named`. Why: a number is the
  order two types were met in, which the next version changes under a
  user's code. Test: `generate/test/rules.test.ts`.
- **An attribute's type is generated from Solid's JSX types**, into
  `src/html.mli`. A type that admits any string is `string`; a closed set
  of literals OCaml can name is a polymorphic variant; a boolean, alone or
  as `"true"` and `"false"`, is `bool`; a number alone is `int`; a handler
  takes Melange's `Dom` event type, its generic one when Melange has none,
  and one Solid also takes in lower case, `onclick`, is bound once,
  `on_click`. Each element also gives `'r check`, its attributes as
  optional arguments before `'r`: the tail of a check for a component that
  passes them on.
- **Kobalte's binding is generated from its declarations**, read from
  Kobalte's real path, into `kobalte/solidtype_kobalte.ml` and
  `kobalte/types.ml`, each `.mli` leaving out the raw external under a
  wrapper. A part is a module of its component and its check: its own
  options, then its children by kind, then its element's `check`. Its
  options map as an element's attributes do, and further:
  - a number is a `float`, since a slider's value is fractional;
  - `T | null` given to Kobalte is `Js.Null.t`, made of an `option` only
    by `Js.Null.fromOption`, since Kobalte reads `undefined` as
    uncontrolled and `null` as controlled and empty; read from Kobalte, or
    given as `T | null | undefined`, it is `Js.Nullable.t`;
  - `undefined` is absence for an optional prop, `?name` then `()` for a
    function the user calls, and an `option` anywhere else;
  - members of different JavaScript kinds are `Types.Either.t`, built by
    `left` and `right`, each the value as it is;
  - an option accessor that takes a key or a function takes the function;
    one that takes only a key, a `string`;
  - a root whose value turns on `multiple` is two modules, `Root` and
    `Root_multiple`;
  - a named object type is a module of `Types`: a getter per field, a
    curried wrapper per function it holds, a constructor where it has
    neither methods nor a class; two declarations of one name TypeScript
    takes for each other are one module; a class is each interface it
    implements, by a `to_` conversion;
  - Solid's handler argument, an event with its targets named, is the
    event; a type parameter bound by an element is `'t Dom.element_like`;
  - a type argument typed `any` is whatever the caller has where it is
    given, `_`, and `Types.Unknown.t`, which nothing reads, where it is
    read; a `bigint` is `Js.Bigint.t`; a function of several signatures is
    its first where OCaml calls it, and not bound where it is given;
  - a member typed `any` is not bound, nor one whose value would be a type
    its caller chooses; but in the props a `create` function takes, `any`
    is the caller's own data, `'data`, and a string beside a function of
    it is left for the function; what a callback gives back as `any` is
    `unit`;
  - menu, popper, dismissable-layer and polymorphic are not bound as
    components, though a part drawn by polymorphic takes `as_`; the hooks
    Kobalte's lists are made of are bound from its root, as `Selection`.

  Test: `test/kobalte/selection_test.mlx`; `test/does_not_compile.t`
  refuses `Js.Nullable.fromOption` where `T | null` is given.
- **HeroUI's variant functions are generated from @heroui/styles'
  declarations**, into `heroui/styles.ml`: a module per function,
  `buttonVariants` is `Styles.Button`, with `options`, its variants as
  optional arguments and `class_`, and `classes`, or for a component of
  several parts `slots` and a string per part. A variant of `true` and
  `false` is a `bool`; any other is its keys as tags, a space taken as a
  hyphen, each named by `[@mel.as]`, since Melange writes `undefined` for
  a tag left unnamed where others are. Only HeroUI's classes are bound;
  its components are ported. Why: a port's look is HeroUI's own classes,
  never a copy. Test: `test/heroui/styles_test.ml`.
- **@internationalized/date's binding is generated from its
  declarations**: a function an external, a class a module of `Types`. A
  date's numbers are `int`, but the milliseconds `fromAbsolute` takes and
  what `compare` gives are `float`. `CalendarDate`, `CalendarDateTime`,
  `Time` and `ZonedDateTime` are each a kind of one `Types.Value.t`, and a
  union of them, or an interface they satisfy, is the kinds TypeScript
  takes for it, an open set. A parser, and whatever takes a time zone or a
  disambiguation, throws though no declaration says so: it raises
  `Invalid_argument`, with an `_opt` beside it. Test:
  `test/internationalized_date`.
- **Gravity UI's icons are generated from @gravity-ui/icons' SVG files**,
  a module per icon, `ChevronDown` is `Chevron_down`: an svg that takes
  every attribute an svg does, a caller's after its own. An attribute
  Solid's JSX types leave off its element is written in `attr:`, the
  package's clip id is one the icon makes, `Solid.create_unique_id`, and
  an element, id or reference the generator does not know fails it. Why:
  an example copies into an application only if each icon it draws is
  there.
- **rhp's binding is generated where a rule maps a declaration whole, and
  ported by hand where none does.** A hand port is a module of `rhp/`,
  named in the generator, its `.mli` saying why, and held to what rhp
  declares for it: each prop, setting, field or key is bound there or
  named in the generator as left out, with the reason. The generator fails
  on anything else it cannot bind. A rule is made general only where it
  would bind the next version the same way; a rule for one declaration is
  a hand port. Why: a binding by halves leaves out what a user then cannot
  reach, and a rule for one declaration breaks on the next version.
- **Each opam package declares what its library imports from npm**, in
  `x-npm-depends`, written by its `.opam.template` at the range the root
  `package.json` builds and tests against, `"@bezda/rhp@~2.2.0"`, and
  nothing else: `solidtype-heroui` reaches Kobalte through
  `solidtype-kobalte`, never by naming it again. Why: an application
  installs a JavaScript library only where it uses the package that binds
  it, and reads the list from opam at the version it resolved. Test:
  `vite-plugin/test/npm.test.ts`.

### Components and ports

- **A component Kobalte lacks is made headless first, in
  `solidtype-headless`, and a design system dresses it.** It is made of
  Kobalte's hooks, `Solidtype_kobalte.Selection` first: its parts the
  elements they name, their roles, keys and state as attributes, Kobalte's
  convention for state, present and empty, and its state a context a style
  reads. Its HeroUI port adds only HeroUI's classes, `data-slot`, React
  Aria's state, `"true"`, and HeroUI's own parts. A bug of Kobalte's own
  component is fixed so too, in a module of `solidtype-headless` named for
  it, never in a port: its fixed parts wrap Kobalte's and `include` its
  `Props`, its other parts Kobalte's own. A port's own difference from
  Kobalte stays the port's. Why: behaviour and accessibility are the
  component's whoever dresses it, tested once. Test: `test/headless/`, a
  fix failing on Kobalte's own; its port's test against React's.
- **A part takes every attribute of its element.** Its check ends in its
  element's `Html` check, by `[@@element]` or written by hand, and it
  spreads `Props.others` on that element, or on the part that draws it,
  after its own attributes, so a caller's attribute wins, as React Aria's
  `mergeProps` lets it. A handler, `ref` or `style` the part sets is its
  own prop, `?ref:(given_ref : ...)`, the caller's called or written
  beside its own; what its behaviour rests on -- a Kobalte option, an id
  another part names, a fix -- is written after the spread, since Solid
  merges props in order. A part that draws no element takes none. Why: an
  attribute a port refuses, or one a caller's spread replaces, is one an
  application cannot set without breaking the port. Test:
  `test/heroui/attributes_test.mlx`, every part given a style, a title, a
  handler and a `ref`.
- **A part that draws an element takes `as_`**, HeroUI's `render`: a
  function of `Html.X.props`, which it spreads on what it draws, and of
  the part's state where it has one. `[@@element]` gives it: a plain
  element stays Solid's template until a part is given one, then is
  `Dynamic` given the function, never a tag, which throws as a page
  hydrates. What hands its rest on to a function passes `as_` itself, or
  reads it, `Solid.drawn_as` and `Solid.undrawn`. Why: an animated element
  in a part's place, typed so that what it draws checks its own props.
  Test: `test/heroui/attributes_test.mlx`, `test/ppx`,
  `test/does_not_compile.t`.
- **A component HeroUI ships no stylesheet for has one of its own**,
  `heroui/<name>.css`: Tailwind on HeroUI's tokens, rules for its BEM
  classes, imported by `heroui/extras.css` into the `components` layer.
  The component is made as every port is, its props named as HeroUI names
  its own; its parts carry their classes alone, a caller's after them. The
  plugin's tarball ships the stylesheets, so an application imports them
  by one line, `@import "vite-plugin-solidtype/heroui-extras.css"`. It has
  no twin: its test is a caller's, its classes pinned, with axe. Nothing
  of a licensed kit is installed, imported or copied. Why: every component
  is restyled alike, by a rule for its class, which a utility on the
  element would beat; and this repository, its CI and its site are public.
  Symptom: a utility in a part's class string, or `rg -n heroui-pro .`
  finding anything. Test: `vite-plugin/test/pack.test.ts`.

### Tests and documents

- **Tests of what runs in a browser are OCaml, run by vitest** through
  `melange-jest`; the ppx, native, is tested by its expectations. Why: a
  test in TypeScript would reach a component through the names Melange
  emits. Symptom: a `.test.ts` or `.test.tsx` that imports an OCaml
  module.
- **Each Kobalte component is tested against its TSX twin**, in
  `test/kobalte/twins/`: one check on both -- roles, names, state
  attributes, the pattern's keys -- and axe on both. Why: the library
  promises Kobalte's behaviour and accessibility, which only a running
  component shows. Symptom: a component of
  `kobalte/solidtype_kobalte.ml` with no `test/kobalte/*_test.mlx`.
- **Each rhp page links to the page of rhp's documentation it follows.**
  Why: a copy of what a prop does would drift. Test: `test/test_docs.ml`.
- **`agents/` is generated, never edited**: starlight-hypha-agents writes
  it from the documentation's pages, `docs/agents.md` and its options in
  `docs/astro.config.mjs`, so a page changed is `make docs` run in the
  same commit. A module with a page of its own names the page's installed
  path, `$(opam var solidtype:doc)/pages/<page>.md`, in its `.mli`'s
  opening comment. Why: a user's agent reads what the release installs,
  offline. Test: the docs workflow fails if `agents/` differs from what
  the pages give.

## Changes and releases

Its opam packages and the Vite plugin are released together, at one
version, so a binding and the plugin that reads its markers never
disagree, nor a component and the stylesheet the plugin's tarball ships
for it. The plugin is compiled and packed by `vite-plugin/pack.ts` and
attached to the GitHub release by `make release` while it is a draft,
since an immutable release takes no file after; an application names it
by its URL.

The documentation is published to GitHub Pages, at
hyphatech.github.io/solidtype, by `.github/workflows/docs.yml` on every
push to `main`, so what it says is what `main` does. The README is short
and points to it.
