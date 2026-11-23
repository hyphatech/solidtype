// Writes rhp/solidtype_rhp.ml and rhp/types.ml -- rhp's components, its
// functions and the types they name -- from @bezda/rhp's own declarations,
// and ppx/rhp_names.ml, the props whose JavaScript name the ppx cannot spell
// back by rule. What any library of Solid components shares is
// generate/binding.ts's; this file says what is rhp's.
//
// rhp's binding is generated where a rule maps a declaration whole, and
// ported by hand where none does: each type and export below is a module of
// rhp/, written and tested by hand, which the generated half names and never
// binds. Anything else the generator cannot bind whole fails the run, so no
// part is bound by halves. `make generate` writes the files; `make lint`'s
// `--check` fails when one differs from what rhp's types give.

import ts from "typescript";
import { existsSync, readFileSync } from "node:fs";
import { reading } from "./generator.ts";
import { label } from "./names.ts";
import { apply, name as tname, type Item, type Type } from "./ocaml.ts";
import { refuse } from "./output.ts";
import { byName, root } from "./package.ts";

const by = "generate/rhp.ts";
const { dir, version: rhp, checker, exportsOf, bind } = reading({
  package: "@bezda/rhp",
  entries: (dir) => [`${dir}/dist/index.d.ts`],
  jsx: true,
});
const exports = exportsOf(`${dir}/dist/index.d.ts`);

const declaredIn = (symbol: ts.Symbol, pattern: RegExp) =>
  (symbol.declarations ?? []).some((d) => pattern.test(d.getSourceFile().fileName));
