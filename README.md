# solidtype

Write [SolidJS](https://www.solidjs.com) components in OCaml. You write JSX
in `.mlx` files, [Melange](https://melange.re) compiles them, and the
browser gets the same code Solid's own compiler would produce, with OCaml's
types checking your props, attributes and reactive reads. Bindings for
[Kobalte](https://kobalte.dev) and a port of [HeroUI](https://heroui.com)'s
components come with it.

[![ci](https://img.shields.io/github/actions/workflow/status/hyphatech/solidtype/ci.yml?branch=main&label=ci)](https://github.com/hyphatech/solidtype/actions/workflows/ci.yml)
[![release](https://img.shields.io/github/v/release/hyphatech/solidtype?label=release)](https://github.com/hyphatech/solidtype/releases)
[![license](https://img.shields.io/github/license/hyphatech/solidtype)](LICENSE)
![OCaml 5.5+](https://img.shields.io/badge/OCaml-5.5%2B-EC6813?logo=ocaml&logoColor=white)
[![Hypha Stack](https://img.shields.io/badge/Hypha-Stack-d4a820?labelColor=15120e)](https://hyphatech.io/stack/)

**Documentation**: [hyphatech.github.io/solidtype](https://hyphatech.github.io/solidtype/)

## Quickstart

```sh
opam repo add hypha https://github.com/hyphatech/opam-repository.git
opam install solidtype
```

```ocaml
module Jsx = Solidtype.Jsx
module Solid = Solidtype.Solid

let make () =
  let count, set_count = Solid.create_signal 0 in
  <button type_=`button on_click=(fun _ -> Solid.update set_count succ)>
    "Clicked " (fun () -> Jsx.int (Solid.get count))
  </button>
```

Setting up dune and Vite to build it:
[Getting Started](https://hyphatech.github.io/solidtype/).

## Licence

MIT, copyright Hypha Technologies Ltd. See [LICENSE](LICENSE).
