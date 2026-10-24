// The documentation builds as `make docs` builds it, Solid's and React's
// compilers sharing the site, and a port's page holds its examples
// prerendered with HeroUI's classes, to hydrate as they are scrolled to, and
// its demo beside React, to hydrate as the page loads.

import { expect, test } from "bun:test";
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";

const root = fileURLToPath(new URL("../../", import.meta.url));

// A port's classes are HeroUI's, which its twin test compares, but its look is
// HeroUI's stylesheet for it, which the documentation imports one by one: a
// port whose stylesheet is not imported shows unstyled, and no test of
// classes sees it.
test("Each port's page has HeroUI's stylesheet for it", () => {
  const imported = readFileSync(`${root}docs/src/styles/heroui.css`, "utf8");
  const shipped = new Set(
    [...new Bun.Glob("*.css").scanSync(`${root}node_modules/@heroui/styles/dist/components`)],
  );
  const pages = [...new Bun.Glob("*.mdx").scanSync(`${root}docs/src/content/docs/heroui`)]
    .map((page) => page.replace(/\.mdx$/, ""))
    .filter((page) => page !== "coverage");
  const missing = pages.flatMap((page) => {
    // HeroUI names a few of its stylesheets without the hyphen: textfield.
    const sheet = [`${page}.css`, `${page.replaceAll("-", "")}.css`].find((s) => shipped.has(s));
    return sheet && !imported.includes(`@heroui/styles/components/${sheet}"`) ? [sheet] : [];
  });
  expect(missing).toEqual([]);
});

// The prose's flow spaces each element from the one before, which a port's
// parts must never take: an island stands in an example, or in a block out of
// the flow, `not-content`, on HeroUI's ground.
test("No port's island stands in the prose's flow", () => {
  const bare = [...new Bun.Glob("*.mdx").scanSync(`${root}docs/src/content/docs/heroui`)].flatMap((page) =>
    readFileSync(`${root}docs/src/content/docs/heroui/${page}`, "utf8")
      .split("\n")
      .filter((line, i, lines) => {
        const held = `${lines[i - 1] ?? ""}\n${line}`;
        return / client:\w+/.test(line) && !held.includes("<Example") && !held.includes('class="not-content');
      })
      .map((line) => `${page}: ${line.trim()}`),
  );
  expect(bare).toEqual([]);
});

test("Button's page prerenders the port, to hydrate beside HeroUI's", () => {
  const build = Bun.spawnSync(["bun", "--bun", "astro", "build", "--root", "docs"], { cwd: root, stdout: "pipe", stderr: "pipe" });
  expect(build.exitCode, build.stderr.toString()).toBe(0);
  const html = readFileSync(`${root}_build/docs/heroui/button/index.html`, "utf8");
  const islands = [...html.matchAll(/<astro-island [^>]*component-url="\/solidtype\/_astro\/(\w+)\.[^"]*"[^>]*client="(\w+)"/g)].map((m) => `${m[1]} ${m[2]}`);
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
