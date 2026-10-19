// Every module of the libraries, built for the browser as an application's
// build reads them; server.jsx alone is for the server build.

import { readdirSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { defineConfig } from "vite";
import solid from "vite-plugin-solid";
import solidtype from "vite-plugin-solidtype";

const root = fileURLToPath(new URL("../../", import.meta.url));
const out = `${root}_build/default/example/out/node_modules`;
const modules = ["solidtype", "solidtype-kobalte"].flatMap((lib) =>
  readdirSync(`${out}/${lib}`)
    .filter((f) => f.endsWith(".jsx") && f !== "server.jsx")
    .map((f) => `${out}/${lib}/${f}`),
);

export default defineConfig({
  root,
  logLevel: "warn",
  plugins: [solidtype(), solid()],
  build: {
    outDir: `${root}_build/browser-check`,
    emptyOutDir: true,
    rollupOptions: { input: modules, preserveEntrySignatures: "strict" },
  },
});
