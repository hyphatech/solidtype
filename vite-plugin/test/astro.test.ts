// An OCaml island mounts in an Astro page as any Solid island does. The
// example's Astro page is built as `make example` builds it -- as a
// command, since Vite's node bundle does not load inside Bun's test runner
// -- and must hold the board prerendered, with the hydration keys Solid's
// client reads, and fetching nothing while it is built.

import { expect, test } from "bun:test";
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";

const root = fileURLToPath(new URL("../../", import.meta.url));

test("the page prerenders the board, empty, to hydrate as client:load", () => {
  const build = Bun.spawnSync(["bun", "--bun", "astro", "build"], { cwd: root, stdout: "pipe", stderr: "pipe" });
  expect(build.exitCode, build.stderr.toString()).toBe(0);
  const html = readFileSync(`${root}_build/example-astro/index.html`, "utf8");
  const islands = [...html.matchAll(/<astro-island [^>]*client="(\w+)"[^>]*>([\s\S]*?)<\/astro-island>/g)]
    .map((m) => ({ client: m[1] ?? "", html: m[2] ?? "" }));
  expect(islands.map((i) => i.client)).toEqual(["load"]);
  const board = islands[0]?.html ?? "";
  expect(board).toMatch(/^<main data-hk="\w+" class="mx-auto max-w-6xl px-4 py-10">/);
  expect([...board.matchAll(/<section data-hk="\w+" aria-label="([^"]+)"/g)].map((m) => m[1])).toEqual(["To do", "Doing", "Done"]);
  expect(board.match(/Drop a task here/g)?.length).toBe(3);
  expect(board).not.toContain("Could not load the board");
}, 60_000);
