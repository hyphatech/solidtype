// Writes kobalte/solidtype_kobalte.ml and kobalte/types.ml -- every Kobalte
// component, part by part, its hooks and utilities, and the types they name
// -- from Kobalte's own declarations, so a binding is Kobalte's types and is
// never typed by hand, and ppx/kobalte_names.ml, the props whose JavaScript
// name the ppx cannot spell back by rule. What any library of Solid
// components shares is generate/binding.ts's; this file says what is
// Kobalte's. `make generate` writes them; `make lint`'s `--check` fails when
// a file differs from what Kobalte's types give.

import ts from "typescript";
import { readdirSync, existsSync } from "node:fs";
import { reading } from "./generator.ts";
import type { Item } from "./ocaml.ts";
import { byName } from "./package.ts";

const by = "generate/kobalte.ts";
// The building blocks Kobalte's components are made of, which its
// documentation does not offer as components.
const blocks = new Set(["menu", "popper", "dismissable-layer", "polymorphic"]);
const components = (dist: string) =>
  readdirSync(dist)
    .filter((d) => existsSync(`${dist}/${d}/index.d.ts`) && !blocks.has(d))
    .sort();

const { dir, version: kobalte, checker, exportsOf, bind } = reading({
  package: "@kobalte/core",
  entries: (dir) => [...components(`${dir}/dist`).map((d) => `${dir}/dist/${d}/index.d.ts`), `${dir}/dist/index.d.ts`],
  jsx: true,
});
const dist = `${dir}/dist`;
const entries = components(dist);

const anyOption = "an option, the caller's data, which the context types any";
const threeKinds = "takes a number, a bigint or a third kind, and Either holds two";
const readersChoice = "a context's value, of a type its reader would choose";

const { doc, functionBinding, part, real, valueBinding, write } = bind({
  name: "Kobalte",
  // toFormat throws converting HSL or HSB to hex without saying so.
  throwsUndocumented: (where) => where === "Color.toFormat",
  // The props a create function is given, whose any is the caller's data:
  // createListState's dataSource, and the getKey it is read by.
  data: (symbol) => /^Create[A-Za-z]*Props$/.test(symbol.name),
  // Meter and Slider each declare a GetValueLabelParams, of its own fields.
  named: (symbol) => {
    if (symbol.name !== "GetValueLabelParams") return undefined;
    const file = symbol.declarations?.[0]?.getSourceFile().fileName ?? "";
    const component = ["Meter", "Slider"].find((c) => file.includes(`/${c.toLowerCase()}-`));
    if (!component) throw new Error(`GetValueLabelParams of ${file} is neither Meter's nor Slider's`);
    return `${component}_GetValueLabelParams`;
  },
  leftOut: {
    "ComboboxContextValue.selectedOptions": anyOption,
    "ComboboxContextValue.removeOptionFromSelection": anyOption,
    "SelectContextValue.selectedOptions": anyOption,
    "SelectContextValue.removeOptionFromSelection": anyOption,
    "DateTimeFormat.formatRange()": threeKinds,
    "DateTimeFormat.formatRangeToParts()": threeKinds,
    "NumberFormat.formatRange()": threeKinds,
    "NumberFormat.formatRangeToParts()": threeKinds,
    "FlowProps.value": readersChoice,
    "Context_Provider_Props.value": readersChoice,
    "Toast_Toaster.make": "the toaster is Kobalte's to make: one made here would be handed Kobalte's functions, which OCaml calls by their length",
  },
});

// A type as TypeScript writes it, whole: it cuts a long one short unless
// told not to, and what is read of it here may be past the cut.
const whole = (t: ts.Type) => checker.typeToString(t, undefined, ts.TypeFormatFlags.NoTruncation);

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
      if (/CommonProps$/.test(name) || (part.aliasSymbol?.name === "Partial" && /CommonProps/.test(whole(part)))) {
        for (const p of checker.getPropertiesOfType(part)) {
          if (!/ElementOf|\bT\b/.test(whole(checker.getTypeOfSymbol(p)))) found.push(p);
        }
      }
    }
  };
  visit(checker.getTypeFromTypeNode(props));
  return found;
}

