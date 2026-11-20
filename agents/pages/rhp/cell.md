# Cell

A cell of the band, coloured by its value on the scale.

`Solidtype_rhp.Cell` is rhp's `Cell`, a block that fills its slat's band,
coloured from the theme's `low` at the scale's minimum to its `high` at its
maximum.

Original rhp documentation: [Blocks: Cell](https://rhp.vercel.app/reference/blocks/#cell).

## Usage

A day's visits as a colour, a strip of cells, the chart vertical so the days
run side by side.

```ocaml title="rhp_cell_strip.mlx"
module Cell = Solidtype_rhp.Cell
module Chart = Solidtype_rhp.Chart
module Jsx = Solidtype.Jsx
module Label = Solidtype_rhp.Label
module Plot = Solidtype_rhp.Plot
module Row = Solidtype_rhp.Row
module Slat = Solidtype_rhp.Slat
module Ticks = Solidtype_rhp.Ticks

type day = { day : string; visits : float }

let days =
  [|
    { day = "Mon"; visits = 12. };
    { day = "Tue"; visits = 30. };
    { day = "Wed"; visits = 44. };
    { day = "Thu"; visits = 38. };
    { day = "Fri"; visits = 21. };
    { day = "Sat"; visits = 8. };
    { day = "Sun"; visits = 5. };
  |]

let day =
  Slat.make
    ~room:(Slat.room ~start:(Slat.px 20.) ())
    (fun d ->
      let v = Row.data d in
      <div>
        <Cell value=v.visits /> <Label edge="start">(Jsx.string v.day)</Label>
      </div>)

let make () =
  <Chart
    orientation=`vertical
    height=60.
    scale=(0., 50.)
    ticks=Ticks.none
    label="Visits each day">
    <Plot rows=days render=day />
  </Chart>
```

## API Reference

| Prop | Type | Default | Description |
|---|---|---|---|
| `value` | `float` | | Coloured on the scale, from the theme's low to its high |
| `color` | `Color.t` | | A fixed colour instead |
| `shape` | `Shape.t` | | An outline to wear instead of its rectangle |

It also takes a `<div>`'s attributes and handlers, `class_`, `style` and
`data_*`, which it passes on.
