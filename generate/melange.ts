// What every generator reads of Melange and writes for it, one rule each:
// the DOM types Melange's Dom module has, a TypeScript type that admits any
// string, and the string literals OCaml can name as a polymorphic variant's
// tags.

import ts from "typescript";
import { readFileSync } from "node:fs";
import { keywords } from "./names.ts";
import { switchPrefix } from "./opam.ts";

// Read from the switch the build uses: `make generate` runs each generator
// inside it.
const domTypes = new Set(
  readFileSync(`${switchPrefix()}/lib/melange/dom/melange/dom.ml`, "utf8")
    .match(/^type [a-zA-Z_]+/gm)
    ?.map((t) => t.slice(5)) ?? [],
);

// Melange's type for a DOM interface, HTMLDivElement's Dom.htmlDivElement,
// or null where Dom has none.
export function domType(name: string): string | null {
  const ocaml = name.replace(/^HTML/, "html").replace(/^SVG/, "svg").replace(/^UI/, "ui");
  const lower = ocaml.charAt(0).toLowerCase() + ocaml.slice(1);
  return domTypes.has(lower) ? `Dom.${lower}` : null;
}

// Any string: a plain one, a template, or literals widened by [string & {}],
// which TypeScript writes to keep them in its completions.
export const isString = (t: ts.Type): boolean =>
  (t.flags & (ts.TypeFlags.String | ts.TypeFlags.TemplateLiteral | ts.TypeFlags.StringMapping)) !== 0 ||
  (t.isIntersection() && t.types.some(isString));

// A tag is written as its literal, so the literal must be one OCaml can name.
export const isTag = (s: string): boolean => /^[A-Za-z][A-Za-z0-9_']*$/.test(s) && !keywords.has(s);
