# Bar

A bar along the value axis, from one value to another.

`Solidtype_rhp.Bar` is rhp's `Bar`, a block: a `<div>` from `from` to
`to_` on the chart's scale, across its slat's band.

Original rhp documentation: [Blocks: Bar](https://rhp.vercel.app/reference/blocks/#bar).

## Usage

A bar from one value to another, here a city's lowest temperature to its
highest; below `from`, a bar runs backward. `thick` is its size across the
band, and `color` a theme's key or any CSS color.

```ocaml title="rhp_bar_range.mlx"
module Bar = Solidtype_rhp.Bar
module Chart = Solidtype_rhp.Chart
module Color = Solidtype_rhp.Color
module Jsx = Solidtype.Jsx
module Label = Solidtype_rhp.Label
module Plot = Solidtype_rhp.Plot
module Row = Solidtype_rhp.Row
module Slat = Solidtype_rhp.Slat
module Either = Solidtype_rhp.Types.Either

type city = { city : string; low : float; high : float }

let cities =
  [|
    { city = "Oslo"; low = -7.; high = 22. };
    { city = "Lisbon"; low = 8.; high = 28. };
    { city = "Cairo"; low = 9.; high = 35. };
  |]

let city =
  Slat.make ~thickness:(Slat.number 32.)
    ~room:(Slat.room ~start:(Slat.px 64.) ())
    (fun d ->
      let c = Row.data d in
      <div>
        <Label edge="start">(Jsx.string c.city)</Label>
        <Bar
          from=c.low
          to_=c.high
          thick=(Either.left "10px")
          color=(if c.low < 0. then Color.negative else Color.positive)
        />
      </div>)

let make () =
  <Chart scale=(-10., 40.) label="Each city's range of temperatures">
    <Plot rows=cities render=city />
  </Chart>
```

## Colors

`Color.t` is a key of the chart's theme, which follows the page's, or any
CSS color: `Color.series 1` to `Color.series 6`, `Color.positive`,
`Color.negative`, `Color.ink`, `Color.muted`, `Color.grid`,
`Color.surface`, `Color.low`, `Color.high`, and `Color.css "#c00"`.

## API Reference

| Prop | Type | Default | Description |
|---|---|---|---|
| `from` | `float` | `0.` | Where the bar starts |
| `to_` | `float` | `0.` | Where it ends |
| `thick` | `(string, float) Types.Either.t` | the band less a margin | A CSS length, or a share of the band |
| `color` | `Color.t` | `Color.series 1` | Its color |
| `shape` | `Shape.t` | | An outline to wear instead of its rectangle |
| `children` | elements | | Drawn inside it, cropped to its length |

It also takes a `<div>`'s attributes and handlers, `class_`, `style` and
`data_*`, which it passes on. A missing value is the prop left out, or
`?to_=` given `None`, and draws nothing.
