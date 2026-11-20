# Astro

Build a site with Astro, its interactive parts written as OCaml islands.

We build our own front ends with [Astro](https://astro.build), and
recommend it for solidtype. Astro builds the site: its pages, as HTML.
Each part of a page that the reader interacts with is an island: a Solid
component written in OCaml, which Astro renders with the page and then
brings to life in the browser.

## What Astro does

1. **Routing.** Each file in `src/pages/` is a page, at the URL its path
   names. A file named `[tea].astro` is one page per tea.
2. **Layouts.** The HTML every page shares -- the head, the navigation,
   the stylesheets -- is written once.
3. **HTML first.** Every page is rendered to HTML when the site is built,
   islands included, so the reader sees it before any JavaScript loads,
   and so does a search engine.
4. **JavaScript only where needed.** A page loads the code of its islands
   and nothing else, each when its directive says: as the page loads, or
   only once the island is scrolled into view.
5. **Data to islands.** A page reads its data while it is built, or per
   request, and gives an island what it needs as props.
6. **Navigation without reloading.** A link can swap the next page in
   place, and an island can stay alive from one page to the next.

What is left to the islands is what happens in the browser: state, events,
and what changes on the page.

## Setting up

Add `astro` and `@astrojs/solid-js` to the packages the
[start page](../index.md#install) installs. Solid's integration compiles
the JSX; solidtype's plugin goes in Vite's plugins and runs first:

```js
// astro.config.mjs
import { defineConfig } from "astro/config";
import solid from "@astrojs/solid-js";
import solidtype from "vite-plugin-solidtype";

export default defineConfig({
  integrations: [solid()],
  vite: {
    plugins: [solidtype()],
    resolve: {
      alias: { "@islands": new URL("./_build/default/out/islands", import.meta.url).pathname },
    },
  },
});
```

The islands are a Melange library in `islands/`, and dune emits them into
`_build`, where the alias finds them:

```
astro.config.mjs
dune               (melange.emit (target out) (libraries islands) ...)
islands/           the islands, in .mlx
src/pages/         the pages
```

While you work, run `dune build --watch` and `astro dev` side by side. To
build the site, run `dune build`, then `astro build`.

## An island

A page imports an island's module and mounts its `make`, with a directive
and props:

```astro
---
import * as Counter from "@islands/astro_counter.jsx";
---

<Counter.make client:visible label="Stars" startAt={3} />
```

```ocaml title="astro_counter.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Button = Solidtype_heroui.Button

let%component make ~(label : string) ?(start_at : int = 0) () =
  let count, set_count = S.create_signal (S.get start_at) in
  <Button variant=`secondary on_click=(fun _ -> S.update set_count succ)>
    (Jsx.string (S.get label)) ": " (Jsx.int (S.get count))
  </Button>
```

An island that takes props is a `let%component`, as any
[component](../solid/components.md) is; one that takes none is
`let make () = ...`. In the page a prop has its JavaScript name:
`start_at` is `startAt`.

Props are written into the page as data, so they are strings, numbers,
booleans, arrays and records -- never a list, a variant or a function.

## Hydration

Hydrating is the browser taking over the HTML the server rendered,
attaching the island's code to it. A directive says when:

| Directive | Hydrates | For |
|---|---|---|
| `client:load` | as the page loads | what the reader uses first |
| `client:idle` | once the browser is idle | what can wait a moment |
| `client:visible` | when scrolled into view | most islands |
| `client:media="(max-width: 50em)"` | when the media query matches | a mobile menu |
| `client:only="solid-js"` | renders in the browser alone, never on the server | what has nothing to show without the browser |

With no directive, a component is rendered to HTML and its code never
loads.

The browser's first render has to match the server's HTML. The server has
no window, no storage and not the reader's clock, so an island reads them
in `on_mount`, which runs in the browser alone, after hydrating:

```ocaml title="astro_local_time.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx

let make () =
  let opened, set_opened = S.create_signal "--:--:--" in
  (* The reader's clock is read in the browser alone, once the island is
     hydrated: the server, rendering at build time, has none. *)
  S.on_mount (fun () ->
      S.set set_opened (Js.Date.toLocaleTimeString (Js.Date.make ())));
  <p>"You opened this page at " (Jsx.string (S.get opened))</p>
```

## Routing

Here a route makes a page per tea, and gives each tea's name to the
page's island:

```astro title="src/pages/demo/teas/[tea].astro"
---
import Layout from "./_Layout.astro";
import * as Add from "@islands/astro_add_to_basket.jsx";

export function getStaticPaths() {
  return [
    { params: { tea: "sencha" }, props: { name: "Sencha" } },
    { params: { tea: "darjeeling" }, props: { name: "Darjeeling" } },
    { params: { tea: "pu-erh" }, props: { name: "Pu-erh" } },
  ];
}

const { name } = Astro.props;
---

<Layout title={name}>
  <h1>{name}</h1>
  <Add.make client:visible tea={name} />
</Layout>
```

`getStaticPaths` lists the pages, and the props each is built with. Try
it: [/solidtype/demo/teas/sencha/](https://hyphatech.github.io/solidtype/demo/teas/sencha/).

An island takes the route as a prop, never from `window.location`: the
server knows the route when it renders the page, so the HTML is right
before any code runs.

A page rendered per request, rather than when the site is built, adds
`export const prerender = false`, and an
[adapter](https://docs.astro.build/en/guides/on-demand-rendering/) for the
server it runs on.

## Navigating without reloading

By default a link loads the next page whole, and the islands start
again. With `<ClientRouter />` in the layout's head, Astro swaps the next
page in place, and an island marked `transition:persist` stays as it is:

```astro title="src/pages/demo/teas/_Layout.astro"
---
import { ClientRouter } from "astro:transitions";
import * as Basket from "@islands/astro_basket_count.jsx";
import "@styles/heroui.css";

const { title } = Astro.props;
---

<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>{title}</title>
    <ClientRouter />
  </head>
  <body>
    <nav>
      <a href="/solidtype/demo/teas/sencha/">Sencha</a>
      <a href="/solidtype/demo/teas/darjeeling/">Darjeeling</a>
      <a href="/solidtype/demo/teas/pu-erh/">Pu-erh</a>
      <Basket.make client:load transition:persist />
    </nav>
    <main><slot /></main>
  </body>
</html>

<style>
  body {
    max-width: 40rem;
    margin: 2rem auto;
    padding: 0 1rem;
    font-family: system-ui, sans-serif;
  }
  nav {
    display: flex;
    align-items: center;
    gap: 1rem;
  }
</style>
```

In [the demo](https://hyphatech.github.io/solidtype/demo/teas/sencha/), add a tea and go to another:
the basket keeps its count.

## Sharing state between islands

Islands are separate: a context does not reach from one to another. They
do share the modules they import, so a signal in a module is shared by
every island that reads it:

```ocaml title="astro_basket.ml"
module S = Solidtype.Solid

(* Every island that imports this module shares the one signal. It is made
   on first use, never as the module loads. *)
let basket = lazy (S.create_signal 0)
let count () = S.get (fst (Lazy.force basket))
let add () = S.update (snd (Lazy.force basket)) succ
```

```ocaml title="astro_add_to_basket.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Button = Solidtype_heroui.Button

let%component make ~(tea : string) () =
  <Button on_click=(fun _ -> Astro_basket.add ())>
    "Add " (Jsx.string (S.get tea)) " to the basket"
  </Button>
```

```ocaml title="astro_basket_count.mlx"
module Jsx = Solidtype.Jsx
module Chip = Solidtype_heroui.Chip

let make () =
  <Chip color=`accent variant=`soft>
    "Basket: " (Jsx.int (Astro_basket.count ()))
  </Chip>
```

The server shares a module between every page it renders, so a shared
signal is only written in the browser: from a handler, or from
`on_mount`.
