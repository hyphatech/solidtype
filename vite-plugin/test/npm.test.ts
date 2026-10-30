// Each opam package names, in its x-npm-depends, the npm packages its
// library's JavaScript imports, at the range the workspace builds and tests
// it against, so an application installs exactly what the packages it uses
// import. The plugin's markers are left out: the plugin is an asset of each
// release, never of npm's registry.

import { expect, test } from "bun:test";
import { readdirSync, readFileSync } from "node:fs";
import { join } from "node:path";
import { fileURLToPath } from "node:url";

const root = fileURLToPath(new URL("../../", import.meta.url));
const read = (path: string) => readFileSync(join(root, path), "utf8");
const workspace: Record<string, string> = JSON.parse(read("package.json")).devDependencies;

// The directory whose dune file installs each package.
const libraries = readdirSync(root, { withFileTypes: true }).flatMap((entry) => {
  if (!entry.isDirectory()) return [];
  try {
    const name = read(join(entry.name, "dune")).match(/\(public_name ([^)\s]+)\)/)?.[1];
    return name ? [{ name, dir: entry.name }] : [];
  } catch {
    return [];
  }
});

// A package's name in an import: its scope and name, never a path inside it.
const packageOf = (specifier: string) =>
  specifier
    .split("/")
    .slice(0, specifier.startsWith("@") ? 2 : 1)
    .join("/");

const imported = (dir: string) =>
  [
    ...new Set(
      readdirSync(join(root, dir))
        .filter((file) => /\.mli?x?$/.test(file))
        .flatMap((file) => [...read(join(dir, file)).matchAll(/mel\.module "([^"]+)"/g)].map((m) => packageOf(m[1]!)))
        .filter((name) => name !== "vite-plugin-solidtype"),
    ),
  ].sort();

const declared = (name: string) =>
  [...(read(`${name}.opam`).match(/^x-npm-depends: \[([^\]]*)\]/m)?.[1] ?? "").matchAll(/"([^"]+)"/g)].map((m) => {
    const at = m[1]!.lastIndexOf("@");
    return { name: m[1]!.slice(0, at), range: m[1]!.slice(at + 1) };
  });

test("the libraries are found", () => {
  expect(libraries.map((l) => l.name).sort()).toContain("solidtype-rhp");
});

for (const { name, dir } of libraries) {
  test(`${name} declares what it imports from npm, at the workspace's range`, () => {
    const wanted = imported(dir).map((n) => ({ name: n, range: workspace[n] ?? "none: not in package.json" }));
    const got = declared(name).sort((a, b) => a.name.localeCompare(b.name));
    expect(got).toEqual(wanted);
  });
}
