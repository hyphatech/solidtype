import { fileURLToPath } from "node:url";
import { defineConfig } from "astro/config";
import react from "@astrojs/react";
import solid from "@astrojs/solid-js";
import starlight from "@astrojs/starlight";
import tailwindcss from "@tailwindcss/vite";
import hypha from "starlight-theme-hypha";
import solidtype from "vite-plugin-solidtype";

// solidtype's documentation: how the libraries work and are set up, the
// Solid and Kobalte bindings, and each HeroUI port live, beside the same
// component in React, with its source. The demos are OCaml, compiled by
// Melange into the repository's _build; two JSX compilers share the site,
// React's kept to islands/react, where HeroUI's React components are
// rendered, and Solid's to everything else.
const repository = fileURLToPath(new URL("..", import.meta.url));
const reactFiles = /\/islands\/react\/[^/]+\.tsx$/;

export default defineConfig({
  outDir: `${repository}_build/docs`,
  output: "static",
  integrations: [
    starlight({
      title: "solidtype",
      logo: { src: "starlight-theme-hypha/assets/hypha.webp" },
      // Hypha's look, from its theme; heroui.css keeps the demos in HeroUI's,
      // and api.css sets this site's API tables.
      plugins: [
        hypha({
          brand: "hypha",
          github: "hyphatech/solidtype",
          tabs: { "Start here": "rocket", Solid: "zap", Kobalte: "blocks", HeroUI: "component" },
          links: [{ label: "Hypha Stack", href: "https://hyphatech.io/stack", icon: "layers" }],
        }),
      ],
      customCss: ["./src/styles/heroui.css", "./src/styles/api.css"],
      favicon: "/favicon-32.png",
      head: [
        { tag: "link", attrs: { rel: "icon", type: "image/png", sizes: "16x16", href: "/favicon-16.png" } },
        { tag: "link", attrs: { rel: "apple-touch-icon", sizes: "180x180", href: "/apple-touch-icon.png" } },
      ],
      sidebar: [
        { label: "Start here", items: ["index", "start/how-it-works", "start/melange", "start/vite", "start/conventions"] },
        { label: "Solid", items: ["solid/components", "solid/reactivity", "solid/control-flow", "solid/state", "solid/async", "solid/rendering"] },
        { label: "Kobalte", items: ["kobalte/binding", "kobalte/usage"] },
        { label: "HeroUI", items: ["heroui/coverage", "heroui/alert", "heroui/avatar", "heroui/avatar-group", "heroui/badge", "heroui/button", "heroui/button-group", "heroui/card", "heroui/checkbox", "heroui/checkbox-group", "heroui/chip", "heroui/close-button", "heroui/description", "heroui/empty-state", "heroui/field-error", "heroui/fieldset", "heroui/form", "heroui/input", "heroui/input-group", "heroui/kbd", "heroui/label", "heroui/link", "heroui/meter", "heroui/number-field", "heroui/progress-bar", "heroui/progress-circle", "heroui/radio-group", "heroui/scroll-shadow", "heroui/search-field", "heroui/separator", "heroui/skeleton", "heroui/slider", "heroui/spinner", "heroui/surface", "heroui/switch", "heroui/text-area", "heroui/text-field", "heroui/time-field", "heroui/toast", "heroui/toggle-button", "heroui/toggle-button-group", "heroui/typography"] },
      ],
    }),
    solid({ exclude: [reactFiles] }),
    react({ include: [reactFiles] }),
  ],
  vite: { plugins: [tailwindcss(), solidtype()], server: { fs: { allow: [repository] } } },
});
