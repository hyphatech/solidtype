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
import { readFileSync, realpathSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { bind, doc, functionBinding, names, part, real, typesFiles, unmapped, valueBinding } from "./binding.ts";
import { table } from "./names.ts";
import { apply, name as tname, type Type } from "./ocaml.ts";
import { writeOrCheck } from "./output.ts";
import { Source } from "./source.ts";
import { browser } from "./program.ts";

const root = fileURLToPath(new URL("../", import.meta.url));
const dist = realpathSync(`${root}node_modules/@bezda/rhp/dist`);
const entry = `${dist}/index.d.ts`;
const out = `${root}rhp/solidtype_rhp.ml`;
const typesOut = `${root}rhp/types.ml`;
const namesOut = `${root}ppx/rhp_names.ml`;
const rhp = JSON.parse(readFileSync(`${root}node_modules/@bezda/rhp/package.json`, "utf8")).version as string;

const program = ts.createProgram([entry], {
  ...browser,
  jsx: ts.JsxEmit.Preserve,
  module: ts.ModuleKind.ESNext,
  moduleResolution: ts.ModuleResolutionKind.Bundler,
});
const checker = program.getTypeChecker();

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

// The hand modules, re-exported beside the generated ones.
const handModules = ["Color", "Ease", "Plot", "Row", "Shape", "Slat", "Ticks"];

bind(root, checker, {
  name: "rhp",
  throwsUndocumented: () => false,
  // Solid's CSSProperties is a style, a string, as an element's is.
  ported: (symbol, args, absent) =>
    symbol.name === "CSSProperties" && ofSolid(symbol)
      ? tname("string")
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

const source = program.getSourceFile(entry);
const mod = source && checker.getSymbolAtLocation(source);
if (!mod) throw new Error(`no ${entry}`);

const src = new Source();
for (const sym of [...checker.getExportsOfModule(mod)].sort((a, b) => (a.name < b.name ? -1 : 1))) {
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
    src.both(...doc(r, "  "));
    src.module("  ", sym.name, () => part(src, "@bezda/rhp", sym.name, decl, null, [], sym.name, { element, own }));
    src.both(``);
  } else if (r.flags & ts.SymbolFlags.Function) {
    functionBinding(src, r, sym.name, "@bezda/rhp", sym.name);
  } else if (r.flags & ts.SymbolFlags.Variable && signature === undefined) {
    valueBinding(src, r, sym.name, "@bezda/rhp", sym.name);
  }
}

const { ml: typesText, mli: typesMli } = typesFiles(`(* The types rhp's components and functions name, each a module.
   Generated from the declarations of @bezda/rhp ${rhp} by generate/rhp.ts;
   never edited by hand. *)`);

// Whole or failing: a declaration no rule maps and nothing ports by hand.
if (unmapped.size > 0) {
  for (const [k, v] of unmapped) console.error(`${k}: ${v}`);
  console.error("rhp's declarations above map by no rule: port each by hand, in generate/rhp.ts and rhp/");
  process.exit(1);
}

// Each module is at the top of the file, where the core writes it one deep.
const top = (lines: string[]) => lines.map((l) => l.replace(/^  /gm, ""));

const file = (modules: string[]) => `(* rhp's components and functions, and the types they name, in Types.
   Generated from the declarations of @bezda/rhp ${rhp} by generate/rhp.ts;
   never edited by hand.

   A component's props check takes its own props, then its children, then
   the attributes of the element it passes them on to. Each check is
   external, since the compiler checks it and Melange writes none of it.
   What no rule maps is ported by hand, a module each, re-exported here. *)

module Types = Types
${handModules.map((m) => `module ${m} = ${m}`).join("\n")}

${modules.join("\n")}`;

writeOrCheck(
  [
    [out, file(top(src.ml))],
    [`${out}i`, file(top(src.mli))],
    [typesOut, typesText],
    [`${typesOut}i`, typesMli],
    [namesOut, table(names, "generate/rhp.ts")],
  ],
  "rhp's types",
);
