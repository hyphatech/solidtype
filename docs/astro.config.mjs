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
      customCss: ["./src/styles/heroui.css"],
      sidebar: [
        { label: "Start here", items: ["index"] },
        { label: "HeroUI", items: ["heroui/coverage", "heroui/button", "heroui/separator"] },
      ],
    }),
    solid({ exclude: [reactFiles] }),
    react({ include: [reactFiles] }),
  ],
  vite: { plugins: [tailwindcss(), solidtype()], server: { fs: { allow: [repository] } } },
});
