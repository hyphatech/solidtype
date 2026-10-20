import { defineConfig } from "astro/config";
import solid from "@astrojs/solid-js";
import tailwindcss from "@tailwindcss/vite";
import solidtype from "vite-plugin-solidtype";

// The board as an Astro site: it is OCaml, compiled by Melange into
// _build. Its root is the repository's, so a page reaches Melange's
// output, and the plugin runs before Solid's, under the server build as
// under the client's.
export default defineConfig({
  srcDir: "example",
  outDir: "_build/example-astro",
  output: "static",
  integrations: [solid()],
  vite: { plugins: [tailwindcss(), solidtype()] },
});
