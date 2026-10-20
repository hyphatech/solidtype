import { defineConfig } from "vitest/config";
import solid from "vite-plugin-solid";
import solidtype from "vite-plugin-solidtype";

// The example's tests and the bindings' are OCaml, compiled by Melange into
// _build; melange-jest reaches the globals Jest and vitest share. What runs
// in a browser runs in jsdom; Solid's rendering on the server runs in Node,
// compiled for the server, where Solid resolves its server build.
export default defineConfig({
  test: {
    projects: [
      {
        plugins: [solidtype(), solid()],
        test: {
          name: "browser",
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
      },
      {
        plugins: [solidtype(), solid({ ssr: true })],
        resolve: { conditions: ["node"] },
        test: {
          name: "server",
          environment: "node",
          globals: true,
          include: ["_build/default/test/server/out/test/server/*_test.jsx"],
        },
      },
    ],
  },
});
