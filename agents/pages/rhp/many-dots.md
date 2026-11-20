# Many dots

Many points at once, without a slat or a computation for each.

`Solidtype_rhp.Many_dots` is rhp's `ManyDots`, experimental in rhp: a plain
HTML point for each row, on a chart with a `cross` scale, with no slat and
no Solid computation per point, for a scatter of thousands.

Original rhp documentation: [ManyDots](https://rhp.vercel.app/reference/manydots/).

## Usage

rhp's own example: twelve hundred points, coloured by one shared colour,
by a class for each group, or each in a colour of its own. Point at a dot
to read it, and click or tap one to select it.

A point is a plain element, so its events bubble to the collection: one
handler on `Many_dots` finds the point under the pointer with `closest`,
and its row by the number rhp writes on it, `data-rhp-index`, rather than
a handler for each point. The selected point is given a class of its own
by `point_class`, which an outline styles.

```ocaml title="rhp_many_dots.mlx"
module Chart = Solidtype_rhp.Chart
module Color = Solidtype_rhp.Color
module Jsx = Solidtype.Jsx
module Many_dots = Solidtype_rhp.Many_dots
module S = Solidtype.Solid
module Ticks = Solidtype_rhp.Ticks

type point = { id : int; x : float; y : float; group : int; color : string }
type coloring = Shared | Category | Unique

external pointer_type : Dom.pointerEvent -> string = "pointerType" [@@mel.get]
external pointer_target : Dom.pointerEvent -> Dom.element = "target" [@@mel.get]
external click_target : Dom.mouseEvent -> Dom.element = "target" [@@mel.get]
external change_target : Dom.event -> Dom.element = "target" [@@mel.get]
external value : Dom.element -> string = "value" [@@mel.get]

external closest : Dom.element -> string -> Dom.element Js.Nullable.t
  = "closest"
[@@mel.send]

external get_attribute : Dom.element -> string -> string Js.Nullable.t
  = "getAttribute"
[@@mel.send]

(* The same points for a seed every time, so the page and its prerendered
   HTML agree: Park and Miller's generator, exact in a double. *)
let samples seed =
  let state = ref (float_of_int ((seed * 7919) + 7)) in
  let next () =
    state := Float.rem (!state *. 16807.) 2147483647.;
    !state /. 2147483647.
  in
  Array.init 1200 (fun id ->
      let x = 4. +. (next () *. 92.) in
      let y = 4. +. (next () *. 92.) in
      {
        id;
        x;
        y;
        group = id mod 4;
        color =
          "hsl("
          ^ Js.Float.toString (Float.rem (float_of_int id *. 137.508) 360.)
          ^ " 65% 48%)";
      })

let coloring_of = function
  | "shared" -> Shared
  | "unique" -> Unique
  | _ -> Category

let mode_class = function
  | Shared -> "mode-shared"
  | Category -> "mode-category"
  | Unique -> "mode-unique"

let coordinates p =
  "Point "
  ^ string_of_int (p.id + 1)
  ^ ": "
  ^ Js.Float.toFixed ~digits:1 p.x
  ^ ", "
  ^ Js.Float.toFixed ~digits:1 p.y

let hovering = function
  | Some p -> coordinates p
  | None -> "Hover over a point, or tap/click one to select it."

let selection = function
  | Some p -> "Selected " ^ String.lowercase_ascii (coordinates p) ^ "."
  | None -> "No point selected."

external css : string = "default" [@@mel.module "./rhp_many_dots.css?raw"]

let make () =
  let rows, set_rows = S.create_signal (samples 0) in
  let mode, set_mode = S.create_signal Category in
  let hovered, set_hovered = S.create_signal None in
  let selected, set_selected = S.create_signal None in
  let seed = ref 0 in
  (* A point's events bubble to the collection, which finds the point's row
     by the number rhp writes on it: one handler, not one per point. *)
  let row_at target =
    match Js.Nullable.toOption (closest target ".rhp-manydot") with
    | None -> None
    | Some point -> (
        match Js.Nullable.toOption (get_attribute point "data-rhp-index") with
        | None -> None
        | Some index -> (
            let all = S.get rows in
            match int_of_string_opt index with
            | Some i when i >= 0 && i < Array.length all -> Some all.(i)
            | Some _ | None -> None))
  in
  let clear () =
    S.set set_hovered None;
    S.set set_selected None
  in
  let chosen () =
    match S.get selected with
    | None -> None
    | Some id -> Array.find_opt (fun p -> p.id = id) (S.get rows)
  in
  <div class_="manydots-demo">
    <style>(Jsx.string css)</style>
    <div class_="controls">
      <label>
        "Coloring "
        <select
          on_change=(fun e ->
                      S.set set_mode (coloring_of (value (change_target e))))>
          <option value="shared">"Shared color"</option>
          <option value="category" selected=true>"Category classes"</option>
          <option value="unique">"Unique colors"</option>
        </select>
      </label>
      <button
        class_="button button--sm button--secondary"
        type_=`button
        on_click=(fun _ ->
                     clear ();
                     incr seed;
                     S.set set_rows (samples !seed))>
        "New data"
      </button>
      <button
        class_="button button--sm button--secondary"
        type_=`button
        on_click=(fun _ -> clear ())>
        "Clear selection"
      </button>
    </div>
    <Chart
      scale=(0., 100.)
      cross=(0., 100.)
      ticks=(Ticks.values [| 0.; 25.; 50.; 75.; 100. |])
      cross_ticks=(Ticks.values [| 0.; 25.; 50.; 75.; 100. |])
      height=290.
      label="1,200 sample measurements, each with two coordinates from 4 to 96">
      <Many_dots
        rows=(S.get rows)
        at=(Many_dots.each (fun p _ -> p.x))
        cross=(Many_dots.each (fun p _ -> p.y))
        key=(fun p _ -> p.id)
        size=(Many_dots.same (Many_dots.css "5px"))
        class_=(mode_class (S.get mode))
        color=(match S.get mode with
              | Unique -> Many_dots.each (fun p _ -> Color.css p.color)
              | Shared | Category -> Many_dots.same (Color.series 1))
        point_class=(let picked = S.get selected in
                     Many_dots.each (fun p _ ->
                         "group-" ^ string_of_int p.group
                         ^
                         match picked with
                         | Some id when id = p.id -> " selected"
                         | Some _ | None -> ""))
        on_pointer_move=(fun e ->
                          if not (String.equal (pointer_type e) "touch") then
                            S.set set_hovered (row_at (pointer_target e)))
        on_pointer_leave=(fun _ -> S.set set_hovered None)
        on_click=(fun e ->
                   S.set set_hovered None;
                   S.set set_selected
                     (Option.map (fun p -> p.id) (row_at (click_target e))))
      />
    </Chart>
    <p class_="readout">(Jsx.string (hovering (S.get hovered)))</p>
    <p class_="readout" role=`status>(Jsx.string (selection (chosen ())))</p>
  </div>
```

```css title="rhp_many_dots.css"
.manydots-demo .mode-category .group-0 { background-color: var(--rhp-series-1); }
.manydots-demo .mode-category .group-1 { background-color: var(--rhp-series-2); }
.manydots-demo .mode-category .group-2 { background-color: var(--rhp-series-3); }
.manydots-demo .mode-category .group-3 { background-color: var(--rhp-series-4); }
.manydots-demo .rhp-manydot:hover,
.manydots-demo .rhp-manydot.selected { outline: 2px solid var(--rhp-ink); outline-offset: 2px; }
.manydots-demo .controls { display: flex; flex-wrap: wrap; align-items: center; gap: .5rem; margin-bottom: .75rem; }
.manydots-demo select { font: inherit; color: inherit; background: transparent; border: 1px solid var(--color-border); border-radius: .5rem; padding: .2rem .4rem; }
.manydots-demo .readout { min-height: 1.5em; margin: .5rem 0 0; font-size: .875rem; }
```

## Values

Each prop takes `Many_dots.same v`, one value for every point, or
`Many_dots.each (fun row i -> v)`, one for each point, worked out once for
each update of the rows.

## API Reference

| Prop | Type | Default | Description |
|---|---|---|---|
| `rows` | `'row array` | required | A point each |
| `at` | `('row, float) Many_dots.value` | required | Its value on the value axis; a point not finite is left out |
| `cross` | `('row, float) Many_dots.value` | required | Its value on the cross scale |
| `key` | `'row -> int -> 'key` | its number | What identifies a point |
| `color` | `('row, Color.t) Many_dots.value` | | Its colour |
| `size` | `('row, Many_dots.size) Many_dots.value` | `Many_dots.px 4.` | Its diameter |
| `shape` | `('row, Shape.t) Many_dots.value` | | Its outline |
| `point_class` | `('row, string) Many_dots.value` | | A point's own classes |
| `point_style` | `('row, string Js.Dict.t) Many_dots.value` | | A point's own declarations |

It also takes a `<div>`'s attributes and handlers, `class_`, `style` and
`data_*`, which it passes on.
