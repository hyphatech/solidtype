# Label

Text placed on the chart's scale, or outside it at an edge.

`Solidtype_rhp.Label` is rhp's `Label`, a block: text that starts just past
a value, or ends just before it, or sits outside the plot, in the chart's
gutter.

Original rhp documentation: [Blocks: Label](https://rhp.vercel.app/reference/blocks/#label).

## Usage

`edge="start"` puts a name before the plot and `edge="end"` a unit after
it, each in the room the slat makes; `at` with ``side=`before`` ends the text
just before the value, inside the bar.

```ocaml title="rhp_label_edges.mlx"
module Bar = Solidtype_rhp.Bar
module Chart = Solidtype_rhp.Chart
module Jsx = Solidtype.Jsx
module Label = Solidtype_rhp.Label
module Plot = Solidtype_rhp.Plot
module Row = Solidtype_rhp.Row
module Slat = Solidtype_rhp.Slat

type store = { store : string; sales : float }

let stores =
  [|
    { store = "North"; sales = 48. };
    { store = "Harbour"; sales = 31. };
    { store = "Old town"; sales = 17. };
  |]

external css : string = "default" [@@mel.module "./rhp_label_edges.css?raw"]

let store =
  Slat.make ~thickness:(Slat.number 36.)
    ~room:(Slat.room ~start:(Slat.px 80.) ~end_:(Slat.px 48.) ())
    ~css
    (fun d ->
      let s = Row.data d in
      <div>
        <Label edge="start">(Jsx.string s.store)</Label>
        <Bar to_=s.sales />
        <Label at=s.sales side=`before class_="inside">
          (Jsx.string (Js.Float.toString s.sales))
        </Label>
        <Label edge="end">"k€"</Label>
      </div>)

let make () =
  <Chart scale=(0., 50.) ticks=Solidtype_rhp.Ticks.none>
    <Plot rows=stores render=store />
  </Chart>
```

```css title="rhp_label_edges.css"
.inside { color: white; }
```

## API Reference

| Prop | Type | Default | Description |
|---|---|---|---|
| `at` | `float` | | The text starts just past this value |
| `side` | `` [ `after \| `before ] `` | `` `after `` | With `at`, `` `before `` ends the text just before it |
| `edge` | `string` | | `"start"` or `"end"`: outside the plot, before it or after it |
| `cross` | `float` | | With `at`, its place on the chart's second axis |
| `shape` | `Shape.t` | | An outline to wear instead of its box |
| `children` | elements | | The text |

`edge` is a `string`, since `end` is OCaml's keyword and no tag can be it.
It also takes a `<div>`'s attributes and handlers, which it passes on.
