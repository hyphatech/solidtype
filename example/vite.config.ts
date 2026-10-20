import { fileURLToPath } from "node:url";
import tailwindcss from "@tailwindcss/vite";
import { defineConfig } from "vite";
import solid from "vite-plugin-solid";
import solidtype from "vite-plugin-solidtype";

// The board's page, rooted here, loads Melange's output from the
// repository's _build, which `dune build --watch` keeps current; in
// development the API is the server's, on 4420.
const repository = fileURLToPath(new URL("..", import.meta.url));

export default defineConfig({
  root: fileURLToPath(new URL(".", import.meta.url)),
  plugins: [tailwindcss(), solidtype(), solid()],
  server: { proxy: { "/api": "http://localhost:4420" }, fs: { allow: [repository] } },
  build: { outDir: `${repository}_build/example-dist`, emptyOutDir: true },
});
