# solidtype

Solid, typed: OCaml front ends on [SolidJS](https://www.solidjs.com) and
[Kobalte](https://kobalte.dev), compiled by [Melange](https://melange.re).

[![ci](https://img.shields.io/github/actions/workflow/status/hyphatech/solidtype/ci.yml?branch=main&label=ci)](https://github.com/hyphatech/solidtype/actions/workflows/ci.yml)
[![release](https://img.shields.io/github/v/release/hyphatech/solidtype?label=release)](https://github.com/hyphatech/solidtype/releases)
[![license](https://img.shields.io/github/license/hyphatech/solidtype)](LICENSE)
![OCaml 5.5+](https://img.shields.io/badge/OCaml-5.5%2B-EC6813?logo=ocaml&logoColor=white)
[![Hypha Stack](https://img.shields.io/badge/Hypha-Stack-d4a820?labelColor=15120e)](https://hyphatech.io/stack/)

**Documentation**: [hyphatech.github.io/solidtype](https://hyphatech.github.io/solidtype/)

## Features

- **Solid's own output**: a component in OCaml's JSX reaches the browser as the code Solid's compiler emits for the same JSX, prerendered and hydrated too.
- **Typed**: a reactive read in the wrong place, a prop left out or an attribute an element does not take does not compile.
- **Solid 1.9, whole**: signals, resources, stores, its components and its renderer, server rendering included.
- **Kobalte 0.13, whole**: `solidtype-kobalte`, generated from Kobalte's own declarations.
- **HeroUI 3.2's design**: `solidtype-heroui`, ported onto Kobalte by hand, each component beside the same one in React; [which are ported](https://hyphatech.github.io/solidtype/heroui/coverage/).

## Install

```sh
opam repo add hypha https://github.com/hyphatech/opam-repository.git
opam install solidtype    # and solidtype-kobalte, solidtype-heroui
```

The Vite plugin is an asset of each GitHub release. A whole page, from
`dune-project` to Vite: [getting started](https://hyphatech.github.io/solidtype/).

## Example

```ocaml
module Jsx = Solidtype.Jsx
module Solid = Solidtype.Solid

let make () =
  let count, set_count = Solid.create_signal 0 in
  <button type_=`button on_click=(fun _ -> Solid.update set_count succ)>
    "Clicked " (fun () -> Jsx.int (Solid.get count))
  </button>
```

## Contributing

See [AGENTS.md](AGENTS.md).

## Licence

MIT, copyright Hypha Technologies Ltd. See [LICENSE](LICENSE).
