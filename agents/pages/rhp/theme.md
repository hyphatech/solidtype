# Theme

The colours and font of every chart inside it.

`Solidtype_rhp.Theme` is rhp's `Theme`: a theme, `Types.ThemeValues.t`, for
every chart inside it; a chart's own `theme` wins, key by key, and an inner
`Theme` changes only the keys it names. A theme's colour is a value, so a
key can be a CSS variable of the page's, and follow its light and dark.

Original rhp documentation: [Colors and themes](https://rhp.vercel.app/guides/themes/).

## Usage

Four colours and a serif, each city given the series' next by `series`.

```ocaml title="rhp_theme.mlx"
module Bar = Solidtype_rhp.Bar
module Chart = Solidtype_rhp.Chart
module Jsx = Solidtype.Jsx
module Label = Solidtype_rhp.Label
module Plot = Solidtype_rhp.Plot
module Row = Solidtype_rhp.Row
module Slat = Solidtype_rhp.Slat
module Theme = Solidtype_rhp.Theme
module ThemeValues = Solidtype_rhp.Types.ThemeValues

type city = { city : string; hours : float }

let cities =
  [|
    { city = "Lisbon"; hours = 8.2 };
    { city = "Athens"; hours = 9.1 };
    { city = "Seville"; hours = 9.4 };
    { city = "Malta"; hours = 8.8 };
  |]

let sunset =
  ThemeValues.make
    ~series:[| "#ff6b4a"; "#ffa94d"; "#f0b400"; "#b197fc" |]
    ~font:"Georgia, serif" ()

let colors = Solidtype_rhp.series ()

let city =
  Slat.make ~thickness:(Slat.number 32.)
    ~room:(Slat.room ~start:(Slat.px 64.) ())
    (fun d ->
      let c = Row.data d in
      <div>
        <Label edge="start">(Jsx.string c.city)</Label>
        <Bar to_=c.hours color=(colors d) />
      </div>)

let make () =
  <Theme value=sunset>
    <Chart scale=(0., 12.) label="Hours of sun a day in June">
      <Plot rows=cities render=city />
    </Chart>
  </Theme>
```

## API Reference

| Prop | Type | Description |
|---|---|---|
| `value` | `Types.ThemeValues.t` | Its theme |
| `children` | elements | The charts it themes |

`Types.ThemeValues.make` takes `series`, an array, and `positive`,
`negative`, `ink`, `muted`, `grid`, `surface`, `low`, `high` and `font`,
each a string; a key left out keeps rhp's, `Solidtype_rhp.theme`.
