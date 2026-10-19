# Changes

## Unreleased

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
  observables, `merge_props` and `omit` -- `Web` -- rendering, hydration
  and server rendering -- and `Store`, its state a record. Its
  components are `For`, `Index`, `Show`, `Switch`, `Match`, `Suspense`,
  `SuspenseList`, `ErrorBoundary`, `Dynamic`, `Portal`, `NoHydration`,
  `Hydration`, `HydrationScript` and `Assets`, and `Context.Make` makes
  a context. What Solid's compiler alone emits is not bound.
- `Show.Some` and `Match.Some` show an `option`, `Some 0` too, and
  `Show.Keyed` and `Match.Keyed` give their child the value.
- A `Switch` whose only child is a thunk of a `match` shows the case that
  holds, and a case left out is the compiler's warning.
- Each element's attributes are typed, generated from Solid's JSX types:
  an attribute the element does not take does not compile, and a closed
  set of values is a polymorphic variant, ``type_=`button``. A label's
  underscore is a hyphen, `aria_label`; `on_`, `attr_`, `prop_`, `bool_`
  and `data_` name Solid's namespaces and data attributes.
- `let%component` also writes `Props.make`, a component's props as a
  value, and `Props.omit`, which names the props it leaves out by a
  variant.
- Kobalte 0.13 bound whole, generated from its declarations: each
  component part by part, its check its own options, then its children,
  then its element's attributes; its `use…Context` hooks, `toaster`,
  colors, i18n and color mode; and the types they name, under
  `Kobalte.Types`. A Select, Combobox or ToggleGroup of many values is
  `Root_multiple`.
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
