# Gallery

rhp's gallery charts in OCaml: a waterfall, a pie, a heatmap, a Gantt chart and candlesticks.

Whole charts from rhp's gallery, each written in OCaml from rhp's own
code: the same slats, the same CSS and the same poster around it, from
the looks in `@bezda/rhp/posters.css`. Each chart is tested against the
same chart in rhp's JSX, which it draws exactly, before and after it is
pointed at or clicked.

Their data is fixed, where rhp's has a button for new data, and each
keeps one orientation, the one rhp's page opens with. An event rhp's
poster catches and traces to its row by a `data-` attribute is caught by
the row's own element here, so no handler reads the page.

Original rhp documentation: [Examples](https://rhp.vercel.app/examples/bar-chart/).

## A waterfall

`running` gives each step, from the total before it to the total after,
and a `Tick` at each step's end links it to the next. An expense is a
button: a click cuts it from the month, its step falls to nothing with a
dashed outline where it was, and the steps after it, the savings and the
headline follow.

Original rhp documentation: [Waterfall](https://rhp.vercel.app/examples/waterfall/).

```ocaml title="rhp_waterfall_budget.mlx"
module Bar = Solidtype_rhp.Bar
module Chart = Solidtype_rhp.Chart
module Color = Solidtype_rhp.Color
module Either = Solidtype_rhp.Types.Either
module Jsx = Solidtype.Jsx
module Label = Solidtype_rhp.Label
module Plot = Solidtype_rhp.Plot
module Poster = Solidtype_rhp.Poster
module Row = Solidtype_rhp.Row
module S = Solidtype.Solid
module Show = Solidtype.Show
module Slat = Solidtype_rhp.Slat
module ThemeValues = Solidtype_rhp.Types.ThemeValues
module Tick = Solidtype_rhp.Tick
module Ticks = Solidtype_rhp.Ticks

type step = {
  line : int;
  item : string;
  from : float;
  to_ : float; [@mel.as "to"]
  amount : float;
  cut : bool;
  kind : [ `in_ | `out | `total ];
  class_name : string;  (** The slat's class, which its CSS reads. *)
}

let lines =
  [| "Salary"; "Rent"; "Groceries"; "Transport"; "Bills"; "Going out" |]

(* £ in, then out; what is left is saved. *)
let month = [| 4200.; -1450.; -520.; -180.; -230.; -300. |]

let budget =
  ThemeValues.make ~font:"system-ui, sans-serif" ~ink:"#1c2433" ~muted:"#6b7385"
    ~grid:"#edf0f4" ~surface:"#ffffff" ()

let pounds v =
  let rec thousands s =
    let n = String.length s in
    if n <= 3 then s
    else thousands (String.sub s 0 (n - 3)) ^ "," ^ String.sub s (n - 3) 3
  in
  (if v < 0. then {js|−|js} else "")
  ^ {js|£|js}
  ^ thousands (Js.Float.toString (Js.Math.abs_float (Js.Math.round v)))

(* Each step runs from the total before it to the one after; a cut expense
   is a step of nothing, and the last step is what is left, from 0. *)
let steps cut =
  let total =
    Solidtype_rhp.running
      (Array.mapi (fun i v -> Some (if cut.(i) then 0. else v)) month)
  in
  let at ends i = Option.value ends.(i) ~default:0. in
  let saved = at total.to_ (Array.length month - 1) in
  Array.append
    (Array.mapi
       (fun i item ->
         {
           line = i;
           item;
           from = at total.from i;
           to_ = at total.to_ i;
           amount = month.(i);
           cut = cut.(i);
           kind = (if month.(i) > 0. then `in_ else `out);
           class_name = (if month.(i) > 0. then "in" else "out");
         })
       lines)
    [|
      {
        line = Array.length lines;
        item = "Saved";
        from = 0.;
        to_ = saved;
        amount = saved;
        cut = false;
        kind = `total;
        class_name = "total";
      };
    |]

let is_expense = function `out -> true | `in_ | `total -> false

external css : string = "default"
[@@mel.module "./rhp_waterfall_budget.css?raw"]

let make () =
  let cut, set_cut = S.create_signal (Array.map (fun _ -> false) month) in
  let shown = S.create_memo (fun () -> steps (S.get cut)) in
  let toggle line =
    S.set set_cut
      (Array.mapi (fun i c -> if i = line then not c else c) (S.get cut))
  in
  (* An expense is cut by a click on its name or its bar, and brought back
     by another. *)
  let step =
    Slat.make
      ~thickness:(Slat.lengths ~horizontal:(Slat.number 46.) ())
      ~room:(Slat.room ~start:(Slat.px 100.) ~end_:(Slat.px 66.) ())
      ~css
      (fun d ->
        let s = Row.data d in
        <div
          class_=(s.class_name ^ if s.cut then " cut" else "")
          on_click=(fun _ -> if is_expense s.kind then toggle s.line)>
          <Label edge="start" class_="item">
            (if is_expense s.kind then
               <button
                 type_=`button aria_pressed=(if s.cut then "true" else "false")>
                 (Jsx.string s.item)
               </button>
             else Jsx.string s.item)
          </Label>
          <Show when_=(is_expense s.kind)>
            <Bar
              from=s.from
              to_=(s.from +. s.amount)
              thick=(Either.left "24px")
              class_="ghost"
            />
          </Show>
          <Bar
            from=s.from
            to_=s.to_
            thick=(Either.left "24px")
            color=(match s.kind with
                  | `in_ -> Color.css "#12b886"
                  | `out -> Color.css "#f25f5c"
                  | `total -> Color.css "#1c2433")
            class_="step"
          />
          <Show
            when_=(match s.kind with `total -> false | `in_ | `out -> true)>
            <Tick at=s.to_ class_="link" />
          </Show>
          <Label at=(Float.max s.from s.to_) class_="amount">
            (Jsx.string (pounds s.amount))
          </Label>
        </div>)
  in
  let saved () =
    let all = S.get shown in
    all.(Array.length all - 1).to_
  in
  <Poster
    look="budget"
    kicker=(<span>"Monthly budget"</span>)
    title=(<span>"Where the salary goes"</span>)
    dek=(<span>
           <b>(Jsx.string (pounds (saved ())))</b> " left to save this month."
         </span>)
    note=(<span>
            "Click an expense to cut it from the month; click it again to \
             bring it back."
          </span>)>
    <Chart
      scale=(0., 5000.)
      ticks=(Ticks.values [| 0.; 1000.; 2000.; 3000.; 4000.; 5000. |])
      format=(fun v ->
               <span>
                 (Jsx.string
                    (if v = 0. then "0"
                     else {js|£|js} ^ Js.Float.toString (v /. 1000.) ^ "k"))
               </span>)
      height=320.
      theme=budget>
      <Plot rows=(S.get shown) render=step />
    </Chart>
  </Poster>
```

```css title="rhp_waterfall_budget.css"
.item { font-size: 14px; font-weight: 600; }
.item:horizontal { --rhp-label-gap: 14px; }
.item button { all: unset; cursor: pointer; border-radius: 3px; text-decoration: underline 1.5px dotted #b5bcc8; text-underline-offset: 3px; }
.item button:focus-visible { outline: 2px solid #0b8a63; outline-offset: 2px; }
.out:hover .item button { text-decoration-color: #d2423f; }
.cut .item button { color: #8a93a3; text-decoration: line-through 1.5px #d2423f; }
.step { --rhp-radius: 6px; }
.out .step, .ghost { cursor: pointer; }
.out:hover .step { box-shadow: 0 6px 12px -6px rgb(210 66 63 / .8); }
.ghost { background: none; border: 1.5px dashed #f25f5c; opacity: 0; }
.cut .ghost { opacity: .75; }
.amount { font-size: 12px; font-weight: 800; font-variant-numeric: tabular-nums; }
.in .amount { color: #0b8a63; }
.out .amount { color: #d2423f; }
.cut .amount { color: #8a93a3; text-decoration: line-through; }
.amount:horizontal { --rhp-label-gap: 8px; }
.link { background: #b5bcc8; }
.link:horizontal { width: 1px; top: calc(50% + 12px); height: 22px; translate: -50% 0; }
```

## A pie

A pie is a stacked bar of shares bent into a circle: `shares` makes the
hours percentages, `stack_up` their spans, and `overlap` puts every slat
in one box. rhp has no wedge, so each `Bar` holds an SVG path drawn from
its span, its corners rounded by a stroke of its own colour. `animated`
moves the two numbers, and the wedge is drawn again from them each
frame, since a path's points moved by CSS would flatten its rim.
`keyboard` lets Tab and the arrows reach each slice.

Original rhp documentation: [Pie](https://rhp.vercel.app/examples/pie-chart/).

```ocaml title="rhp_pie.mlx"
module Animated = Solidtype_rhp.Types.Animated
module Bar = Solidtype_rhp.Bar
module Chart = Solidtype_rhp.Chart
module Color = Solidtype_rhp.Color
module Jsx = Solidtype.Jsx
module Label = Solidtype_rhp.Label
module Plot = Solidtype_rhp.Plot
module Poster = Solidtype_rhp.Poster
module Row = Solidtype_rhp.Row
module Slat = Solidtype_rhp.Slat
module ThemeValues = Solidtype_rhp.Types.ThemeValues
module Ticks = Solidtype_rhp.Ticks

type part = {
  name : string;
  hours : float;
  color : string;
  from : float;
  to_ : float; [@mel.as "to"]
}

(* A day of 24 hours, its parts as shares of 100, stacked: the first from 0
   to 37, the next from 37 to 61, and so on round to 100. *)
let parts =
  let names =
    [| "Sleep"; "Chores and errands"; "Work and study"; "Free time" |]
  in
  let hours = [| 8.8; 5.8; 5.0; 4.4 |] in
  let colors = [| "#8d93ff"; "#9aa7c7"; "#ffb547"; "#ff5d73" |] in
  let stack =
    Solidtype_rhp.stack_up (Solidtype_rhp.shares (Array.map Option.some hours))
  in
  Array.mapi
    (fun i name ->
      {
        name;
        hours = hours.(i);
        color = colors.(i);
        from = Option.value stack.from.(i) ~default:0.;
        to_ = Option.value stack.to_.(i) ~default:0.;
      })
    names

let day =
  ThemeValues.make ~font:"system-ui, sans-serif" ~ink:"#eef1f8" ~muted:"#8b93ab"
    ~grid:"#242a3e" ~surface:"#0f1220" ()

(* rhp has no wedge, so a wedge is an SVG path in a 100 by 100 box around
   the middle, its angles turns from twelve o'clock, clockwise. A stroke of
   the fill's colour rounds its corners and grows it by half its width, so
   the path is drawn that much smaller; the gap between two wedges is a
   distance, not an angle, so each straight edge is pushed aside rather
   than turned, and stays one width from its neighbour all the way out. *)
let tau = 2. *. Js.Math._PI
let corner = 1.9
let gap = 1.9

(* Where a wedge starts, so the tips do not pile up in the middle. *)
let hole = 9.
let off = corner +. (gap /. 2.)
let radius = 50. -. corner

(* How far round pushing an edge aside moves the end of an arc, at the rim
   and at the hole. *)
let rim_turn = Js.Math.asin (off /. radius) /. tau
let hole_turn = Js.Math.asin (Float.min 1. (off /. hole)) /. tau

(* Unrounded: near half a turn, an arc moves visibly when its ends are a few
   thousandths off. *)
let point t r =
  Js.Float.toString (r *. Js.Math.sin (t *. tau))
  ^ ","
  ^ Js.Float.toString (-.r *. Js.Math.cos (t *. tau))

let large turns = if turns > 0.5 then "1" else "0"

let wedge (from, to_) =
  let a = from /. 100. and b = to_ /. 100. in
  let mid = (a +. b) /. 2. in
  let u = Float.min (a +. rim_turn) mid and v = Float.max (b -. rim_turn) mid in
  let r = Js.Float.toString radius in
  let rim =
    "L" ^ point u radius ^ "A" ^ r ^ "," ^ r ^ " 0 "
    ^ large (v -. u)
    ^ " 1 " ^ point v radius
  in
  if b -. a <= 2. *. hole_turn then
    (* Too narrow to reach the hole: the edges end where they cross. *)
    "M"
    ^ point mid
        (Float.min (off /. Js.Math.sin ((b -. a) *. Js.Math._PI)) radius)
    ^ rim ^ "Z"
  else
    let s = a +. hole_turn and e = b -. hole_turn in
    let h = Js.Float.toString hole in
    "M" ^ point s hole ^ rim ^ "L" ^ point e hole ^ "A" ^ h ^ "," ^ h ^ " 0 "
    ^ large (e -. s)
    ^ " 0 " ^ point s hole ^ "Z"

external css : string = "default" [@@mel.module "./rhp_pie.css?raw"]

(* A path cannot be transitioned without flattening its rim, so the two
   numbers move instead, and the wedge and its label's turn are drawn again
   from them each frame. *)
let part =
  Slat.make
    ~thickness:(Slat.lengths ~horizontal:(Slat.number 82.) ())
    ~room:(Slat.room ~start:(Slat.px 24.) ~end_:(Slat.px 24.) ())
    ~css
    (fun d ->
      let p = Row.data d in
      let span =
        Solidtype_rhp.animated
          (fun () -> (p.from, p.to_))
          ~settings:(fun () -> Animated.make ~duration:600. ())
          ()
      in
      <div class_="slat">
        <Bar from=p.from to_=p.to_ color=(Color.css p.color) class_="slice">
          <svg
            view_box="-50 -50 100 100"
            preserve_aspect_ratio="xMidYMid meet"
            aria_hidden=true>
            <path d=(wedge (span None)) />
          </svg>
        </Bar>
        <Label
          at=((p.from +. p.to_) /. 2.)
          class_="tag"
          style=(let from, to_ = span None in
                 "--turn: " ^ Js.Float.toString ((from +. to_) /. 200.))>
          <span class_="move">
            <b>
              (Jsx.string
                 (Js.Float.toString (Js.Math.round (p.to_ -. p.from)) ^ "%"))
            </b>
            <span class_="said">
              <i>(Jsx.string p.name)</i>
              <i>
                (Jsx.string (Js.Float.toFixed ~digits:1 p.hours ^ " hours"))
              </i>
            </span>
          </span>
        </Label>
      </div>)

let make () =
  <Poster
    look="day"
    kicker=(<span>"A day · 25 to 34 year olds"</span>)
    title=(<span>"Four hours to yourself"</span>)
    dek=(<span>
           "Sleep takes the largest share of a day, and once work and the \
            running of a life are counted, about four hours of it are yours."
         </span>)
    note=(<span>
            "Illustrative, after the American Time Use Survey, averaged over \
             every day of the week. Point at a slice, or tab into the chart, \
             for the hours behind its share."
          </span>)>
    <Chart
      orientation=`vertical
      scale=(0., 100.)
      ticks=Ticks.none
      height=450.
      theme=day>
      <Plot
        rows=parts
        keyboard=true
        overlap=true
        key=(fun d -> (Row.data d).name)
        render=part
      />
    </Chart>
  </Poster>
```

```css title="rhp_pie.css"
.slat { container-type: size; }
.slat:vertical .slice { inset: 0; left: 0; top: 0; width: 100%; height: 100%; translate: none; background: none; }
.slat:vertical .slice svg { display: block; width: 100%; height: 100%; }
.slat:vertical { pointer-events: none; }
.slat:vertical :is(.slice path, .tag) { pointer-events: auto; }
.slice path { fill: var(--rhp-color); stroke: var(--rhp-color); stroke-width: 3.8; stroke-linejoin: round; }
.slat:vertical .tag { left: 50%; top: 50%; bottom: auto; translate: -50% -50%; padding: 0;
  transform: rotate(calc(var(--turn) * 1turn)) translateY(-31cqmin) rotate(calc(var(--turn) * -1turn)); }
.slat:vertical .slice { --mid: calc((var(--rhp-lo) + var(--rhp-hi)) / 2); }
.slat:vertical :is(.slice svg, .tag .move) { transition: translate .25s ease-out; }
.slat:vertical:is(:hover, :focus-within) .slice svg { translate: calc(sin(var(--mid) * 1turn) * 13px) calc(cos(var(--mid) * 1turn) * -13px); }
.slat:vertical:is(:hover, :focus-within) .tag .move { translate: calc(sin(var(--rhp-p) * 1turn) * 13px) calc(cos(var(--rhp-p) * 1turn) * -13px); }
.tag { z-index: 2; color: var(--rhp-surface); text-align: center; }
.move { display: block; }
.tag b { display: block; font: 800 clamp(20px, 6cqmin, 32px)/1 var(--rhp-font); letter-spacing: -.03em; }
.said { display: grid; font-size: clamp(9px, 2.2cqmin, 12px); }
.said i { grid-area: 1 / 1; font-style: normal; transition: opacity .2s; }
.said i + i { opacity: 0; }
.slat:is(:hover, :focus-within) .said i { opacity: 0; }
.slat:is(:hover, :focus-within) .said i + i { opacity: 1; }
.slat:focus-visible { outline: none; }
.slat:focus-visible .tag b { text-decoration: underline; text-underline-offset: 4px; }
```

## A heatmap

Each day is a slat, and its hours a plot across it, `` orientation=`across ``,
each a `Cell` coloured from the theme's `low` to its `high`.
`use_orientation` gives a cell the orientation it is drawn in, the other
one, so the hour numbers stay beside the first day. The hour pointed at
lights its day and its hour, and the dek reads it.

Original rhp documentation: [Heatmap](https://rhp.vercel.app/examples/heatmap/).

```ocaml title="rhp_heatmap.mlx"
module Cell = Solidtype_rhp.Cell
module Chart = Solidtype_rhp.Chart
module Jsx = Solidtype.Jsx
module Label = Solidtype_rhp.Label
module Plot = Solidtype_rhp.Plot
module Poster = Solidtype_rhp.Poster
module Row = Solidtype_rhp.Row
module S = Solidtype.Solid
module Show = Solidtype.Show
module Slat = Solidtype_rhp.Slat
module ThemeValues = Solidtype_rhp.Types.ThemeValues
module Ticks = Solidtype_rhp.Ticks

type hour = { day : int; hour : int; visitors : float }
type day = { name : string; hours : hour array }

external pointer_type : Dom.pointerEvent -> string = "pointerType" [@@mel.get]

let names = [| "Mon"; "Tue"; "Wed"; "Thu"; "Fri"; "Sat"; "Sun" |]

(* The same scatter on every load, so the page and its prerendered HTML
   agree: a hash of the hour, not a random number. *)
let noise day hour =
  let x =
    Js.Math.sin (float_of_int ((day * 24) + hour + 1) *. 12.9898) *. 43758.5453
  in
  x -. Js.Math.floor_float x

(* Visitors peak after lunch, two hours later and fewer at the weekend. *)
let days =
  Array.mapi
    (fun day name ->
      let weekend = day > 4 in
      let peak = if weekend then 15. else 13. in
      {
        name;
        hours =
          Array.init 24 (fun hour ->
              let h = float_of_int hour -. peak in
              {
                day;
                hour;
                visitors =
                  Float.max 0.
                    ((70. *. Js.Math.exp (-.(h *. h) /. 18.))
                    +. (30. *. noise day hour)
                    -. if weekend then 15. else 0.);
              });
      })
    names

let heat =
  ThemeValues.make ~font:"system-ui, sans-serif" ~ink:"#f3f1ed" ~muted:"#9b9893"
    ~grid:"#2b2a28" ~surface:"#151515" ~low:"#332214" ~high:"#ffb94c" ()

let two_digits n = (if n < 10 then "0" else "") ^ string_of_int n

(* The hour pointed at, read out in the dek on one line, so the chart never
   moves. *)
let reading = function
  | None -> "Weekdays peak at 1 pm, weekends at 3 pm."
  | Some (day, hour) ->
      names.(day) ^ " " ^ two_digits hour ^ {js|:00 · |js}
      ^ Js.Float.toString (Js.Math.round days.(day).hours.(hour).visitors)
      ^ " visitors"

external css : string = "default" [@@mel.module "./rhp_heatmap.css?raw"]

let make () =
  let picked, set_picked = S.create_signal None in
  let pick (h : hour) = S.set set_picked (Some (h.day, h.hour)) in
  (* An hour lit while nothing is pointed at, or its day or its hour is. *)
  let lit (h : hour) =
    match S.get picked with
    | None -> true
    | Some (day, hour) -> day = h.day || hour = h.hour
  in
  (* The cells run across the day's band, so their orientation is the
     other one: the hour numbers go before the first day's cells either
     way. *)
  let hour =
    Slat.make ~css (fun d ->
        let h = Row.data d in
        let orientation = Solidtype_rhp.use_orientation () in
        <div
          on_pointer_enter=(fun _ -> pick h) on_pointer_down=(fun _ -> pick h)>
          <Cell value=h.visitors class_=(if lit h then "cell" else "cell faded")
          />
          <Show when_=(h.day = 0 && h.hour mod 3 = 0)>
            <Label
              edge=(match orientation () with
                   | `vertical -> "end"
                   | `horizontal -> "start")
              class_="hour">
              (Jsx.string (string_of_int h.hour))
            </Label>
          </Show>
        </div>)
  in
  let day =
    Slat.make
      ~thickness:(Slat.lengths ~horizontal:(Slat.number 26.) ())
      ~room:
        (Slat.rooms
           ~horizontal:(Slat.room ~start:(Slat.px 40.) ~before:18. ())
           ~vertical:(Slat.room ~start:(Slat.px 24.) ~before:30. ())
           ())
      (fun d ->
        let w = Row.data d in
        <div>
          <Label edge="start">(Jsx.string w.name)</Label>
          <Plot orientation=`across rows=w.hours render=hour />
        </div>)
  in
  <Poster
    look="heat"
    kicker=(<span>{js|An online shop · visitors per hour|js}</span>)
    title=(<span>"Lunch break is rush hour"</span>)
    dek=(<span>(Jsx.string (reading (S.get picked)))</span>)
    note=(<span>"Point at an hour to read it. Illustrative data."</span>)
    on_pointer_leave=(fun e ->
                       if not (String.equal (pointer_type e) "touch") then
                         S.set set_picked None)>
    <Chart scale=(0., 100.) ticks=Ticks.none height=320. theme=heat>
      <Plot rows=days render=day />
    </Chart>
  </Poster>
```

```css title="rhp_heatmap.css"
.cell { --rhp-cell-gap: 1px; --rhp-radius: 2px; }
.hour { --rhp-label-size: 10px; color: var(--rhp-muted); pointer-events: none; }
.hour:horizontal { width: auto; }
.faded { opacity: .25; }
```

## A Gantt chart

A trade is a bar from the week it starts to the week it ends, the part
done by today a second bar over it. The months are a `Scale` of a tick
every four weeks, each a band from its tick to the next; today is a plot
of one row, `overlap`, over the trades, which the pointer passes
through.

Original rhp documentation: [Gantt](https://rhp.vercel.app/examples/gantt/).

```ocaml title="rhp_gantt.mlx"
module Bar = Solidtype_rhp.Bar
module Chart = Solidtype_rhp.Chart
module Either = Solidtype_rhp.Types.Either
module Jsx = Solidtype.Jsx
module Label = Solidtype_rhp.Label
module Order = Solidtype_rhp.Order
module Plot = Solidtype_rhp.Plot
module Poster = Solidtype_rhp.Poster
module Row = Solidtype_rhp.Row
module Scale = Solidtype_rhp.Scale
module Show = Solidtype.Show
module Slat = Solidtype_rhp.Slat
module ThemeValues = Solidtype_rhp.Types.ThemeValues
module Tick = Solidtype_rhp.Tick
module Ticks = Solidtype_rhp.Ticks

(* Weeks from the start of March. *)
type trade = { trade : string; start : float; end_ : float [@mel.as "end"] }
type today = { week : float }

let trades =
  [|
    { trade = "Groundworks"; start = 0.; end_ = 6. };
    { trade = "Frame"; start = 5.; end_ = 13. };
    { trade = "Roof"; start = 12.; end_ = 17. };
    { trade = "Services"; start = 14.; end_ = 23. };
    { trade = "Interiors"; start = 20.; end_ = 30. };
    { trade = "Garden"; start = 27.; end_ = 32. };
  |]

let months = [| "Mar"; "Apr"; "May"; "Jun"; "Jul"; "Aug"; "Sep"; "Oct" |]
let now = { week = 14. }

let drawing =
  ThemeValues.make ~font:"system-ui, sans-serif" ~ink:"#141414" ~muted:"#77736d"
    ~grid:"#e7e4de" ~surface:"#fbfaf7" ()

external month_css : string = "default"
[@@mel.module "./rhp_gantt_month.css?raw"]

(* The months are a scale of intervals: a slat for each four weeks, from
   one tick to the next, every other one shaded. *)
let month =
  Slat.make
    ~room:
      (Slat.rooms ~horizontal:(Slat.room ~before:26. ())
         ~vertical:(Slat.room ~before:40. ()) ())
    ~css:month_css
    (fun (d : Scale.tick Row.t) ->
      let t = Row.data d in
      let i = Row.index d in
      <div class_=(if i mod 2 = 1 then "odd" else "")>
        <Bar from=t.at to_=t.next class_="band" />
        <Show when_=(not t.last)>
          <Label at=t.at class_="month">(Jsx.string months.(i))</Label>
        </Show>
      </div>)

external trade_css : string = "default"
[@@mel.module "./rhp_gantt_trade.css?raw"]

(* A trade on site: the whole job a thin grey bar, the part done by today
   orange; pointed at, a dimension line measures it, as a drawing does. *)
let trade =
  Slat.make
    ~thickness:(Slat.lengths ~horizontal:(Slat.number 44.) ())
    ~room:
      (Slat.rooms
         ~horizontal:(Slat.room ~start:(Slat.px 116.) ~end_:(Slat.px 16.) ())
         ~vertical:(Slat.room ~start:(Slat.px 40.) ~end_:(Slat.px 10.) ())
         ())
    ~css:trade_css
    (fun d ->
      let t = Row.data d in
      <div class_="slat">
        <Label edge="start" class_="trade">
          (Jsx.string t.trade)
          <small>
            (Jsx.string
               ("wk " ^ Js.Float.toString t.start ^ "-"
              ^ Js.Float.toString t.end_))
          </small>
        </Label>
        <Bar from=t.start to_=t.end_ thick=(Either.left "10px") class_="job" />
        <Show when_=(t.start < now.week)>
          <Bar
            from=t.start
            to_=(Float.min now.week t.end_)
            thick=(Either.left "10px")
            class_="done"
          />
        </Show>
        <Bar from=t.start to_=t.end_ thick=(Either.left "1px") class_="dim" />
        <Label at=((t.start +. t.end_) /. 2.) class_="weeks">
          (Jsx.string (Js.Float.toString (t.end_ -. t.start) ^ " WK"))
        </Label>
      </div>)

external today_css : string = "default"
[@@mel.module "./rhp_gantt_today.css?raw"]

(* Today, a line across the trades, named below the plot, where the months
   above leave room. *)
let today =
  Slat.make
    ~room:(Slat.rooms ~horizontal:(Slat.room ~after:24. ()) ())
    ~css:today_css
    (fun d ->
      let n = Row.data d in
      <div>
        <Tick at=n.week thick=(Either.right 1.) class_="now" />
        <Label at=n.week class_="now-label">"TODAY"</Label>
      </div>)

let make () =
  <Poster
    look="drawing"
    kicker=(<span>"Building a house · week 14 of 32"</span>)
    title=(<span>"From plot to keys"</span>)
    dek=(<span>
           "Each bar is a trade on site; the orange part is done. Point at one \
            to measure it."
         </span>)>
    <Chart scale=(0., 32.) height=340. theme=drawing>
      <Scale ticks=(Ticks.custom (Solidtype_rhp.every 4. ())) render=month />
      <Plot
        rows=trades
        key=(fun d -> (Row.data d).trade)
        order=(Order.sort_by (fun d -> (Row.data d).start))
        render=trade
      />
      <Plot
        rows=[| now |]
        overlap=true
        style=(Js.Dict.fromArray [| ("pointer-events", "none") |])
        render=today
      />
    </Chart>
  </Poster>
```

```css title="rhp_gantt_month.css"
.band { background: none; --rhp-radius: 0px; }
.odd .band { background: rgb(20 20 20 / .035); }
.band:horizontal { top: 0; height: 100%; translate: none; }
.band:vertical { left: 0; width: 100%; translate: none; }
.month { font-size: 10.5px; font-weight: 700; letter-spacing: .08em; text-transform: uppercase; color: var(--rhp-muted); padding: 0; }
.month:horizontal { top: -20px; translate: 6px 0; }
.month:vertical { left: -34px; translate: 0 -4px; }
@container (max-width: 360px) { .odd > .month:horizontal { display: none; } }
```

```css title="rhp_gantt_trade.css"
.trade { font-size: 14px; font-weight: 700; }
.trade small { display: block; font-size: 10.5px; font-weight: 500; color: var(--rhp-muted); }
.trade:horizontal { --rhp-label-gap: 14px; }
.job { background: #d8d5cf; --rhp-radius: 99px; }
.done { background: #ff5a1f; --rhp-radius: 99px; }
.slat:hover .job { background: #c4c0b8; }
.slat:hover .trade { color: #ff5a1f; }
.dim, .weeks { visibility: hidden; }
.slat:hover :is(.dim, .weeks) { visibility: visible; }
.dim { background: var(--rhp-ink); --rhp-radius: 0px; }
.dim:horizontal { translate: 0 -13px; }
.dim::before, .dim::after { content: ""; position: absolute; background: var(--rhp-ink); }
.dim:horizontal::before, .dim:horizontal::after { top: -4px; width: 1px; height: 9px; }
.dim:horizontal::before { left: 0; } .dim:horizontal::after { right: 0; }
.weeks { padding: 0 4px; font-size: 10.5px; font-weight: 800; letter-spacing: .06em; background: var(--rhp-surface); }
.weeks:horizontal { translate: -50% calc(-50% - 13px); }
```

```css title="rhp_gantt_today.css"
.now { background: #ff5a1f; --rhp-tick-width: 2px; }
.now-label { font-size: 10.5px; font-weight: 800; letter-spacing: .08em; color: #ff5a1f; padding: 0; }
.now-label:horizontal { top: calc(100% + 6px); translate: -50% 0; }
```

## Candlesticks

A day is two bars, its wick from the low to the high and its body from
the open to the close, and the scale is fitted to the month by `nice`.
The day pointed at is read out above the chart and crossed by a second
plot, `overlap`, of that one day, or of none.

Original rhp documentation: [Candlestick](https://rhp.vercel.app/examples/candlestick/).

```ocaml title="rhp_candlestick.mlx"
module Bar = Solidtype_rhp.Bar
module Chart = Solidtype_rhp.Chart
module Color = Solidtype_rhp.Color
module Either = Solidtype_rhp.Types.Either
module Jsx = Solidtype.Jsx
module Label = Solidtype_rhp.Label
module Nice = Solidtype_rhp.Types.Nice
module Plot = Solidtype_rhp.Plot
module Poster = Solidtype_rhp.Poster
module Row = Solidtype_rhp.Row
module S = Solidtype.Solid
module Show = Solidtype.Show
module Slat = Solidtype_rhp.Slat
module ThemeValues = Solidtype_rhp.Types.ThemeValues
module Tick = Solidtype_rhp.Tick
module Ticks = Solidtype_rhp.Ticks

type day = {
  day : int;
  open_ : float; [@mel.as "open"]
  close : float;
  low : float;
  high : float;
  latest : bool;
}

external pointer_type : Dom.pointerEvent -> string = "pointerType" [@@mel.get]

(* The same month on every load, so the page and its prerendered HTML
   agree: a hash of the draw's number, not a random one. *)
let draw k lo hi =
  let x = Js.Math.sin (float_of_int k *. 12.9898) *. 43758.5453 in
  lo +. ((x -. Js.Math.floor_float x) *. (hi -. lo))

(* A price that walks: each day opens where the last one closed. *)
let days =
  let count = 22 in
  let price = ref 48. in
  Array.init count (fun day ->
      let open_ = !price in
      let close = Float.max 20. (open_ +. draw ((day * 3) + 1) (-3.2) 3.6) in
      price := close;
      {
        day;
        open_;
        close;
        low = Float.min open_ close -. draw ((day * 3) + 2) 0.2 2.2;
        high = Float.max open_ close +. draw ((day * 3) + 3) 0.2 2.2;
        latest = day = count - 1;
      })

(* The scale fitted to the month, in round numbers. *)
let range =
  Solidtype_rhp.nice
    (Array.fold_left (fun m d -> Float.min m d.low) infinity days)
    (Array.fold_left (fun m d -> Float.max m d.high) neg_infinity days)
    ~count:4. ()

let market =
  ThemeValues.make ~font:"system-ui, sans-serif" ~ink:"#33302e" ~muted:"#66605c"
    ~grid:"#eadbcc" ~surface:"#fff1e5" ()

let dollars v = "$" ^ Js.Float.toFixed ~digits:(if v < 100. then 2 else 0) v
let rose d = d.close >= d.open_

(* The cross's one row, the day pointed at, or none. *)
let crossed = function Some i -> [| days.(i) |] | None -> [||]

external cross_css : string = "default"
[@@mel.module "./rhp_candlestick_cross.css?raw"]

(* The day under the pointer: a dashed line at its close, and its price
   over the axis numbers. *)
let cross =
  Slat.make ~room:(Slat.room ()) ~css:cross_css (fun r ->
      let d = Row.data r in
      <div>
        <Tick at=d.close thick=(Either.right 1.) class_="cross" />
        <Label at=d.close class_="price">(Jsx.string (dollars d.close))</Label>
      </div>)

external candle_css : string = "default"
[@@mel.module "./rhp_candlestick_candle.css?raw"]

let make () =
  let picked, set_picked = S.create_signal None in
  (* The day the readout shows: the one pointed at, or the latest. *)
  let read () =
    match S.get picked with Some i -> i | None -> Array.length days - 1
  in
  let change () =
    let i = read () in
    let before = if i > 0 then days.(i - 1).close else days.(i).open_ in
    (days.(i).close -. before) /. before *. 100.
  in
  (* A day: its wick over its range, its body from the open to the close,
     and on the latest day its closing price. *)
  let candle =
    Slat.make
      ~thickness:(Slat.lengths ~horizontal:(Slat.number 15.) ())
      ~room:
        (Slat.rooms
           ~horizontal:(Slat.room ~start:(Slat.px 24.) ~end_:(Slat.px 64.) ())
           ~vertical:(Slat.room ~start:(Slat.px 10.) ~end_:(Slat.px 30.) ())
           ())
      ~css:candle_css
      (fun r ->
        let d = Row.data r in
        let pick _ = S.set set_picked (Some d.day) in
        <div class_="day" on_pointer_enter=pick on_pointer_down=pick>
          <Bar from=d.low to_=d.high thick=(Either.left "1.5px") class_="wick"
          />
          <Bar
            from=d.open_
            to_=d.close
            thick=(Either.right 0.72)
            color=(Color.css (if rose d then "#0d7680" else "#990f3d"))
            class_="body"
          />
          <Show when_=d.latest>
            <Label
              at=d.close
              class_="last"
              style=("--rhp-color: " ^ if rose d then "#0d7680" else "#990f3d")>
              (Jsx.string (dollars d.close))
            </Label>
          </Show>
        </div>)
  in
  <Poster
    look="market"
    kicker=(<span>{js|Share price · daily|js}</span>)
    title=(<span>"A month on the market"</span>)
    dek=(<span>
           "Each candle is a day: its body runs from the open to the close, \
            its wick covers the day's range."
         </span>)
    note=(<span>"Illustrative data. Point at a day for its prices."</span>)
    on_pointer_leave=(fun e ->
                       if not (String.equal (pointer_type e) "touch") then
                         S.set set_picked None)>
    <p class_="ohlc">
      <b>(Jsx.string ("Day " ^ string_of_int (read () + 1)))</b>
      <span>(Jsx.string ("Open " ^ dollars days.(read ()).open_))</span>
      <span>(Jsx.string ("High " ^ dollars days.(read ()).high))</span>
      <span>(Jsx.string ("Low " ^ dollars days.(read ()).low))</span>
      <span>
        "Close "
        <b class_=(if change () >= 0. then "up" else "down")>
          (let c = change () in
           Jsx.string
             (dollars days.(read ()).close
             ^ (if c >= 0. then {js| ▲ |js} else {js| ▼ |js})
             ^ Js.Float.toFixed ~digits:1 (Js.Math.abs_float c)
             ^ "%"))
        </b>
      </span>
    </p>
    <Chart
      orientation=`vertical
      scale=(Nice.min range, Nice.max range)
      ticks=(Ticks.values (Nice.ticks range))
      format=(fun v -> <span>(Jsx.string ("$" ^ Js.Float.toString v))</span>)
      height=300.
      theme=market>
      <Plot rows=days render=candle />
      <Plot
        rows=(crossed (S.get picked))
        overlap=true
        style=(Js.Dict.fromArray [| ("pointer-events", "none") |])
        render=cross
      />
    </Chart>
  </Poster>
```

```css title="rhp_candlestick_cross.css"
.cross { background: none; --rhp-tick-width: 0px; }
.cross:horizontal { border-left: 1px dashed var(--rhp-ink); }
.cross:vertical { border-top: 1px dashed var(--rhp-ink); }
.price { padding: 3px 6px; border-radius: 3px; background: var(--rhp-ink); color: var(--rhp-surface); font-size: 11px; font-weight: 800; }
.price:horizontal { top: calc(100% + 1px); translate: -50% 0; }
.price:vertical { left: auto; right: calc(100% + 3px); translate: 0 50%; }
```

```css title="rhp_candlestick_candle.css"
.day:hover { background: rgb(51 48 46 / .07); }
.wick { background: #807973; }
.body { --rhp-radius: 1px; }
.last { font-size: 11.5px; font-weight: 800; color: #fff; padding: 2px 6px; border-radius: 3px; background: var(--rhp-color); font-variant-numeric: tabular-nums; }
.last:horizontal { margin-left: 8px; }
.last:vertical { left: auto; right: 0; translate: 0 -8px; }
```
