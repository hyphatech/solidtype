# Slat

The template for one row, with the CSS and layout every slat of its type shares.

A slat is a function of a row that returns one element: the row's root,
which rhp places in its band. `Solidtype_rhp.Slat.make` is rhp's `slat()`,
which gives a slat type its own CSS and layout, so it looks and lays out the
same in any chart.

Original rhp documentation: [slat()](https://rhp.vercel.app/reference/slat/)
and [Layout](https://rhp.vercel.app/guides/layout/).

## Usage

`thickness` is a row's height, `inset` the empty share of the band beside a
bar, `room` the room outside the plot for its labels -- `Slat.auto_room`
fits each side to its widest label -- and `css` styles this type's slats
alone.

```ocaml title="rhp_slat_layout.mlx"
module Bar = Solidtype_rhp.Bar
module Chart = Solidtype_rhp.Chart
module Jsx = Solidtype.Jsx
module Label = Solidtype_rhp.Label
module Plot = Solidtype_rhp.Plot
module Row = Solidtype_rhp.Row
module Slat = Solidtype_rhp.Slat

type language = { name : string; share : float }

let languages =
  [|
    { name = "OCaml"; share = 64. };
    { name = "TypeScript"; share = 28. };
    { name = "Shell"; share = 8. };
  |]

external css : string = "default" [@@mel.module "./rhp_slat_layout.css?raw"]

let language =
  Slat.make ~thickness:(Slat.number 40.) ~inset:(Slat.number 0.3)
    ~room:Slat.auto_room ~css (fun d ->
      let l = Row.data d in
      <div>
        <Label edge="start">(Jsx.string l.name)</Label>
        <Bar to_=l.share class_="bar" />
        <Label edge="end" class_="value">
          (Jsx.string (Js.Float.toString l.share ^ "%"))
        </Label>
      </div>)

let make () =
  <Chart scale=(0., 100.)><Plot rows=languages render=language /></Chart>
```

```css title="rhp_slat_layout.css"
.bar { --rhp-end-radius: 8px; }
.value { color: var(--rhp-muted); }
```

## The row

A slat's argument is a `'row Row.t`, rhp's row for a plot whose rows are
`'row`:

| Function | Type | Description |
|---|---|---|
| `Row.data` | `'row Row.t -> 'row` | The row: each field read from rhp as it is read |
| `Row.index` | `'row Row.t -> int` | Its number among the rows, from 0 |
| `Row.position` | `'row Row.t -> int option` | Its place on screen, `None` while hidden |

`Row.data` costs nothing: `let f = Row.data d in f.sold` is `d.sold`, the
read rhp tracks, so JSX that reads it follows the row.

## The root's style

rhp places a slat's root by its style, so a `style` on the root that
changes replaces rhp's and loses the slat's place, as
[rhp's gotchas](https://rhp.vercel.app/ai/rhp/references/api.md#15-gotchas)
warn: an element's `style` is a string, which Solid writes whole. Give the
root a class that changes, and its look in the slat's `css`; a block's
`style` may change, since rhp keeps a block's own.

## Sizes

rhp takes a number or a CSS length, for both orientations or for each:

| rhp | solidtype |
|---|---|
| `thickness: 40` | `~thickness:(Slat.number 40.)` |
| `thickness: "var(--row)"` | `~thickness:(Slat.css "var(--row)")` |
| `thickness: { horizontal: 40, vertical: 60 }` | `~thickness:(Slat.lengths ~horizontal:(Slat.number 40.) ~vertical:(Slat.number 60.) ())` |
| `room: { start: 80, end: "auto" }` | `~room:(Slat.room ~start:(Slat.px 80.) ~end_:Slat.auto ())` |
| `room: "auto"` | `~room:Slat.auto_room` |

## API Reference

`Slat.make ?css ?thickness ?inset ?room f`:

| Argument | Type | Default | Description |
|---|---|---|---|
| `css` | `string` | | CSS scoped to this type's slats; the theme's colors are `var(--rhp-<key>)` |
| `thickness` | `_ Slat.length` | the chart's share, or 32px | A row's height, or a column's width |
| `inset` | `_ Slat.length` | `0.18` | The empty share of the band beside a `Bar`, a `Tick` or an `Area` |
| `room` | `_ Slat.room` | | Room outside the plot, in px, at its `start`, `end_`, `before` and `after` |
| `f` | `'row Row.t -> Jsx.element` | required | The slat, left as it was |

Any function of a row is a slat with no layout of its own.

## Restyle

`Slat.restyle slat css` gives a slat type new CSS, and every slat of that
type restyles at once, without being drawn again, for a live style editor.
The type must have been made with `css`, an empty string will do; else it
raises `Invalid_argument`.
