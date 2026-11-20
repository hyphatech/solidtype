# Solid

Zero-cost bindings to Solid.

Solid is solidtype's core, and everything else in it is built on it:
Kobalte's components, HeroUI's port and the charts. `solidtype` binds all of
[Solid](https://www.solidjs.com) 1.9 -- signals, memos and effects,
components and their props, control flow, stores and context, resources and
Suspense, and its renderer in the browser and on the server -- and a
component written in OCaml's JSX reaches the browser as the code Solid's
own compiler emits for the same JSX.

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

The filter is a variant, and the `Switch` over it a `match`: a filter added
to the type is a case the compiler asks for, where Solid's own `Switch`
would show nothing for it. That is what the binding adds to Solid: its
types.

## What the types hold

- **A reactive read in JSX is tracked.** An expression in JSX is read again
  as what it reads changes, as Solid's compiler makes it, and a
  function given where a value belongs does not compile.
- **A component's props are checked**, as TSX checks them: a prop left
  out, a prop the component does not take, a value of the wrong type.
- **An element's attributes are typed** from Solid's own JSX types, so an
  attribute an element does not take, or a value it cannot hold, is an
  error.
- **A test Solid reads for truth is a `bool` or an `option`**, never an
  OCaml value JavaScript would read as false.

## In this section

| Page | What it covers | Modules |
|---|---|---|
| [Components](solid/components.md) | a component, its props and children, `let%component` | `Jsx`, `Check` |
| [Reactivity](solid/reactivity.md) | signals, memos, effects, and where a read is tracked | `Solid` |
| [Control flow](solid/control-flow.md) | `Show`, `For`, `Index`, `Switch`, `Match`, `ErrorBoundary`, `Portal` | one module each, named as Solid names them |
| [Stores and context](solid/state.md) | state tracked field by field, a value given to everything below | `Store`, `Context` |
| [Async](solid/async.md) | resources, `Suspense`, transitions | `Solid`, `Suspense` |
| [Rendering](solid/rendering.md) | mounting, rendering on the server, hydration | `Web`, `Server` |

Solid's documentation stays the reference for what each function does;
these pages say how it is written in OCaml, and
[Conventions](start/conventions.md) how a name of Solid's is
spelt.

## Install

```sh
opam install solidtype
```

```lisp
(libraries solidtype melange.dom)
(preprocess (pps melange.ppx ppx_solidtype))
```

[Getting Started](index.md) sets up dune and Vite around it.
