# Line

A line through points: a sparkline in a slat, or a line chart on a second scale.

`Solidtype_rhp.Line` is rhp's `Line`: an SVG path through `points`, each an
`x` on the value axis and a `y` across the band, or on the chart's second
scale.

Original rhp documentation: [Blocks: Line](https://rhp.vercel.app/reference/blocks/#line).

## Usage

A sparkline for each city, its points a month and a temperature each, made
as the slat draws.

```ocaml title="rhp_line_sparklines.mlx"
module Chart = Solidtype_rhp.Chart
module Jsx = Solidtype.Jsx
module Label = Solidtype_rhp.Label
module Line = Solidtype_rhp.Line
module Plot = Solidtype_rhp.Plot
module Row = Solidtype_rhp.Row
module Slat = Solidtype_rhp.Slat
module Ticks = Solidtype_rhp.Ticks

type city = { city : string; temps : float array }

let cities =
  [|
    {
      city = "Oslo";
      temps = [| -4.; -4.; 0.; 5.; 11.; 15.; 17.; 16.; 11.; 6.; 1.; -3. |];
    };
    {
      city = "Lisbon";
      temps = [| 11.; 12.; 14.; 15.; 17.; 20.; 22.; 23.; 21.; 18.; 14.; 12. |];
    };
    {
      city = "Cairo";
      temps = [| 14.; 15.; 18.; 22.; 25.; 27.; 28.; 28.; 26.; 24.; 19.; 16. |];
    };
  |]

(* A point for each month: its number along the value axis, its temperature
   across the band, from the coldest month of all. *)
let points temps =
  Array.mapi (fun i t -> Some (Some (float_of_int i), Some (t +. 5.))) temps

let city =
  Slat.make ~thickness:(Slat.number 56.)
    ~room:(Slat.room ~start:(Slat.px 64.) ())
    (fun d ->
      let c = Row.data d in
      <div>
        <Label edge="start">(Jsx.string c.city)</Label>
        <Line points=(points c.temps) peak=34. smooth=true fill=true />
      </div>)

let make () =
  <Chart scale=(0., 11.) ticks=Ticks.none label="Each month's temperature">
    <Plot rows=cities render=city />
  </Chart>
```

## Points

A point is `(float option * float option) option`: `Some (Some x, Some y)`,
and a missing point, `None`, or a missing `x` or `y`, breaks the line there,
as rhp's `null` does.

## API Reference

| Prop | Type | Default | Description |
|---|---|---|---|
| `points` | `(float option * float option) option array` | | Its points, in any order: out of `x`'s order, a connected scatter plot |
| `peak` | `float` | the largest `y` | In a slat, the `y` that reaches the band's top |
| `fill` | `bool` | `false` | Fill under it, to the band's edge or down to `base` |
| `base` | `float` | `0.` | On a second scale, where the fill ends |
| `smooth` | `bool` | `false` | Curves between the points |
| `color` | `Color.t` | `Color.series 1` | Its colour |

It also takes an `<svg>`'s attributes and handlers, which it passes on.
