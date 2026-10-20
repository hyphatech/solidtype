import { defineConfig } from "vitest/config";
import solid from "vite-plugin-solid";
import solidtype from "vite-plugin-solidtype";

// The example's tests and the bindings' are OCaml, compiled by Melange into
// _build; melange-jest reaches the globals Jest and vitest share.
export default defineConfig({
  plugins: [solidtype(), solid()],
  test: {
    environment: "jsdom",
    // The example's board calls its server, from a page on the server's
    // origin, as `make serve` serves it.
    environmentOptions: { jsdom: { url: "http://localhost:4420/" } },
    globalSetup: ["example/test/server.ts"],
    // What jsdom lacks, stood in for in every test file.
    setupFiles: ["test/jsdom.ts", "example/test/fetch.ts"],
    globals: true,
    include: [
      "_build/default/example/out/example/test/*_test.jsx",
      "_build/default/test/browser/out/test/browser/*_test.jsx",
      "_build/default/test/kobalte/out/test/kobalte/*_test.jsx",
    ],
  },
});
