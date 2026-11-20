# Async

Resources, Suspense and transitions, with OCaml's options and results.

## Resources

A resource is a value fetched asynchronously, as a `Js.Promise.t`, and
read like a signal. `Solid.create_resource_from` fetches again whenever its
source changes:

```ocaml title="solid_resource.mlx"
module S = Solidtype.Solid
module Jsx = Solidtype.Jsx
module Suspense = Solidtype.Suspense

(* A fetch that takes most of a second, as a server's answer would. *)
let quote n = Wait.after 700 ("Quote number " ^ string_of_int n)

let make () =
  let n, set_n = S.create_signal 1 in
  let text, _ =
    S.create_resource_from (fun () -> Some (S.get n)) (fun n _ -> quote n)
  in
  <div class_="flex w-72 flex-col items-start gap-3">
    <Suspense fallback=(<p class_="text-muted">"Loading..."</p>)>
      <p>(Jsx.string (Option.value (S.read text) ~default:""))</p>
    </Suspense>
    <button
      class_="button button--secondary"
      type_=`button
      on_click=(fun _ -> S.update set_n succ)>
      "Next quote"
    </button>
  </div>
```

The source is a thunk of an `option`: while it is `None`, nothing is
fetched. Solid's own skips a source that is `false`, `null` or `undefined`;
solidtype boxes the source, so `Some false` and `Some 0` are fetched as any
other value. `Solid.create_resource` fetches once, with no source.

What the resource gives:

| Call | What it gives |
|---|---|
| `Solid.read r` | the value, tracked; `None` before the first. An errored resource raises its error, which an `ErrorBoundary` catches |
| `Solid.latest r` | the last value, held while it is fetched again |
| `Solid.state r` | `Unresolved`, `Pending`, `Ready`, `Refreshing` or `Errored`, a variant to `match` |
| `Solid.loading r`, `Solid.error r` | a `bool`, and an `exn option` |
| `Solid.mutate actions v`, `Solid.refetch actions` | set the value without fetching, or fetch again |

The fetch is told what it fetches over, as a record:
`{ value; refetching }`.

## Suspense

A resource read inside `Suspense` shows its fallback while the resource
loads, as above. `SuspenseList` orders several. On the server, a page
rendered with `Server.render_to_string_async` waits for every resource read,
and `render_to_stream` sends each part as it resolves; see
[Rendering](rendering.md).

## Transitions

`Solid.start_transition f` runs `f` so that its updates show together, once
what they suspend on has resolved; the page keeps showing the old state
meanwhile, rather than a fallback. `Solid.use_transition ()` gives whether
one is pending, and what starts one.

## Errors

A promise in Melange's binding may reject, and a rejection nothing handles
is lost. A fetch that may fail resolves to a `result` at the point where it
is bound -- `Js.Promise.catch` there -- so the resource's value is
`(data, error) result`, and the page `match`es it as any other value.
