import { fileURLToPath } from "node:url";
import { defineConfig } from "astro/config";
import react from "@astrojs/react";
import solid from "@astrojs/solid-js";
import starlight from "@astrojs/starlight";
import starlightThemeObsidian from "starlight-theme-obsidian";
import tailwindcss from "@tailwindcss/vite";
import solidtype from "vite-plugin-solidtype";

// solidtype's documentation: each HeroUI port live, beside the same
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
      // Obsidian's theme dresses the site; heroui.css keeps the demos in
      // HeroUI's look. Its site graph reads the pages from a path relative
      // to the working directory, the repository's, where make runs Astro;
      // an absolute one it trims to a relative one that names nothing.
      plugins: [starlightThemeObsidian({ sitemapConfig: { contentRoot: "docs/src/content/docs" } })],
      customCss: ["./src/styles/heroui.css"],
      components: { PageTitle: "./src/components/PageTitle.astro" },
      sidebar: [
        { label: "Start here", items: ["index"] },
        { label: "HeroUI", items: ["heroui/coverage", "heroui/alert", "heroui/avatar", "heroui/avatar-group", "heroui/badge", "heroui/button", "heroui/button-group", "heroui/card", "heroui/checkbox", "heroui/checkbox-group", "heroui/chip", "heroui/close-button", "heroui/description", "heroui/empty-state", "heroui/field-error", "heroui/fieldset", "heroui/input", "heroui/input-group", "heroui/kbd", "heroui/label", "heroui/link", "heroui/meter", "heroui/number-field", "heroui/radio-group", "heroui/scroll-shadow", "heroui/search-field", "heroui/separator", "heroui/skeleton", "heroui/slider", "heroui/spinner", "heroui/surface", "heroui/switch", "heroui/text-area", "heroui/text-field", "heroui/typography"] },
      ],
    }),
    solid({ exclude: [reactFiles] }),
    react({ include: [reactFiles] }),
  ],
  vite: { plugins: [tailwindcss(), solidtype()], server: { fs: { allow: [repository] } } },
});
