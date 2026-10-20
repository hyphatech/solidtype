// What the plugin writes for a marker form, read from Melange's shape of it.

import { expect, test } from "bun:test";
import { rewrite } from "../src/rewrite.ts";

const header = `import * as Markers from "vite-plugin-solidtype/markers";\n`;

async function written(body: string): Promise<string> {
  const result = await rewrite(header + body, "case.jsx");
  if (!result) throw new Error("the plugin rewrote nothing");
  return result.code;
}

test("a thunk bound once, for a component's check, goes back where it is used", async () => {
  const code = await written(`
function make() {
  const solidtype__text = function (param) { return count(); };
  return Markers.c(Label.component, [Markers.d("text", solidtype__text)], []);
}`);
  expect(code).toContain("text={count()}");
  expect(code).not.toContain("solidtype__text");
});

test("a function child bound once goes back as the child", async () => {
  const code = await written(`
function make() {
  const solidtype__children = function (item) { return item; };
  return Markers.c(For.component, [], [solidtype__children]);
}`);
  expect(code).toContain("{function (item)");
  expect(code).not.toContain("solidtype__children");
});

test("a binding used twice stays, and the thunk is called", async () => {
  const code = await written(`
function make() {
  const t = function (param) { return count(); };
  use(t);
  return Markers.c(Label.component, [Markers.d("text", t)], []);
}`);
  expect(code).toContain("const t = function");
  expect(code).toContain("text={t()}");
});

test("a binding that is not a function stays", async () => {
  const code = await written(`
function make() {
  const p = props;
  return Markers.c(Field.component, [Markers.spread(p)], []);
}`);
  expect(code).toContain("{...p}");
});

test("an element given as a prop's value is rewritten too", async () => {
  const code = await written(`
function make() {
  return Markers.c(Show.component, [Markers.s("fallback", Markers.el("p", [], ["wait"]))], []);
}`);
  expect(code).toContain("fallback={<p>wait</p>}");
  expect(code).not.toContain("Markers");
});

test("an element returned from a thunk is rewritten too", async () => {
  const code = await written(`
function make() {
  return Markers.el("div", [], [Markers.dynamic(function (param) {
    if (on()) { return Markers.el("a", [], []); } else { return Markers.el("b", [], []); }
  })]);
}`);
  expect(code).toContain("on() ? <a /> : <b />");
  expect(code).not.toContain("Markers");
});

test("each namespace the ppx writes is JSX's namespaced name", async () => {
  const code = await written(`
function make() {
  return Markers.el("div", [
    Markers.s("on:scroll", f),
    Markers.s("oncapture:click", g),
    Markers.d("prop:value", function (param) { return v(); }),
    Markers.s("attr:title", "t"),
    Markers.d("bool:hidden", function (param) { return closed(); }),
    Markers.s("on:my-event", h),
    Markers.s("aria-label", "x"),
  ], []);
}`);
  expect(code).toContain("on:scroll={f}");
  expect(code).toContain("oncapture:click={g}");
  expect(code).toContain("prop:value={v()}");
  expect(code).toContain('attr:title="t"');
  expect(code).toContain("bool:hidden={closed()}");
  expect(code).toContain("on:my-event={h}");
  expect(code).toContain('aria-label="x"');
});

// A string reaches the page as a TSX author's {"..."} would, whatever it
// holds: what Solid's compiler makes of the plugin's output -- its templates
// and its calls -- is what it makes of that TSX. JSX's own text and quoted
// attributes read entities, collapse whitespace and keep no escapes, so a
// string is either written so that JSX reads it back unchanged, or kept as
// the expression it is.
const strings = [
  "Hello, world",
  "Tom &amp; Jerry",
  'say "hi"',
  "a\\b",
  "né",
  "Rechercher…",
  "a\tb",
  "two  spaces",
  "line\nbreak",
  " padded ",
  "{braces} and <tags>",
];

async function solid(code: string, filename: string): Promise<string> {
  const { transformAsync } = await import("@babel/core");
  const result = await transformAsync(code, {
    filename,
    babelrc: false,
    configFile: false,
    presets: [["babel-preset-solid", { generate: "dom" }]],
  });
  return result?.code ?? "";
}

function templates(code: string): string[] {
  return [...code.matchAll(/_\$template\(`([^`]*)`/g)].map((m) => m[1] ?? "");
}

for (const s of strings) {
  test(`${JSON.stringify(s)} reaches the page as TSX's {"..."} does, as text and as an attribute`, async () => {
    const ocaml = await written(`
function make() {
  return Markers.el("p", [Markers.s("title", ${JSON.stringify(s)})], [${JSON.stringify(s)}]);
}`);
    const tsx = `function make() { return <p title={${JSON.stringify(s)}}>{${JSON.stringify(s)}}</p>; }`;
    const ours = await solid(ocaml, "case.jsx");
    expect(ours.length).toBeGreaterThan(0);
    expect(templates(ours)).toEqual(templates(await solid(tsx, "twin.jsx")));
  });
}

test("a plain string stays JSX's own text and quoted attribute, as a TSX author writes it", async () => {
  const code = await written(`
function make() {
  return Markers.el("p", [Markers.s("title", "Hello")], ["Hello, world"]);
}`);
  expect(code).toContain('<p title="Hello">Hello, world</p>');
});
