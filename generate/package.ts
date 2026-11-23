import ts from "typescript";
import { readFileSync, realpathSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { browser } from "./program.ts";

export const root = fileURLToPath(new URL("../", import.meta.url));

// Its real path: a package manager that links each package's dependencies
// beside it, as Bun does, resolves them from there.
export function installed(name: string): { dir: string; version: string } {
  const dir = realpathSync(`${root}node_modules/${name}`);
  return { dir, version: JSON.parse(readFileSync(`${dir}/package.json`, "utf8")).version as string };
}

export type Declarations = {
  program: ts.Program;
  checker: ts.TypeChecker;
  exportsOf: (entry: string) => ts.Symbol[];
  real: (symbol: ts.Symbol) => ts.Symbol;
};

export function declarations(entries: string[], options: ts.CompilerOptions = {}): Declarations {
  const program = ts.createProgram(entries, {
    ...browser,
    module: ts.ModuleKind.ESNext,
    moduleResolution: ts.ModuleResolutionKind.Bundler,
    ...options,
  });
  const checker = program.getTypeChecker();
  return {
    program,
    checker,
    exportsOf: (entry) => {
      const source = program.getSourceFile(entry);
      const module = source && checker.getSymbolAtLocation(source);
      if (!module) throw new Error(`${entry} is no module`);
      return checker.getExportsOfModule(module);
    },
    real: (s) => (s.flags & ts.SymbolFlags.Alias ? checker.getAliasedSymbol(s) : s),
  };
}

export const byName = (symbols: ts.Symbol[]) => [...symbols].sort((a, b) => (a.name < b.name ? -1 : 1));
