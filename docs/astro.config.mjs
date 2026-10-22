import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { defineConfig } from "astro/config";
import react from "@astrojs/react";
import solid from "@astrojs/solid-js";
import starlight from "@astrojs/starlight";
import { ExpressiveCodeTheme } from "@astrojs/starlight/expressive-code";
import tailwindcss from "@tailwindcss/vite";
import solidtype from "vite-plugin-solidtype";

// solidtype's documentation: each HeroUI port live, beside the same
// component in React, with its source. The demos are OCaml, compiled by
// Melange into the repository's _build; two JSX compilers share the site,
// React's kept to islands/react, where HeroUI's React components are
// rendered, and Solid's to everything else.
const repository = fileURLToPath(new URL("..", import.meta.url));
const reactFiles = /\/islands\/react\/[^/]+\.tsx$/;
// hypha.pub's code theme, copied as its palette is.
const codeTheme = ExpressiveCodeTheme.fromJSONString(
  readFileSync(new URL("./src/styles/code-theme.json", import.meta.url), "utf-8"),
);

export default defineConfig({
  outDir: `${repository}_build/docs`,
  output: "static",
  integrations: [
    starlight({
      title: "solidtype",
      // hypha.pub's look, in theme.css and the components it takes over;
      // heroui.css keeps the demos in HeroUI's.
      customCss: ["./src/styles/heroui.css", "./src/styles/theme.css"],
      favicon: "/favicon-32.png",
      head: [
        { tag: "link", attrs: { rel: "icon", type: "image/png", sizes: "16x16", href: "/favicon-16.png" } },
        { tag: "link", attrs: { rel: "apple-touch-icon", sizes: "180x180", href: "/apple-touch-icon.png" } },
        { tag: "meta", attrs: { name: "theme-color", content: "#0B0C0F" } },
      ],
      // The page's frame is hypha.pub's grid, not Starlight's.
      components: {
        ContentPanel: "./src/components/ContentPanel.astro",
        Footer: "./src/components/Footer.astro",
        Header: "./src/components/Header.astro",
        MobileMenuFooter: "./src/components/MobileMenuFooter.astro",
        PageFrame: "./src/components/PageFrame.astro",
        PageSidebar: "./src/components/PageSidebar.astro",
        PageTitle: "./src/components/PageTitle.astro",
        SiteTitle: "./src/components/SiteTitle.astro",
        SocialIcons: "./src/components/SocialIcons.astro",
        ThemeProvider: "./src/components/ThemeProvider.astro",
        ThemeSelect: "./src/components/ThemeSelect.astro",
        TwoColumnContent: "./src/components/TwoColumnContent.astro",
      },
      // Code as hypha.pub sets it: a panel on a rule, no shadow.
      expressiveCode: {
        themes: [codeTheme],
        useStarlightUiThemeColors: false,
        styleOverrides: {
          borderRadius: "var(--radius-panel)",
          borderColor: "var(--rule)",
          codeBackground: "var(--panel)",
          codeFontFamily: "var(--font-mono)",
          codeFontSize: "0.875rem",
          codeLineHeight: "1.65",
          uiFontFamily: "var(--font-sans)",
          frames: {
            shadowColor: "transparent",
            editorTabBarBackground: "var(--panel)",
            editorActiveTabBackground: "var(--panel)",
            editorActiveTabIndicatorTopColor: "transparent",
            editorActiveTabIndicatorBottomColor: "var(--paper)",
            editorActiveTabForeground: "var(--graphite)",
            editorTabBarBorderBottomColor: "var(--rule)",
            terminalTitlebarBackground: "var(--panel)",
            terminalTitlebarBorderBottomColor: "var(--rule)",
            terminalBackground: "var(--panel)",
          },
        },
      },
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
