// The documentation builds as `make docs` builds it, Solid's and React's
// compilers sharing the site, and a port's page holds the port prerendered
// with HeroUI's classes, to hydrate as client:load.

import { expect, test } from "bun:test";
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";

const root = fileURLToPath(new URL("../../", import.meta.url));

test("Button's page prerenders the port, to hydrate beside HeroUI's", () => {
  const build = Bun.spawnSync(["bun", "--bun", "astro", "build", "--root", "docs"], { cwd: root, stdout: "pipe", stderr: "pipe" });
  expect(build.exitCode, build.stderr.toString()).toBe(0);
  const html = readFileSync(`${root}_build/docs/heroui/button/index.html`, "utf8");
  const islands = [...html.matchAll(/<astro-island [^>]*client="(\w+)"/g)].map((m) => m[1]);
  expect(islands).toEqual(["load", "load"]);
  const classes = [...html.matchAll(/<button data-hk="\w+" type="button" class="([^"]*)"/g)].map((m) => m[1]?.trim());
  expect(classes).toEqual([
    "button button--md button--primary",
    "button button--md button--primary",
    "button button--md button--secondary",
    "button button--md button--tertiary",
    "button button--md button--outline",
    "button button--md button--ghost",
    "button button--md button--danger",
    "button button--md button--danger-soft",
  ]);
}, 60_000);
