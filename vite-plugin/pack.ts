// Packs the plugin as a release ships it: compiled to JavaScript, its
// version the release's, into vite-plugin-solidtype-<version>.tgz in the
// directory given. The release workflow attaches it to the GitHub release,
// whose URL an application names: `bun vite-plugin/pack.ts 0.1.0 dist`.

import { $ } from "bun";
import { copyFileSync, mkdirSync, mkdtempSync, readFileSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import { join, resolve } from "node:path";
import { fileURLToPath } from "node:url";

const [version, destination] = process.argv.slice(2);
if (!version || !destination) throw new Error("usage: bun vite-plugin/pack.ts <version> <directory>");

const here = fileURLToPath(new URL(".", import.meta.url));
const root = fileURLToPath(new URL("../", import.meta.url));
const stage = mkdtempSync(join(tmpdir(), "vite-plugin-solidtype-"));
const dist = join(stage, "dist");
mkdirSync(dist);

// The plugin, with Babel and Vite left to the application's install.
await $`bun build ${join(here, "src/index.ts")} --outdir ${dist} --target node --format esm --external @babel/core --external vite`.quiet();
copyFileSync(join(here, "src/markers.js"), join(dist, "markers.js"));
await $`bun x tsc ${join(here, "src/index.ts")} --declaration --emitDeclarationOnly --allowImportingTsExtensions --skipLibCheck --module NodeNext --moduleResolution NodeNext --target ES2023 --outDir ${dist}`.quiet();

const manifest = JSON.parse(readFileSync(join(here, "package.json"), "utf8"));
delete manifest.devDependencies;
manifest.version = version;
manifest.files = ["dist"];
manifest.exports = {
  ".": { types: "./dist/index.d.ts", default: "./dist/index.js" },
  "./markers": "./dist/markers.js",
};
writeFileSync(join(stage, "package.json"), `${JSON.stringify(manifest, null, 2)}\n`);
copyFileSync(join(root, "LICENSE"), join(stage, "LICENSE"));

mkdirSync(resolve(destination), { recursive: true });
await $`bun pm pack --destination ${resolve(destination)}`.cwd(stage).quiet();
console.log(join(resolve(destination), `vite-plugin-solidtype-${version}.tgz`));
