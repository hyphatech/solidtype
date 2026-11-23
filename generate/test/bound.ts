// Read from memory at a path inside the repository, so the declarations name
// solid-js as a library's do.

import ts from "typescript";
import { fileURLToPath } from "node:url";
import { bind, type Library } from "../binding.ts";
import { browser } from "../program.ts";
import { printItems, type Item } from "../ocaml.ts";

const root = fileURLToPath(new URL("../../", import.meta.url));
const path = `${root}generate/test/declarations.d.ts`;

export type Bound = {
  mli: string;
  ml: string;
  types: string;
  refusals: string[];
};

export function bound(declarations: string, library: Partial<Library> = {}): Bound {
  const options: ts.CompilerOptions = { ...browser, module: ts.ModuleKind.ESNext, moduleResolution: ts.ModuleResolutionKind.Bundler };
  const host = ts.createCompilerHost(options);
  const { fileExists, readFile, getSourceFile } = host;
  host.fileExists = (f) => f === path || fileExists(f);
  host.readFile = (f) => (f === path ? declarations : readFile(f));
  host.getSourceFile = (f, ...rest) => (f === path ? ts.createSourceFile(f, declarations, ts.ScriptTarget.ESNext, true) : getSourceFile(f, ...rest));
  const program = ts.createProgram([path], options, host);
  const checker = program.getTypeChecker();
  const source = program.getSourceFile(path);
  const module = source && checker.getSymbolAtLocation(source);
  if (!module) throw new Error("the declarations export nothing");
  const { functionBinding, part, valueBinding, reach, refusals, typesFiles } = bind(root, checker, { name: "lib", throwsUndocumented: () => false, ...library });
  const items: Item[] = [];
  for (const symbol of checker.getExportsOfModule(module)) {
    const signature = checker.getTypeOfSymbol(symbol).getCallSignatures()[0];
    const declaration = signature?.getDeclaration();
    if (/^[A-Z]/.test(symbol.name) && signature && declaration && signature.getParameters().length === 1) {
      const own = checker.getPropertiesOfType(checker.getTypeOfSymbol(signature.getParameters()[0]!));
      items.push({ kind: "module", name: symbol.name, items: part("lib", symbol.name, declaration, null, [], symbol.name, { element: null, own }) });
    } else if (symbol.flags & ts.SymbolFlags.Function) items.push(...functionBinding(symbol, symbol.name, "lib", symbol.name));
    else if (symbol.flags & ts.SymbolFlags.Variable) items.push(...valueBinding(symbol, symbol.name, "lib", symbol.name));
    else if (symbol.flags & ts.SymbolFlags.Class) reach(symbol);
  }
  const types = typesFiles("");
  return { mli: printItems(items, "mli"), ml: printItems(items, "ml"), types: types.mli, refusals: refusals() };
}
