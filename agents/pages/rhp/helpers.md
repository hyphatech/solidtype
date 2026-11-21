# Helpers

The functions of data rhp gives: stacks, running totals, bins, summaries, densities.

rhp's helpers work a chart's values out from its data. Each takes values
that may be missing, `float option array`, and leaves a missing one out:
`Array.map Option.some` makes one of plain values.

Original rhp documentation: [Helpers](https://rhp.vercel.app/reference/helpers/).

## Stacked bars

`stack_up` gives each value's segment, positive ones up from 0, negative
ones down; a missing value is a missing segment, its bar given `None`,
which draws nothing. The segments are a plot inside the slat, `overlap` so
they share its band.

```ocaml title="rhp_stacked_bars.mlx"
module Bar = Solidtype_rhp.Bar
module Chart = Solidtype_rhp.Chart
module Color = Solidtype_rhp.Color
module Jsx = Solidtype.Jsx
module Label = Solidtype_rhp.Label
module Plot = Solidtype_rhp.Plot
module Row = Solidtype_rhp.Row
module Slat = Solidtype_rhp.Slat

type team = { team : string; hours : float option array }
type segment = { from : float option; to_ : float option; part : int }

let teams =
  [|
    { team = "Web"; hours = [| Some 12.; Some 8.; Some 5. |] };
    { team = "Mobile"; hours = [| Some 9.; None; Some 7. |] };
    { team = "Data"; hours = [| Some 4.; Some 11.; Some 6. |] };
  |]

(* A team's hours as segments end to end, a missing one drawing nothing. *)
let segments hours =
  let stack = Solidtype_rhp.stack_up hours in
  Array.mapi
    (fun part from -> { from; to_ = stack.to_.(part); part })
    stack.from

let segment d =
  let s = Row.data d in
  <Bar ?from=s.from ?to_=s.to_ color=(Color.series (s.part + 1)) />

let team =
  Slat.make ~thickness:(Slat.number 32.)
    ~room:(Slat.room ~start:(Slat.px 64.) ())
    (fun d ->
      let t = Row.data d in
      <div>
        <Label edge="start">(Jsx.string t.team)</Label>
        <Plot rows=(segments t.hours) overlap=true render=segment />
      </div>)

let make () =
  <Chart scale=(0., 30.) label="Hours a week, by task">
    <Plot rows=teams render=team />
  </Chart>
```

## A waterfall

`running` gives each change's step, from the total before it to the total
after.

```ocaml title="rhp_waterfall.mlx"
module Bar = Solidtype_rhp.Bar
module Chart = Solidtype_rhp.Chart
module Color = Solidtype_rhp.Color
module Jsx = Solidtype.Jsx
module Label = Solidtype_rhp.Label
module Plot = Solidtype_rhp.Plot
module Row = Solidtype_rhp.Row
module Slat = Solidtype_rhp.Slat

type step = {
  name : string;
  change : float;
  from : float option;
  to_ : float option;
}

(* Each change from the total before it. *)
let steps =
  let names = [| "Sales"; "Refunds"; "Services"; "Costs" |] in
  let changes = [| 40.; -12.; 18.; -6. |] in
  let total = Solidtype_rhp.running (Array.map Option.some changes) in
  Array.mapi
    (fun i name ->
      { name; change = changes.(i); from = total.from.(i); to_ = total.to_.(i) })
    names

let step =
  Slat.make ~thickness:(Slat.number 32.)
    ~room:(Slat.room ~start:(Slat.px 72.) ())
    (fun d ->
      let s = Row.data d in
      <div>
        <Label edge="start">(Jsx.string s.name)</Label>
        <Bar
          ?from=s.from
          ?to_=s.to_
          color=(if s.change < 0. then Color.negative else Color.positive)
        />
      </div>)

let make () =
  <Chart scale=(0., 60.) label="The month's profit, change by change">
    <Plot rows=steps render=step />
  </Chart>
```

## A histogram

`bins` counts the samples in bins of equal width over a domain.

```ocaml title="rhp_histogram.mlx"
module Bar = Solidtype_rhp.Bar
module Bins = Solidtype_rhp.Types.Bins
module Chart = Solidtype_rhp.Chart
module Jsx = Solidtype.Jsx
module Label = Solidtype_rhp.Label
module Plot = Solidtype_rhp.Plot
module Range = Solidtype_rhp.Types.Bins2
module Row = Solidtype_rhp.Row
module Slat = Solidtype_rhp.Slat

type bin = { from : float; tally : float }

let ages =
  [|
    23.;
    25.;
    31.;
    34.;
    35.;
    36.;
    38.;
    41.;
    41.;
    42.;
    44.;
    45.;
    47.;
    48.;
    52.;
    53.;
    55.;
    58.;
    61.;
    64.;
  |]

(* The ages in bins of ten years, a column each. *)
let bins =
  let b =
    Solidtype_rhp.bins
      (Array.map Option.some ages)
      ~options:(Bins.make ~domain:(20., 70.) ~count:5. ())
      ()
  in
  Array.mapi (fun i tally -> { from = (Range.x0 b).(i); tally }) (Range.tally b)

let bin =
  Slat.make
    ~room:(Slat.room ~start:(Slat.px 20.) ())
    (fun d ->
      let b = Row.data d in
      <div>
        <Bar to_=b.tally />
        <Label edge="start">
          (Jsx.string (Js.Float.toString b.from ^ "s"))
        </Label>
      </div>)

let make () =
  <Chart
    orientation=`vertical
    height=160.
    scale=(0., 8.)
    label="Customers by age, in bins of ten years">
    <Plot rows=bins render=bin />
  </Chart>
```

## Box plots

`summary` gives the quartiles, the median and the whiskers' ends.

```ocaml title="rhp_box_plot.mlx"
module Bar = Solidtype_rhp.Bar
module Chart = Solidtype_rhp.Chart
module Color = Solidtype_rhp.Color
module Either = Solidtype_rhp.Types.Either
module Jsx = Solidtype.Jsx
module Label = Solidtype_rhp.Label
module Plot = Solidtype_rhp.Plot
module Row = Solidtype_rhp.Row
module Slat = Solidtype_rhp.Slat
module Summary = Solidtype_rhp.Types.Summary
module Tick = Solidtype_rhp.Tick

type runner = { runner : string; laps : float array }

let runners =
  [|
    { runner = "Ana"; laps = [| 61.; 63.; 62.; 65.; 60.; 64.; 70.; 62. |] };
    { runner = "Ben"; laps = [| 58.; 66.; 59.; 71.; 62.; 57.; 64.; 60. |] };
    { runner = "Cleo"; laps = [| 67.; 68.; 66.; 69.; 67.; 70.; 68.; 66. |] };
  |]

let runner =
  Slat.make ~thickness:(Slat.number 36.)
    ~room:(Slat.room ~start:(Slat.px 48.) ())
    (fun d ->
      let r = Row.data d in
      let s = Solidtype_rhp.summary (Array.map Option.some r.laps) in
      <div>
        <Label edge="start">(Jsx.string r.runner)</Label>
        <Bar
          from=(Summary.low s)
          to_=(Summary.high s)
          thick=(Either.left "2px")
          color=Color.muted
        />
        <Bar from=(Summary.q1 s) to_=(Summary.q3 s) />
        <Tick at=(Summary.median s) color=Color.surface />
      </div>)

let make () =
  <Chart scale=(55., 75.) label="Lap times, in seconds">
    <Plot rows=runners render=runner />
  </Chart>
```

## API Reference

| Function | Type | Description |
|---|---|---|
| `stack_up` | `float option array -> Solidtype_rhp.stack` | Stacked segments, `from` and `to_` |
| `running` | `float option array -> Solidtype_rhp.stack` | Running totals, for a waterfall |
| `shares` | `?total:float -> float option array -> float option array` | Each value's share of the sum, scaled to `total`, 100 by default |
| `summary` | `float option array -> Types.Summary.t` | Quartiles, median, whiskers, mean and outliers |
| `bins` | `float option array -> ?options:Types.Bins.t -> unit -> Types.Bins2.t` | Histogram bins, `x0`, `x1` and `tally` |
| `density` | `float option array -> ?options:Types.Density.t -> unit -> (float * float) array` | A kernel density estimate, for an `Area` |
| `extent` | `float option array -> float * float` | The smallest and the largest |
| `nice` | `float -> float -> ?count:float -> unit -> Types.Nice.t` | A round scale over a range |
| `every` | `float -> ?options:Types.Every.t -> unit -> (float * float -> float array)` | Ticks at every multiple of a step |
| `series` | `?n:int -> unit -> 'row Row.t -> Color.t` | The theme's series colours through the rows |
| `cycle` | `'a array -> 'row Row.t -> 'a` | A list repeated over the rows |

`every` raises `Invalid_argument` for a step not above 0, and `every_opt`
gives `None`.