const modules: Item[] = [];
for (const entry of entries) {
  const exports = exportsOf(`${dist}/${entry}/index.d.ts`);
  const exported = new Map(exports.map((s) => [s.name, s]));
  const component = pascal(entry);
  const items: Item[] = [];
  for (const sym of byName(exports)) {
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
      const opt = exported.get(optionsName) ?? exported.get(`${sym.name}Options`) ?? exported.get(`${sym.name}Props`);
      // Without an Options interface, the props its signature gives:
      // PolymorphicProps<T, Props>, SegmentedControl's an alias of
      // RadioGroup's.
      const param = signature.parameters[0]?.type;
      const given = !opt && param && ts.isTypeReferenceNode(param) && /PolymorphicProps$/.test(param.typeName.getText()) && param.typeArguments?.[1]
        ? checker.getTypeFromTypeNode(param.typeArguments[1])
        : null;
      const optType = opt ? checker.getDeclaredTypeOfSymbol(real(opt)) : given;
      // A root whose value type turns on [multiple] is two modules.
      if (optType?.isUnion() && optType.types.some((t) => /Multiple/.test(whole(t)))) {
        for (const variant of optType.types) {
          const multiple = /Multiple/.test(whole(variant));
          items.push({
            kind: "module",
            name: `${sym.name}${multiple ? "_multiple" : ""}`,
            doc: doc(r),
            items: part(`@kobalte/core/${entry}`, `${entry}.${sym.name}`, signature, variant, commonProps(signature), sym.name),
          });
        }
        continue;
      }
      items.push({
        kind: "module",
        name: sym.name,
        doc: doc(r),
        items: part(`@kobalte/core/${entry}`, `${entry}.${sym.name}`, signature, optType, commonProps(signature), sym.name),
      });
    } else if ((r.flags & ts.SymbolFlags.Function) && ts.isFunctionDeclaration(decl)) {
      items.push(...functionBinding(r, sym.name, `@kobalte/core/${entry}`, `${entry}.${sym.name}`));
    } else if (r.flags & ts.SymbolFlags.Variable && sym.name !== component && !exported.get(sym.name)?.getDeclarations()?.some(ts.isFunctionDeclaration)) {
      items.push(...valueBinding(r, sym.name, `@kobalte/core/${entry}`, `${entry}.${sym.name}`));
    }
  }
  if (items.length > 0) modules.push({ kind: "module", name: component, items });
}

// The building blocks of Kobalte's lists, from its root, which a component
// Kobalte lacks is made of: a list's state and selection, and the handlers
// that make an element a list of selectable items.
const selectionNames = ["createListState", "createSelectableCollection", "createSelectableItem", "createSelectableList", "createTypeSelect"];
{
  const exports = new Map(exportsOf(`${dist}/index.d.ts`).map((s) => [s.name, s]));
  const items = selectionNames.flatMap((name) => {
    const sym = exports.get(name);
    if (!sym) throw new Error(`@kobalte/core exports no ${name}`);
    return functionBinding(real(sym), name, "@kobalte/core", `Selection.${name}`);
  });
  modules.push({ kind: "module", name: "Selection", items });
}

// The types are a file of their own: Melange keeps a function's arity, and
// so calls it directly from another library, one module deep in a file, not
// two.
write({
  module: "kobalte/solidtype_kobalte",
  names: "ppx/kobalte_names.ml",
  by,
  whose: "Kobalte's",
  header: `(* Every Kobalte component, part by part, its hooks and utilities, and the
   types they name, in Types. Generated from the declarations of
   @kobalte/core ${kobalte} by ${by}; never edited by hand.

   A part's props check takes its own props, then its children, then the
   attributes of the element it renders, which it passes on. Each check is
   external, since the compiler checks it and Melange writes none of it. *)`,
  typesHeader: `(* The types Kobalte's components and functions name, each a module.
   Generated from the declarations of @kobalte/core ${kobalte} by
   ${by}; never edited by hand. *)`,
  items: modules,
});
