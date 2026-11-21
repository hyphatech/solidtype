Solid, typed, for OCaml front ends on SolidJS and Kobalte, compiled by Melange. A component is written in OCaml's JSX (`.mlx`) and reaches the browser as the code Solid's own compiler emits for the same JSX. HeroUI's components are ported onto Kobalte, and rhp's charts are bound.

A signal given where its value belongs does not compile, and neither does a prop left out, an attribute an element does not take, or a `match` in a `Switch` that misses a case. Solid's, Kobalte's and HeroUI's own documentation stays the reference for what a component does; these pages say how it is written in OCaml.

## Packages

- `solidtype`: Solid 1.9 bound whole, for Melange: signals, resources, stores, its components, its renderer, server rendering included.
- `ppx_solidtype`: rewrites the JSX of `.mlx` files into calls Melange compiles.
- `vite-plugin-solidtype`: turns those calls back into JSX for Solid's compiler. It is not on npm: it is the asset `vite-plugin-solidtype-<version>.tgz` of each release at https://github.com/hyphatech/solidtype/releases, at the version of the opam packages.
- `solidtype-kobalte`: Kobalte 0.13 bound whole, generated from its declarations.
- `solidtype-headless`: the components Kobalte lacks, with no style, and Kobalte's own where they need a fix.
- `solidtype-heroui`: HeroUI 3's components, ported onto Kobalte. Their look is `@import "@heroui/styles";` after Tailwind's, and for Segment, TrendChip and TextShimmer, which HeroUI has no styles for, `@import "vite-plugin-solidtype/heroui-extras.css";`.
- `solidtype-rhp`: rhp 2.2's charts.
- `solidtype-internationalized-date`: @internationalized/date, the values HeroUI's date components take.
- `solidtype-gravity-icons`: every icon of Gravity UI, the set HeroUI's examples draw: `ChevronDown` is `Solidtype_gravity_icons.Chevron_down`. It imports nothing from npm; `solidtype-heroui` depends on it and draws its own icons from it.

The opam packages come from open-opam: `opam repo add open-opam https://github.com/open-opam/opam-repository.git`. Each names the npm packages it imports in its opam field `x-npm-depends`: `bun add $(opam show solidtype-heroui --field x-npm-depends)`. In Vite, `solidtype()` goes before `solid()`.

## Writing it

- Every name is snake case, by one rule from the name in Solid's, Kobalte's or HeroUI's documentation: `onClick` is `on_click`, `aria-label` is `aria_label`, `isDisabled` is `is_disabled`; a keyword takes a trailing underscore, `class_`, `type_`. A module keeps its JavaScript name: `Solidtype_kobalte.Switch.Root`, `Solidtype_heroui.Button`.
- In JSX a value is written as itself, and Solid keeps it current. A literal or a name is given as it is; any other expression is read again as what it reads changes, as Solid's compiler makes an expression in JSX a getter: `title=(S.get note)` is `title={note()}`, a child `(Jsx.int (S.get count))` is `{count()}`. What changes is read by `S.get` (a signal, a prop, a part's state). Outside JSX a value that changes is `fun () -> e`, as Solid's own API takes `() => e`; state a component derives for its children is `S.accessor (fun () -> e)`. Nothing but a binding writes `[@u]`.
- A function is a function wherever it is given, `on_close=(fun () -> hide ())`, and one given where a value belongs is refused by its type.
- An optional prop is given as OCaml gives an optional argument: a value, `count=3`, or an option, `?title=label_opt`, `?title=(S.get note)`, absent while `None`.
- What JSX holds is one type, `Jsx.element`, as Solid's `JSX.Element` is: a node, `Jsx.string s`, `Jsx.int n`. A child given by its name or an expression is one, `let icon = <Icon /> in <Button>icon "Save"</Button>`.
- A function child is written in place as the child, `<For each=items>(fun item _ -> ...)</For>`, or given by its name as `render=f`.
- A component is `let%component make ~(name : string) () = ...`, and reads a prop as a signal is read, `S.get name`; its tag is the module, `<Greeting name="Ada" />`. A root mounted by a page is a plain `let make () = ...`.
- A spread, TSX's `{...props}`, is the attribute `props`; no prop is named `props`.
- A `data-` attribute is a `Jsx.data`: `data_selected=(Jsx.flag (S.get on))`.
- A namespace wraps the value: `on:click={f}` is `on_click=(Jsx.native f)`.
- A part draws another element by `as_`, HeroUI's `render`.

A page is built from the library's parts, as this counter is from HeroUI's Button: a raw element is written only where no part draws it.

```ocaml
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Button = Solidtype_heroui.Button

let make () =
  let count, set_count = S.create_signal 0 in
  <Button variant=`secondary on_click=(fun _ -> S.update set_count succ)>
    "Clicked " (Jsx.int (S.get count)) " times"
  </Button>
```
