// The core of a generated binding: a TypeScript library of Solid components,
// read with TypeScript's checker and written as OCaml for Melange -- each type
// mapped, each part a component and its props check, each function and value
// an external, and the types they name, each a module of Types. What is one
// library's own -- which entries it binds, how its parts and their options are
// named -- is its generator's, which binds it once, by bind, and calls what
// bind gives.

import ts from "typescript";
import { emitters } from "./emit.ts";
import { Binding, type Library } from "./library.ts";
import { mapping } from "./mapping.ts";
import { typesFiles } from "./types_file.ts";

export type { Library } from "./library.ts";
export type { Given } from "./emit.ts";

export function bind(root: string, checker: ts.TypeChecker, library: Library) {
  const b = new Binding(root, checker, library);
  const m = mapping(b);
  const e = emitters(b, m);
  return {
    part: e.part,
    doc: e.doc,
    functionBinding: e.functionBinding,
    valueBinding: e.valueBinding,
    real: b.real,
    reach: b.reach,
    refusals: () => b.refusals(),
    names: b.names,
    typesFiles: (header: string) => typesFiles(b, m, e, header),
  };
}
