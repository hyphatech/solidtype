import { fileURLToPath } from "node:url";
import { defineConfig } from "astro/config";
import react from "@astrojs/react";
import solid from "@astrojs/solid-js";
import starlight from "@astrojs/starlight";
import tailwindcss from "@tailwindcss/vite";
import links from "starlight-links-validator";
import hypha from "starlight-theme-hypha";
import solidtype from "vite-plugin-solidtype";

// solidtype's documentation: how the libraries work and are set up, the
// Solid and Kobalte bindings, and each HeroUI port live, beside the same
// component in React, with its source. The demos are OCaml, compiled by
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
      logo: { src: "starlight-theme-hypha/assets/hypha.webp" },
      // Hypha's look, from its theme; heroui.css keeps the demos in HeroUI's,
      // and api.css sets this site's API tables.
      plugins: [
        hypha({
          brand: "hypha",
          github: "hyphatech/solidtype",
          tabs: { "Start here": "rocket", Solid: "zap", Kobalte: "blocks", HeroUI: "component", Reference: "library" },
          links: [{ label: "Hypha Stack", href: "https://hyphatech.io/stack", icon: "layers" }],
        }),
        // The reference is odoc's, in public/, which the validator cannot see.
        links({ exclude: ["**/reference/**"] }),
      ],
      customCss: ["./src/styles/heroui.css", "./src/styles/api.css"],
      favicon: "/favicon-32.png",
      head: [
        { tag: "link", attrs: { rel: "icon", type: "image/png", sizes: "16x16", href: "/solidtype/favicon-16.png" } },
        { tag: "link", attrs: { rel: "apple-touch-icon", sizes: "180x180", href: "/solidtype/apple-touch-icon.png" } },
      ],
      sidebar: [
        { label: "Start here", items: ["index", "start/how-it-works", "start/melange", "start/vite", "start/conventions"] },
        { label: "Solid", items: ["solid/components", "solid/reactivity", "solid/control-flow", "solid/state", "solid/async", "solid/rendering"] },
        { label: "Kobalte", items: ["kobalte/binding", "kobalte/usage"] },
        { label: "HeroUI", items: ["heroui/coverage", "heroui/accordion", "heroui/alert", "heroui/alert-dialog", "heroui/avatar", "heroui/avatar-group", "heroui/badge", "heroui/breadcrumbs", "heroui/button", "heroui/button-group", "heroui/card", "heroui/checkbox", "heroui/checkbox-group", "heroui/chip", "heroui/close-button", "heroui/description", "heroui/disclosure", "heroui/disclosure-group", "heroui/drawer", "heroui/empty-state", "heroui/field-error", "heroui/fieldset", "heroui/form", "heroui/input", "heroui/input-group", "heroui/kbd", "heroui/label", "heroui/link", "heroui/meter", "heroui/modal", "heroui/number-field", "heroui/pagination", "heroui/popover", "heroui/progress-bar", "heroui/progress-circle", "heroui/radio-group", "heroui/scroll-shadow", "heroui/search-field", "heroui/separator", "heroui/skeleton", "heroui/slider", "heroui/spinner", "heroui/surface", "heroui/switch", "heroui/tabs", "heroui/text-area", "heroui/text-field", "heroui/time-field", "heroui/toast", "heroui/toggle-button", "heroui/toggle-button-group", "heroui/tooltip", "heroui/typography"] },
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
    // the code a page shows; `@example/` is the example, and `@components/`
    // the site's own components.
    resolve: {
      alias: [
        { find: /^@islands\/(.+)\.jsx$/, replacement: `${repository}_build/default/docs/islands/out/docs/islands/$1.jsx` },
        { find: "@islands", replacement: `${repository}docs/islands` },
        { find: "@example", replacement: `${repository}example` },
        { find: "@components", replacement: `${repository}docs/src/components` },
      ],
    },
    server: { fs: { allow: [repository] } },
  },
});
