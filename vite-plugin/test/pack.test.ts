// An application installs the plugin from a release's tarball, and with it
// the stylesheets of solidtype-heroui's components HeroUI has none for: one
// import, by the package's name, puts them in the components layer. The
// tarball is packed as `make release` packs it and installed beside an
// application built by Vite with Tailwind, as a command, since Vite's node
// bundle does not load inside Bun's test runner.

import { expect, test } from "bun:test";
import { mkdirSync, readdirSync, readFileSync, rmSync, writeFileSync } from "node:fs";
import { join } from "node:path";
import { fileURLToPath } from "node:url";

const root = fileURLToPath(new URL("../../", import.meta.url));
const dir = join(root, "_build/pack-test");
const app = join(dir, "app");

const run = (command: string[], cwd: string) => {
  const result = Bun.spawnSync(command, { cwd, stdout: "pipe", stderr: "pipe" });
  expect(result.exitCode, result.stderr.toString()).toBe(0);
};

test("the release's plugin gives an application the extras' stylesheet, in the components layer", () => {
  rmSync(dir, { recursive: true, force: true });
  run(["bun", "vite-plugin/pack.ts", "0.0.0", dir], root);
  const installed = join(app, "node_modules/vite-plugin-solidtype");
  mkdirSync(installed, { recursive: true });
  run(["tar", "xzf", join(dir, "vite-plugin-solidtype-0.0.0.tgz"), "--strip-components", "1", "-C", installed], root);

  writeFileSync(
    join(app, "app.css"),
    '@import "tailwindcss";\n@import "@heroui/styles";\n@import "vite-plugin-solidtype/heroui-extras.css";\n',
  );
  writeFileSync(join(app, "main.js"), 'import "./app.css";\n');
  writeFileSync(join(app, "index.html"), '<!doctype html><script type="module" src="./main.js"></script>\n');
  writeFileSync(
    join(app, "vite.config.js"),
    'import tailwindcss from "@tailwindcss/vite";\nexport default { plugins: [tailwindcss()], build: { cssMinify: false } };\n',
  );
  run(["bun", "--bun", "vite", "build"], app);

  const assets = join(app, "dist/assets");
  const css = readdirSync(assets)
    .filter((file) => file.endsWith(".css"))
    .map((file) => readFileSync(join(assets, file), "utf8"))
    .join("\n");
  for (const block of [".segment", ".trend-chip__indicator", ".text-shimmer"]) {
    const at = css.indexOf(`  ${block} {`);
    expect(at, `${block} is in the stylesheet`).toBeGreaterThan(-1);
    const layer = css.slice(0, at).match(/@layer (\w+) \{(?![\s\S]*@layer \w+ \{)/)?.[1];
    expect(layer, `${block}'s layer`).toBe("components");
  }
}, 120_000);
