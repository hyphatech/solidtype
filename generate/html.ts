// Writes src/html.mli -- each element's attributes, as OCaml types -- from
// Solid's own JSX types, so an attribute's type is Solid's and is never typed
// by hand, and ppx/html_names.ml, the attributes whose JavaScript name the
// ppx cannot spell back by rule. `make generate` writes them; the test run's
// `--check` fails when a file differs from what Solid's types give.

import ts from "typescript";
import { readFileSync, writeFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { keywords, record, table } from "./names.ts";

const root = fileURLToPath(new URL("../", import.meta.url));
const jsx = `${root}node_modules/solid-js/types/jsx.d.ts`;
const out = `${root}src/html.mli`;
const namesOut = `${root}ppx/html_names.ml`;
const solid = JSON.parse(readFileSync(`${root}node_modules/solid-js/package.json`, "utf8")).version as string;

// The types Melange's Dom module has, which an event or an element maps to,
// read from the switch the build uses: `make generate` runs this inside it.
const prefix = process.env.OPAM_SWITCH_PREFIX;
if (!prefix) throw new Error("run through opam exec, or make generate, so Melange's Dom is found");
const domTypes = new Set(
  readFileSync(`${prefix}/lib/melange/dom/melange/dom.ml`, "utf8")
    .match(/^type [a-zA-Z_]+/gm)
    ?.map((t) => t.slice(5)) ?? [],
);

const program = ts.createProgram([jsx], { strict: true, skipLibCheck: true, noEmit: true });
const checker = program.getTypeChecker();
const source = program.getSourceFile(jsx);
if (!source) throw new Error(`no ${jsx}`);

function namespace(node: ts.Node): ts.ModuleDeclaration | undefined {
  let found: ts.ModuleDeclaration | undefined;
  node.forEachChild((n) => {
    if (ts.isModuleDeclaration(n) && n.name.getText() === "JSX") found = n;
  });
  return found;
}
const ns = namespace(source);
if (!ns?.body || !ts.isModuleBlock(ns.body)) throw new Error("no JSX namespace");
const interfaces = new Map<string, ts.InterfaceDeclaration>();
for (const s of ns.body.statements) if (ts.isInterfaceDeclaration(s)) interfaces.set(s.name.text, s);

// Each attribute's name as a user writes it, with its JavaScript name.
const names = new Map<string, string>();

// An attribute's OCaml name, by the one spelling rule. A handler Solid also
// takes in lower case, onclick beside onClick, is the same handler, so it
// has the one name, on_click.
function label(name: string): string | null {
  if (!/^[a-z][A-Za-z0-9-]*$/.test(name)) return null;
  if (/^on[a-z]/.test(name)) return null;
  return record(names, name);
}

const eventUnions = new Set([
  "EventHandlerUnion", "InputEventHandlerUnion", "FocusEventHandlerUnion",
  "ChangeEventHandlerUnion", "EventHandlerWithOptionsUnion",
]);

function domType(tsName: string, fallback: string): string {
  const name = tsName.replace(/^HTML/, "html").replace(/^SVG/, "svg").replace(/^UI/, "ui");
  const lower = name.charAt(0).toLowerCase() + name.slice(1);
  return domTypes.has(lower) ? `Dom.${lower}` : fallback;
}

const unmapped = new Map<string, string>();

// A tag is written as its name, so the literal must be one OCaml can name.
function literalTag(v: string): boolean {
  return /^[A-Za-z][A-Za-z0-9_']*$/.test(v) && !keywords.has(v);
}

// What an attribute holds, from Solid's declared type: the rules the PRD
// states, and null for a type none of them covers.
function ocamlType(name: string, node: ts.TypeNode | undefined): string | null {
  if (!node) return null;
  if (name === "ref") return "element -> unit";
  if (name === "classList") return "bool Js.Dict.t";
  if (name === "style") return "string";
  const parts = ts.isUnionTypeNode(node) ? node.types : [node];
  for (const p of parts) {
    if (ts.isTypeReferenceNode(p) && eventUnions.has(p.typeName.getText())) {
      const event = p.typeArguments?.[1]?.getText() ?? "Event";
      return `${domType(event, "Dom.event")} -> unit`;
    }
  }
  const type = checker.getTypeFromTypeNode(node);
  const members = (type.isUnion() ? type.types : [type]).filter(
    (t) => !(t.flags & (ts.TypeFlags.Undefined | ts.TypeFlags.Null)),
  );
  const flags = members.map((t) => t.flags);
  const has = (f: ts.TypeFlags) => flags.some((x) => (x & f) !== 0);
  const only = (f: ts.TypeFlags) => flags.every((x) => (x & f) !== 0);
  if (members.length === 0 || has(ts.TypeFlags.Any | ts.TypeFlags.Never)) return null;
  // Any string: a plain one, a template, or literals widened by
  // [string & {}], which TypeScript writes to keep them in its completions.
  const open = (t: ts.Type) =>
    (t.flags & (ts.TypeFlags.String | ts.TypeFlags.TemplateLiteral | ts.TypeFlags.StringMapping)) !== 0 ||
    (t.isIntersection() && t.types.some(open));
  if (members.some(open)) return "string";
  if (only(ts.TypeFlags.BooleanLike)) return "bool";
  const strings = members.filter((t) => t.isStringLiteral()).map((t) => (t as ts.StringLiteralType).value);
  const booleans = members.filter((t) => t.flags & ts.TypeFlags.BooleanLike);
  if (booleans.length > 0 && strings.length + booleans.length === members.length) {
    // A boolean among other words is any of those words.
    return strings.every((s) => s === "true" || s === "false") ? "bool" : "string";
  }
  // Solid writes a boolean attribute as the text "true" or "false".
  if (strings.length === members.length && strings.every((s) => s === "true" || s === "false")) return "bool";
  if (strings.length === members.length) {
    return strings.every(literalTag) ? `[ ${strings.map((s) => `\`${s}`).join(" | ")} ]` : "string";
  }
  if (only(ts.TypeFlags.NumberLike)) return "int";
  if (has(ts.TypeFlags.Number) && members.every((t) => t.flags & (ts.TypeFlags.NumberLike | ts.TypeFlags.StringLike))) return "string";
  return null;
}

type Members = Map<string, string>;

// An interface's members, its bases' included, with the element type T left
// as [element].
function membersOf(name: string, seen = new Set<string>()): Members {
  const decl = interfaces.get(name);
  const members: Members = new Map();
  if (!decl || seen.has(name)) return members;
  seen.add(name);
  for (const clause of decl.heritageClauses ?? []) {
    for (const base of clause.types) {
      for (const [k, v] of membersOf(base.expression.getText(), seen)) members.set(k, v);
    }
  }
  for (const m of decl.members) {
    if (!ts.isPropertySignature(m) || !m.name) continue;
    const raw = m.name.getText().replace(/^["']|["']$/g, "");
    if (raw === "children" || raw.startsWith("$")) continue;
    const l = label(raw);
    if (!l) continue;
    const t = ocamlType(raw, m.type);
    if (t) members.set(l, t);
    else unmapped.set(`${name}.${raw}`, m.type?.getText() ?? "?");
  }
  return members;
}

// Each element: its tag, the interface of its attributes, and its DOM type.
const elements: { tag: string; attributes: string; element: string }[] = [];
for (const tags of ["HTMLElementTags", "HTMLElementDeprecatedTags", "SVGElementTags"]) {
  const decl = interfaces.get(tags);
  if (!decl) throw new Error(`no ${tags}`);
  for (const m of decl.members) {
    if (!ts.isPropertySignature(m) || !m.type || !ts.isTypeReferenceNode(m.type)) continue;
    const tag = m.name.getText();
    if (!/^[a-z][A-Za-z0-9]*$/.test(tag) || elements.some((e) => e.tag === tag)) continue;
    const element = m.type.typeArguments?.[0]?.getText() ?? "Element";
    elements.push({ tag, attributes: m.type.typeName.getText(), element: domType(element, "Dom.element") });
  }
}

const common = membersOf("DOMAttributes");
const sharesCommon = (ms: Members) => [...common].every(([k, v]) => ms.get(k) === v);

// Each signature also gives ['r check], every attribute as an optional
// argument before ['r]: the tail of a component's props check, for a
// component that passes them to this element, as Kobalte's parts do.
function signature(ms: Members, include: boolean, root = false): string {
  const lines = include ? ["  include Dom_attributes"] : ["  type element"];
  const sorted = [...ms].sort(([a], [b]) => (a < b ? -1 : a > b ? 1 : 0));
  const own = sorted.filter(([k]) => !(include && common.has(k)));
  for (const [k, v] of own) lines.push(`  type ${k} = ${v}`);
  const argument = ([k, v]: [string, string]) => (v.includes("->") ? `?${k}:${k}` : `?${k}:${k} Check.value`);
  const tail = include ? "'r dom_check" : "'r";
  const name = root ? "dom_check" : "check";
  lines.push(`  type 'r ${name} =\n${own.map((m) => `    ${argument(m)} ->`).join("\n")}\n    ${tail}`);
  return lines.join("\n");
}

