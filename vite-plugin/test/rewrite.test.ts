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

test("a namespaced attribute is JSX's namespaced name", async () => {
  const code = await written(`
function make() {
  return Markers.el("div", [Markers.s("on:scroll", f), Markers.s("aria-label", "x")], []);
}`);
  expect(code).toContain("on:scroll={f}");
  expect(code).toContain('aria-label="x"');
});
