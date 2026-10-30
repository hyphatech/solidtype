import { defineConfig } from "vitest/config";
import react from "@vitejs/plugin-react";
import solid from "vite-plugin-solid";
import solidtype from "vite-plugin-solidtype";

// The example's tests and the bindings' are OCaml, compiled by Melange into
// _build; melange-jest reaches the globals Jest and vitest share. What runs
// in a browser runs in jsdom; Solid's rendering on the server runs in Node,
// compiled for the server, where Solid resolves its server build.
//
// A HeroUI port is tested beside HeroUI's React component, its twin: React's
// compiler is kept to those twins, Solid's to everything else.
const reactTwins = /\/test\/heroui\/twins\/[^/]+\.tsx$/;

export default defineConfig({
  test: {
    projects: [
      {
        plugins: [solidtype(), solid({ exclude: [reactTwins] }), react({ include: reactTwins })],
        test: {
          name: "browser",
          environment: "jsdom",
          // The example's board calls its server, from a page on the server's
          // origin, as `make example-serve` serves it.
          environmentOptions: { jsdom: { url: "http://localhost:4420/" } },
          globalSetup: ["example/test/server.ts"],
          // What jsdom lacks, stood in for in every test file.
          setupFiles: ["test/jsdom.ts", "example/test/fetch.ts"],
          globals: true,
          include: [
            "_build/default/example/out/example/test/*_test.jsx",
            "_build/default/test/browser/out/test/browser/*_test.jsx",
            "_build/default/test/kobalte/out/test/kobalte/*_test.jsx",
            "_build/default/test/heroui/out/test/heroui/*_test.jsx",
            "_build/default/test/rhp/out/test/rhp/*_test.jsx",
          ],
        },
      },
      {
        // An island the setup renders on the server, through Vite's own
        // server-side loading, and the test hydrates: Solid's hydratable
        // compile, for both sides.
        plugins: [solidtype(), solid({ ssr: true })],
        resolve: { conditions: ["browser", "development"] },
        ssr: { resolve: { conditions: ["node"], externalConditions: ["node"] } },
        test: {
          name: "hydration",
          environment: "jsdom",
          // Solid and rhp are compiled with the test, as an application's
          // build compiles them: left to Node, solid-js/web's import of
          // Solid's core would be the server's, whose onMount runs with no
          // element to hydrate.
          server: { deps: { inline: [/@bezda\/rhp/, /solid-js/] } },
          globalSetup: ["test/hydration/setup.ts"],
          globals: true,
          include: ["_build/default/test/hydration/out/test/hydration/*_test.jsx"],
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
