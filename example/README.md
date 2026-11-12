# The example: a kanban board

A kanban board on Hypha Stack, small enough to read in one sitting:
projects, each with its tasks in five columns from the backlog to done,
kept in SQLite by a [Spindle](https://github.com/hyphatech/spindle) server
and shown by islands written in OCaml's JSX on solidtype: Solid
underneath, and HeroUI's ports for what the page shows. It is built
against this checkout, the libraries and the plugin as they are here.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="board-dark.png">
  <img alt="The board: the API project's tasks in five columns, the backlog and done folded to the edges, a sidebar of projects" src="board-light.png">
</picture>

## What it is made of

- [Spindle](https://github.com/hyphatech/spindle): the server, its routes
  under `/api`, their OpenAPI document at `/docs`, and the built page
- [rowtype](https://github.com/hyphatech/rowtype): the SQLite store, each
  statement a typed value, and its migrations, `rowtype-migrate`
- [wiretype](https://github.com/hyphatech/wiretype): the API's types,
  their JSON checked where it enters, shared by the server and the
  Melange client Spindle's command line prints from the routes as the
  board builds
- solidtype: the board, written in OCaml's JSX on Solid, Kobalte and
  HeroUI's ports, compiled by Melange
- Vite and `vite-plugin-solidtype`: the page built, as a Solid page is
- Astro: the same board prerendered and hydrated
- Bun: installs and runs the JavaScript side, and vitest the board's tests

## Prerequisites

- [opam](https://opam.ocaml.org/doc/Install.html). `make setup` creates
  the switch with OCaml 5.5 and every OCaml dependency.
- [Bun](https://bun.sh) 1.3 or later. `make setup` installs Vite, Astro,
  Solid and the rest of the JavaScript into `node_modules`, so none is
  installed globally.
- The `sqlite3` command, which seeds a new database. macOS has it, and a
  minimal Linux takes it from its package manager, `apt install sqlite3`.
  opam installs only SQLite's library.

## Run it

From the repository's root:

```sh
make setup          # once: the opam switch and the JavaScript dependencies
make example-serve  # build, then serve on http://localhost:4420
```

`BOARD_PORT` and `BOARD_DB` change the port and the database. Remove
`example/board.db` to start again from the seed. `/docs` is the API.

## How it fits

```
migrations/        the projects' and tasks' tables, rowtype-migrate
                   migrations
seed.sql           a board to look at, for a new database alone
server/store.ml    the projects and tasks in SQLite through spindle-sqlite's
                   pool, each statement a rowtype value, a colour's and a
                   status's word one for the column and the API alike
server/routes.ml   the store over HTTP, under /api, its input checked where
                   it enters
server/serve.ml    Spindle serving the routes, their document at /docs,
                   and the built page beside them on one origin, on a pool
                   of the file BOARD_DB names
server/board.ml    the command line, Spindle_cli: the API as OpenAPI, Zod,
                   or the Melange client
server/test_tasks  the routes, called in-process on a file of each test's
                   own, migrated as rowtype-migrate migrates the board's,
                   with a server started again on it, a board made before
                   projects migrated, and every statement verified
                   against the tables
src/api.ml         that client, printed by the command line as dune builds
                   src/, never kept: a route that changes is a front end
                   that stops compiling
src/app.mlx        the board: its projects and tasks (resources), the
                   project shown, a Search_field that filters it, and
                   Toasts for what happened
src/sidebar.mlx    the projects to choose, each project's Dropdown that
                   deletes it once an Alert_dialog confirms, and the
                   theme by a Segment
src/column.mlx     a status's tasks and a drop, the first and last
                   folded to a rail
src/card.mlx       HeroUI's Card with a Dropdown that moves or removes
                   it, its link and labels Chips
src/add_*.mlx      Add_task and Add_project, HeroUI's Modal holding its
                   Form, Text_fields and Select, the server's problems
                   shown on the fields they name
src/board.css      HeroUI's styles, the components the board uses, as
                   HeroUI's README gives them, and the board's classes,
                   which Tailwind reads from the .mlx sources
index.html         the page, which loads Melange's output from _build and
                   Vite builds into _build/example-dist, which the server
                   serves
pages/index.astro  the same board as an Astro page, prerendered and
                   hydrated, built into _build/example-astro
test/              the board against the server, in OCaml, run by vitest,
                   on a database migrated for the run
```

In development Vite serves the page and proxies `/api` to the server, and
`dune build --watch` rebuilds the OCaml Vite reads.
