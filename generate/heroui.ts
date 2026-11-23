// Writes heroui/styles.ml and its interface -- each of HeroUI's variant
// functions, its options and the classes it gives -- from the declarations of
// @heroui/styles, so the classes a port applies are the ones HeroUI's own
// components get, and their options are never typed by hand. `make generate`
// writes them; `make lint`'s `--check` fails when a file differs from what
// HeroUI's types give.

import ts from "typescript";
import { isTag } from "./melange.ts";
import { label } from "./names.ts";
import { name as tname, print, printItems, type Item, type Type } from "./ocaml.ts";
import { formatted, writeOrCheck } from "./output.ts";
import { declarations, installed, root } from "./package.ts";

const { dir, version: heroui } = installed("@heroui/styles");
const entry = `${dir}/dist/index.d.ts`;
const out = `${root}heroui/styles.ml`;

const { checker, exportsOf, real } = declarations([entry]);
const exported = exportsOf(entry);

const properties = (t: ts.Type | undefined) => (t && !(t.flags & ts.TypeFlags.Undefined) ? checker.getPropertiesOfType(t) : []);

// A variant's type: a bool where its keys are true and false, else its keys
// as tags, each named by the one spelling rule, a space taken as a hyphen,
// and written as its key.
function variant(where: string, keys: string[]): Type {
  if (keys.every((k) => k === "true" || k === "false")) return tname("bool");
  const tags = keys.map((k) => label(k.replace(/ /g, "-")));
  tags.forEach((t, i) => {
    if (!isTag(t)) throw new Error(`${where}: "${keys[i]}" names no tag`);
  });
  if (new Set(tags).size !== tags.length) throw new Error(`${where}: two keys name one tag`);
  return { kind: "tags", tags, js: keys };
}

const show = (t: Type) =>
  print(t, (module) => {
    throw new Error(`no type of its own is named here, ${module}`);
  });

// Each variant function, a module by its component: buttonVariants is
// Button. The capitalised exports, ButtonVariants, are types.
const items: Item[] = [];
for (const symbol of exported) {
  if (!/^[a-z]\w*Variants$/.test(symbol.name)) continue;
  const type = checker.getTypeOfSymbol(real(symbol));
  if (type.getSymbol()?.name !== "TVReturnType") throw new Error(`${symbol.name} is no variant function`);
  const [variants, slots] = checker.getTypeArguments(type as ts.TypeReference);
  const component = symbol.name.charAt(0).toUpperCase() + symbol.name.slice(1, -"Variants".length);
  const options = properties(variants).map((v) => {
    const keys = properties(checker.getTypeOfSymbol(v)).map((k) => k.name);
    return `?${label(v.name)}:(${show(variant(`${symbol.name}.${v.name}`, keys))} [@mel.as ${JSON.stringify(v.name)}]) ->`;
  });
  const parts = properties(slots).map((s) => s.name);
  const from = [`mel.module "@heroui/styles"`];
  items.push({
    kind: "module",
    name: component,
    doc: `HeroUI's [${symbol.name}].`,
    items: [
      { kind: "type", name: "options" },
      { kind: "external", name: "options", type: `${options.join(" ")} ?class_:(string [@mel.as "class"]) -> unit -> options`, js: "", attributes: ["mel.obj"] },
      ...(parts.length === 0
        ? [{ kind: "external", name: "classes", type: "options -> string", js: symbol.name, attributes: from } as Item]
        : [
            { kind: "type", name: "slots" } as Item,
            { kind: "external", name: "slots", type: "options -> slots", js: symbol.name, attributes: from } as Item,
            ...parts.map((part): Item => ({ kind: "external", name: label(part), type: "slots -> string", js: part, attributes: ["mel.send"] })),
          ]),
    ],
  });
}

// cn, which the variant functions merge a class by: a component styled here
// rather than by a variant function merges a caller's class by it too, so the
// caller's utility wins as it does over HeroUI's own.
const cn = exported.find((s) => s.name === "cn");
const cnType = cn && checker.getTypeOfSymbol(real(cn));
if (!cnType || cnType.getCallSignatures().length === 0) throw new Error("@heroui/styles exports no cn function");
items.push({
  kind: "external",
  name: "cn",
  type: "string -> string -> string Js.undefined",
  js: "cn",
  attributes: [`mel.module "@heroui/styles"`],
  doc: "HeroUI's [cn]: [cn a b] is [a]'s classes and [b]'s, a Tailwind utility of [b] winning over one of [a] that sets the same property, as a variant function merges its [class]; none where both are empty.",
});

const file = (which: "ml" | "mli") => `(* Each of HeroUI's variant functions, by its component: [options] built
   from its variants, then [classes], its class string, or for a component of
   several parts [slots], a class string per part; and [cn], the merge they
   give a class by. Generated from the declarations of @heroui/styles
   ${heroui} by generate/heroui.ts; never edited by hand. *)

${printItems(items, which)}
`;

writeOrCheck(
  [
    [out, formatted(out, file("ml"))],
    [`${out}i`, formatted(`${out}i`, file("mli"))],
  ],
  "HeroUI's types",
);
