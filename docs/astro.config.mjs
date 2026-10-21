import { fileURLToPath } from "node:url";
import { defineConfig } from "astro/config";
import react from "@astrojs/react";
import solid from "@astrojs/solid-js";
import starlight from "@astrojs/starlight";
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
      customCss: ["./src/styles/heroui.css", "./src/styles/site.css"],
      components: { PageTitle: "./src/components/PageTitle.astro" },
      // Code as HeroUI's documentation shows it: a rounded block on the
      // background's second shade, no border, no shadow.
      expressiveCode: {
        styleOverrides: {
          borderRadius: "1rem",
          borderColor: "transparent",
          codeBackground: "var(--background-secondary)",
          codeFontSize: "0.8125rem",
          frames: {
            shadowColor: "transparent",
            editorTabBarBackground: "var(--background-secondary)",
            editorActiveTabBackground: "var(--background-secondary)",
            editorActiveTabIndicatorTopColor: "transparent",
            editorActiveTabIndicatorBottomColor: "transparent",
            editorActiveTabForeground: "var(--muted)",
            editorTabBarBorderBottomColor: "var(--separator)",
            terminalTitlebarBackground: "var(--background-secondary)",
            terminalBackground: "var(--background-secondary)",
          },
        },
      },
      sidebar: [
        { label: "Start here", items: ["index"] },
        { label: "HeroUI", items: ["heroui/coverage", "heroui/avatar", "heroui/avatar-group", "heroui/badge", "heroui/button", "heroui/button-group", "heroui/card", "heroui/checkbox", "heroui/checkbox-group", "heroui/chip", "heroui/close-button", "heroui/description", "heroui/empty-state", "heroui/field-error", "heroui/fieldset", "heroui/input", "heroui/kbd", "heroui/label", "heroui/link", "heroui/number-field", "heroui/radio-group", "heroui/scroll-shadow", "heroui/search-field", "heroui/separator", "heroui/skeleton", "heroui/slider", "heroui/spinner", "heroui/surface", "heroui/switch", "heroui/text-area", "heroui/text-field", "heroui/typography"] },
      ],
    }),
    solid({ exclude: [reactFiles] }),
    react({ include: [reactFiles] }),
  ],
  vite: { plugins: [tailwindcss(), solidtype()], server: { fs: { allow: [repository] } } },
});
