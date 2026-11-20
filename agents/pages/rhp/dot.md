# Dot

A round point at a value, or at a value on each of two scales.

`Solidtype_rhp.Dot` is rhp's `Dot`, a block: a round point at `at` on the
chart's scale, across its slat's band, or at `cross` on the chart's second
scale.

Original rhp documentation: [Blocks: Dot](https://rhp.vercel.app/reference/blocks/#dot).

## Usage

Two dots and a thin bar between them, a dumbbell: each role's pay before and
after.

```ocaml title="rhp_dot_dumbbell.mlx"
module Bar = Solidtype_rhp.Bar
module Chart = Solidtype_rhp.Chart
module Color = Solidtype_rhp.Color
module Dot = Solidtype_rhp.Dot
module Either = Solidtype_rhp.Types.Either
module Jsx = Solidtype.Jsx
module Label = Solidtype_rhp.Label
module Plot = Solidtype_rhp.Plot
module Row = Solidtype_rhp.Row
module Slat = Solidtype_rhp.Slat

type pay = { role : string; before : float; after : float }

let pays =
  [|
    { role = "Design"; before = 48.; after = 61. };
    { role = "Support"; before = 35.; after = 39. };
    { role = "Sales"; before = 52.; after = 58. };
  |]

let pay =
  Slat.make ~thickness:(Slat.number 36.)
    ~room:(Slat.room ~start:(Slat.px 72.) ())
    (fun d ->
      let p = Row.data d in
      <div>
        <Label edge="start">(Jsx.string p.role)</Label>
        <Bar
          from=p.before to_=p.after thick=(Either.left "2px") color=Color.muted
        />
        <Dot at=p.before color=(Color.series 2) />
        <Dot at=p.after />
      </div>)

let make () =
  <Chart scale=(30., 70.) label="Pay before and after, in k€">
    <Plot rows=pays render=pay />
  </Chart>
```

A scatter plot is dots on two scales: see [Plot](plot.md#a-scatter-plot).

## API Reference

| Prop | Type | Default | Description |
|---|---|---|---|
| `at` | `float` | | Its value on the value axis |
| `size` | `(string, float) Types.Either.t` | `"10px"` | Its diameter: a CSS length, or a share of the band |
| `across` | `float` | `0.5` | Where it sits across the band, from 0 to 1 |
| `cross` | `float` | | Its value on the chart's second scale, in place of `across` |
| `color` | `Color.t` | `Color.series 1` | Its color |
| `shape` | `Shape.t` | | An outline to wear instead of its circle |

It also takes a `<div>`'s attributes and handlers, `class_`, `style` and
`data_*`, which it passes on.
