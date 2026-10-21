# The example: a kanban board

A kanban board on Hypha Stack, small enough to read in one sitting: tasks
to do, being done and done, kept by a
[Spindle](https://github.com/hyphatech/spindle) server and shown by
islands written in OCaml's JSX on solidtype and Kobalte, styled with
Tailwind. It is built against this checkout, the libraries and the plugin
as they are here.

```sh
make serve    # the API and the built page on http://localhost:4420
make dev      # the three commands for development, each in its terminal
make example  # the page, and the Astro page that mounts the same board
```

`/docs` is the API's interactive document.

## How it fits

```
server/store.ml    the tasks in memory, their types derived with
                   ppx_wiretype, and the rules a change to one keeps
server/routes.ml   the store over HTTP, under /api
server/serve.ml    Spindle serving the routes, their document at /docs,
                   and the built page beside them on one origin
server/board.ml    the command line, Spindle_cli: the API as OpenAPI, Zod,
                   or the Melange client
server/test_tasks  the routes, called in-process
src/api.ml         that client, printed by the command line as dune builds
                   src/, never kept: a route that changes is a front end
                   that stops compiling
src/*.mlx          the board: App, a column per status, its cards dragged
                   between them; Card (Show, Button), Add_task (Dialog,
                   TextField), notices (Toast); Tailwind reads its classes
                   from the .mlx sources
index.html         the page: loads Melange's output from _build; Vite
                   builds it into _build/example-dist, which the server
                   serves
pages/index.astro  the same board as an Astro page, prerendered and
                   hydrated, built into _build/example-astro
twin/              each island's TSX twin, and board.gen.ts, the server's
                   Zod schemas the twins read
test/              the board against the server, in OCaml, run by vitest
```

In development Vite serves the page and proxies `/api` to the server, and
`dune build --watch` rebuilds the OCaml Vite reads.

## Rough edges found building it

What surprised or slowed down writing this, as a user of the libraries.

1. **One enum is three types in the Melange client.** `status` is used by
   a task, by the move's body and by the list's query, and the client
   prints `task_status`, `move_status` and `get_api_tasks_status`, the
   same constructors three times: a task's status cannot be sent back
   without a conversion. Wiretype's schema walk inlines an enum wherever
   it is used, never a component, which Zod and OpenAPI read harmlessly,
   since their types are structural, but OCaml's are nominal. `[@@kind]`
   does not change it. Worked around in `src/status.ml`.
2. **A query parameter's enum is spelt twice.** `Spindle.Query` takes a
   `Codec`, and the derived wiretype enum keeps its words to itself, so
   `server/routes.ml` writes `to_do`, `doing`, `done` again.
3. **`~refuses:[ Spindle.Refusal.not_found ]` does not compile**, as the
   bodies tutorial suggests: that is the refusal, and the code is
   `Spindle.Refusal.Code.not_found`.
4. **A bare name in a JSX attribute is taken for a thunk, and the error is
   elsewhere.** `<Item value=key>` inside a `For` makes the ppx annotate
   `key : unit -> _`, and the compiler then reports a use of `key` lines
   away. It must be `value=(fun () -> key)`; the rule is right, but the
   error should point at the attribute.
5. **A callback prop must be named `on_*` or written as a `fun`.**
   `<Task_row changed />`, `changed : string -> unit`, is read as a thunk;
   `on_changed=changed` is passed as the function.
6. **A child that is a call is refused**: `(Notice.region ())` returning an
   element is not a child; only a literal, an element or a thunk is.
7. **An integer id is a `float` in the front end**, since it has no bound
   within 32 bits: documented, but an `id : int` on the server reading as
   `float` in the browser is a surprise the first time.
8. **`api check` needs `--openapi` and `--zod`** even for an OCaml-only
   front end; the Melange client is only an addition to them.
9. **A port in use is a backtrace.** `Spindle.serve` raises Eio's
   `Unix_error(EADDRINUSE, "bind", "")`, as the serving guide says it
   does, rather than a line saying the port is taken.
10. **Editors do not know `.mlx`.** Vim highlights nothing until told
    `au BufRead,BufNewFile *.mlx setfiletype ocaml`, which highlights the
    OCaml and not the JSX; no tree-sitter grammar knows MLX. And
    `(merlin_reader mlx)` runs `ocamlmerlin-mlx`, which no package here
    brought, solidtype's switch included: until `ocamlmerlin-mlx` is a
    dev-setup dependency, ocamllsp fails every hover and jump in an
    `.mlx`. `dune describe pp` crashes on a dialect file,
    so the ppx's output is read by running `mlx-pp` and the ppx by hand.
11. **Small ones.** `Dialog.Root`'s check names
    `Types.AlertDialog_Root_Translations.t`; `Select` takes its options
    wrapped in `Types.Either.left`, and an item's text is read back
    through `Node.raw_value (Item_props.item props)`.
