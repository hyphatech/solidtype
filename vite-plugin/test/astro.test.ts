// FR-7: an OCaml island mounts in an Astro page, client:only and
// client:load. The example site is built as `make example` builds it -- as
// a command, since Vite's node bundle does not load inside Bun's test
// runner -- and its page must hold the prerendered island's HTML, with the
// hydration keys Solid's client reads, and the client:only island's mount
// point empty for the browser to fill.

import { expect, test } from "bun:test";
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";

const root = fileURLToPath(new URL("../../", import.meta.url));

test("the page prerenders the counter and leaves the settings and the notes to the browser", () => {
  const build = Bun.spawnSync(["bun", "--bun", "astro", "build"], { cwd: root, stdout: "pipe", stderr: "pipe" });
  expect(build.exitCode, build.stderr.toString()).toBe(0);
  const html = readFileSync(`${root}_build/example-dist/index.html`, "utf8");
  const islands = [...html.matchAll(/<astro-island [^>]*client="(\w+)"[^>]*>([\s\S]*?)<\/astro-island>/g)]
    .map((m) => ({ client: m[1] ?? "", html: m[2] ?? "" }));
  expect(islands.map((i) => i.client)).toEqual(["load", "only", "only"]);
  const counter = islands[0]?.html ?? "";
  const settings = islands[1]?.html ?? "";
  const notes = islands[2]?.html ?? "";
  expect(counter).toMatch(/^<button data-hk="\w+" type="button" class="cold">Clicked <!--\$-->0<!--\/-->/);
  expect(counter).toMatch(/<span data-hk="\w+" class="label">times<\/span>/);
  expect(settings).toBe("");
  expect(notes).toBe("");
}, 60_000);