const used = [...new Set(elements.map((e) => e.attributes))].sort();
const moduleType = (name: string) => name.replace(/HTMLAttributes$|SVGAttributes$/, (s) => s);

let text = `(** Each element's attributes, as their types: [Html.Div.class_] is
    [string]. Generated from the JSX types of solid-js ${solid} by
    [generate/html.ts]; never edited by hand.

    An attribute is named as Solid's JSX names it, by one rule: a capital is
    an underscore and the lower case, [read_only], a hyphen an underscore,
    [aria_label], and an OCaml keyword takes a trailing underscore,
    [class_]. *)

module type Dom_attributes = sig
${signature(common, false, true)}
end
`;
for (const name of used) {
  const ms = membersOf(name);
  text += `\nmodule type ${moduleType(name)} = sig\n${signature(ms, sharesCommon(ms))}\nend\n`;
}
for (const e of elements) {
  const module = e.tag.charAt(0).toUpperCase() + e.tag.slice(1);
  text += `\nmodule ${module} : ${moduleType(e.attributes)} with type element = ${e.element}\n`;
}

if (unmapped.size > 0 && process.argv.includes("--unmapped")) {
  for (const [k, v] of unmapped) console.error(`${k}: ${v}`);
}

const namesText = table(names, "generate/html.ts");
if (process.argv.includes("--check")) {
  for (const [file, want] of [[out, text], [namesOut, namesText]] as const) {
    if (readFileSync(file, "utf8") !== want) {
      console.error(`${file} is not what Solid's types give: run make generate`);
      process.exit(1);
    }
  }
} else {
  writeFileSync(out, text);
  writeFileSync(namesOut, namesText);
}
