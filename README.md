# solidtype

Solid, typed: OCaml front ends on [SolidJS](https://www.solidjs.com) and
[Kobalte](https://kobalte.dev), compiled by
[Melange](https://melange.re).

A component is written in OCaml's JSX and reaches the browser as the
code Solid's own compiler emits for the same JSX. A reactive read in the
wrong place does not compile, and neither does a prop left out, an
attribute an element does not take, or a `match` in a `Switch` that
misses a case.

```ocaml
let%component make ~(name : string) ?(greeting : string = "Hello") () =
  <p>(fun () -> Solidtype.Jsx.string (greeting () ^ ", " ^ name ()))</p>
```

Solid 1.9 is bound whole -- signals, computations, resources, stores,
its components and its renderer, server rendering included -- but for
what only its compiler emits; where OCaml cannot type a form, the `.mli`
says what replaces it. Each element's attributes are typed from Solid's
own JSX types.

Kobalte 0.13 is bound whole, in a package of its own,
`solidtype-kobalte`, generated from Kobalte's own declarations.

HeroUI 3.2's design is being ported onto Kobalte by hand, in
`solidtype-heroui`: HeroUI's classes, from `@heroui/styles`, on Kobalte's
behaviour. Avatar, AvatarGroup, Badge, Button, ButtonGroup, Card, Checkbox
with CheckboxGroup, Chip, CloseButton, Description, EmptyState, FieldError,
Fieldset, Input, InputGroup, Kbd, Label, Link, NumberField, RadioGroup with
Radio, ScrollShadow, SearchField, Separator, Skeleton, Slider, Spinner,
Surface, Switch with SwitchGroup, TextArea, TextField and Typography are
ported so far.
`make docs-serve` serves the documentation, where each port is shown beside
the same component in React.

## Naming conventions

Every name you write is snake case, made by one rule from the name
Solid's or Kobalte's documentation gives: a capital is an underscore and
the lower case, a run of capitals one word, a hyphen an underscore, and
an OCaml keyword takes a trailing underscore.

| Solid | OCaml |
|---|---|
| `onClick` | `on_click` |
| `readOnly` | `read_only` |
| `aria-label` | `aria_label` |
| `defaultValue` | `default_value` |
| `classList` | `class_list` |
| a keyword: `class`, `type`, `for`, `open` | `class_`, `type_`, `for_`, `open_` |

A handler takes the event its element and name give it: `on_click` a
`Dom.mouseEvent`, `on_input` a `Dom.inputEvent`.

One of Solid's namespaces wraps the value, never the name: `ns:name={v}`
is `name=(Jsx.ns v)`.

| Solid | OCaml |
|---|---|
| `on:click={f}` | `on_click=(Jsx.native f)` |
| `oncapture:click={f}` | `on_click=(Jsx.capture f)` |
| `prop:value={v}` | `value=(Jsx.prop v)` |
| `attr:title={s}` | `title=(Jsx.attr s)` |
| `bool:hidden={b}` | `hidden=(Jsx.bool b)` |
| `on:my-event={f}` | `on=(Jsx.listen "my-event" f)` |
| `data-X={s}` | `attr=(Jsx.named "data-X" s)` |

The last two are for a name whose case or spelling the rule cannot keep.

A `data-` attribute is a `Jsx.data`, on an element and on a component,
which passes it on to its element, as TSX lets a component take a
hyphenated attribute: present, or absent while a flag is down, so a state
is in the HTML a page is prerendered with.

| TSX | OCaml |
|---|---|
| `data-slot="badge"` | `data_slot="badge"` |
| `data-selected={on() ? "true" : undefined}` | `data_selected=(fun () -> Jsx.flag (on ()))` |
| `data-id={id()}` | `data_id=(fun () -> Jsx.data (id ()))` |

A constant held in a name is passed to a component as the thunk it is
read by, `choices=(fun () -> variants)`: a name alone is passed as it is,
which a component's check takes only for a function.

An optional prop, one a component may leave out, is passed on as it is
with OCaml's own `?`: present while its option is `Some`, absent while it
is `None`, as TSX passes `undefined`. A component's optional parameter is
such an option, so it passes on by its name.

| TSX | OCaml |
|---|---|
| `title={note()}` | `?title=(fun () -> note ())` |
| `name={props.name}` | `?name` |

The compiler refuses `?` on a prop that is not optional.

A spread, TSX's `{...props}`, is the attribute `props`, and so no prop is
named `props`:

```ocaml
let make (props : Props.t) = <input class_="field" props />
<Dynamic component=(fun () -> Greeting.component) props />
```

## Getting started

The OCaml side, from Hypha's opam repository:

```sh
opam repo add hypha https://github.com/hyphatech/opam-repository.git
opam install solidtype ppx_solidtype mlx    # and solidtype-kobalte for Kobalte
```

`dune-project` reads `.mlx` files:

```lisp
(lang dune 3.18)
(using melange 0.1)
(dialect
 (name mlx)
 (implementation
  (extension mlx)
  (merlin_reader mlx)
  (preprocess (run mlx-pp %{input-file}))))
```

The components are a Melange library, emitted as `.jsx` modules, the
files the plugin rewrites:

```lisp
; src/dune
(library
 (name app)
 (modes melange)
 (libraries solidtype melange.dom)
 (preprocess (pps melange.ppx ppx_solidtype)))

; dune
(melange.emit
 (target out)
 (libraries app)
 (module_systems (es6 jsx)))
```

A component, `src/counter.mlx`:

```ocaml
module Jsx = Solidtype.Jsx
module Solid = Solidtype.Solid

let make () =
  let count, set_count = Solid.create_signal 0 in
  <button type_=`button on_click=(fun _ -> Solid.update set_count succ)>
    "Clicked " (fun () -> Jsx.int (Solid.get count))
  </button>
```

An entry module mounts it, `src/main.ml`:

```ocaml
external get_element_by_id : string -> Dom.element = "getElementById"
[@@mel.scope "document"]

let (_ : unit -> unit) = Solidtype.Web.render Counter.make (get_element_by_id "app")
```

The JavaScript side, with Vite and the plugin, which is an asset of each
GitHub release:

```json
{
  "type": "module",
  "dependencies": {
    "solid-js": "~1.9.17",
    "vite": "^8.3.0",
    "vite-plugin-solid": "^2.11.14",
    "vite-plugin-solidtype": "https://github.com/hyphatech/solidtype/releases/download/0.1.0/vite-plugin-solidtype-0.1.0.tgz"
  }
}
```

The plugin runs before Solid's:

```js
// vite.config.js
import { defineConfig } from "vite";
import solid from "vite-plugin-solid";
import solidtype from "vite-plugin-solidtype";

export default defineConfig({ plugins: [solidtype(), solid()] });
```

The page loads Melange's output:

```html
<!doctype html>
<div id="app"></div>
<script type="module" src="/_build/default/out/src/main.jsx"></script>
```

Dune builds before Vite reads its output:

```sh
bun install
opam exec -- dune build
bun --bun vite build
```

## License

MIT
