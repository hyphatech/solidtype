import ts from "typescript";
import { readFileSync } from "node:fs";
import { domType, isString, isTag } from "./melange.ts";
import { record } from "./names.ts";
import { byTag } from "./ocaml.ts";
import { root } from "./package.ts";
import { browser } from "./program.ts";

export type Members = Map<string, string>;

export type SolidHtml = {
  version: string;
  elements: { tag: string; attributes: string; element: string }[];
  membersOf: (name: string) => Members;
  common: Members;
  // Each attribute's name as a user writes it, with its JavaScript name.
  names: Map<string, string>;
  unmapped: Map<string, string>;
  modules: Set<string>;
  attributeNames: Set<string>;
};

let read: SolidHtml | undefined;

export function solidHtml(): SolidHtml {
  read ??= readSolidHtml();
  return read;
}

function readSolidHtml(): SolidHtml {
const jsx = `${root}node_modules/solid-js/types/jsx.d.ts`;
const version = JSON.parse(readFileSync(`${root}node_modules/solid-js/package.json`, "utf8")).version as string;
const program = ts.createProgram([jsx], browser);
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

const unmapped = new Map<string, string>();

// What an attribute holds, from Solid's declared type, by AGENTS.md's "An
// attribute's type is generated from Solid's JSX types", and null for a
// type none of its mappings covers.
function ocamlType(name: string, node: ts.TypeNode | undefined): string | null {
  if (!node) return null;
  if (name === "ref") return "element -> unit";
  if (name === "classList") return "bool Js.Dict.t";
  if (name === "style") return "string";
  const parts = ts.isUnionTypeNode(node) ? node.types : [node];
  for (const p of parts) {
    if (ts.isTypeReferenceNode(p) && eventUnions.has(p.typeName.getText())) {
      const event = p.typeArguments?.[1]?.getText() ?? "Event";
      return `${domType(event) ?? "Dom.event"} -> unit`;
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
  if (members.some(isString)) return "string";
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
    return strings.every(isTag) ? `[ ${byTag(strings, strings.map((s) => `\`${s}`)).join(" | ")} ]` : "string";
  }
  if (only(ts.TypeFlags.NumberLike)) return "int";
  if (has(ts.TypeFlags.Number) && members.every((t) => t.flags & (ts.TypeFlags.NumberLike | ts.TypeFlags.StringLike))) return "string";
  return null;
}

// The string literals a type node lists, "a" | "b".
function literals(node: ts.TypeNode): string[] {
  const parts = ts.isUnionTypeNode(node) ? node.types : [node];
  return parts.flatMap((p) => (ts.isLiteralTypeNode(p) && ts.isStringLiteral(p.literal) ? [p.literal.text] : []));
}

// An interface's members, its bases' included, with the element type T left
// as [element].
function membersOf(name: string, seen = new Set<string>()): Members {
  const decl = interfaces.get(name);
  const members: Members = new Map();
  if (!decl || seen.has(name)) return members;
  seen.add(name);
  for (const clause of decl.heritageClauses ?? []) {
    for (const base of clause.types) {
      const target = base.expression.getText();
      // Pick<X, "a" | "b"> is the members of X it names, and Omit<X, ...> the
      // rest: an SVG shape takes its fill and stroke so. X is read again,
      // whoever else has, since each takes its own few.
      if (target === "Pick" || target === "Omit") {
        const [from, keys] = base.typeArguments ?? [];
        if (!from || !keys || !ts.isTypeReferenceNode(from)) continue;
        const listed = new Set(literals(keys).map(label));
        for (const [k, v] of membersOf(from.typeName.getText(), new Set(seen))) {
          if (listed.has(k) === (target === "Pick")) members.set(k, v);
        }
        continue;
      }
      for (const [k, v] of membersOf(target, seen)) members.set(k, v);
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
    elements.push({ tag, attributes: m.type.typeName.getText(), element: domType(element) ?? "Dom.element" });
  }
}

const common = membersOf("DOMAttributes");
const module = (tag: string) => tag.charAt(0).toUpperCase() + tag.slice(1);
return {
  version,
  elements,
  membersOf: (name) => membersOf(name),
  common,
  names,
  unmapped,
  // Element is the module of a tag known only as the page runs.
  modules: new Set([...elements.map((e) => module(e.tag)), "Element"]),
  get attributeNames() {
    const all = new Set<string>(common.keys());
    for (const attributes of new Set(elements.map((e) => e.attributes))) for (const k of membersOf(attributes).keys()) all.add(k);
    return all;
  },
};
}
