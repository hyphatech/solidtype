// The documentation builds as `make docs` builds it, Solid's and React's
// compilers sharing the site, and a port's page holds its examples
// prerendered with HeroUI's classes, to hydrate as they are scrolled to, and
// its demo beside React, to hydrate as the page loads.

import { expect, test } from "bun:test";
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";

const root = fileURLToPath(new URL("../../", import.meta.url));

test("Button's page prerenders the port, to hydrate beside HeroUI's", () => {
  const build = Bun.spawnSync(["bun", "--bun", "astro", "build", "--root", "docs"], { cwd: root, stdout: "pipe", stderr: "pipe" });
  expect(build.exitCode, build.stderr.toString()).toBe(0);
  const html = readFileSync(`${root}_build/docs/heroui/button/index.html`, "utf8");
  const islands = [...html.matchAll(/<astro-island [^>]*component-url="\/_astro\/(\w+)\.[^"]*"[^>]*client="(\w+)"/g)].map((m) => `${m[1]} ${m[2]}`);
  expect(islands).toEqual([
    "button_usage visible",
    "button_variants visible",
    "button_sizes visible",
    "button_icons visible",
    "button_icon_only visible",
    "button_full_width visible",
    "button_disabled visible",
    "button_tailwind visible",
    "button_demo load",
  ]);
  // Usage's button, then Variants' each.
  const classes = [...html.matchAll(/<button data-hk="\w+" type="button" class="([^"]*)"/g)].map((m) => m[1]?.trim());
  expect(classes.slice(0, 8)).toEqual([
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
