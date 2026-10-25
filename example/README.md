# The example: a kanban board

A kanban board on Hypha Stack, small enough to read in one sitting: tasks
to do, being done and done, kept in SQLite by a
[Spindle](https://github.com/hyphatech/spindle) server and shown by
islands written in OCaml's JSX on solidtype: Solid underneath, HeroUI's
ports for what the page shows, and Kobalte's dialog where HeroUI has no
port yet. It is built against this checkout, the libraries and the plugin
as they are here.

```sh
make example        # the page, and the Astro page that mounts the same board
make example-serve  # the API and the built page on http://localhost:4420
```

`make example-serve` keeps the tasks in `example/board.db`, or the file
`BOARD_DB` names, made and migrated by `rowtype-migrate` before the server
starts. `/docs` is the API's interactive document.

## How it fits

```
migrations/        the tasks' table, a rowtype-migrate migration
server/store.ml    the tasks in SQLite through spindle-sqlite's pool, each
                   statement a rowtype value, their types derived with
                   ppx_wiretype
server/routes.ml   the store over HTTP, under /api; a failure of the
                   database is Spindle_sqlite.refusal's answer
server/serve.ml    Spindle serving the routes, their document at /docs,
                   and the built page beside them on one origin, on a pool
                   of the file BOARD_DB names
server/board.ml    the command line, Spindle_cli: the API as OpenAPI, Zod,
                   or the Melange client
server/test_tasks  the routes, called in-process on a file of each test's
                   own, migrated as rowtype-migrate migrates the board's;
                   a server started again on it, and every statement
                   verified against the table
src/api.ml         that client, printed by the command line as dune builds
                   src/, never kept: a route that changes is a front end
                   that stops compiling
src/*.mlx          the board: App, a column per status (Solid's For, a
                   resource), its count a HeroUI Chip, an Empty_state
                   where it has no task, and Toasts for what happened;
                   Card, HeroUI's Card with its Close_button and Buttons;
                   Add_task, Kobalte's Dialog in HeroUI's modal classes
                   holding HeroUI's Form, Text_fields and Buttons, the
                   server's problems shown on the fields they name
src/board.css      HeroUI's styles, the components the board uses, as
                   HeroUI's README gives them; Tailwind reads the board's
                   classes from the .mlx sources
index.html         the page: loads Melange's output from _build; Vite
                   builds it into _build/example-dist, which the server
                   serves
pages/index.astro  the same board as an Astro page, prerendered and
                   hydrated, built into _build/example-astro
twin/              each island's TSX twin, naming HeroUI's ports by
                   Melange's output, and board.gen.ts, the server's Zod
                   schemas the twins read
test/              the board against the server, in OCaml, run by vitest,
                   on a database migrated for the run
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
2. **A status's words are spelt three times.** `Spindle.Query` takes a
   `Codec` and a column `Rowtype.enum`, and the derived wiretype enum keeps
   its words to itself, so `server/routes.ml` and `server/store.ml` each
   write `to_do`, `doing`, `done` again, and the migration's check a
   third time.
3. **`~refuses:[ Spindle.Refusal.not_found ]` does not compile**, as the
   bodies tutorial suggests: that is the refusal, and the code is
   `Spindle.Refusal.Code.not_found`.
4. **A child that is a call is refused**: `(region ())` returning an
   element is not a child; only a literal, an element or a thunk is.
5. **An integer id is a `float` in the front end**, since it has no bound
   within 32 bits: documented, but an `id : int` on the server reading as
   `float` in the browser is a surprise the first time.
6. **`api check` needs `--openapi` and `--zod`** even for an OCaml-only
   front end; the Melange client is only an addition to them.
7. **Editors do not know `.mlx`.** Vim highlights nothing until told
    `au BufRead,BufNewFile *.mlx setfiletype ocaml`, which highlights the
    OCaml and not the JSX; no tree-sitter grammar knows MLX. And
    `(merlin_reader mlx)` runs `ocamlmerlin-mlx`, which no package here
    brought, solidtype's switch included: until `ocamlmerlin-mlx` is a
    dev-setup dependency, ocamllsp fails every hover and jump in an
    `.mlx`. `dune describe pp` crashes on a dialect file,
    so the ppx's output is read by running `mlx-pp` and the ppx by hand.
8. **A name is a static prop.** The ppx reads a bare name as a value that
   never changes, so `class_=backdrop` and `is_invalid=untitled` are
   refused where a thunk is wanted: each is written `(fun () -> ...)`,
   though the string never changes and the function is already the thunk.
9. **HeroUI has no modal yet.** Kobalte's `Dialog` takes HeroUI's look from
   `Styles.Modal`, slot by slot: an overlay blurred, and a second backdrop,
   transparent, that only places the dialog, since Kobalte's overlay is not
   the dialog's parent as React Aria's is. A field on it takes the
   `secondary` variant, as HeroUI's own modal form does: a primary field is
   the overlay's colour in the dark theme, and vanishes. HeroUI's theme is
   dark under `.dark` rather than the system's scheme, so each page sets
   it, a line of script.
10. **A body's problems have two paths.** The client checks a body before it
   sends it and names a field `title`; the server names the same problem
   `body.title`. The form shows the client's on its field; a refusal from
   the server alone would find none.
11. **Small ones.** `Dialog.Root`'s check names
    `Types.AlertDialog_Root_Translations.t`; `Select` takes its options
    wrapped in `Types.Either.left`, and an item's text is read back
    through `Node.raw_value (Item_props.item props)`.
