# Chart

The frame of a chart -- its scale, its axis and its orientation.

`Solidtype_rhp.Chart` is rhp's `Chart`: the frame its plots draw in, on
one scale, with its axis.

Original rhp documentation: [Chart](https://rhp.vercel.app/reference/chart/).

## Usage

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

## Examples

### Vertical, with its own ticks

``orientation=`vertical`` runs the bars bottom to top, the slats side by side.
`ticks` is a [`Ticks.t`](#ticks), here a function of the scale that
`every` gives, and `format` writes each tick's text. `label` names the
chart for a reader, which then reads it as a figure.

```ocaml title="rhp_chart_vertical.mlx"
module Bar = Solidtype_rhp.Bar
module Chart = Solidtype_rhp.Chart
module Color = Solidtype_rhp.Color
module Jsx = Solidtype.Jsx
module Label = Solidtype_rhp.Label
module Plot = Solidtype_rhp.Plot
module Row = Solidtype_rhp.Row
module Slat = Solidtype_rhp.Slat
module Ticks = Solidtype_rhp.Ticks

type month = { month : string; rain : float }

let months =
  [|
    { month = "Jan"; rain = 61. };
    { month = "Feb"; rain = 48. };
    { month = "Mar"; rain = 52. };
    { month = "Apr"; rain = 44. };
    { month = "May"; rain = 51. };
    { month = "Jun"; rain = 45. };
  |]

let column =
  Slat.make
    ~room:(Slat.room ~start:(Slat.px 24.) ())
    (fun d ->
      let m = Row.data d in
      <div>
        <Label edge="start">(Jsx.string m.month)</Label>
        <Bar to_=m.rain color=(Color.series 2) />
      </div>)

let make () =
  <Chart
    orientation=`vertical
    height=200.
    scale=(0., 80.)
    ticks=(Ticks.custom (Solidtype_rhp.every 20. ()))
    format=(fun mm -> <span>(Jsx.string (Js.Float.toString mm ^ " mm"))</span>)
    label="Rain each month">
    <Plot rows=months render=column />
  </Chart>
```

### Ticks of your own

`Ticks.custom` takes any function of the scale's minimum and maximum: here
its ends and its middle.

```ocaml title="rhp_chart_ticks.mlx"
module Bar = Solidtype_rhp.Bar
module Chart = Solidtype_rhp.Chart
module Jsx = Solidtype.Jsx
module Label = Solidtype_rhp.Label
module Plot = Solidtype_rhp.Plot
module Row = Solidtype_rhp.Row
module Slat = Solidtype_rhp.Slat
module Ticks = Solidtype_rhp.Ticks

type fruit = { name : string; sold : float }

let fruits =
  [|
    { name = "Apples"; sold = 12. };
    { name = "Bananas"; sold = 18. };
    { name = "Cherries"; sold = 7. };
  |]

let fruit =
  Slat.make ~thickness:(Slat.number 32.)
    ~room:(Slat.room ~start:(Slat.px 80.) ())
    (fun d ->
      let f = Row.data d in
      <div>
        <Label edge="start">(Jsx.string f.name)</Label> <Bar to_=f.sold />
      </div>)

let make () =
  <Chart
    scale=(0., 30.)
    ticks=(Ticks.custom (fun (lo, hi) -> [| lo; (lo +. hi) /. 2.; hi |]))>
    <Plot rows=fruits render=fruit />
  </Chart>
```

## Ticks

rhp takes four kinds of ticks, which `Ticks` builds:

| rhp | solidtype |
|---|---|
| `[0, 10, 20]` | `Ticks.values [\| 0.; 10.; 20. \|]` |
| `5` | `Ticks.count 5` |
| `every(10)` | `Ticks.custom (Solidtype_rhp.every 10. ())` |
| `([lo, hi]) => [lo, hi]` | `Ticks.custom (fun (lo, hi) -> [\| lo; hi \|])` |
| `false` | `Ticks.none` |

## API Reference

| Prop | Type | Default | Description |
|---|---|---|---|
| `scale` | `float * float` | `(0., 100.)` | The value axis' minimum and maximum |
| `orientation` | `` [ `horizontal \| `vertical ] `` | `` `horizontal `` | Bars left to right, or bottom to top |
| `ticks` | `Ticks.t` | about 5 | The axis' ticks |
| `grid` | `bool` | `true` | Whether the axis draws its grid lines |
| `format` | `float -> Jsx.element` | the number | A tick's text |
| `height` | `float` | `240.` when vertical | The plot's height, in px |
| `aspect` | `float` | | The whole chart's width over its height, kept at any width |
| `animate` | `(bool, Types.Timing.t) Types.Either.t` | off | The JavaScript version, or its timing |
| `theme` | `Types.ThemeValues.t` | rhp's | Colors and font, over a `Theme`'s around it |
| `static` | `bool` | `false` | Rows drawn once, for data that does not change |
| `no_css_guard` | `bool` | `false` | Without the CSS that keeps the page's out of the chart |
| `cross` | `float * float` | | A second scale, across the band |
| `cross_ticks`, `cross_grid`, `cross_format` | | | The second axis', as `ticks`, `grid` and `format` |
| `label` | `string` | | The chart's name for a reader |
| `id`, `class_`, `role`, `ref` | | | On the chart's element |
| `style` | `string Js.Dict.t` | | Declarations rhp adds to its own |

rhp's `aria-*` props are not taken; `label` names the chart.
