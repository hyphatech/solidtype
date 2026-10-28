# The example: a kanban board

A kanban board on Hypha Stack, small enough to read in one sitting: tasks
to do, being done and done, kept in SQLite by a
[Spindle](https://github.com/hyphatech/spindle) server and shown by
islands written in OCaml's JSX on solidtype: Solid underneath, HeroUI's
ports for what the page shows, and Kobalte's dialog in HeroUI's modal
classes. It is built against this checkout, the libraries and the plugin
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
