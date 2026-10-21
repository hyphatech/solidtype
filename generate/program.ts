// What every generator reads declarations under: a browser's standard
// library and no ambient types. A package's types installed for the build
// -- @types/bun, which adds image() to every Blob -- would otherwise be read
// as part of the browser's own, and bound as if a page had them.

import ts from "typescript";

export const browser: ts.CompilerOptions = {
  strict: true,
  skipLibCheck: true,
  noEmit: true,
  types: [],
  target: ts.ScriptTarget.ESNext,
  lib: ["lib.esnext.d.ts", "lib.dom.d.ts", "lib.dom.iterable.d.ts"],
};
