// Writes gravity_icons/ -- every icon of @gravity-ui/icons, a component of
// its own, from the SVG file the package ships. An icon is a module
// of its own so that a page bundles only the icons it draws. `make generate`
// writes them; `make lint`'s `--check` fails when a file differs from what
// the package gives, or one is left of an icon it no longer ships.

import ts from "typescript";
import { readdirSync, readFileSync, realpathSync, unlinkSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { label, record } from "./names.ts";
import { writeOrCheck } from "./output.ts";
import { browser } from "./program.ts";

const root = fileURLToPath(new URL("../", import.meta.url));
const pkg = realpathSync(`${root}node_modules/@gravity-ui/icons`);
const version = JSON.parse(readFileSync(`${pkg}/package.json`, "utf8")).version as string;
const out = `${root}gravity_icons/`;
const from = "generate/gravity_icons.ts";

type Icon = { componentName: string; svgName: string };
const icons = (JSON.parse(readFileSync(`${pkg}/metadata.json`, "utf8")) as { icons: Icon[] }).icons;

// Whether Solid's JSX types declare an attribute on an element: one they
// leave out, clip-rule on a <g>, is written in Solid's attr: namespace, set
// as the package sets it.
const jsx = `${root}node_modules/solid-js/types/jsx.d.ts`;
const program = ts.createProgram([jsx], browser);
const checker = program.getTypeChecker();
const intrinsic = (() => {
  const source = program.getSourceFile(jsx);
  let found: ts.InterfaceDeclaration | undefined;
  const visit = (n: ts.Node): void => {
    if (ts.isInterfaceDeclaration(n) && n.name.text === "IntrinsicElements") found = n;
    else n.forEachChild(visit);
  };
  if (source) visit(source);
  if (!found) throw new Error(`no IntrinsicElements in ${jsx}`);
  return checker.getTypeAtLocation(found);
})();
function declared(tag: string, name: string): boolean {
  const element = intrinsic.getProperty(tag);
  if (!element) throw new Error(`Solid declares no <${tag}>`);
  const attributes = checker.getNonNullableType(checker.getTypeOfSymbol(element));
  return attributes.getProperty(name) !== undefined;
}

type Element = { tag: string; attributes: [string, string][]; children: Element[] };

// An SVG file of the package's: elements and their attributes, nothing
// else, which is all it ships; anything else fails, so no icon is drawn by
// halves.
function parse(svg: string, file: string): Element {
  const token = /<(\/?)([a-zA-Z]+)((?:\s+[a-zA-Z:-]+="[^"]*")*)\s*(\/?)>/y;
  const stack: Element[] = [{ tag: "", attributes: [], children: [] }];
  let at = 0;
  while (at < svg.length) {
    token.lastIndex = at;
    const m = token.exec(svg);
    if (!m) throw new Error(`${file}: what is at ${at} is not an element`);
    const [whole, closing, tag = "", attributes = "", selfClosing] = m;
    at += whole.length;
    const parent = stack.at(-1);
    if (!parent) throw new Error(`${file}: more closed than opened`);
    if (closing) {
      if (parent.tag !== tag) throw new Error(`${file}: </${tag}> closes <${parent.tag}>`);
      stack.pop();
      continue;
    }
    const element: Element = {
      tag,
      attributes: [...attributes.matchAll(/([a-zA-Z:-]+)="([^"]*)"/g)].map(([, n = "", v = ""]) => [n, v]),
      children: [],
    };
    parent.children.push(element);
    if (!selfClosing) stack.push(element);
  }
  const [document] = stack;
  const svgElement = document?.children[0];
  if (stack.length !== 1 || document?.children.length !== 1 || svgElement?.tag !== "svg")
    throw new Error(`${file}: not one <svg>`);
  return svgElement;
}

const literal = (s: string) => {
  if (/["\\]/.test(s)) throw new Error(`a value the generator does not quote: ${s}`);
  return `"${s}"`;
};

// The package names each clip "a", so two icons on a page share an id; an
// icon here makes its own, `clip`, and every reference to "a" names it.
function attribute(tag: string, [name, value]: [string, string], file: string): string {
  const l = label(name);
  if (name === "id") {
    if (value !== "a") throw new Error(`${file}: an id other than "a": ${value}`);
    return "id=clip";
  }
  if (value.includes("url(")) {
    if (value !== "url(#a)") throw new Error(`${file}: a reference other than url(#a): ${value}`);
    return `${l}=clip_url`;
  }
  return declared(tag, name) ? `${l}=${literal(value)}` : `${l}=(Solidtype.Jsx.attr ${literal(value)})`;
}

function draw(e: Element, indent: string, file: string, root: boolean): string[] {
  const attributes = [...e.attributes.map((a) => attribute(e.tag, a, file)), ...(root ? ["props=(Props.others props)"] : [])];
  const open = `${indent}<${e.tag}`;
  const inner = `${indent}  `;
  const oneLine = [open, ...attributes].join(" ");
  const head = oneLine.length < 76 ? [oneLine] : [open, ...attributes.map((a) => `${inner}${a}`)];
  if (e.children.length === 0) return [...head.slice(0, -1), `${head.at(-1)} />`];
  return [
    ...head.slice(0, -1),
    `${head.at(-1)}>`,
    ...e.children.flatMap((c) => draw(c, inner, file, false)),
    `${indent}</${e.tag}>`,
  ];
}

const size = (svg: Element) => {
  const of = (n: string) => svg.attributes.find(([a]) => a === n)?.[1];
  const [width, height] = [of("width"), of("height")];
  if (!width || !height) throw new Error("an svg of no size");
  return `${width} by ${height}`;
};

const identified = (e: Element): boolean =>
  e.attributes.some(([n]) => n === "id") || e.children.some(identified);

const names = new Map<string, string>();
const files: [string, string][] = [];

for (const icon of icons) {
  const file = `svgs/${icon.svgName}.svg`;
  const svg = parse(readFileSync(`${pkg}/${file}`, "utf8").trim(), file);
  const name = record(names, icon.componentName);
  const clipped = identified(svg);
  const header = `(* Gravity UI's ${icon.componentName}, from @gravity-ui/icons ${version}'s
   ${file}, MIT, Copyright (c) 2022 YANDEX LLC. Generated by
   ${from}; never edited by hand. *)
`;
  const body = [
    ...(clipped
      ? [
          `  (* An id of this icon's own, where the package's are all "a". *)`,
          `  let clip = Solidtype.Solid.create_unique_id () in`,
          `  let clip_url = "url(#" ^ clip ^ ")" in`,
        ]
      : []),
    ...draw(svg, "  ", file, true),
  ];
  files.push([
    `${out}${name}.mlx`,
    `${header}
let%component make () =
${body.join("\n")}
[@@element svg]
`,
  ]);
  files.push([
    `${out}${name}.mli`,
    `${header}
(** Gravity UI's [${icon.componentName}], ${size(svg)} in [currentColor]: an svg
    that takes every attribute an svg does, a caller's after its own. *)

module Props : sig
  type t

  val check :
    ?as_:(Solidtype.Html.Svg.props -> Solidtype.Jsx.element) ->
    ?props:t Solidtype.Solid.rest ->
    (unit -> unit) Solidtype.Html.Svg.check
end

val make : Props.t -> Solidtype.Jsx.element
val component : Props.t Solidtype.Jsx.component
`,
  ]);
}

const kept = new Set(["dune"]);
const written = new Set(files.map(([path]) => path));
const stale = readdirSync(out)
  .filter((f) => !kept.has(f) && !written.has(`${out}${f}`))
  .map((f) => `${out}${f}`);
if (process.argv.includes("--check") && stale.length > 0) {
  console.error(`${stale.join(", ")}: no icon of ${from}'s: run make generate`);
  process.exit(1);
}
for (const path of stale) unlinkSync(path);
writeOrCheck(files, from);
