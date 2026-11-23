# Scale

An axis drawn as a plot of its ticks, from blocks.

`Solidtype_rhp.Scale` is rhp's `Scale`: a slat for each tick of the chart's
scale, so an axis is drawn from the same blocks as the data. A chart with a
`Scale` draws no axis of its own.

Original rhp documentation: [Scale](https://rhp.vercel.app/reference/scale/).

## Usage

A tick every five, the ends included, each a `Tick` and a `Label`, the last
one saying the unit.

```ocaml title="rhp_scale_axis.mlx"
module Bar = Solidtype_rhp.Bar
module Chart = Solidtype_rhp.Chart
module Either = Solidtype_rhp.Types.Either
module Every = Solidtype_rhp.Types.Every_Options
module Jsx = Solidtype.Jsx
module Label = Solidtype_rhp.Label
module Plot = Solidtype_rhp.Plot
module Row = Solidtype_rhp.Row
module Scale = Solidtype_rhp.Scale
module Slat = Solidtype_rhp.Slat
module Tick = Solidtype_rhp.Tick
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

external css : string = "default" [@@mel.module "./rhp_scale_axis.css?raw"]

(* A tick of the axis: a thin line behind the bars, across the whole plot,
   and its value under the plot, in the room the slat makes there, the last
   one saying the unit. *)
let tick =
  Slat.make
    ~room:(Slat.room ~end_:(Slat.px 32.) ~after:28. ())
    ~css
    (fun (d : Scale.tick Row.t) ->
      let t = Row.data d in
      <div>
        <Tick at=t.at thick=(Either.right 1.) class_="line" />
        <Label at=t.at class_="num">
          (Jsx.string (Js.Float.toString t.at ^ if t.last then " sold" else ""))
        </Label>
      </div>)

let make () =
  <Chart scale=(0., 20.)>
    <Scale
      ticks=(Ticks.custom
               (Solidtype_rhp.every 5. ~options:(Every.make ~ends:true ()) ()))
      render=tick
    />
    <Plot rows=fruits render=fruit />
  </Chart>
```

```css title="rhp_scale_axis.css"
.line { background: var(--rhp-grid); --rhp-tick-width: 1px; }
.num { font-size: 11px; color: var(--rhp-muted); padding: 0; }
.num:horizontal { top: calc(100% + 8px); translate: -50% 0; }
```

## The tick

A tick's slat is a function of a `Scale.tick Row.t`, a record:

| Field | Type | Description |
|---|---|---|
| `at` | `float` | The tick's value |
| `next` | `float` | The next tick's value, the scale's maximum for the last |
| `first`, `last` | `bool` | Whether it is the first, or the last |
| `to_end` | `float` | px from it to the scale's end, once measured; `infinity` before |

## API Reference

| Prop | Type | Default | Description |
|---|---|---|---|
| `ticks` | `Ticks.t` | the chart's | Its ticks |
| `render`, or a function child | `Scale.tick Slat.t` | required | A tick's slat |
| `class_` | `string` | | On its element |
| `style` | `string Js.Dict.t` | | Declarations rhp adds to its own |
