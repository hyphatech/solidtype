// The island, and a chart, rendered on the server, through Vite's
// server-side loading, so the same plugin and Solid's compiler for the server
// make the HTML, handed to each test as "html" and "chart".
import type { TestProject } from "vitest/node";

export default async function setup(project: TestProject) {
  const rendered = await project.vite.ssrLoadModule(
    "/_build/default/test/hydration/out/test/hydration/rendered.jsx",
  );
  project.provide("html", rendered.html());
  project.provide("script", rendered.script());
  project.provide("chart", rendered.chart());
}

declare module "vitest" {
  export interface ProvidedContext {
    html: string;
    script: string;
    chart: string;
  }
}