const ofRhp = (symbol: ts.Symbol) => declaredIn(symbol, /@bezda\/rhp\/dist\//);
const ofSolid = (symbol: ts.Symbol) => declaredIn(symbol, /solid-js\//);

const float = tname("float");

// rhp's types ported by hand, each the type of its module in rhp/, whose
// .mli says why no rule maps it.
const portedTypes: Record<string, (args: Type[], absent: boolean) => Type> = {
  Color: () => tname("Color.t"),
  Ticks: () => tname("Ticks.t"),
  Ease: () => tname("Ease.t"),
  Shape: () => tname("Shape.t"),
  Row: (args) => apply("Row.t", ...args),
  // A missing value is an optional prop left out, or else None, which
  // Melange writes as undefined, rhp's missing value.
  Value: (_, absent) => (absent ? float : apply("option", float)),
  Point: () => apply("option", { kind: "tuple", items: [apply("option", float), apply("option", float)] }),
  // A ref is the function Solid calls with the element, as an element's is.
  Ref: (args) => ({ kind: "arrow", params: [{ type: args[0] ?? tname("Dom.element") }], result: tname("unit") }),
};

// rhp's exports ported by hand: a component of a typed row, Plot, Scale and
// ManyDots; a function of overloads or of a slat, slat, shape, restyle,
// stackUp, shares and running; and what reads rows or makes a data group,
// sortBy, series and cycle.
const portedExports = new Set([
  "Plot", "Scale", "ManyDots", "slat", "shape", "restyle", "stackUp", "shares", "running", "sortBy", "series", "cycle",
]);

// The hand modules, re-exported beside the generated ones; Helpers, rhp's
// functions of rows and their values, is included, as rhp exports them.
const handModules = ["Animate", "Color", "Ease", "Many_dots", "Order", "Plot", "Row", "Scale", "Shape", "Slat", "Ticks"];
const included = "Helpers";

const { doc, functionBinding, part, real, valueBinding, write } = bind({
  name: "rhp",
  throwsUndocumented: () => false,
  // Solid's CSSProperties alone is a style rhp spreads into its own, an
  // object of declarations; beside a string, the core's rule makes it one.
  ported: (symbol, args, absent) =>
    symbol.name === "CSSProperties" && ofSolid(symbol)
      ? apply("Js.Dict.t", tname("string"))
      : ofRhp(symbol)
        ? portedTypes[symbol.name]?.(args, absent)
        : undefined,
});

// The element of a DOM interface rhp's attributes name.
const elements: Record<string, string> = { HTMLDivElement: "div", SVGSVGElement: "svg" };
// A component whose attributes are JSX.HTMLAttributes<HTMLElement>, which
// names no element, by the element its declaration says it renders: "Any
// other prop or attribute goes on its <figure>".
const renders: Record<string, string> = { Poster: "figure" };

// The element a props type passes its attributes on to, from its
// declaration: the attributes of JSX it extends, under an Omit or not.
function elementOf(node: ts.Node): string | null {
  if (ts.isIntersectionTypeNode(node)) {
    for (const t of node.types) {
      const e = elementOf(t);
      if (e) return e;
    }
    return null;
  }
  const isRef = ts.isTypeReferenceNode(node) || ts.isExpressionWithTypeArguments(node);
  if (!isRef) return null;
  const name = ts.isTypeReferenceNode(node) ? node.typeName : node.expression;
  const args = node.typeArguments ?? [];
  const text = name.getText();
  if (text === "Omit" && args[0]) return elementOf(args[0]);
  if (/Attributes$/.test(text)) return args[0] ? (elements[args[0].getText()] ?? null) : null;
  const symbol = checker.getSymbolAtLocation(ts.isTypeReferenceNode(node) ? node.typeName : node.expression);
  for (const d of (symbol && real(symbol).declarations) ?? []) {
    if (ts.isTypeAliasDeclaration(d)) return elementOf(d.type);
    if (ts.isInterfaceDeclaration(d)) {
      for (const clause of d.heritageClauses ?? []) {
        for (const t of clause.types) {
          const e = elementOf(t);
          if (e) return e;
        }
      }
    }
  }
  return null;
}

// A component with a page of its own names it in its comment, the page's
// path as the solidtype package installs it, so an agent reading the
// signature is sent to how the component is used. Indented as a module's
// comment is, which top() takes back to the file's margin.
function pageDoc(comment: string | undefined, name: string): string | undefined {
  const page = `rhp/${name.replace(/([a-z])([A-Z])/g, "$1-$2").toLowerCase()}`;
  if (!existsSync(`${root}docs/src/content/docs/${page}.mdx`)) return comment;
  const line = `Its page, with its examples: [$(opam var solidtype:doc)/pages/${page}.md].`;
  return comment === undefined ? line : `${comment}\n\n${line}`;
}

const items: Item[] = [];
for (const sym of byName(exports)) {
  if (portedExports.has(sym.name)) continue;
  const r = real(sym);
  const type = checker.getTypeOfSymbol(r);
  const signature = type.getCallSignatures()[0];
  const decl = signature?.getDeclaration();
  if (/^[A-Z][a-z]/.test(sym.name) && signature && decl && signature.getParameters().length === 1) {
    // A component: its props are its one parameter's.
    const param = decl.parameters[0];
    const props = checker.getTypeOfSymbol(signature.getParameters()[0]!);
    const element = renders[sym.name] ?? (param?.type ? elementOf(param.type) : null);
    const own = checker.getPropertiesOfType(props).filter(ofRhp);
    items.push({ kind: "module", name: sym.name, doc: pageDoc(doc(r), sym.name), items: part("@bezda/rhp", sym.name, decl, null, [], sym.name, { element, own }) });
  } else if (r.flags & ts.SymbolFlags.Function) {
    items.push(...functionBinding(r, sym.name, "@bezda/rhp", sym.name));
  } else if (r.flags & ts.SymbolFlags.Variable && signature === undefined) {
    items.push(...valueBinding(r, sym.name, "@bezda/rhp", sym.name));
  }
}

// What a hand port is held to: each prop, setting, field or key rhp declares
// for it is bound in its .mli, or named here as left out, with the reason,
// so one rhp adds fails the run as a type no rule maps does, rather than
// going unbound with nothing said.
type Held = { port: string; declared: string; leftOut?: Record<string, string> };
const held: Held[] = [
  { port: "plot", declared: "PlotSettings", leftOut: { children: "the slat, given as render=f or a function child" } },
  { port: "slat", declared: "SlatLayout" },
  { port: "scale", declared: "ScaleProps", leftOut: { children: "the tick's slat, given as render=f or a function child" } },
  { port: "scale", declared: "ScaleTick" },
  { port: "many_dots", declared: "ManyDotsProps" },
  { port: "color", declared: "Color" },
];

// The names an interface binds: its labels, ?name: and name:, and its
// records' fields, as a user writes them.
function boundIn(mli: string): Set<string> {
  const text = readFileSync(mli, "utf8");
  return new Set([
    ...[...text.matchAll(/[?~]([a-z_][a-z0-9_']*):/g)].map((m) => m[1]!),
    ...[...text.matchAll(/^\s+([a-z_][a-z0-9_']*)\s?:/gm)].map((m) => m[1]!),
    ...[...text.matchAll(/^val ([a-z_][a-z0-9_']*) :/gm)].map((m) => m[1]!),
  ]);
}

// What rhp declares for a port: an object type's own members, or a union's
// keys, a template's head the key of its family, series-${number}'s series.
function declaredNames(name: string): string[] {
  const symbol = exports.find((s) => s.name === name);
  if (!symbol) throw new Error(`rhp declares no ${name}`);
  const type = checker.getDeclaredTypeOfSymbol(real(symbol));
  if (type.isUnion()) {
    return type.types.flatMap((t) =>
      t.isStringLiteral() ? [t.value] : t.flags & ts.TypeFlags.TemplateLiteral ? [(t as ts.TemplateLiteralType).texts[0]!.replace(/-$/, "")] : [],
    );
  }
  return checker.getPropertiesOfType(type).filter(ofRhp).map((p) => p.name);
}

const drift: string[] = [];
const exported = new Set(exports.map((s) => s.name));
for (const name of portedExports) if (!exported.has(name)) drift.push(`${name}: ported by hand, but rhp no longer exports it`);
for (const { port, declared, leftOut = {} } of held) {
  const mli = `${root}rhp/${port}.mli`;
  if (!existsSync(mli)) {
    drift.push(`${declared}: ported by rhp/${port}.mli, which is not there`);
    continue;
  }
  const bound = boundIn(mli);
  const declaredHere = declaredNames(declared);
  for (const name of Object.keys(leftOut)) {
    if (!declaredHere.includes(name)) drift.push(`${declared}.${name}: named as left out, but rhp no longer declares it`);
  }
  for (const name of declaredHere) {
    if (!(name in leftOut) && !bound.has(label(name))) drift.push(`${declared}.${name}: rhp declares it, and rhp/${port}.mli neither binds it nor is said to leave it out`);
  }
}

// Whole or failing: a declaration no rule maps and nothing ports by hand,
// and a hand port behind what rhp declares.
refuse(drift, "rhp's hand ports above are not what its declarations give: bind each, or name it as left out in generate/rhp.ts");

write({
  module: "rhp/solidtype_rhp",
  names: "ppx/rhp_names.ml",
  by,
  whose: "rhp's",
  otherwise: "port it by hand, in rhp/",
  header: `(* rhp's components and functions, and the types they name, in Types.
   Generated from the declarations of @bezda/rhp ${rhp} by ${by};
   never edited by hand.

   A component's props check takes its own props, then its children, then
   the attributes of the element it passes them on to. Each check is
   external, since the compiler checks it and Melange writes none of it.
   What no rule maps is ported by hand, a module each, re-exported here. *)`,
  typesHeader: `(* The types rhp's components and functions name, each a module.
   Generated from the declarations of @bezda/rhp ${rhp} by ${by};
   never edited by hand. *)`,
  items: [
    ...handModules.map((m): Item => ({ kind: "alias", name: m, of: m })),
    // The interface strengthened, so the included module's types are its own.
    { kind: "include", ml: `include ${included}`, mli: `include module type of struct include ${included} end` },
    ...items,
  ],
});
