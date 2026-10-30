// The documentation builds as `make docs` builds it, Solid's and React's
// compilers sharing the site, and a port's page holds its examples
// prerendered with HeroUI's classes, to hydrate as they are scrolled to, and
// its demo beside React, to hydrate as the page loads.

import { beforeAll, expect, test } from "bun:test";
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

// The site, built once for the tests that read it.
beforeAll(() => {
  const build = Bun.spawnSync(["bun", "--bun", "astro", "build", "--root", "docs"], { cwd: root, stdout: "pipe", stderr: "pipe" });
  expect(build.exitCode, build.stderr.toString()).toBe(0);
}, 60_000);

const islandsOf = (html: string) =>
  [...html.matchAll(/<astro-island [^>]*>/g)].map(([tag]) => ({
    name: /component-url="\/solidtype\/_astro\/(\w+)\./.exec(tag)?.[1],
    client: /client="(\w+)"/.exec(tag)?.[1],
    props: JSON.parse((/ props="([^"]*)"/.exec(tag)?.[1] ?? "{}").replaceAll("&quot;", '"')),
    persist: /data-astro-transition-persist="([^"]*)"/.exec(tag)?.[1],
  }));

test("Button's page prerenders the port, to hydrate beside HeroUI's", () => {
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
});

// The Astro page's islands take what the page gives them, and its demo is a
// route per tea, each tea's island given its name, under one basket that
// the client router keeps from page to page by its one persist name.
test("The Astro page's islands are given props, and its demo's routes keep one basket", () => {
  const page = islandsOf(readFileSync(`${root}_build/docs/start/astro/index.html`, "utf8"));
  expect(page.map((i) => [i.name, i.client, i.props])).toEqual([
    ["astro_counter", "visible", { label: [0, "Stars"], startAt: [0, 3] }],
    ["astro_local_time", "idle", {}],
    ["astro_basket_count", "load", {}],
    ["astro_add_to_basket", "visible", { tea: [0, "Sencha"] }],
  ]);
  const routes = { sencha: "Sencha", darjeeling: "Darjeeling", "pu-erh": "Pu-erh" };
  const baskets = Object.entries(routes).map(([slug, name]) => {
    const html = readFileSync(`${root}_build/docs/demo/teas/${slug}/index.html`, "utf8");
    expect(html).toContain('<meta name="astro-view-transitions-enabled" content="true">');
    const islands = islandsOf(html);
    expect(islands.find((i) => i.name === "astro_add_to_basket")?.props).toEqual({ tea: [0, name] });
    return islands.find((i) => i.name === "astro_basket_count")?.persist;
  });
  expect(baskets[0]).toBeString();
  expect(new Set(baskets).size).toBe(1);
});
