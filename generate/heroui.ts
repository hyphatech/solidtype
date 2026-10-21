// Writes heroui/styles.ml and its interface -- each of HeroUI's variant
// functions, its options and the classes it gives -- from the declarations of
// @heroui/styles, so the classes a port applies are the ones HeroUI's own
// components get, and their options are never typed by hand. `make generate`
// writes them; `make lint`'s `--check` fails when a file differs from what
// HeroUI's types give.

import ts from "typescript";
import { readFileSync, realpathSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { isTag } from "./melange.ts";
import { label } from "./names.ts";
import { name as tname, print, type Type } from "./ocaml.ts";
import { writeOrCheck } from "./output.ts";
import { browser } from "./program.ts";
import { Source } from "./source.ts";

const root = fileURLToPath(new URL("../", import.meta.url));
// HeroUI's real path: tailwind-variants, whose types its declarations name,
// is installed beside it, not here.
const entry = realpathSync(`${root}node_modules/@heroui/styles/dist/index.d.ts`);
const out = `${root}heroui/styles.ml`;
const heroui = JSON.parse(readFileSync(`${root}node_modules/@heroui/styles/package.json`, "utf8")).version as string;

const program = ts.createProgram([entry], {
  ...browser,
  module: ts.ModuleKind.ESNext,
  moduleResolution: ts.ModuleResolutionKind.Bundler,
});
const checker = program.getTypeChecker();
const source = program.getSourceFile(entry);
const exported = source && checker.getSymbolAtLocation(source);
if (!exported) throw new Error(`no ${entry}`);

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
const src = new Source();
for (const symbol of checker.getExportsOfModule(exported)) {
  if (!/^[a-z]\w*Variants$/.test(symbol.name)) continue;
  const real = symbol.flags & ts.SymbolFlags.Alias ? checker.getAliasedSymbol(symbol) : symbol;
  const type = checker.getTypeOfSymbol(real);
  if (type.getSymbol()?.name !== "TVReturnType") throw new Error(`${symbol.name} is no variant function`);
  const [variants, slots] = checker.getTypeArguments(type as ts.TypeReference);
  const component = symbol.name.charAt(0).toUpperCase() + symbol.name.slice(1, -"Variants".length);
  const options = properties(variants).map((v) => {
    const keys = properties(checker.getTypeOfSymbol(v)).map((k) => k.name);
    return `    ?${label(v.name)}:(${show(variant(`${symbol.name}.${v.name}`, keys))} [@mel.as ${JSON.stringify(v.name)}]) ->`;
  });
  const parts = properties(slots).map((s) => s.name);
  src.both(`(** HeroUI's [${symbol.name}]. *)`);
  src.module("", component, () => {
    src.both(
      `  type options`,
      ``,
      `  external options :`,
      ...options,
      `    ?class_:(string [@mel.as "class"]) ->`,
      `    unit ->`,
      `    options = ""`,
      `  [@@mel.obj]`,
      ``,
    );
    if (parts.length === 0) {
      src.both(`  external classes : options -> string = ${JSON.stringify(symbol.name)}`, `  [@@mel.module "@heroui/styles"]`);
    } else {
      src.both(`  type slots`, ``, `  external slots : options -> slots = ${JSON.stringify(symbol.name)}`, `  [@@mel.module "@heroui/styles"]`, ``);
      for (const part of parts) src.both(`  external ${label(part)} : slots -> string = ${JSON.stringify(part)} [@@mel.send]`);
    }
  });
  src.both(``);
}

const file = (lines: string[]) => `(* Each of HeroUI's variant functions, by its component: [options] built
   from its variants, then [classes], its class string, or for a component of
   several parts [slots], a class string per part. Generated from the
   declarations of @heroui/styles ${heroui} by generate/heroui.ts; never edited
   by hand. *)

${lines.join("\n")}`;

writeOrCheck(
  [
    [out, file(src.ml)],
    [`${out}i`, file(src.mli)],
  ],
  "HeroUI's types",
);
