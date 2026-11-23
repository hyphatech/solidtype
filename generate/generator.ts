import ts from "typescript";
import { bind } from "./binding.ts";
import type { Library } from "./library.ts";
import { table } from "./names.ts";
import { printItems, type Item } from "./ocaml.ts";
import { formatted, refuse, writeOrCheck } from "./output.ts";
import { byName, declarations, installed, root, type Declarations } from "./package.ts";

export type Reading = {
  package: string;
  entries: (dir: string) => string[];
  jsx?: boolean;
};

export type Written = {
  // From the repository's root, without its extension; Types is written beside it.
  module: string;
  header: string;
  typesHeader: string;
  items: Item[];
  names?: string;
  by: string;
  whose: string;
  otherwise?: string;
};

export function reading(of: Reading) {
  const { dir, version } = installed(of.package);
  const read: Declarations = declarations(of.entries(dir), of.jsx ? { jsx: ts.JsxEmit.Preserve } : {});
  return { ...read, dir, version, bind: (library: Library) => bound(read, library) };
}

function bound(read: Declarations, library: Library) {
  const bound = bind(root, read.checker, library);
  return {
    ...bound,
    functions(entry: string, jsModule: string): Item[] {
      return byName(read.exportsOf(entry)).flatMap((symbol) => {
        const real = read.real(symbol);
        return real.flags & ts.SymbolFlags.Function ? bound.functionBinding(real, symbol.name, jsModule, symbol.name) : [];
      });
    },
    write(w: Written): void {
      const types = bound.typesFiles(w.typesHeader);
      refuse(
        bound.refusals(),
        `${w.whose} declarations above are not bound: map each by a rule${w.otherwise ? `, ${w.otherwise}` : ""}, or name it as left out, with why, in ${w.by}`,
      );
      const items: Item[] = [{ kind: "alias", name: "Types", of: "Types" }, ...w.items];
      const file = (which: "ml" | "mli") => `${w.header}\n\n${printItems(items, which)}\n`;
      const typesOut = `${root}${w.module.replace(/[^/]+$/, "types")}`;
      const written = (path: string, text: string): [string, string] => [path, formatted(path, text)];
      writeOrCheck(
        [
          written(`${root}${w.module}.ml`, file("ml")),
          written(`${root}${w.module}.mli`, file("mli")),
          written(`${typesOut}.ml`, types.ml),
          written(`${typesOut}.mli`, types.mli),
          ...(w.names ? [written(`${root}${w.names}`, table(bound.names, w.by))] : []),
        ],
        `${w.whose} types`,
      );
    },
  };
}
