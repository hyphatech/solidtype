// Writes kobalte/solidtype_kobalte.ml and kobalte/types.ml -- every Kobalte
// component, part by part, its hooks and utilities, and the types they name
// -- from Kobalte's own declarations, so a binding is Kobalte's types and is
// never typed by hand, and ppx/kobalte_names.ml, the props whose JavaScript
// name the ppx cannot spell back by rule. What any library of Solid
// components shares is generate/binding.ts's; this file says what is
// Kobalte's. `make generate` writes them; `make lint`'s `--check` fails when
// a file differs from what Kobalte's types give.

import ts from "typescript";
import { readdirSync, existsSync, readFileSync, realpathSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { bind, doc, functionBinding, names, part, real, typesFiles, unmapped, valueBinding } from "./binding.ts";
import { table } from "./names.ts";
import { writeOrCheck } from "./output.ts";
import { Source } from "./source.ts";
import { browser } from "./program.ts";

const root = fileURLToPath(new URL("../", import.meta.url));
// Kobalte's real path: a package manager that links each package's
// dependencies beside it, as Bun does, is resolved from there.
const dist = realpathSync(`${root}node_modules/@kobalte/core/dist`);
const out = `${root}kobalte/solidtype_kobalte.ml`;
// The types, a file of their own: Melange keeps a function's arity, and so
// calls it directly from another library, one module deep in a file, not two.
const typesOut = `${root}kobalte/types.ml`;
const namesOut = `${root}ppx/kobalte_names.ml`;
const kobalte = JSON.parse(readFileSync(`${root}node_modules/@kobalte/core/package.json`, "utf8")).version as string;

// The building blocks Kobalte's components are made of, which its
// documentation does not offer as components.
const blocks = new Set(["menu", "popper", "dismissable-layer", "polymorphic"]);

const entries = readdirSync(dist)
  .filter((d) => existsSync(`${dist}/${d}/index.d.ts`) && !blocks.has(d))
  .sort();
const program = ts.createProgram(entries.map((d) => `${dist}/${d}/index.d.ts`), {
  ...browser,
  jsx: ts.JsxEmit.Preserve,
  module: ts.ModuleKind.ESNext,
  moduleResolution: ts.ModuleResolutionKind.Bundler,
});
const checker = program.getTypeChecker();

bind(root, checker, {
  name: "Kobalte",
  // toFormat throws converting HSL or HSB to hex without saying so.
  throwsUndocumented: (where) => where === "Color.toFormat",
});

const pascal = (s: string) => s.split("-").map((w) => w.charAt(0).toUpperCase() + w.slice(1)).join("");

// The members of the CommonProps its signature's props are made of, that
// do not depend on the element: those are attributes, which the check's
// tail takes.
function commonProps(decl: ts.SignatureDeclaration): ts.Symbol[] {
  const param = decl.parameters[0]?.type;
  const props = param && ts.isTypeReferenceNode(param) && param.typeArguments?.[1];
  if (!props) return [];
  const found: ts.Symbol[] = [];
  const visit = (t: ts.Type) => {
    for (const part of t.isIntersection() ? t.types : [t]) {
      const name = part.aliasSymbol?.name ?? part.getSymbol()?.name ?? "";
      if (/CommonProps$/.test(name) || (part.aliasSymbol?.name === "Partial" && /CommonProps/.test(checker.typeToString(part)))) {
        for (const p of checker.getPropertiesOfType(part)) {
          if (!/ElementOf|\bT\b/.test(checker.typeToString(checker.getTypeOfSymbol(p)))) found.push(p);
        }
      }
    }
  };
  visit(checker.getTypeFromTypeNode(props));
  return found;
}

// Each entry's module, its lines ending in an empty one, then end.
let body = "";
let bodyMli = "";
for (const entry of entries) {
  const source = program.getSourceFile(`${dist}/${entry}/index.d.ts`);
  const mod = source && checker.getSymbolAtLocation(source);
  if (!mod) continue;
  const exports = checker.getExportsOfModule(mod);
  const byName = new Map(exports.map((s) => [s.name, s]));
  const component = pascal(entry);
  const src = new Source();
  for (const sym of [...exports].sort((a, b) => (a.name < b.name ? -1 : 1))) {
    const r = real(sym);
    const declared = r.declarations?.[0];
    if (!declared) continue;
    // A component is a function, or a const of a function type, as
    // SegmentedControl declares its root.
    const signature =
      ts.isFunctionDeclaration(declared)
        ? declared
        : r.flags & ts.SymbolFlags.Variable && /^[A-Z]/.test(sym.name) && checker.getTypeOfSymbol(r).getProperties().length === 0
          ? checker.getTypeOfSymbol(r).getCallSignatures()[0]?.getDeclaration()
          : undefined;
    const decl = signature ?? declared;
    if (signature && /^[A-Z]/.test(sym.name)) {
      if (sym.name === component) continue;
      const optionsName = `${component}${sym.name}Options`;
      const opt = byName.get(optionsName) ?? byName.get(`${sym.name}Options`) ?? byName.get(`${sym.name}Props`);
      // Without an Options interface, the props its signature gives:
      // PolymorphicProps<T, Props>, SegmentedControl's an alias of
      // RadioGroup's.
      const param = signature.parameters[0]?.type;
      const given = !opt && param && ts.isTypeReferenceNode(param) && /PolymorphicProps$/.test(param.typeName.getText()) && param.typeArguments?.[1]
        ? checker.getTypeFromTypeNode(param.typeArguments[1])
        : null;
      const optType = opt ? checker.getDeclaredTypeOfSymbol(real(opt)) : given;
      // A root whose value type turns on [multiple] is two modules.
      if (optType?.isUnion() && optType.types.some((t) => /Multiple/.test(checker.typeToString(t)))) {
        for (const variant of optType.types) {
          const multiple = /Multiple/.test(checker.typeToString(variant));
          src.both(...doc(r, "  "));
          src.module("  ", `${sym.name}${multiple ? "_multiple" : ""}`, () => part(src, `@kobalte/core/${entry}`, `${entry}.${sym.name}`, signature, variant, commonProps(signature), sym.name));
          src.both(``);
        }
        continue;
      }
      src.both(...doc(r, "  "));
      src.module("  ", sym.name, () => part(src, `@kobalte/core/${entry}`, `${entry}.${sym.name}`, signature, optType, commonProps(signature), sym.name));
      src.both(``);
    } else if ((r.flags & ts.SymbolFlags.Function) && ts.isFunctionDeclaration(decl)) {
      functionBinding(src, r, sym.name, `@kobalte/core/${entry}`, `${entry}.${sym.name}`);
    } else if (r.flags & ts.SymbolFlags.Variable && sym.name !== component && !byName.get(sym.name)?.getDeclarations()?.some(ts.isFunctionDeclaration)) {
      valueBinding(src, r, sym.name, `@kobalte/core/${entry}`, `${entry}.${sym.name}`);
    }
  }
  if (src.ml.length === 0) continue;
  body += `\nmodule ${component} = struct\n${src.ml.join("\n")}end\n`;
  bodyMli += `\nmodule ${component} : sig\n${src.mli.join("\n")}end\n`;
}

const { ml: typesText, mli: typesMli } = typesFiles(`(* The types Kobalte's components and functions name, each a module.
   Generated from the declarations of @kobalte/core ${kobalte} by
   generate/kobalte.ts; never edited by hand. *)`);


const componentsFile = (modules: string) => `(* Every Kobalte component, part by part, its hooks and utilities, and the
   types they name, in Types. Generated from the declarations of
   @kobalte/core ${kobalte} by generate/kobalte.ts; never edited by hand.

   A part's props check takes its own props, then its children, then the
   attributes of the element it renders, which it passes on. Each check is
   external, since the compiler checks it and Melange writes none of it. *)

module Types = Types
${modules}`;
const text = componentsFile(body);
const textMli = componentsFile(bodyMli);

if (process.argv.includes("--unmapped")) for (const [k, v] of unmapped) console.error(`${k}: ${v}`);

writeOrCheck(
  [
    [out, text],
    [`${out}i`, textMli],
    [typesOut, typesText],
    [`${typesOut}i`, typesMli],
    [namesOut, table(names, "generate/kobalte.ts")],
  ],
  "Kobalte's types",
);
