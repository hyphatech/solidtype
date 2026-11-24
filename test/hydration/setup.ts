// The island, a chart, and a HeroUI Select, TimeField, DateField and
// CheckboxGroup, and a virtualized Table and List_view,
// rendered on the server, through Vite's server-side loading, so the same
// plugin and Solid's compiler for the server make the HTML, handed to each
// test as "html", "chart", "select", "timeField", "dateField",
// "checkboxGroup", "theme", "table" and "listView".
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
  project.provide("dateField", rendered.date_field());
  project.provide("checkboxGroup", rendered.checkbox_group());
  project.provide("theme", rendered.theme());
  project.provide("table", rendered.table());
  project.provide("listView", rendered.list_view());
}

declare module "vitest" {
  export interface ProvidedContext {
    html: string;
    script: string;
    chart: string;
    select: string;
    timeField: string;
    dateField: string;
    checkboxGroup: string;
    theme: string;
    table: string;
    listView: string;
  }
}
