import { fileURLToPath } from "node:url";
import { defineConfig } from "astro/config";
import react from "@astrojs/react";
import solid from "@astrojs/solid-js";
import starlight from "@astrojs/starlight";
import tailwindcss from "@tailwindcss/vite";
import links from "starlight-links-validator";
import hypha from "starlight-theme-hypha";
import solidtype from "vite-plugin-solidtype";
import astro from "@shikijs/langs/astro";
import ocaml from "@shikijs/langs/ocaml";
import mlx from "./src/mlx.mjs";

// solidtype's documentation: how the libraries work and are set up, the
// Solid and Kobalte bindings, the charts of rhp's binding, and each HeroUI
// port live,
// beside the same component in React, with its source. The demos are OCaml, compiled by
// Melange into the repository's _build; two JSX compilers share the site,
// React's kept to islands/react, where HeroUI's React components are
// rendered, and Solid's to everything else. It is published to GitHub Pages
// by .github/workflows/docs.yml, under the repository's name. `make docs`
// builds it into _build/docs, odoc's reference from the .mli files into
// public/reference/ first.
//
// Every whole program a page shows is a file the repository builds --
// an island, or the example's -- imported raw into Starlight's <Code>. A
// missing one, or a link to a page or a heading that is not there, fails
// the build.
const repository = fileURLToPath(new URL("..", import.meta.url));
const reactFiles = /\/islands\/react\/[^/]+\.tsx$/;

