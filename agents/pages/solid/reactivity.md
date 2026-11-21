# Reactivity

Signals, derived values and effects, and where a reactive read is tracked.

`Solidtype.Solid` binds `solid-js`, Solid's reactive core, at 1.9. Its
names are Solid's in snake case, so Solid's own guide to
[reactivity](https://docs.solidjs.com/concepts/intro-to-reactivity) reads
across: `createSignal` is `create_signal`, `createMemo` is `create_memo`.

## Signals

```ocaml
let count, set_count = Solid.create_signal 0 in
Solid.get count             (* 0, and subscribes where it is tracked *)
Solid.set set_count 5
Solid.update set_count succ (* 6 *)
```

A signal is an accessor, `'a Solid.accessor`, and a setter. `Solid.get`
reads it; inside a tracking scope -- an expression in JSX, a memo, an effect --
the read subscribes, so the scope reruns when the signal changes.
`Solid.set` writes a value and `Solid.update` a function of the last one.

An accessor is Solid's own function, typed uncurried, and `Solid.get` is
inlined, so `Solid.get count` compiles to `count()`. An accessor can be
handed to JavaScript that expects Solid's, and a read costs what it costs
in Solid.

A write equal to the last value, by JavaScript's `===`, is no change.
`~equals:(By f)` gives the equality, and `~equals:Never` makes every write
a change.

## A reactive read in JSX

Solid tracks a read by when it happens: inside a tracking scope, or not at
all. In JSX an expression is read again whenever what it reads changes, as
Solid's compiler makes it: `(Jsx.int (Solid.get count))` becomes `{count()}`, and
`class_=(if Solid.get count > 2 then "hot" else "cold")` updates the class.
A read taken out of JSX into a name, `let n = Solid.get count`, is read
once.

Outside JSX a tracking scope is a function you write, `fun () -> e`, as
Solid's own API takes `() => e`: a memo, an effect, or an accessor.

## Derived values

A function of signals is already reactive when it is read in JSX. A
memo caches it, and notifies only when its value changes:

```ocaml title="solid_derived.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx

let make () =
  let celsius, set_celsius = S.create_signal 20 in
  let fahrenheit = S.create_memo (fun () -> (S.get celsius * 9 / 5) + 32) in
  <div class_="flex items-center gap-4">
    <button
      class_="button button--secondary"
      type_=`button
      aria_label="Colder"
      on_click=(fun _ -> S.update set_celsius pred)>
      "-"
    </button>
    <span class_="tabular-nums">
      (Jsx.int (S.get celsius))
      {js| °C is |js}
      (Jsx.int (S.get fahrenheit))
      {js| °F|js}
    </span>
    <button
      class_="button button--secondary"
      type_=`button
      aria_label="Warmer"
      on_click=(fun _ -> S.update set_celsius succ)>
      "+"
    </button>
  </div>
```

`create_selector` gives a test for a key, tracked for that key alone, so a
list of a thousand items whose one is selected updates two of them when the
selection moves, not all.

## Effects

```ocaml
Solid.create_effect (fun () ->
    Js.log ("count is " ^ string_of_int (Solid.get count)))
```

An effect runs after rendering and again whenever what it read changes.
`create_render_effect` runs during rendering, before the DOM is connected,
and `create_computed` at once. `Solid.on deps f` reads only `deps`, and runs
`f` with its new and previous values:

```ocaml
Solid.create_effect
  (Solid.on (fun () -> Solid.get count) (fun count previous -> ...))
```

Where Solid passes a computation its previous value, the binding is two
functions: `create_memo` and `create_memo_from ~init`, `create_effect` and
`create_effect_from ~init`.

`Solid.batch` holds every notification until it returns, and
`Solid.untrack` reads without subscribing.

## Ownership

Every computation belongs to an owner and is disposed with it.
`Solid.on_cleanup` runs when the current owner is disposed or reruns,
`Solid.on_mount` once after the first render, and `Solid.create_root` makes
an owner that lives until its `dispose` is called. `Solid.get_owner` and
`Solid.run_with_owner` carry an owner into a callback, so a context or a
computation made there belongs where it should.

`Solid.catch_error f handler` sends the errors `f` raises, or a computation
it made raises later, to `handler`, as an OCaml exception: one raised in
OCaml as it was raised, and a value JavaScript threw as `Js.Exn.Error`.

## What else is bound

| Solid | solidtype |
|---|---|
| `createDeferred` | `Solid.create_deferred ?timeout_ms` |
| `createReaction` | `Solid.create_reaction` |
| `startTransition`, `useTransition` | `Solid.start_transition`, `Solid.use_transition` |
| `mapArray`, `indexArray` | `Solid.map_array`, `Solid.index_array` |
| `observable`, `from` | `Solid.observable`, `Solid.from`, `Solid.from_observable` |

Resources, a value fetched asynchronously, are on [Async](async.md).
