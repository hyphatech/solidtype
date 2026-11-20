# Poster

A panel around a chart, as a magazine sets one: kicker, headline, dek and note.

`Solidtype_rhp.Poster` is rhp's `Poster`, a `<figure>` around a chart with a
kicker, a headline, a dek and a note: markup alone, its look the page's
CSS, or one of the looks in `@bezda/rhp/posters.css`, which a page links.

Original rhp documentation: [Poster](https://rhp.vercel.app/reference/poster/).

## Usage

`look="market"` is one of the looks in rhp's `posters.css`, which this page
imports, as an application imports it once.

```ocaml title="rhp_poster.mlx"
module Bar = Solidtype_rhp.Bar
module Chart = Solidtype_rhp.Chart
module Jsx = Solidtype.Jsx
module Label = Solidtype_rhp.Label
module Plot = Solidtype_rhp.Plot
module Poster = Solidtype_rhp.Poster
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
    ~room:(Slat.room ~start:(Slat.px 80.) ())
    (fun d ->
      let f = Row.data d in
      <div>
        <Label edge="start">(Jsx.string f.name)</Label> <Bar to_=f.sold />
      </div>)

let make () =
  <Poster
    look="market"
    kicker=(<span>"The market"</span>)
    title=(<span>"Bananas sell best"</span>)
    dek=(<span>"Crates sold on Saturday, by fruit"</span>)
    note=(<span>"Counted at the stall's till."</span>)>
    <Chart scale=(0., 20.)><Plot rows=fruits render=fruit /></Chart>
  </Poster>
```

## API Reference

| Prop | Type | Description |
|---|---|---|
| `look` | `string` | A class for its look, added to `poster` |
| `kicker` | `Jsx.element` | Above the headline |
| `title` | `Jsx.element` | The headline |
| `dek` | `Jsx.element` | Under the headline |
| `note` | `Jsx.element` | Under the chart |
| `children` | elements | The chart |

It also takes a `<figure>`'s attributes and handlers, which it passes on.
