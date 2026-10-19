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
`solidtype-kobalte` -- every component part by part, its hooks, values
and utilities, and the types they name -- generated from its own
declarations, each component tested beside its TSX twin for behaviour
and accessibility.

Kobalte itself, in TSX as in OCaml, falls short in six places the tests
found, each with what a page does about it:

- **Slider**: its `Slider.Input` sits inside the thumb, an input nested in
  a control, which axe refuses. Leave it out unless the slider is in a
  form that posts its value.
- **Toast**: a toast is an item of a list with the role `status`, which
  axe refuses. Nothing in the binding changes it.
- **NavigationMenu**: the viewport is an item of the menubar's list that
  holds no menu item. Give it `role=`presentation``, as Kobalte gives its
  triggers' items.
- **ColorChannelField**: once it changes, a channel writes its formatted
  text, unit and all, into `aria-valuenow`, which axe refuses for a hue's
  degrees and a percentage. A plain number channel, `red`, is not
  affected.
- **Dialog and Popover**: a close button is named "Dismiss" whatever its
  text says, since Kobalte gives it that `aria-label`. Give it one of its
  own.
- **Accordion**: an arrow key moves Kobalte's focused item but not the
  focus, so a header is reached by Tab.

An island mounts in an [Astro](https://astro.build) page as any Solid
island does, `client:only` or prerendered and hydrated as `client:load`:
the plugin runs under Astro's build, server side as client side.

## Names

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
| `class`, `classList` | `class_`, `class_list` |

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

## Getting started

Not released yet: these steps name its first release, 0.1.0.

The OCaml side, from Hypha's opam repository:

```sh
opam repo add hypha https://github.com/hyphatech/opam-repository.git
opam install solidtype ppx_solidtype solidtype-kobalte mlx ocamlformat-mlx
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
  (format (run ocamlformat-mlx --impl %{input-file}))
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

The JavaScript side, on Bun, with Astro and the plugin, which is an
asset of each GitHub release:

```json
{
  "type": "module",
  "dependencies": {
    "astro": "^7.3.3",
    "@astrojs/solid-js": "^7.0.2",
    "solid-js": "~1.9.17",
    "@kobalte/core": "~0.13.14",
    "vite-plugin-solidtype": "https://github.com/hyphatech/solidtype/releases/download/0.1.0/vite-plugin-solidtype-0.1.0.tgz"
  }
}
```

The plugin runs before Solid's:

```js
// astro.config.mjs
import { defineConfig } from "astro/config";
import solid from "@astrojs/solid-js";
import solidtype from "vite-plugin-solidtype";

export default defineConfig({
  integrations: [solid()],
  vite: { plugins: [solidtype()] },
});
```

A page mounts a component from Melange's output, prerendered or in the
browser alone:

```astro
---
import * as Counter from "../../_build/default/out/src/counter.jsx";
---
<Counter.make client:load />
```

Dune builds before Astro reads its output:

```sh
bun install
opam exec -- dune build
bun --bun astro build
```

## License

MIT
