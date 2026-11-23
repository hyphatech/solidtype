# Area

A filled outline across the band: ridgelines, or violins drawn both ways.

`Solidtype_rhp.Area` is rhp's `Area`: an SVG shape over `points`, each a
value and a height across the band, up from its edge or, `mirror`ed, both
ways from its middle.

Original rhp documentation: [Blocks: Area](https://rhp.vercel.app/reference/blocks/#area).

## Usage

A violin for each route: its times' spread, from `density`, drawn both ways
from the middle of the band.

```ocaml title="rhp_area_violin.mlx"
module Area = Solidtype_rhp.Area
module Chart = Solidtype_rhp.Chart
module Density = Solidtype_rhp.Types.Density_Options
module Jsx = Solidtype.Jsx
module Label = Solidtype_rhp.Label
module Plot = Solidtype_rhp.Plot
module Row = Solidtype_rhp.Row
module Slat = Solidtype_rhp.Slat

type route = { route : string; minutes : float array }

let routes =
  [|
    {
      route = "Bus";
      minutes = [| 22.; 25.; 24.; 31.; 28.; 26.; 35.; 24.; 27.; 29. |];
    };
    {
      route = "Tram";
      minutes = [| 18.; 19.; 21.; 20.; 19.; 22.; 18.; 20.; 21.; 19. |];
    };
    {
      route = "Bike";
      minutes = [| 15.; 17.; 16.; 18.; 15.; 16.; 17.; 19.; 16.; 15. |];
    };
  |]

(* Each route's spread of times, as a density over the scale. *)
let spread minutes =
  Solidtype_rhp.density
    (Array.map Option.some minutes)
    ~options:(Density.make ~domain:(10., 40.) ())
    ()
  |> Array.map (fun (x, y) -> Some (Some x, Some y))

let route =
  Slat.make ~thickness:(Slat.number 48.)
    ~room:(Slat.room ~start:(Slat.px 48.) ())
    (fun d ->
      let r = Row.data d in
      <div>
        <Label edge="start">(Jsx.string r.route)</Label>
        <Area points=(spread r.minutes) mirror=true smooth=true />
      </div>)

let make () =
  <Chart scale=(10., 40.) label="Minutes to work, by route">
    <Plot rows=routes render=route />
  </Chart>
```

## API Reference

| Prop | Type | Default | Description |
|---|---|---|---|
| `points` | `(float option * float option) option array` | | Value and height pairs, sorted by value; a missing one breaks the shape |
| `peak` | `float` | the largest height | The height that fills the band |
| `mirror` | `bool` | `false` | Both ways from the band's middle |
| `smooth` | `bool` | `false` | Curves between the points |
| `color` | `Color.t` | `Color.series 1` | Its colour |

It also takes an `<svg>`'s attributes and handlers, which it passes on.
