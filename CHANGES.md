# Changes

## Unreleased

- \`Store.track\` subscribes the computation that calls it to every field of
  the store, as Solid's \`$TRACK\` does: Melange had dropped its read, so it
  did nothing.
- Breaking: a toast's \`SwipeEvent\` binds \`init_event\` and
  \`init_custom_event\` as the methods they are, where reading either gave
  a function typed as an event, and has no \`make\`, since an event is
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
