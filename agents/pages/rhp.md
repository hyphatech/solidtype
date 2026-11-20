# Charts

Zero-cost bindings to rhp, Solid's reactive charts made of HTML.

Charts in solidtype are powered by [rhp](https://rhp.vercel.app), a chart
library for Solid, which `solidtype-rhp` binds in full. The
[Gallery](rhp/gallery.md) shows what you can build with it.

Original rhp documentation: [Introduction](https://rhp.vercel.app/start/introduction/)
and [Your first chart](https://rhp.vercel.app/start/first-chart/). rhp's
pages are the reference for what each prop does; these say how it is
written in OCaml.

```ocaml title="rhp_bar_chart.mlx"
module Bar = Solidtype_rhp.Bar
module Chart = Solidtype_rhp.Chart
module Jsx = Solidtype.Jsx
module Label = Solidtype_rhp.Label
module Plot = Solidtype_rhp.Plot
module Row = Solidtype_rhp.Row
module Slat = Solidtype_rhp.Slat

type fruit = { name : string; sold : float }

let fruits =
  [|
    { name = "Apples"; sold = 12. };
    { name = "Bananas"; sold = 18. };
    { name = "Cherries"; sold = 7. };
  |]

let fruit =
  Slat.make ~thickness:(Slat.number 32.)
    ~room:(Slat.room ~start:(Slat.px 80.) ~end_:(Slat.px 40.) ())
    (fun d ->
      let f = Row.data d in
      <div>
        <Label edge="start">(Jsx.string f.name)</Label>
        <Bar to_=f.sold />
        <Label at=f.sold>(Jsx.string (Js.Float.toString f.sold))</Label>
      </div>)

let make () = <Chart scale=(0., 30.)><Plot rows=fruits render=fruit /></Chart>
```

## Install

rhp is Solid's only peer, and adds its CSS to the page itself.

```sh
bun add @bezda/rhp
opam install solidtype-rhp
```

```lisp
(libraries solidtype solidtype-rhp melange.dom)
```

## How a chart is made

A `Chart` is the frame: its scale, its axis, its orientation. A `Plot`
inside it draws one **slat** for each of its rows, and a slat is the
template for one row: a function of the row that returns one element, made
of **blocks** -- `Bar`, `Label` and the others -- that place themselves on
the chart's scale.

- **Rows are records.** A plot's `rows` is an array of an OCaml record,
  which Melange writes as JavaScript objects of the same fields, and its
  slat is a function of that record's [`Row.t`](rhp/slat.md#the-row).
  `Row.data d` is the row itself, so a slat reads only the fields its
  record has, and a misspelt one does not compile.
- **A read is tracked where it is written.** rhp reads a row's field when
  a block reads it, so a change redraws only what reads it: `to_=f.sold` is
  read again as the row changes, as any expression in JSX is.
- **A slat is given by name**, `render=fruit`, since rhp reads its layout
  from the slat itself; a slat written in place is a function child,
  `(fun d -> ...)`.

## Missing values

rhp draws nothing for a missing value, which OCaml says with an option. A
block's prop that may be missing is the optional prop, `?to_=sold` with
`sold : float option`, written as `undefined` while it is
`None`; a prop left out keeps its default, a bar's `from` its 0. A helper
takes and gives `float option array`, and a point of a `Line` or an `Area`
is an option of two options.
