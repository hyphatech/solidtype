# solidtype

SolidJS for modern OCaml.
Fast, accessible and reactivity-safe. Kobalte, HeroUI, Gravity UI's icons,
rhp's charts and @internationalized/date's dates included.

[![ci](https://img.shields.io/github/actions/workflow/status/hyphatech/solidtype/ci.yml?branch=main&label=ci)](https://github.com/hyphatech/solidtype/actions/workflows/ci.yml)
[![release](https://img.shields.io/github/v/release/hyphatech/solidtype?label=release)](https://github.com/hyphatech/solidtype/releases)
[![license](https://img.shields.io/github/license/hyphatech/solidtype)](LICENSE)
![OCaml 5.5+](https://img.shields.io/badge/OCaml-5.5%2B-EC6813?logo=ocaml&logoColor=white)
[![Hypha Stack](https://img.shields.io/badge/Hypha-Stack-d4a820?labelColor=15120e)](https://hyphatech.io/stack/)

**Documentation**: [hyphatech.github.io/solidtype](https://hyphatech.github.io/solidtype/)

## Quickstart

```sh
opam repo add open-opam https://github.com/open-opam/opam-repository.git
opam install solidtype solidtype-heroui
bun add $(opam show solidtype-heroui --field x-npm-depends)
```

```ocaml
module Jsx = Solidtype.Jsx
module Solid = Solidtype.Solid
module Button = Solidtype_heroui.Button

let make () =
  let count, set_count = Solid.create_signal 0 in
  <Button variant=`secondary on_click=(fun _ -> Solid.update set_count succ)>
    "Clicked " (Jsx.int (Solid.get count))
  </Button>
```

Setting up dune and Vite to build it:
[Getting Started](https://hyphatech.github.io/solidtype/).

## With an agent

Each release installs its documentation for an agent with it: `llms.txt`,
every page in Markdown, and a skill that sends the agent there before it
writes code with solidtype. With opam alone, copy the skill into your
project, into `.agents/skills/` for Codex, Cursor and most agents or
`.claude/skills/` for Claude Code:

```sh
mkdir -p .agents/skills
cp -r $(opam var solidtype:doc)/skills/solidtype .agents/skills/
```

With Node or Bun:

```sh
npx skills add hyphatech/solidtype
```

An agent that reads no skills is told in your project's `AGENTS.md`:

```md
Before writing code with solidtype, read `$(opam var solidtype:doc)/llms.txt`
and the page of each part the work needs; build from its parts.
```

## Licence

MIT, copyright Hypha Technologies Ltd. See [LICENSE](LICENSE).
