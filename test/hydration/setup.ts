// The island, a chart, and a HeroUI Select, TimeField and CheckboxGroup,
// rendered on the server, through Vite's server-side loading, so the same
// plugin and Solid's compiler for the server make the HTML, handed to each
// test as "html", "chart", "select", "timeField" and "checkboxGroup".
import type { TestProject } from "vitest/node";

export default async function setup(project: TestProject) {
  const rendered = await project.vite.ssrLoadModule(
    "/_build/default/test/hydration/out/test/hydration/rendered.jsx",
  );
  project.provide("html", rendered.html());
  project.provide("script", rendered.script());
  project.provide("chart", rendered.chart());
  project.provide("select", rendered.select());
  project.provide("timeField", rendered.time_field());
  project.provide("checkboxGroup", rendered.checkbox_group());
}

declare module "vitest" {
  export interface ProvidedContext {
    html: string;
    script: string;
    chart: string;
    select: string;
    timeField: string;
    checkboxGroup: string;
  }
}
