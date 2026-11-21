# Tick

A short line across the band at a value: a goal, a median, a mark.

`Solidtype_rhp.Tick` is rhp's `Tick`, a block: a line across its slat's band
at `at`.

Original rhp documentation: [Blocks: Tick](https://rhp.vercel.app/reference/blocks/#tick).

## Usage

A bar and a tick, a bullet chart: each metric beside its goal.

```ocaml title="rhp_tick_bullet.mlx"
module Bar = Solidtype_rhp.Bar
module Chart = Solidtype_rhp.Chart
module Color = Solidtype_rhp.Color
module Either = Solidtype_rhp.Types.Either
module Jsx = Solidtype.Jsx
module Label = Solidtype_rhp.Label
module Plot = Solidtype_rhp.Plot
module Row = Solidtype_rhp.Row
module Slat = Solidtype_rhp.Slat
module Tick = Solidtype_rhp.Tick

type metric = { metric : string; value : float; goal : float }

let metrics =
  [|
    { metric = "Revenue"; value = 72.; goal = 80. };
    { metric = "Signups"; value = 91.; goal = 75. };
    { metric = "Retention"; value = 58.; goal = 65. };
  |]

let metric =
  Slat.make ~thickness:(Slat.number 32.)
    ~room:(Slat.room ~start:(Slat.px 80.) ())
    (fun d ->
      let m = Row.data d in
      <div>
        <Label edge="start">(Jsx.string m.metric)</Label>
        <Bar to_=m.value thick=(Either.right 0.4) />
        <Tick at=m.goal thick=(Either.right 0.8) color=Color.ink />
      </div>)

let make () =
  <Chart scale=(0., 100.) label="Each metric against its goal">
    <Plot rows=metrics render=metric />
  </Chart>
```

## API Reference

| Prop | Type | Default | Description |
|---|---|---|---|
| `at` | `float` | | Its value |
| `thick` | `(string, float) Types.Either.t` | the band less a margin | Its length across the band: a CSS length, or a share |
| `color` | `Color.t` | `Color.ink` | Its color |
| `shape` | `Shape.t` | | An outline to wear instead of its rectangle |

It also takes a `<div>`'s attributes and handlers, `class_`, `style` and
`data_*`, which it passes on.
