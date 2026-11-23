// Writes src/html.mli -- each element's attributes, as OCaml types -- from
// Solid's own JSX types, so an attribute's type is Solid's and is never typed
// by hand, and ppx/html_names.ml, the attributes whose JavaScript name the
// ppx cannot spell back by rule. `make generate` writes them; `make lint`'s
// `--check` fails when a file differs from what Solid's types give.

import { formatted, refuse, writeOrCheck } from "./output.ts";
import { table } from "./names.ts";
import { root } from "./package.ts";
import { solidHtml, type Members } from "./solid_html.ts";

const out = `${root}src/html.mli`;
const namesOut = `${root}ppx/html_names.ml`;
const { version: solid, elements, membersOf, common, names, unmapped } = solidHtml();

const sharesCommon = (ms: Members) => [...common].every(([k, v]) => ms.get(k) === v);

// Each signature also gives ['r check], every attribute as an optional
// argument before ['r]: the tail of a component's props check, for a
// component that passes them to this element, as Kobalte's parts do.
function signature(ms: Members, include: boolean, root = false): string {
  const lines = include ? ["  include Dom_attributes"] : ["  type element\n  type props = element Solid.rest"];
  const sorted = [...ms].sort(([a], [b]) => (a < b ? -1 : a > b ? 1 : 0));
  const own = sorted.filter(([k]) => !(include && common.has(k)));
  for (const [k, v] of own) lines.push(`  type ${k} = ${v}`);
  const argument = ([k, v]: [string, string]) => (v.includes("->") ? `?${k}:${k}` : `?${k}:${k} Check.value`);
  const tail = include ? "'r dom_check" : "'r";
  const name = root ? "dom_check" : "check";
  lines.push(`  type 'r ${name} =\n${own.map((m) => `    ${argument(m)} ->`).join("\n")}\n    ${tail}`);
  return lines.join("\n");
}

const used = [...new Set(elements.map((e) => e.attributes))].sort();

let text = `(** Each element's attributes, as their types: [Html.Div.class_] is
    [string]. Generated from the JSX types of solid-js ${solid} by
    [generate/html.ts]; never edited by hand.

    An attribute is named as Solid's JSX names it, by one rule: a capital is
    an underscore and the lower case, [read_only], a hyphen an underscore,
    [aria_label], and an OCaml keyword takes a trailing underscore,
    [class_]. *)

module type Dom_attributes = sig
${signature(common, false, true)}
end
`;
for (const name of used) {
  const ms = membersOf(name);
  text += `\nmodule type ${name} = sig\n${signature(ms, sharesCommon(ms))}\nend\n`;
}
for (const e of elements) {
  const module = e.tag.charAt(0).toUpperCase() + e.tag.slice(1);
  text += `\nmodule ${module} : ${e.attributes} with type element = ${e.element}\n`;
}
// An element whose tag is known only as the page runs, Dynamic's: the
// attributes every HTML element takes, as TSX types a tag that is a string.
text += `\n(** An element whose tag is known only as the page runs: the attributes
    every HTML element takes. *)
module Element : HTMLAttributes with type element = Dom.htmlElement\n`;

const leftOut: Record<string, string> = {
  "HTMLAttributes.inlist": "RDFa's, which Solid types any",
  "DialogHtmlAttributes.tabindex": "a dialog takes none, which Solid types never",
};
refuse(
  [
    ...[...unmapped].filter(([k]) => !(k in leftOut)).map(([k, v]) => `${k}: no rule maps ${v}`),
    ...Object.keys(leftOut).filter((k) => !unmapped.has(k)).map((k) => `${k}: named as left out, but it is mapped, or no longer declared`),
  ],
  "Solid's attributes above are not typed: map each by a rule, or name it as left out, with why, in generate/html.ts",
);

writeOrCheck(
  [
    [out, formatted(out, text)],
    [namesOut, formatted(namesOut, table(names, "generate/html.ts"))],
  ],
  "Solid's types",
);
