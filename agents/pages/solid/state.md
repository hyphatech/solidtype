# Stores and context

State tracked field by field, and a value given to every component below a provider.

## Stores

`Solidtype.Store` binds `solid-js/store`: state whose every field is
tracked on its own, so a change to one field reruns only what read it.

A store's state is an OCaml record, which Melange writes as an object with
the record's field names. Reading a field, `player.volume`, is a read Solid
tracks, with no accessor to call:

```ocaml title="solid_store.mlx"
module Jsx = Solidtype.Jsx
module Store = Solidtype.Store

type player = { mutable volume : int; mutable muted : bool }

let make () =
  let player, set_player = Store.create_store { volume = 5; muted = false } in
  let louder () =
    Store.modify set_player
      (Store.produce (fun draft -> draft.volume <- min 10 (draft.volume + 1)))
  in
  <div class_="flex items-center gap-4">
    <button
      class_="button button--secondary"
      type_=`button
      on_click=(fun _ ->
                 Store.set set_player { player with muted = not player.muted })>
      (Jsx.string (if player.muted then "Unmute" else "Mute"))
    </button>
    <button
      class_="button button--secondary"
      type_=`button
      on_click=(fun _ -> louder ())>
      "Louder"
    </button>
    <span class_="tabular-nums">
      (Jsx.string
         (if player.muted then "Muted"
          else "Volume " ^ string_of_int player.volume))
    </span>
  </div>
```

A change goes through the setter, in one of three ways:

- **`Store.set setter value`** merges the value's fields into the store's,
  as Solid's setter does with an object.
- **`Store.modify setter (Store.produce f)`** changes the store by `f
  draft`, where the draft's `mutable` fields are assigned in place.
- **`Store.modify setter (Store.reconcile value)`** changes the store to the
  value, keeping every part that is equal, so only what differs notifies;
  arrays' items are matched by their `id` field, or by `~key`.

Solid's path setter, `setStore("todos", 0, "done", true)`, is not bound,
since OCaml cannot type a path of strings. `produce` says the same with a
field assignment the compiler checks.

A copy made by OCaml's functional update, `{ player with muted = true }`,
is a plain object, no longer tracked: it is a value to give the setter, not
a store. `Store.create_mutable` gives a store whose `mutable` fields are
assigned directly, each assignment a change. `Store.unwrap` gives the plain
object under a store, untracked.

## Context

A context is a value given to every component below its provider. Its
provider is a component named in JSX, so a context is a module, made by a
functor from its type and its default:

```ocaml title="solid_context.mlx"
module Jsx = Solidtype.Jsx

type locale = English | French

module Locale = Solidtype.Context.Make (struct
  type t = locale

  let default = English
end)

module Hello = struct
  let%component make () =
    let locale = Locale.use () in
    <p>
      (Jsx.string
         (match locale with English -> "Hello" | French -> "Bonjour"))
    </p>
end

let make () =
  <div class_="flex flex-col gap-1">
    <Hello /> <Locale.Provider value=French><Hello /></Locale.Provider>
  </div>
```

`Locale.use ()` reads the nearest provider's value above the component, or
the default with none. `Context.Make_optional` makes a context with no
default, whose `use` gives an `option`.

A value that changes is put in the context as a signal or a store, and read
where it is used, so the provider's value itself is given once.
