import { fileURLToPath } from "node:url";
import { defineConfig } from "astro/config";
import solid from "@astrojs/solid-js";
import tailwindcss from "@tailwindcss/vite";
import solidtype from "vite-plugin-solidtype";

// The board as an Astro site: it is OCaml, compiled by Melange into the
// repository's _build, which Vite may read from here, and the plugin runs
// before Solid's, under the server build as under the client's. Its pages
// are pages/, beside the board's sources, so this directory is Astro's
// source directory.
const repository = fileURLToPath(new URL("..", import.meta.url));

export default defineConfig({
  srcDir: ".",
  outDir: `${repository}_build/example-astro`,
  output: "static",
  integrations: [solid()],
  vite: { plugins: [tailwindcss(), solidtype()], server: { fs: { allow: [repository] } } },
});
