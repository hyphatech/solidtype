# Place

A place on the scale, which draws nothing, for whatever is put in it.

`Solidtype_rhp.Place` is rhp's `Place`, a block of no size that draws
nothing: what is put inside it sits at its value.

Original rhp documentation: [Blocks: Place](https://rhp.vercel.app/reference/blocks/#place).

## Usage

A badge of each route's weight, at the end of its bar, styled by the slat's
CSS.

```ocaml title="rhp_place_badges.mlx"
module Bar = Solidtype_rhp.Bar
module Chart = Solidtype_rhp.Chart
module Jsx = Solidtype.Jsx
module Label = Solidtype_rhp.Label
module Place = Solidtype_rhp.Place
module Plot = Solidtype_rhp.Plot
module Row = Solidtype_rhp.Row
module Slat = Solidtype_rhp.Slat

type parcel = { route : string; kg : float }

let parcels =
  [|
    { route = "Air"; kg = 14. };
    { route = "Road"; kg = 32. };
    { route = "Sea"; kg = 48. };
  |]

external css : string = "default" [@@mel.module "./rhp_place_badges.css?raw"]

let parcel =
  Slat.make ~thickness:(Slat.number 36.)
    ~room:(Slat.room ~start:(Slat.px 48.) ~end_:(Slat.px 64.) ())
    ~css
    (fun d ->
      let p = Row.data d in
      <div>
        <Label edge="start">(Jsx.string p.route)</Label>
        <Bar to_=p.kg />
        <Place at=p.kg>
          <span class_="badge">
            (Jsx.string (Js.Float.toString p.kg ^ " kg"))
          </span>
        </Place>
      </div>)

let make () = <Chart scale=(0., 60.)><Plot rows=parcels render=parcel /></Chart>
```

```css title="rhp_place_badges.css"
.badge { position: absolute; translate: 6px -50%; padding: 1px 6px; border-radius: 6px; white-space: nowrap; background: var(--rhp-ink); color: var(--rhp-surface); font-size: 12px; }
```

## API Reference

| Prop | Type | Default | Description |
|---|---|---|---|
| `at` | `float` | | Its value |
| `across` | `float` | `0.5` | Where it sits across the band, from 0 to 1 |
| `cross` | `float` | | Its value on the chart's second scale, in place of `across` |
| `children` | elements | | What sits at its value |

It also takes a `<div>`'s attributes and handlers, `class_`, `style` and
`data_*`, which it passes on.
