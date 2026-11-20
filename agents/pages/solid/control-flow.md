# Control flow

Show, For, Index, Switch and Match, ErrorBoundary and Portal, with OCaml's options and matches.

Solid's control flow is components, so that each branch and each item is
created once and kept, never rendered again from scratch. solidtype binds
each as a module of its own, named as Solid names it, and adds the forms
OCaml's options and matches want.

```ocaml title="solid_flow.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module For = Solidtype.For
module Show = Solidtype.Show
module Switch = Solidtype.Switch
module Match = Solidtype.Match

type filter = All | Open | Finished
type task = { title : string; finished : bool }

let tasks =
  [|
    { title = "Bind Solid"; finished = true };
    { title = "Generate Kobalte's binding"; finished = true };
    { title = "Port HeroUI"; finished = false };
  |]

let filters = [| (All, "All"); (Open, "Open"); (Finished, "Finished") |]

let make () =
  let filter, set_filter = S.create_signal All in
  let picked = S.create_selector (fun () -> S.get filter) in
  let shown =
    S.create_memo (fun () ->
        match S.get filter with
        | All -> tasks
        | Open ->
            Array.of_list
              (List.filter (fun t -> not t.finished) (Array.to_list tasks))
        | Finished ->
            Array.of_list
              (List.filter (fun t -> t.finished) (Array.to_list tasks)))
  in
  <div class_="flex w-72 flex-col gap-3">
    <div class_="flex gap-2">
      <For each=filters>
        (fun (f, label) _ ->
          <button
            class_=(if picked f then "button button--sm button--primary"
                    else "button button--sm button--tertiary")
            type_=`button
            on_click=(fun _ -> S.set set_filter f)>
            (Jsx.string label)
          </button>)
      </For>
    </div>
    <Switch>
      (match S.get filter with
      | All -> <p class_="text-sm text-muted">"Every task"</p>
      | Open -> <p class_="text-sm text-muted">"What is left"</p>
      | Finished -> <p class_="text-sm text-muted">"What is done"</p>)
    </Switch>
    <Show
      when_=(Array.length (S.get shown) > 0) fallback=(<p>"Nothing here"</p>)>
      <ul class_="flex flex-col gap-1">
        <For each=(S.get shown)>
          (fun task _ -> <li>(Jsx.string task.title)</li>)
        </For>
      </ul>
    </Show>
  </div>
```

## Show

```ocaml
<Show when_=(Solid.get ready) fallback=(<p>"Loading"</p>)>
  <Dashboard />
</Show>
```

`when_` is a `bool`. Solid tests its condition for truth, and Melange
writes `Some 0`, `Some ""` and a variant's first constant constructor as
values JavaScript reads as false, so solidtype never hands Solid an OCaml
value to test. An `option` is shown by `Show.Some`, whose child is given a
read of the value while it is `Some`:

```ocaml
<Show.Some some=(Solid.get user)>
  (fun user -> <p>(Jsx.string (Solid.get user).name)</p>)
</Show.Some>
```

`Show.Keyed` gives the value itself, and renders again whenever it changes.

## For and Index

`For` renders each item once, by identity, and moves its element when the
list reorders; its child is the function that renders an item, given the
item and a tracked index:

```ocaml
<For each=(Solid.get tasks)>
  (fun task i -> <li>(Jsx.string task.title)</li>)
</For>
```

`Index` renders each position once, and gives a tracked read of the item at
it, for a list of values that change in place. Both take an `array`, which
is what JavaScript holds.

## Switch and Match

A `Switch` whose only child is a `match` gets a `Match` per case,
written by the ppx:

```ocaml
<Switch>
  (match Solid.get answer with
    | Waiting -> <p>"waiting"</p>
    | Ready n -> <p>(Jsx.int n)</p>
    | Refused why -> <p>(Jsx.string why)</p>)
</Switch>
```

The `match` is also checked whole, so a case left out is the compiler's
warning, as in any `match`. A case that binds a variable becomes a
`Match.Keyed`. The lowering names `Match`, so `Solidtype.Match` is in
scope where it is used. Written out, `<Match when_=...>` takes a `bool`, and
`Match.Some` and `Match.Keyed` an option, as `Show`'s forms do.

## ErrorBoundary

```ocaml
<ErrorBoundary fallback=(fun exn reset -> <button on_click=(fun _ -> reset ())>"Retry"</button>)>
  <Chart />
</ErrorBoundary>
```

The fallback is given what was raised, an OCaml exception as it was
raised and a value JavaScript threw as `Js.Exn.Error`, and a function that
renders the children again.

## Portal and Dynamic

`Portal` mounts its children elsewhere, in `document.body` unless `mount`
is given, while they stay this component's in the reactive graph.
`Dynamic` renders a component chosen while the page runs; see
[Components](components.md#a-component-chosen-at-run-time).
