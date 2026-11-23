# Getting Started

SolidJS for modern OCaml.

solidtype is [Solid](https://www.solidjs.com) for OCaml. A component is
written in OCaml's JSX, compiled by [Melange](https://melange.re), and
reaches the browser as the code Solid's own compiler emits for the same
JSX: the same templates, the same runtime calls, in the same order. What
OCaml adds is its types. A signal given where its value belongs does not
compile, and neither does a prop left out, an attribute an element does not
take, or a `match` in a `Switch` that misses a case.

```ocaml title="solid_counter.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx

let make () =
  let count, set_count = S.create_signal 0 in
  <button
    class_="button button--primary"
    type_=`button
    on_click=(fun _ -> S.update set_count succ)>
    "Clicked " (Jsx.int (S.get count)) " times"
  </button>
```

## What it is made of

| Package | What it is |
|---|---|
| `solidtype` | Solid 1.9 bound whole: signals, computations, resources, stores, its components and its renderer, server rendering included |
| `ppx_solidtype` | rewrites JSX written in `.mlx` files into calls Melange compiles |
| `vite-plugin-solidtype` | turns those calls back into JSX, which Solid's compiler compiles as it compiles TSX |
| `solidtype-kobalte` | [Kobalte](https://kobalte.dev) 0.13 bound whole, generated from its own declarations |
| `solidtype-headless` | the components Kobalte lacks, made as Kobalte makes its own, with no style, and Kobalte's own where they need a fix |
| `solidtype-heroui` | [HeroUI](https://heroui.com)'s components, a maintained port onto Kobalte |
| `solidtype-rhp` | [rhp](https://rhp.vercel.app) 2.2's reactive charts, bound whole |
| `solidtype-gravity-icons` | every icon of [Gravity UI](https://gravity-ui.com/icons), the set HeroUI's examples draw |

[OCaml over TypeScript](start/ocaml-over-typescript.md) says
why a front end is better written in OCaml. [How it works](start/how-it-works.md) follows one component through every
step. [Melange and dune](start/melange.md) and [Vite](start/vite.md)
say how each tool is set up, [Astro](start/astro.md) how a site is built of pages and OCaml islands, and [Conventions](start/conventions.md) how a
name in Solid's documentation is written in OCaml. The
[Solid](solid.md) and [Kobalte](kobalte.md) tabs are the
bindings, [HeroUI](heroui.md) the design system built on them, and
[Charts](rhp.md) the charts. For a model, [llms.txt](https://hyphatech.github.io/solidtype/llms.txt)
says how solidtype is written and lists every page.

## Install

It needs opam, with a switch of OCaml 5.5 or later, and
[Bun](https://bun.sh) 1.3 or later, which installs the JavaScript side and
runs Vite 8.

The OCaml side, from open-opam:

```sh
opam repo add open-opam https://github.com/open-opam/opam-repository.git
opam install solidtype    # and solidtype-kobalte for Kobalte
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
    "vite-plugin-solidtype": "https://github.com/hyphatech/solidtype/releases/download/0.15.0/vite-plugin-solidtype-0.15.0.tgz"
  }
}
```

## A first page

`dune-project` reads `.mlx` files, OCaml with JSX:

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

The components are a Melange library, emitted as `.jsx` modules, the files
the plugin rewrites:

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

The counter above is `src/app.mlx`. An entry module mounts it,
`src/main.ml`:

```ocaml
external get_element_by_id : string -> Dom.element Js.Nullable.t
  = "getElementById"
[@@mel.scope "document"]

let () =
  match Js.Nullable.toOption (get_element_by_id "app") with
  | Some root -> ignore (Solidtype.Web.render App.make root : unit -> unit)
  | None -> invalid_arg "index.html has no element #app to draw the board in"
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

Dune builds before Vite reads what it wrote:

```sh
bun install
opam exec -- dune build
bun --bun vite build
```
