# Plot

A slat for each row, stacked in the chart's band, each in its place as the rows change.

`Solidtype_rhp.Plot` is rhp's `Plot`: a slat for each of its rows. Its
`rows` are an array of an OCaml record, and its slat a
[`Slat.t`](slat.md) of that record, so the two agree or the
chart does not compile.

Original rhp documentation: [Plot](https://rhp.vercel.app/reference/plot/).

## Usage

`rows` is read as it changes: a new array redraws only what changed in it,
here one bar, which moves to its new length. `keyboard` lets the slats take
focus: Tab stops at one, and the arrows, Home and End move through them.

```ocaml title="rhp_plot_live.mlx"
module Animate = Solidtype_rhp.Animate
module Bar = Solidtype_rhp.Bar
module Chart = Solidtype_rhp.Chart
module Jsx = Solidtype.Jsx
module Label = Solidtype_rhp.Label
module Plot = Solidtype_rhp.Plot
module Row = Solidtype_rhp.Row
module S = Solidtype.Solid
module Slat = Solidtype_rhp.Slat

type team = { team : string; points : float }

let start =
  [|
    { team = "Ravens"; points = 21. };
    { team = "Otters"; points = 14. };
    { team = "Herons"; points = 9. };
  |]

let team =
  Slat.make ~thickness:(Slat.number 32.)
    ~room:(Slat.room ~start:(Slat.px 72.) ())
    (fun d ->
      let t = Row.data d in
      <div>
        <Label edge="start">(Jsx.string t.team)</Label> <Bar to_=t.points />
      </div>)

let make () =
  let teams, set_teams = S.create_signal start in
  let score i =
    S.set set_teams
      (Array.mapi
         (fun j (t : team) ->
           if i = j then { t with points = t.points +. 3. } else t)
         (S.get teams))
  in
  <div>
    <Chart scale=(0., 40.) label="Points">
      <Plot
        rows=(S.get teams)
        keyboard=true
        animate=(Animate.groups [| "points" |])
        render=team
      />
    </Chart>
    <button
      class_="button button--secondary"
      type_=`button
      on_click=(fun _ -> score 2)>
      "Herons score"
    </button>
  </div>
```

## Examples

### Sorted

`order` is an `Order.t`: a place for each row, `Order.positions`, or a
sort, `Order.sort_by`, by what a function of the row gives. Given `None`,
`?order=`, the rows keep their own order; the bars slide between the two.

```ocaml title="rhp_plot_sorted.mlx"
module Bar = Solidtype_rhp.Bar
module Chart = Solidtype_rhp.Chart
module Jsx = Solidtype.Jsx
module Label = Solidtype_rhp.Label
module Order = Solidtype_rhp.Order
module Plot = Solidtype_rhp.Plot
module Row = Solidtype_rhp.Row
module S = Solidtype.Solid
module Slat = Solidtype_rhp.Slat

type fruit = { name : string; sold : float }

let fruits =
  [|
    { name = "Apples"; sold = 12. };
    { name = "Bananas"; sold = 18. };
    { name = "Cherries"; sold = 7. };
    { name = "Dates"; sold = 15. };
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
  let ranked, set_ranked = S.create_signal false in
  <div>
    <Chart scale=(0., 20.) label="Crates sold">
      <Plot
        rows=fruits
        ?order=(if S.get ranked then
                  Some
                    (Order.sort_by ~direction:`desc (fun d -> (Row.data d).sold))
                else None)
        render=fruit
      />
    </Chart>
    <button
      class_="button button--secondary"
      type_=`button
      on_click=(fun _ -> S.set set_ranked (not (S.get ranked)))>
      "Rank"
    </button>
  </div>
```

### A scatter plot

On a chart with a `cross` scale, an `overlap` plot's slats share the whole
plot, and a `Dot` given `at` and `cross` is a point on both scales. A block
alone can be an overlap plot's slat, with no element around it.

```ocaml title="rhp_plot_scatter.mlx"
module Chart = Solidtype_rhp.Chart
module Dot = Solidtype_rhp.Dot
module Plot = Solidtype_rhp.Plot
module Row = Solidtype_rhp.Row

type car = { power : float; price : float }

let cars =
  [|
    { power = 90.; price = 18. };
    { power = 120.; price = 24. };
    { power = 150.; price = 31. };
    { power = 110.; price = 27. };
    { power = 200.; price = 45. };
    { power = 170.; price = 36. };
  |]

let car d =
  let c = Row.data d in
  <Dot at=c.power cross=c.price />

let make () =
  <Chart
    scale=(50., 250.)
    cross=(0., 60.)
    height=220.
    label="Price, in k€, by power, in hp">
    <Plot rows=cars overlap=true render=car />
  </Chart>
```

## Anatomy

```ocaml
<Chart scale=((0., 30.))>
  <Plot rows=(fruits) render=fruit />
</Chart>
```

A slat made by `Slat.make` is given by name, `render=fruit`, since rhp
reads its layout from it; one with no layout of its own can be written in
place, as the plot's child:

```ocaml
<Plot rows=(fruits)>
  (fun d -> let f = Row.data d in <Bar to_=(f.sold) />)
</Plot>
```

## API Reference

| Prop | Type | Default | Description |
|---|---|---|---|
| `rows` | `'row array` | required | The rows, a slat each |
| `render`, or a function child | `'row Slat.t` | required | The slat |
| `key` | `'row Row.t -> 'key` | the row's number | What identifies a row, so a row removed takes its own slat with it |
| `reorder` | `` [ `slide \| `move \| `refill ] `` | `` `slide `` | How slats change places |
| `orientation` | `` [ `horizontal \| `vertical \| `across ] `` | the chart's | `` `across `` is the other way from the plot around it |
| `overlap` | `bool` | `false` | Every slat in one band: stacked segments, strips of dots, layers |
| `slats` | `float` | every row | The number of slats |
| `order` | `'row Order.t` | the rows' | The order they are shown in |
| `animate` | `Animate.t` | the chart's | The JavaScript version: `Animate.all`, only the fields that change, `Animate.groups [\| "points" \|]`, or with its timing, `Animate.make` |
| `thick` | `(string, float) Types.Either.t` | `1.` | In a slat, the share of its band the plot fills, or a CSS length |
| `static` | `bool` | the chart's | Rows drawn once |
| `keyboard` | `bool` | `false` | The slats take focus |
| `class_`, `ref` | | | On the plot's element |
| `style` | `string Js.Dict.t` | | Declarations rhp adds to its own |