export default defineConfig({
  site: "https://hyphatech.github.io",
  base: "/solidtype",
  outDir: `${repository}_build/docs`,
  output: "static",
  integrations: [
    starlight({
      title: "solidtype",
      description: "SolidJS for modern OCaml.",
      // The 404 page is src/pages/404.astro, drawn by Starlight.
      disable404Route: true,
      logo: { dark: "starlight-theme-hypha/assets/hypha.webp", light: "starlight-theme-hypha/assets/hypha-day.webp" },
      // Hypha's look, from its theme; heroui.css keeps the demos in HeroUI's,
      // api.css sets this site's API tables, and rhp.css gives rhp's charts
      // the site's colours.
      plugins: [
        hypha({
          brand: "hypha",
          github: "hyphatech/solidtype",
          tabs: { "Start here": "rocket", Solid: "zap", Kobalte: "blocks", HeroUI: "component", Charts: "waves-horizontal", Reference: "library" },
          links: [{ label: "Hypha Stack", href: "https://hyphatech.io/stack", icon: "layers" }],
        }),
        // The reference is odoc's, in public/, and the Astro page's demo is
        // pages of its own, src/pages/demo: the validator sees neither.
        links({ exclude: ["**/reference/solidtype*/**", "**/reference/ppx_solidtype/**", "/solidtype/demo/**"] }),
      ],
      customCss: ["./src/styles/heroui.css", "./src/styles/api.css", "./src/styles/rhp.css"],
      // An OCaml block is MLX: its JSX highlighted by a grammar injected
      // into Shiki's OCaml, which is loaded first so the rules the grammar
      // includes are there. A <Code> block highlights in the prerendered
      // pages, under _build, which cannot import a grammar Shiki would load
      // as it needs it: Astro's is loaded here, without the styles it would
      // load so, Sass's and the like, which no page writes.
      expressiveCode: {
        shiki: { langs: [...ocaml, mlx, ...astro.map((lang) => ({ ...lang, embeddedLangsLazy: [] }))] },
      },
      favicon: "/favicon-32.png",
      head: [
        { tag: "link", attrs: { rel: "icon", type: "image/png", sizes: "16x16", href: "/solidtype/favicon-16.png" } },
        { tag: "link", attrs: { rel: "apple-touch-icon", sizes: "180x180", href: "/solidtype/apple-touch-icon.png" } },
      ],
      sidebar: [
        { label: "Start here", items: ["index", "start/ocaml-over-typescript", "start/how-it-works", "start/melange", "start/vite", "start/astro", "start/conventions"] },
        { label: "Solid", items: [{ slug: "solid", label: "Overview" }, "solid/components", "solid/reactivity", "solid/control-flow", "solid/state", "solid/async", "solid/rendering"] },
        { label: "Kobalte", items: [{ slug: "kobalte", label: "Overview" }, "kobalte/binding", "kobalte/usage", "kobalte/headless"] },
        {
          label: "HeroUI",
          items: [
            { slug: "heroui", label: "Overview" },
            "heroui/coverage",
            { label: "Handbook", items: ["heroui/theming", "heroui/styling", "heroui/composition"] },
            { label: "Buttons", items: ["heroui/button", "heroui/button-group", "heroui/close-button", "heroui/segment", "heroui/toggle-button", "heroui/toggle-button-group"] },
            { label: "Collections", items: ["heroui/dropdown", "heroui/empty-state", "heroui/list-box"] },
            { label: "Colors", items: ["heroui/color-area", "heroui/color-field", "heroui/color-picker", "heroui/color-slider", "heroui/color-swatch", "heroui/color-swatch-picker"] },
            { label: "Controls", items: ["heroui/slider", "heroui/switch"] },
            { label: "Data Display", items: ["heroui/badge", "heroui/chip", "heroui/table", "heroui/trend-chip"] },
            { label: "Date and Time", items: ["heroui/time-field"] },
            { label: "Feedback", items: ["heroui/alert", "heroui/meter", "heroui/progress-bar", "heroui/progress-circle", "heroui/skeleton", "heroui/spinner", "heroui/text-shimmer"] },
            { label: "Forms", items: ["heroui/checkbox", "heroui/checkbox-group", "heroui/description", "heroui/field-error", "heroui/fieldset", "heroui/form", "heroui/input", "heroui/input-group", "heroui/label", "heroui/number-field", "heroui/radio-group", "heroui/search-field", "heroui/text-area", "heroui/text-field"] },
            { label: "Layout", items: ["heroui/card", "heroui/separator", "heroui/surface"] },
            { label: "Media", items: ["heroui/avatar", "heroui/avatar-group"] },
            { label: "Navigation", items: ["heroui/accordion", "heroui/breadcrumbs", "heroui/disclosure", "heroui/disclosure-group", "heroui/link", "heroui/pagination", "heroui/tabs"] },
            { label: "Overlays", items: ["heroui/alert-dialog", "heroui/drawer", "heroui/modal", "heroui/popover", "heroui/toast", "heroui/tooltip"] },
            { label: "Pickers", items: ["heroui/autocomplete", "heroui/combo-box", "heroui/select"] },
            { label: "Typography", items: ["heroui/kbd", "heroui/typography"] },
            { label: "Utilities", items: ["heroui/scroll-shadow"] },
          ],
        },
        {
          label: "Charts",
          items: [
            { slug: "rhp", label: "Overview" },
            "rhp/gallery",
            "rhp/theme",
            { label: "Reference", items: ["rhp/chart", "rhp/plot", "rhp/scale", "rhp/slat", "rhp/many-dots", "rhp/poster", "rhp/helpers"] },
            { label: "Blocks", items: ["rhp/bar", "rhp/dot", "rhp/tick", "rhp/label", "rhp/cell", "rhp/place", "rhp/line", "rhp/area"] },
          ],
        },
        { label: "Reference", items: ["reference"] },
      ],
    }),
    solid({ exclude: [reactFiles] }),
    react({ include: [reactFiles] }),
  ],
  vite: {
    plugins: [tailwindcss(), solidtype()],
    // A page imports across the repository by these names, never by a path
    // up the tree: `@islands/<name>.jsx` is an island as Melange compiled
    // it, the demo a page runs, and `@islands/<name>.mlx?raw` its source,
    // the code a page shows; `@example/` is the example, `@components/`
    // the site's own components, `@styles/` its stylesheets, and `@demo/`
    // the pages of the Astro page's demo, whose sources it shows.
    resolve: {
      alias: [
        { find: /^@islands\/(.+)\.jsx$/, replacement: `${repository}_build/default/docs/islands/out/docs/islands/$1.jsx` },
        { find: "@islands", replacement: `${repository}docs/islands` },
        { find: "@example", replacement: `${repository}example` },
        { find: "@components", replacement: `${repository}docs/src/components` },
        { find: "@demo", replacement: `${repository}docs/src/pages/demo` },
        { find: "@styles", replacement: `${repository}docs/src/styles` },
      ],
    },
    server: { fs: { allow: [repository] } },
    // The comparisons' React -- React itself, React Aria's components and
    // the hooks under them, and HeroUI's React components -- shared by every
    // port's page, each a chunk of its own, together past what one chunk
    // should hold.
    build: {
      rolldownOptions: {
        output: {
          codeSplitting: {
            groups: [
              { name: "react", test: /\/node_modules\/(react|react-dom|scheduler)\// },
              // React Aria's components carry their hooks, past a chunk alone:
              // a module each, split in two by name, for size.
              { name: "react-aria-components-a", test: /\/node_modules\/react-aria-components\/dist\/[a-z]+\/[A-La-l]/ },
              { name: "react-aria-components", test: /\/node_modules\/react-aria-components\// },
              {
                name: "react-aria",
                test: /\/node_modules\/(@react-aria|@react-stately|@react-types|react-aria|react-stately|@internationalized)\//,
              },
              { name: "heroui-react", test: /\/node_modules\/@heroui\/react\// },
            ],
          },
        },
      },
    },
  },
});
