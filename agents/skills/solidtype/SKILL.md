---
name: solidtype
description: "Use before writing or changing OCaml code that uses solidtype or its packages: Solid's components, signals and stores in OCaml's JSX (.mlx), Kobalte's components, HeroUI's ported onto them (buttons, fields, lists, tabs, overlays, tables), rhp's charts, Gravity UI's icons and @internationalized/date."
---

# solidtype

solidtype's documentation is installed with its opam package, `solidtype`, at the release the code builds against. Read it before writing code with solidtype, and build from the parts it gives.

1. Read the catalogue, `$(opam var solidtype:doc)/llms.txt`: every page, a line each, by what it is for. Only where it is not installed, read https://hyphatech.github.io/solidtype/llms.txt, which may document a newer release than the code builds against.
2. Read the page of each part the work needs, `$(opam var solidtype:doc)/pages/<page>.md`, its examples among them.
3. Build from those parts, and write by hand only what none of them does.

## Written by hand instead of a part

Each of these is easily written by hand where solidtype has a part; look for the part first:

- a raw `<button>`, `<input>`, `<a>`, `<ul>`/`<li>` used as a list, `<nav>`, or a `style=`, where solidtype-heroui has Button, TextField/Input, Link, ListBox, Tabs/Breadcrumbs, and the design's tokens
