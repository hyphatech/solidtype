// AGENTS.md's "An island compiles as its TSX twin does": an OCaml component
// reaches the browser as the code Solid's own compiler emits for the same
// JSX. Each example island, compiled by Melange and rewritten, goes through
// babel-preset-solid beside its TSX twin, and
// the two must agree once names are set aside -- the three ways Astro's
// integration runs the compiler: for the browser, for the browser with
// hydration, and for the server. A prerendered island hydrates because the
// last two agree with the twin's.

import { expect, test } from "bun:test";
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { transformAsync } from "@babel/core";
import { rewrite } from "../src/rewrite.ts";

const root = fileURLToPath(new URL("../../", import.meta.url));
// An island and its twin: the example's, or one of rhp's charts, a page's
// island of the documentation beside the same chart in rhp's own JSX.
const sources = {
  example: {
    melange: (name: string) => `${root}_build/default/example/out/example/src/${name}.jsx`,
    twin: (name: string) => `${root}example/twin/${name}.tsx`,
  },
  rhp: {
    melange: (name: string) => `${root}_build/default/docs/islands/out/docs/islands/${name}.jsx`,
    twin: (name: string) => `${root}test/rhp/twins/${name}.tsx`,
  },
} as const;

export const modes = {
  dom: { generate: "dom" },
  hydratable: { generate: "dom", hydratable: true },
  ssr: { generate: "ssr", hydratable: true },
} as const;

type Mode = keyof typeof modes;

async function solid(code: string, filename: string, mode: Mode): Promise<string> {
  const presets: [string, object][] = [["babel-preset-solid", modes[mode]]];
  if (filename.endsWith(".tsx")) presets.push(["@babel/preset-typescript", {}]);
  const result = await transformAsync(code, { filename, cwd: root, babelrc: false, configFile: false, presets });
  if (!result?.code) throw new Error(`Solid's compiler wrote nothing for ${filename}`);
  return result.code;
}

// What Solid's compiler made, with names set aside: each template -- a
// string for the browser, an array of fragments for the server -- and each
// runtime call in order, by the helper it calls.
function shape(code: string) {
  const templates = [
    ...[...code.matchAll(/_\$template\(`([^`]*)`/g)].map((m) => m[1]),
    ...[...code.matchAll(/_tmpl\$\d* = (\[[\s\S]*?\]);/g)].map((m) => m[1]),
  ];
  const calls = [...code.matchAll(/_\$(\w+)\(/g)].map((m) => m[1]).filter((c) => c !== "template");
  return { templates, calls };
}

export async function compiled(ml: string, tsx: string, mode: Mode = "dom", from: keyof typeof sources = "example") {
  const { melange, twin } = sources[from];
  const rewritten = await rewrite(readFileSync(melange(ml), "utf8"), `${ml}.jsx`);
  if (!rewritten) throw new Error(`the plugin rewrote nothing in ${ml}`);
  return {
    ocaml: await solid(rewritten.code, `${ml}.jsx`, mode),
    tsx: await solid(readFileSync(twin(tsx), "utf8"), `${tsx}.tsx`, mode),
  };
}

const islands = [
  ["example", "app", "App"],
  ["example", "card", "Card"],
  ["example", "add_task", "AddTask"],
  ["rhp", "rhp_bar_chart", "BarChart"],
  ["rhp", "rhp_chart_vertical", "ChartVertical"],
  ["rhp", "rhp_chart_ticks", "ChartTicks"],
  ["rhp", "rhp_plot_live", "PlotLive"],
  ["rhp", "rhp_slat_layout", "SlatLayout"],
  ["rhp", "rhp_bar_range", "BarRange"],
  ["rhp", "rhp_label_edges", "LabelEdges"],
  ["rhp", "rhp_dot_dumbbell", "DotDumbbell"],
  ["rhp", "rhp_tick_bullet", "TickBullet"],
  ["rhp", "rhp_cell_strip", "CellStrip"],
  ["rhp", "rhp_place_badges", "PlaceBadges"],
  ["rhp", "rhp_line_sparklines", "LineSparklines"],
  ["rhp", "rhp_area_violin", "AreaViolin"],
  ["rhp", "rhp_scale_axis", "ScaleAxis"],
  ["rhp", "rhp_many_dots", "ManyDots"],
  ["rhp", "rhp_poster", "Poster"],
  ["rhp", "rhp_theme", "Theme"],
  ["rhp", "rhp_stacked_bars", "StackedBars"],
  ["rhp", "rhp_waterfall", "Waterfall"],
  ["rhp", "rhp_histogram", "Histogram"],
  ["rhp", "rhp_box_plot", "BoxPlot"],
  ["rhp", "rhp_plot_sorted", "PlotSorted"],
  ["rhp", "rhp_plot_scatter", "PlotScatter"],
  ["rhp", "rhp_grouped_bars", "GroupedBars"],
  ["rhp", "rhp_waterfall_budget", "WaterfallBudget"],
  ["rhp", "rhp_pie", "Pie"],
  ["rhp", "rhp_heatmap", "Heatmap"],
  ["rhp", "rhp_gantt", "Gantt"],
  ["rhp", "rhp_candlestick", "Candlestick"],
] as const;

for (const [from, ml, tsx] of islands) {
  for (const mode of Object.keys(modes) as Mode[]) {
    test(`${ml}.mlx compiles as ${tsx}.tsx does, ${mode}`, async () => {
      const { ocaml, tsx: expected } = await compiled(ml, tsx, mode, from);
      if (process.env.SHOW) console.log(`--- ${ml}.mlx, ${mode}\n${ocaml}\n--- ${tsx}.tsx, ${mode}\n${expected}`);
      expect(shape(ocaml)).toEqual(shape(expected));
    });
  }
}
