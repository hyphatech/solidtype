// Writes kobalte/solidtype_kobalte.ml and kobalte/types.ml -- every Kobalte
// component, part by part, its hooks and utilities, and the types they name
// -- from Kobalte's own declarations, so a binding is Kobalte's types and is
// never typed by hand, and ppx/kobalte_names.ml, the props whose JavaScript
// name the ppx
// cannot spell back by rule. `make generate` writes them; `make lint`'s
// `--check` fails when a file differs from what Kobalte's types give.

import ts from "typescript";
import { readdirSync, existsSync, readFileSync, realpathSync, writeFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { keywords, label, record, snake, table } from "./names.ts";
import { switchPrefix } from "./opam.ts";

const root = fileURLToPath(new URL("../", import.meta.url));
// Kobalte's real path: a package manager that links each package's
// dependencies beside it, as Bun does, is resolved from there.
const dist = realpathSync(`${root}node_modules/@kobalte/core/dist`);
const out = `${root}kobalte/solidtype_kobalte.ml`;
// The types, a file of their own: Melange keeps a function's arity, and so
// calls it directly from another library, one module deep in a file, not two.
const typesOut = `${root}kobalte/types.ml`;
const namesOut = `${root}ppx/kobalte_names.ml`;
const kobalte = JSON.parse(readFileSync(`${root}node_modules/@kobalte/core/package.json`, "utf8")).version as string;

// The building blocks Kobalte's components are made of, which its
// documentation does not offer as components.
const blocks = new Set(["menu", "popper", "dismissable-layer", "polymorphic"]);

const prefix = switchPrefix();
const domTypes = new Set(
  readFileSync(`${prefix}/lib/melange/dom/melange/dom.ml`, "utf8").match(/^type [a-zA-Z_]+/gm)?.map((t) => t.slice(5)) ?? [],
);
// The elements solidtype's Html has a module for.
const htmlModules = new Set(
  readFileSync(`${root}src/html.mli`, "utf8").match(/^module [A-Z][A-Za-z0-9]* :/gm)?.map((m) => m.slice(7, -2)) ?? [],
);


const entries = readdirSync(dist)
  .filter((d) => existsSync(`${dist}/${d}/index.d.ts`) && !blocks.has(d))
  .sort();
const program = ts.createProgram(entries.map((d) => `${dist}/${d}/index.d.ts`), {
  strict: true,
  jsx: ts.JsxEmit.Preserve,
  skipLibCheck: true,
  noEmit: true,
  module: ts.ModuleKind.ESNext,
  moduleResolution: ts.ModuleResolutionKind.Bundler,
});
const checker = program.getTypeChecker();

const pascal = (s: string) => s.split("-").map((w) => w.charAt(0).toUpperCase() + w.slice(1)).join("");
const lowerFirst = (s: string) => s.charAt(0).toLowerCase() + s.slice(1);
const value = (name: string) => (keywords.has(name) ? `${name}_` : name);
const named = (name: string) => /^[A-Za-z_][A-Za-z0-9_]*$/.test(name);

const unmapped = new Map<string, string>();

// Each prop's name as a user writes it, with its JavaScript name.
const names = new Map<string, string>();

// The named object types the bindings reach, each a module of Types.
type Named = {
  module: string;
  symbol: ts.Symbol | null;
  type: ts.Type;
  params: string[];
  // The standard types an intersection is too, each a conversion.
  conversions: string[];
};
const types = new Map<ts.Symbol | ts.Type, Named>();
const queue: Named[] = [];
const moduleNames = new Set<string>();

function freshModule(name: string): string {
  let n = name.replace(/[^A-Za-z0-9_]/g, "_");
  n = n.charAt(0).toUpperCase() + n.slice(1);
  let k = n;
  for (let i = 2; moduleNames.has(k); i++) k = `${n}${i}`;
  moduleNames.add(k);
  return k;
}

// The package a symbol is declared in: the last node_modules in its path,
// since a store such as Bun's nests packages under its own.
function moduleOf(symbol: ts.Symbol): string | null {
  const file = symbol.declarations?.[0]?.getSourceFile().fileName ?? "";
  const m = file.match(/.*node_modules\/((?:@[^/]+\/)?[^/]+)\//);
  return m ? m[1]! : null;
}

function isDomLib(symbol: ts.Symbol): boolean {
  const file = symbol.declarations?.[0]?.getSourceFile().fileName ?? "";
  return /typescript\/lib\/lib\./.test(file);
}

function domType(name: string): string | null {
  const ocaml = lowerFirst(name.replace(/^HTML/, "html").replace(/^SVG/, "svg").replace(/^UI/, "ui"));
  return domTypes.has(ocaml) ? `Dom.${ocaml}` : null;
}

type Vars = Map<string, string>;

function typeVar(name: string, vars: Vars): string {
  let v = vars.get(name);
  if (!v) {
    v = `'${snake(name).replace(/^t$/, "t")}`;
    vars.set(name, v);
  }
  return v;
}

function namedModule(symbol: ts.Symbol, type: ts.Type): Named {
  let n = types.get(symbol);
  if (!n) {
    const decl = symbol.declarations?.[0];
    const params =
      decl && (ts.isInterfaceDeclaration(decl) || ts.isClassDeclaration(decl) || ts.isTypeAliasDeclaration(decl))
        ? (decl.typeParameters ?? []).map((p) => p.name.text)
        : [];
    n = { module: freshModule(symbol.name), symbol, type, params, conversions: [] };
    types.set(symbol, n);
    queue.push(n);
  }
  return n;
}

// An object type with no name of its own -- an inline type, an
// intersection, a const's typeof -- named by where it is first met.
function anonymousModule(type: ts.Type, where: string): Named {
  let n = types.get(type);
  if (!n) {
    n = {
      module: freshModule(where.split(".").map((w) => w.split("-").map((x) => x.charAt(0).toUpperCase() + x.slice(1)).join("")).join("_")),
      symbol: null,
      type,
      params: [],
      conversions: [],
    };
    types.set(type, n);
    queue.push(n);
  }
  return n;
}

const readable = new Set([
  "File", "DateTimeFormatOptions", "NumberFormatOptions", "CollatorOptions",
  "Collator", "NumberFormat", "DateTimeFormat",
]);
const opaques = new Set<string>();
function opaque(name: string): string {
  opaques.add(name);
  return name;
}

const isString = (t: ts.Type): boolean =>
  (t.flags & (ts.TypeFlags.String | ts.TypeFlags.TemplateLiteral | ts.TypeFlags.StringMapping)) !== 0 ||
  (t.isIntersection() && t.types.some(isString));

const isElement = (t: ts.Type) => t.aliasSymbol?.name === "Element" && moduleOf(t.aliasSymbol) === "solid-js";

// [absent] drops undefined, which an optional prop's absence already says;
// anywhere else -- a callback's argument, a result -- it is an option.
// The OCaml type of a TypeScript one, by AGENTS.md's "Kobalte's binding is
// generated from its declarations"; null when none of its mappings covers it.
function map(t: ts.Type, vars: Vars, where: string, absent = false): string | null {
  if (t.flags & ts.TypeFlags.TypeParameter) return typeVar(t.symbol?.name ?? "t", vars);
  if (isElement(t)) return "Solidtype.Jsx.element";
  // Exclude<Option, null> and its kind: the type it narrows.
  if (t.flags & ts.TypeFlags.Conditional) return map((t as ts.ConditionalType).checkType, vars, where);
  if (t.flags & ts.TypeFlags.Substitution) return map((t as ts.SubstitutionType).baseType, vars, where);
  if (t.flags & (ts.TypeFlags.Any | ts.TypeFlags.Unknown | ts.TypeFlags.Never)) return null;
  if (t.flags & ts.TypeFlags.Void) return "unit";
  if (t.flags & ts.TypeFlags.Undefined) return "unit";
  if (t.isUnion()) {
    const undefinable = t.types.some((m) => m.flags & ts.TypeFlags.Undefined);
    let members = t.types.filter((m) => !(m.flags & ts.TypeFlags.Undefined));
    // An accessor that takes a key or a function takes the function alone;
    // one that takes only a key, Select's optionGroupChildren, takes its
    // name, which OCaml cannot check.
    const keys = members.filter((m) => m.flags & ts.TypeFlags.Index);
    members = members.filter((m) => !(m.flags & ts.TypeFlags.Index));
    if (members.length === 0 && keys.length > 0) return "string";
    // Solid's element, inlined, holds null and undefined of its own.
    const element = members.some((m) => m.getSymbol()?.name === "ArrayElement" && moduleOf(m.getSymbol()!) === "solid-js");
    const nullable = !element && members.some((m) => m.flags & ts.TypeFlags.Null);
    if (!element) members = members.filter((m) => !(m.flags & ts.TypeFlags.Null));
    const inner = mapUnion(members, vars, where);
    if (!inner) return null;
    const value = nullable ? `${inner} Js.Nullable.t` : inner;
    return undefinable && !absent && !element && inner !== "unit" && !nullable ? `${wrap(value)} option` : value;
  }
  return mapUnion([t], vars, where);
}

// Solid's JSX.Element is a union, which TypeScript inlines into a union it is
// part of; its members together are one element.
const isJsxMember = (t: ts.Type) => {
  const s = t.getSymbol();
  return s !== undefined && (s.name === "ArrayElement" || s.name === "Node") &&
    (moduleOf(s) === "solid-js" || isDomLib(s));
};

function mapUnion(members: ts.Type[], vars: Vars, where: string): string | null {
  if (members.length === 0) return "unit";
  // A style is a string, as an element's is: Solid's CSSProperties beside
  // it is the same declarations as an object.
  if (members.some(isString)) {
    members = members.filter((m) => !(m.getSymbol()?.name === "CSSProperties" || m.aliasSymbol?.name === "CSSProperties"));
  }
  if (members.some((m) => m.getSymbol()?.name === "ArrayElement" && moduleOf(m.getSymbol()!) === "solid-js")) {
    const rest = members.filter(
      (m) => !isJsxMember(m) && !isString(m) && !m.isStringLiteral() &&
        !(m.flags & (ts.TypeFlags.NumberLike | ts.TypeFlags.BooleanLike | ts.TypeFlags.Null)),
    );
    if (rest.length === 0) return "Solidtype.Jsx.element";
    const others = mapUnion(rest, vars, where);
    return others ? `(Solidtype.Jsx.element, ${others}) §Either§` : null;
  }
  if (members.some(isString)) {
    const others = members.filter((m) => !isString(m) && !m.isStringLiteral());
    if (others.length === 0) return "string";
  }
  const booleans = members.filter((m) => m.flags & ts.TypeFlags.BooleanLike);
  if (booleans.length === members.length) return "bool";
  const strings = members.filter((m) => m.isStringLiteral()).map((m) => (m as ts.StringLiteralType).value);
  if (strings.length === members.length) {
    return strings.every((s) => named(s) && !keywords.has(s)) ? `[ ${strings.map((s) => `\`${s}`).join(" | ")} ]` : "string";
  }
  if (members.every((m) => m.flags & ts.TypeFlags.NumberLike)) return "float";
  if (members.length === 1) return mapOne(members[0]!, vars, where);
  // Literals beside other kinds are one member, their own set of tags.
  const literals = members.filter((m) => m.isStringLiteral());
  if (literals.length > 0 && literals.length < members.length) {
    const rest = members.filter((m) => !m.isStringLiteral());
    const tags = mapUnion(literals, vars, where);
    const others = mapUnion(rest, vars, where);
    return tags && others ? `(${tags}, ${others}) §Either§` : null;
  }
  // Members of different JavaScript kinds: a type whose values are each
  // member as it is, built by a conversion per member.
  const kinds = members.map((m) => mapOne(m, vars, where));
  if (kinds.some((k) => k === null)) return null;
  const distinct = [...new Set(kinds as string[])];
  if (distinct.length === 1) return distinct[0]!;
  if (distinct.length === 2) return `(${distinct[0]}, ${distinct[1]}) §Either§`;
  return null;
}

function mapOne(t: ts.Type, vars: Vars, where: string): string | null {
  if (t.isUnion() || isElement(t) || t.flags & (ts.TypeFlags.Conditional | ts.TypeFlags.Substitution))
    return map(t, vars, where);
  if (t.flags & ts.TypeFlags.TypeParameter) return typeVar(t.symbol?.name ?? "t", vars);
  if (t.flags & ts.TypeFlags.Index) return "string";
  if (checker.isTupleType(t)) {
    const items = checker.getTypeArguments(t as ts.TypeReference).map((a) => map(a, vars, where));
    return items.some((i) => i === null) ? null : `(${(items as string[]).map(wrap).join(" * ")})`;
  }
  if (isString(t) || t.isStringLiteral()) return "string";
  if (t.flags & ts.TypeFlags.BooleanLike) return "bool";
  if (t.flags & ts.TypeFlags.NumberLike) return "float";
  if (t.flags & (ts.TypeFlags.Void | ts.TypeFlags.Undefined)) return "unit";
  if (t.flags & (ts.TypeFlags.Any | ts.TypeFlags.Unknown | ts.TypeFlags.Never | ts.TypeFlags.Null)) return null;
  const libraryAlias = t.aliasSymbol && isDomLib(t.aliasSymbol);
  if (libraryAlias && t.aliasSymbol!.name === "NonNullable" && t.aliasTypeArguments?.[0])
    return map(t.aliasTypeArguments[0], vars, where);
  // A standard alias -- Partial, Omit -- is the type it makes.
  const alias = libraryAlias ? undefined : t.aliasSymbol;
  if (alias?.name === "Accessor") {
    const arg = t.aliasTypeArguments?.[0];
    const a = arg ? map(arg, vars, where) : null;
    return a ? `${a} Solidtype.Solid.accessor` : null;
  }
  if (alias?.name === "Setter") {
    const arg = t.aliasTypeArguments?.[0];
    const a = arg ? map(arg, vars, where) : null;
    return a ? `${a} Solidtype.Solid.setter` : null;
  }
  const symbol = t.getSymbol();
  const name = symbol?.name ?? "";
  if (name === "Element" && moduleOf(symbol!) === "solid-js") return "Solidtype.Jsx.element";
  if (alias?.name === "Element" || /JSX\.Element/.test(checker.typeToString(t))) return "Solidtype.Jsx.element";
  if (checker.isArrayType(t)) {
    const arg = checker.getTypeArguments(t as ts.TypeReference)[0];
    const a = arg ? map(arg, vars, where) : null;
    return a ? `${a} array` : null;
  }
  if (name === "Set" && symbol && isDomLib(symbol)) {
    const arg = checker.getTypeArguments(t as ts.TypeReference)[0];
    const a = arg ? map(arg, vars, where) : null;
    return a ? `${a} Js.Set.t` : null;
  }
  if (name === "Iterable") {
    const arg = (t as ts.TypeReference).typeArguments?.[0] ?? checker.getTypeArguments(t as ts.TypeReference)[0];
    const a = arg ? map(arg, vars, where) : null;
    return a ? `${a} array` : null;
  }
  if (symbol && isDomLib(symbol)) {
    if (name === "Date") return "Js.Date.t";
    if (name === "RegExp") return "Js.Re.t";
    if (name === "Map") {
      const [k, v] = checker.getTypeArguments(t as ts.TypeReference).map((a) => map(a, vars, where));
      return k && v ? `(${k}, ${v}) Js.Map.t` : null;
    }
    if (name === "Promise") {
      const arg = checker.getTypeArguments(t as ts.TypeReference)[0];
      const a = arg ? map(arg, vars, where) : null;
      return a ? `${a} Js.Promise.t` : null;
    }
    // An interface or a class named for an event or an element is one, but
    // never a method that happens to be named so, initEvent.
    const kind = symbol.flags & (ts.SymbolFlags.Interface | ts.SymbolFlags.Class);
    const dom = domType(name) ?? (kind && /Event$/.test(name) ? "Dom.event" : kind && /Element$/.test(name) ? "Dom.element" : null);
    if (dom) return dom;
    // A standard interface is opaque but for those a user builds or reads;
    // anything else of the standard library is a function or not bound.
    const declared = symbol.flags & (ts.SymbolFlags.Interface | ts.SymbolFlags.Class);
    if (declared && named(name) && !name.startsWith("__") && !readable.has(name)) return `§${opaque(name)}§`;
    if (!readable.has(name)) {
      const calls = t.getCallSignatures();
      return calls.length > 0 && t.getProperties().length === 0 ? mapFunction(calls[0]!, vars, where) : null;
    }
  }
  const calls = t.getCallSignatures();
  if (calls.length > 0 && t.getProperties().length === 0) return mapFunction(calls[0]!, vars, where);
  if (calls.length > 0 && name === "Component") {
    // A component prop: a function from the props Kobalte gives it.
    return mapFunction(calls[0]!, vars, where);
  }
  const anonymous = !symbol || symbol.name === "__type" || symbol.name === "__object";
  if (t.isIntersection()) {
    // Its own members are the module's; a standard member is a conversion.
    const standard = t.types.filter((m) => m.getSymbol() && isDomLib(m.getSymbol()!));
    const own = t.types.filter((m) => !standard.includes(m) && m.getProperties().length > 0);
    if (own.length === 0) return standard[0] ? mapOne(standard[0], vars, where) : null;
    const n = alias ? namedModule(alias, t) : anonymousModule(t, where);
    const ref = reference(n, t, alias, vars, where);
    if (n.conversions.length === 0) {
      for (const m of standard) {
        const d = mapOne(m, vars, where);
        if (d && d.startsWith("Dom.")) n.conversions.push(d);
      }
    }
    return ref;
  }
  if (anonymous && t.getProperties().length > 0) {
    const n = alias ? namedModule(alias, t) : anonymousModule(t, where);
    return reference(n, t, alias, vars, where);
  }
  if (symbol && (symbol.flags & (ts.SymbolFlags.Interface | ts.SymbolFlags.Class | ts.SymbolFlags.TypeLiteral | ts.SymbolFlags.TypeAlias))) {
    const owner = alias ?? symbol;
    return reference(namedModule(owner, t), t, alias, vars, where);
  }
  return null;
}

// A named type's reference, its type arguments applied.
function reference(n: Named, t: ts.Type, alias: ts.Symbol | undefined, vars: Vars, where: string): string {
  const args = (alias ? t.aliasTypeArguments : (t as ts.TypeReference).typeArguments) ?? [];
  const mapped = n.params.map((_, i) => (args[i] ? map(args[i]!, vars, where) : null) ?? "_");
  const applied = mapped.length === 0 ? "" : mapped.length === 1 ? `${wrap(mapped[0]!)} ` : `(${mapped.join(", ")}) `;
  return `${applied}§${n.module}§`;
}

// Whether a parameter may be left out: optional, or with a default, but not
// a rest of them.
function leftOut(q: ts.Symbol): boolean {
  const d = q.valueDeclaration;
  return !!d && ts.isParameter(d) && !d.dotDotDotToken && (d.questionToken !== undefined || d.initializer !== undefined);
}

// A function's OCaml type. [labelled], for a function the user calls, an
// external, writes a parameter that may be left out as an optional argument,
// ?name, followed by unit, as the stdlib does; a function JavaScript calls
// takes its arguments by position, so there it is an option.
function mapFunction(sig: ts.Signature, vars: Vars, where: string, labelled = false): string | null {
  const ps = sig.getParameters();
  const params = ps.map((q) => {
    const optional = labelled && leftOut(q);
    const t = checker.getTypeOfSymbol(q);
    const m = map(optional ? checker.getNonNullableType(t) : t, vars, where);
    if (m === null) return null;
    const a = m.includes("->") ? `(${m})` : m;
    return optional ? `?${value(snake(q.name))}:${a}` : a;
  });
  if (params.some((p) => p === null)) return null;
  const result = map(sig.getReturnType(), vars, where);
  if (!result) return null;
  const args = params.length === 0 ? ["unit"] : (params as string[]);
  if (labelled && ps.some(leftOut)) args.push("unit");
  // A function returned is parenthesized, so it is not taken for more
  // arguments.
  return `${args.join(" -> ")} -> ${topArrow(result) ? `(${result})` : result}`;
}

const wrap = (t: string) => (t.includes("->") ? `(${t})` : t);

// Whether reading a member gives a type variable that neither its module nor
// its own arguments fix: a value whose type its caller would choose, an
// unchecked cast, so it is not read. A variable an argument fixes, a generic
// function's, is the function's own.
const typeVars = (t: string) => t.match(/'[a-z_][A-Za-z0-9_]*/g) ?? [];
function unbound(t: string, params: string[]): boolean {
  const parts: string[] = [];
  let depth = 0;
  let last = 0;
  for (let i = 0; i < t.length - 1; i++) {
    const c = t[i];
    if (c === "(" || c === "[") depth++;
    else if (c === ")" || c === "]") depth--;
    else if (depth === 0 && c === "-" && t[i + 1] === ">") {
      parts.push(t.slice(last, i));
      last = i + 2;
    }
  }
  const result = t.slice(last);
  const fixed = new Set([...params, ...parts.flatMap(typeVars)]);
  return typeVars(result).some((v) => !fixed.has(v));
}

// Whether an OCaml type is a function: an arrow outside every parenthesis.
function topArrow(t: string): boolean {
  let depth = 0;
  for (let i = 0; i < t.length - 1; i++) {
    const c = t[i];
    if (c === "(" || c === "[") depth++;
    else if (c === ")" || c === "]") depth--;
    else if (depth === 0 && c === "-" && t[i + 1] === ">") return true;
  }
  return false;
}

// Every attribute any element has, from Html: a CommonProps member that is
// none of them, Search.Indicator's loadingComponent, is the part's own.
const attributeNames = new Set(
  readFileSync(`${root}src/html.mli`, "utf8").match(/^  type [A-Za-z_0-9]+ =/gm)?.map((t) => t.slice(7, -2)) ?? [],
);

// The members of the CommonProps its signature's props are made of, that
// do not depend on the element: those are attributes, which the check's
// tail takes.
function commonProps(decl: ts.SignatureDeclaration): ts.Symbol[] {
  const param = decl.parameters[0]?.type;
  const props = param && ts.isTypeReferenceNode(param) && param.typeArguments?.[1];
  if (!props) return [];
  const found: ts.Symbol[] = [];
  const visit = (t: ts.Type) => {
    for (const part of t.isIntersection() ? t.types : [t]) {
      const name = part.aliasSymbol?.name ?? part.getSymbol()?.name ?? "";
      if (/CommonProps$/.test(name) || (part.aliasSymbol?.name === "Partial" && /CommonProps/.test(checker.typeToString(part)))) {
        for (const p of checker.getPropertiesOfType(part)) {
          if (!/ElementOf|\bT\b/.test(checker.typeToString(checker.getTypeOfSymbol(p)))) found.push(p);
        }
      }
    }
  };
  visit(checker.getTypeFromTypeNode(props));
  return found;
}

function fixedElement(decl: ts.SignatureDeclaration): { element: string; own: ts.Symbol[] } | null {
  const param = decl.parameters[0]?.type;
  if (!param || !ts.isTypeReferenceNode(param)) return null;
  const symbol = checker.getSymbolAtLocation(param.typeName);
  const alias = symbol && real(symbol).declarations?.find(ts.isTypeAliasDeclaration);
  if (alias && ts.isTypeReferenceNode(alias.type) && /ComponentProps$/.test(alias.type.typeName.getText())) {
    const arg = alias.type.typeArguments?.[0];
    if (arg && ts.isLiteralTypeNode(arg) && ts.isStringLiteral(arg.literal)) return { element: arg.literal.text, own: [] };
  }
  const props = symbol && real(symbol).declarations?.find(ts.isInterfaceDeclaration);
  if (!props) return null;
  for (const clause of props.heritageClauses ?? []) {
    for (const base of clause.types) {
      const arg = base.typeArguments?.[0];
      if (/ComponentProps$/.test(base.expression.getText()) && arg && ts.isLiteralTypeNode(arg) && ts.isStringLiteral(arg.literal)) {
        const type = checker.getTypeAtLocation(props.name);
        const own = checker.getPropertiesOfType(type).filter((p) => p.declarations?.some((d) => d.parent === props));
        return { element: arg.literal.text, own };
      }
    }
  }
  return null;
}

// One part's binding: its component, from its entry, and its props check --
// its options, then its children, then its element's attributes.
function part(entry: string, name: string, decl: ts.SignatureDeclaration, options: ts.Type | null, js: string): string {
  const where = `${entry}.${name}`;
  const vars: Vars = new Map();
  const tp = decl.typeParameters?.find((p) => p.default && /ValidComponent/.test(p.constraint?.getText() ?? ""));
  const polymorphic = tp?.default && ts.isLiteralTypeNode(tp.default) ? (tp.default.literal as ts.StringLiteral).text : null;
  // A part that is not polymorphic renders the element its props extend,
  // ComponentProps<"input">, and its options are that interface's own.
  const fixed = polymorphic ? null : fixedElement(decl);
  const element = polymorphic ?? fixed?.element ?? null;
  const commons = commonProps(decl).filter((p) => !attributeNames.has(label(p.name)));
  // A part with neither options nor an element, I18nProvider, takes the
  // props its signature declares.
  const declaredProps = (): ts.Symbol[] => {
    const param = decl.parameters[0];
    return param ? checker.getPropertiesOfType(checker.getTypeAtLocation(param)) : [];
  };
  const own = [...(options ? checker.getPropertiesOfType(options) : (fixed?.own ?? (polymorphic ? [] : declaredProps()))), ...commons];
  const args: string[] = [];
  let children = "?children:('f, [ `nodes ]) Solidtype.Check.children ->";
  for (const p of own) {
    if (!named(p.name)) continue;
    const pt = checker.getTypeOfSymbol(p);
    const optional = (p.flags & ts.SymbolFlags.Optional) !== 0;
    // A prop only false, as a single-value root's multiple, is not given.
    if (pt.isUnion() && pt.types.every((m) => m.flags & (ts.TypeFlags.BooleanLiteral | ts.TypeFlags.Undefined)) &&
      pt.types.filter((m) => m.flags & ts.TypeFlags.BooleanLiteral).length === 1 && checker.typeToString(pt).includes("false")) continue;
    const t = map(pt, vars, `${where}.${p.name}`, optional);
    if (!t) {
      unmapped.set(`${where}.${p.name}`, checker.typeToString(pt));
      continue;
    }
    if (p.name === "children") {
      // Children: elements, a function of the part's own, or either.
      const either = t.match(/^\(Solidtype\.Jsx\.element, (.*)\) §Either§$/);
      const q = optional ? "?" : "";
      children = either
        ? `${q}children:(${either[1]}, [ \`nodes | \`render ]) Solidtype.Check.children ->`
        : topArrow(t)
          ? `${q}children:(${t}, [ \`render ]) Solidtype.Check.children ->`
          : `${q}children:('f, [ \`nodes ]) Solidtype.Check.children ->`;
      continue;
    }
    const name = record(names, p.name);
    const checked = topArrow(t) ? wrap(t) : `${wrap(t)} Solidtype.Check.value`;
    args.push(`${optional ? "?" : ""}${name}:${checked} ->`);
  }
  const html = element ? element.charAt(0).toUpperCase() + element.slice(1) : null;
  const tail = `${children} unit -> unit`;
  const check = html && htmlModules.has(html) ? `(${tail}) Solidtype.Html.${html}.check` : tail;
  return [
    `    module Props = struct`,
    `      external check :`,
    ...args.map((a) => `        ${a}`),
    `        ${check} = "check"`,
    `      [@@mel.module "vite-plugin-solidtype/markers"]`,
    `    end`,
    ``,
    `    external component : unit Solidtype.Jsx.component = "${js}"`,
    `    [@@mel.module "@kobalte/core/${entry}"]`,
  ].join("\n");
}

// A symbol's type, also one a mapped type made, which has no declaration.
const typeOf = (s: ts.Symbol): ts.Type => checker.getTypeOfSymbol(s);

// Kobalte's comment on a declaration, as odoc: its documentation is the
// binding's.
function doc(symbol: ts.Symbol, indent: string, raises = false): string[] {
  const text = ts.displayPartsToString(symbol.getDocumentationComment(checker)).trim();
  const escaped = text.replace(/\*\)/g, "* )").replace(/[{}\[\]@]/g, (c) => `\\${c}`);
  const raise = raises ? "@raise Invalid_argument with Kobalte's message, where it throws." : "";
  const all = [escaped, raise].filter((t) => t !== "").join("\n\n");
  if (!all) return [];
  return [`${indent}(** ${all.split("\n").join(`\n${indent}    `)} *)`];
}

// A function Kobalte documents as throwing, and toFormat, which throws
// converting HSL or HSB to hex without saying so: a precondition the caller
// broke, raised as Invalid_argument with Kobalte's message. One at the top
// of a module reads input from outside, so it also has an _opt that gives
// None for it.
const undocumentedThrows = new Set(["Color.toFormat"]);
const throws = (symbol: ts.Symbol, where: string) =>
  undocumentedThrows.has(where) || /\bThrows\b/.test(ts.displayPartsToString(symbol.getDocumentationComment(checker)));

// The type of each function written as a let, by its module and name: the
// .mli declares it, where the raw external under it, _js, is left out.
const vals = new Map<string, string>();

// A function type's arguments and its result, split at its outer arrows.
function splitArrow(t: string): { args: string[]; result: string } {
  const args: string[] = [];
  let depth = 0;
  let last = 0;
  for (let i = 0; i < t.length - 1; i++) {
    const c = t[i];
    if (c === "(" || c === "[") depth++;
    else if (c === ")" || c === "]") depth--;
    else if (depth === 0 && c === "-" && t[i + 1] === ">") {
      args.push(t.slice(last, i).trim());
      last = i + 2;
    }
  }
  return { args, result: t.slice(last).trim() };
}

// The OCaml function over [js], an external that may throw, of [type], in
// module [where]: [self] its object where it is a method, and [opt] whether
// an _opt is written beside. It takes [sig]'s arguments as the external
// does: by position, and one that may be left out as ?name, then ().
function guarded(indent: string, where: string, name: string, type: string, js: string, sig: ts.Signature, self: boolean, opt: boolean): string[] {
  vals.set(`${where}.${name}`, type);
  const ps = sig.getParameters();
  const named = ps.map((q, i) => (leftOut(q) ? `?${value(snake(q.name))}` : `x${i}`));
  if (ps.some(leftOut)) named.push("()");
  const xs = named.length === 0 ? "()" : named.join(" ");
  const args = self ? `o ${xs}` : xs;
  const lines = [
    `${indent}let ${name} ${args} =`,
    `${indent}  match ${js} ${args} with`,
    `${indent}  | v -> v`,
    `${indent}  | exception Js.Exn.Error e -> invalid_arg ("${name}: " ^ Option.value (Js.Exn.message e) ~default:"")`,
  ];
  if (opt) {
    const { args: ts, result } = splitArrow(type);
    vals.set(`${where}.${name}_opt`, `${ts.join(" -> ")} -> ${wrap(result)} option`);
    lines.push(`${indent}let ${name}_opt ${args} = match ${js} ${args} with v -> Some v | exception Js.Exn.Error _ -> None`);
  }
  return lines;
}

const real = (s: ts.Symbol) => (s.flags & ts.SymbolFlags.Alias ? checker.getAliasedSymbol(s) : s);

let body = "";
for (const entry of entries) {
  const source = program.getSourceFile(`${dist}/${entry}/index.d.ts`);
  const mod = source && checker.getSymbolAtLocation(source);
  if (!mod) continue;
  const exports = checker.getExportsOfModule(mod);
  const byName = new Map(exports.map((s) => [s.name, s]));
  const component = pascal(entry);
  const lines: string[] = [];
  for (const sym of [...exports].sort((a, b) => (a.name < b.name ? -1 : 1))) {
    const r = real(sym);
    const declared = r.declarations?.[0];
    if (!declared) continue;
    // A component is a function, or a const of a function type, as
    // SegmentedControl declares its root.
    const signature =
      ts.isFunctionDeclaration(declared)
        ? declared
        : r.flags & ts.SymbolFlags.Variable && /^[A-Z]/.test(sym.name) && checker.getTypeOfSymbol(r).getProperties().length === 0
          ? checker.getTypeOfSymbol(r).getCallSignatures()[0]?.getDeclaration()
          : undefined;
    const decl = signature ?? declared;
    if (signature && /^[A-Z]/.test(sym.name)) {
      if (sym.name === component) continue;
      const optionsName = `${component}${sym.name}Options`;
      const opt = byName.get(optionsName) ?? byName.get(`${sym.name}Options`) ?? byName.get(`${sym.name}Props`);
      // Without an Options interface, the props its signature gives:
      // PolymorphicProps<T, Props>, SegmentedControl's an alias of
      // RadioGroup's.
      const param = decl.parameters[0]?.type;
      const given = !opt && param && ts.isTypeReferenceNode(param) && /PolymorphicProps$/.test(param.typeName.getText()) && param.typeArguments?.[1]
        ? checker.getTypeFromTypeNode(param.typeArguments[1])
        : null;
      const optType = opt ? checker.getDeclaredTypeOfSymbol(real(opt)) : given;
      // A root whose value type turns on [multiple] is two modules.
      if (optType?.isUnion() && optType.types.some((t) => /Multiple/.test(checker.typeToString(t)))) {
        for (const variant of optType.types) {
          const multiple = /Multiple/.test(checker.typeToString(variant));
          lines.push(`  module ${sym.name}${multiple ? "_multiple" : ""} = struct`);
          lines.push(part(entry, sym.name, decl, variant, sym.name));
          lines.push(`  end`, ``);
        }
        continue;
      }
      lines.push(...doc(r, "  "));
      lines.push(`  module ${sym.name} = struct`);
      lines.push(part(entry, sym.name, decl, optType, sym.name));
      lines.push(`  end`, ``);
    } else if ((r.flags & ts.SymbolFlags.Function) && ts.isFunctionDeclaration(decl)) {
      const sig = checker.getSignaturesOfType(checker.getTypeOfSymbol(r), ts.SignatureKind.Call)[0];
      const t = sig ? mapFunction(sig, new Map(), `${entry}.${sym.name}`, true) : null;
      if (!t) {
        unmapped.set(`${entry}.${sym.name}`, sig ? checker.signatureToString(sig) : "?");
        continue;
      }
      const name = value(snake(sym.name));
      if (sig && throws(r, sym.name)) {
        lines.push(`  external ${name}_js : ${t} = "${sym.name}"`);
        lines.push(`  [@@mel.module "@kobalte/core/${entry}"]`);
        lines.push(...doc(r, "  ", true));
        lines.push(...guarded("  ", component, name, t, `${name}_js`, sig, false, true), ``);
        continue;
      }
      lines.push(...doc(r, "  "));
      lines.push(`  external ${name} : ${t} = "${sym.name}"`);
      lines.push(`  [@@mel.module "@kobalte/core/${entry}"]`, ``);
    } else if (r.flags & ts.SymbolFlags.Variable && sym.name !== component && !byName.get(sym.name)?.getDeclarations()?.some(ts.isFunctionDeclaration)) {
      // A value: toaster, the storage managers, the default translations.
      const vt = checker.getTypeOfSymbol(r);
      if (vt.getCallSignatures().length > 0 && vt.getProperties().length > 0) continue;
      const t = map(vt, new Map(), `${entry}.${sym.name}`);
      if (!t || /'/.test(t)) {
        unmapped.set(`${entry}.${sym.name}`, checker.typeToString(vt));
        continue;
      }
      lines.push(`  external ${value(snake(sym.name))} : ${t} = "${sym.name}"`);
      lines.push(`  [@@mel.module "@kobalte/core/${entry}"]`, ``);
    }
  }
  if (lines.length === 0) continue;
  body += `\nmodule ${component} = struct\n${lines.join("\n")}end\n`;
}

// Each named type: abstract, a getter per property, a method per method,
// and a constructor where it has none and is not a class.
const flatName = (module: string) => `t_${snake(module)}`;
const abstracts: string[] = [];
const done = new Set<ts.Symbol | ts.Type>();
const signatures: string[] = [];
while (queue.length > 0) {
  const n = queue.shift()!;
  const key = n.symbol ?? n.type;
  if (done.has(key)) continue;
  done.add(key);
  const vars: Vars = new Map();
  const params = n.params.map((p) => typeVar(p, vars));
  const t = params.length === 0 ? "t" : params.length === 1 ? `${params[0]} t` : `(${params.join(", ")}) t`;
  const declared = n.symbol && !(n.symbol.flags & ts.SymbolFlags.TypeAlias) ? checker.getDeclaredTypeOfSymbol(n.symbol) : n.type;
  const flat = `${params.length === 0 ? "" : params.length === 1 ? `${params[0]} ` : `(${params.join(", ")}) `}${flatName(n.module)}`;
  abstracts.push(`  type ${flat}`);
  const lines: string[] = [...(n.symbol ? doc(n.symbol, "  ") : []), `  module ${n.module} = struct`, `    type ${t} = ${flat}`];
  const isClass = n.symbol !== null && (n.symbol.flags & ts.SymbolFlags.Class) !== 0;
  // A standard type is Melange's to bind, but for one a user builds or
  // reads, whose fields, methods and constructor are bound here.
  const library = n.symbol !== null && isDomLib(n.symbol) && !readable.has(n.symbol.name);
  const fields: [string, string, boolean][] = [];
  // A function a field holds, wrapped once by [make] into the shape its type
  // declares: OCaml writes [fun id () -> ...] and [fun id -> fun () -> ...]
  // as one type but not one arity, and a [let] between two [fun]s keeps
  // Melange from merging them. The field stays curried, since Melange drops
  // [@mel.as] from an uncurried field of a [@@mel.obj].
  const shaped = new Map<string, (f: string) => string>();
  let methods = 0;
  for (const p of checker.getPropertiesOfType(declared)) {
    if (!named(p.name)) continue;
    // A standard type's members are Melange's, through a conversion.
    if (!library && n.conversions.length > 0 && p.declarations?.every((d) => /typescript\/lib\/lib\./.test(d.getSourceFile().fileName))) continue;
    const pt = checker.getTypeOfSymbol(p);
    const optional = (p.flags & ts.SymbolFlags.Optional) !== 0;
    // A standard type's method stays one where a mapped type, Omit, gives it
    // back as a property: its declaration is still a method's.
    const method = (p.flags & ts.SymbolFlags.Method) !== 0 || (p.declarations ?? []).some((d) => ts.isMethodSignature(d) || ts.isMethodDeclaration(d));
    if (method) {
      // The standard library's methods are Melange's to bind.
      if (library) continue;
      const sig = pt.getCallSignatures()[0];
      const f = sig ? mapFunction(sig, vars, `${n.module}.${p.name}`, true) : null;
      if (!f || unbound(f, params)) {
        unmapped.set(`${n.module}.${p.name}()`, sig ? checker.signatureToString(sig) : "?");
        continue;
      }
      methods++;
      const name = value(snake(p.name));
      if (sig && throws(p, `${n.module}.${p.name}`)) {
        lines.push(`    external ${name}_js : ${t} -> ${f} = "${p.name}" [@@mel.send]`);
        lines.push(...doc(p, "    ", true));
        lines.push(...guarded("    ", n.module, name, `${t} -> ${f}`, `${name}_js`, sig, true, false));
        continue;
      }
      lines.push(`    external ${name} : ${t} -> ${f} = "${p.name}" [@@mel.send]`);
      continue;
    }
    const ft = map(pt, vars, `${n.module}.${p.name}`, optional);
    if (!ft) {
      unmapped.set(`${n.module}.${p.name}`, checker.typeToString(pt));
      continue;
    }
    fields.push([p.name, ft, optional]);
    // Its constructor takes it, but reading it would be a cast.
    if (unbound(ft, params)) {
      unmapped.set(`${n.module}.${p.name}`, `read as ${ft}`);
      continue;
    }
    lines.push(...doc(p, "    "));
    const sig = checker.getNonNullableType(pt).getCallSignatures()[0];
    // A function is one the mapping writes as an arrow, not a setter, an
    // accessor or a type of its own that happens to be callable.
    const arrow = topArrow(ft);
    const fn = sig && arrow && checker.getNonNullableType(pt).getProperties().length === 0 && !optional
      ? mapFunction(sig, vars, `${n.module}.${p.name}`)
      : null;
    if (sig && library) continue;
    if (sig && fn) {
      // A function a property holds: read uncurried, as Melange counts an
      // external's arguments through parentheses, and called curried.
      const arity = sig.getParameters().length;
      const xs = Array.from({ length: arity }, (_, i) => `x${i}`);
      const getter = `${value(snake(p.name))}_js`;
      const args = arity === 0 ? "()" : xs.join(" ");
      // A function it returns is uncurried too, since OCaml reads
      // a -> (b -> c) as a -> b -> c, and is given back curried.
      const returned = sig.getReturnType().getCallSignatures()[0];
      const result = returned ? mapFunction(returned, vars, `${n.module}.${p.name}`) : null;
      if (returned && result) {
        const argTypes = sig.getParameters().map((q) => map(checker.getTypeOfSymbol(q), vars, n.module));
        const inner = returned.getParameters().length;
        const ys = Array.from({ length: inner }, (_, i) => `y${i}`);
        const yargs = inner === 0 ? "()" : ys.join(" ");
        const params = argTypes.length === 0 ? "unit" : argTypes.map((a) => wrap(a ?? "_")).join(" -> ");
        lines.push(`    external ${getter} : ${t} -> (${params} -> (${result} [@u]) [@u]) = "${p.name}" [@@mel.get]`);
        lines.push(`    let ${value(snake(p.name))} o ${args} = let r = (${getter} o) ${args} [@u] in fun ${yargs} -> r ${yargs} [@u]`);
        vals.set(`${n.module}.${value(snake(p.name))}`, `${t} -> ${params} -> ${wrap(result)}`);
        shaped.set(p.name, (f) => `(fun ${args} -> let r = ${f} ${args} in fun ${yargs} -> r ${yargs})`);
      } else {
        // Called as a method of the object that holds it: an external is
        // called directly from another library, where a [let] in a nested
        // module goes through Curry, its arity lost.
        lines.push(`    external ${value(snake(p.name))} : ${t} -> ${mapFunction(sig, vars, `${n.module}.${p.name}`, true) ?? fn} = "${p.name}" [@@mel.send]`);
      }
    } else {
      lines.push(`    external ${value(snake(p.name))} : ${t} -> ${optional ? `${wrap(ft)} option` : wrap(ft)} = "${p.name}" [@@mel.get]`);
    }
  }
  // A value Kobalte declares as a DOM node or event, extended, is that value:
  // the conversion only forgets what Kobalte added, so it is %identity, named
  // as the stdlib names a conversion, to_html_div_element.
  for (const d of n.conversions) {
    lines.push(`    external to_${snake(d.slice(4))} : ${t} -> ${d} = "%identity"`);
  }
  if (!isClass && !library && methods === 0 && fields.length > 0 && n.conversions.length === 0) {
    const label = ([k, ft, opt]: [string, string, boolean]) =>
      `${opt ? "?" : ""}${value(snake(k))}:(${wrap(ft)} [@mel.as "${k}"]) ->`;
    if (shaped.size === 0) {
      lines.push(`    external make : ${fields.map(label).join(" ")} unit -> ${t} = "" [@@mel.obj]`);
    } else {
      const params = fields.map(([k, , opt]) => `${opt ? "?" : "~"}${value(snake(k))}`);
      const passed = fields.map(([k, , opt]) => {
        const v = value(snake(k));
        const shape = shaped.get(k);
        return opt ? `?${v}` : shape ? `~${v}:${shape(v)}` : `~${v}`;
      });
      lines.push(`    external make_js : ${fields.map(label).join(" ")} unit -> ${t} = "" [@@mel.obj]`);
      lines.push(`    let make ${params.join(" ")} () = make_js ${passed.join(" ")} ()`);
      const labels = fields.map(([k, ft, opt]) => `${opt ? "?" : ""}${value(snake(k))}:${wrap(ft)} ->`);
      vals.set(`${n.module}.make`, `${labels.join(" ")} unit -> ${t}`);
    }
  }
  if (isClass && n.symbol?.valueDeclaration) {
    const mod = moduleOf(n.symbol);
    const ctor = checker.getTypeOfSymbolAtLocation(n.symbol, n.symbol.valueDeclaration).getConstructSignatures()[0];
    const f = ctor ? mapFunction(ctor, vars, `${n.module}.constructor`, true) : null;
    if (f && mod) {
      lines.push(`    external make : ${f.replace(/-> [^>]*$/, `-> ${t}`)} = "${n.module}" [@@mel.new] [@@mel.module "${mod}"]`);
    }
  }
  lines.push(`  end`);
  signatures.push(lines.join("\n"));
}

// A reference to a named type: its flat name inside Types, where the types
// refer to one another, and its module's type outside.
const inside = (x: string) => x.replace(/§([A-Za-z0-9_]+)§/g, (_, m: string) => (m === "Either" ? "either" : flatName(m)));
const outside = (x: string) => x.replace(/§([A-Za-z0-9_]+)§/g, (_, m: string) => `Types.${m}.t`);

// What Types holds, a module one deep in its own file.
const typesInner = `  (* Members of different JavaScript kinds, each as it is. *)
  type ('a, 'b) either
${[...opaques].sort().filter((o) => !moduleNames.has(o)).map((o) => `  type ${flatName(o)}`).join("\n")}
${abstracts.join("\n")}

  module Either = struct
    type ('a, 'b) t = ('a, 'b) either

    external left : 'a -> ('a, 'b) t = "%identity"
    external right : 'b -> ('a, 'b) t = "%identity"
  end
${[...opaques].sort().filter((o) => !moduleNames.has(o)).map((o) => `\n  (* The standard library's ${o}, opaque. *)\n  module ${o} = struct\n    type t = ${flatName(o)}\n  end\n`).join("")}
${inside(signatures.join("\n\n"))}`;

const typesText = `(* The types Kobalte's components and functions name, each a module.
   Generated from the declarations of @kobalte/core ${kobalte} by
   generate/kobalte.ts; never edited by hand. *)

${typesInner.replace(/^  /gm, "")}
`;

const text = `(* Every Kobalte component, part by part, its hooks and utilities, and the
   types they name, in Types. Generated from the declarations of
   @kobalte/core ${kobalte} by generate/kobalte.ts; never edited by hand.

   A part's props check takes its own props, then its children, then the
   attributes of the element it renders, which it passes on. Each check is
   external, since the compiler checks it and Melange writes none of it. *)

module Types = Types
${outside(body)}`;

// A file's interface, from the file: a struct is a sig, a let its val, and a
// raw external under a let, _js, left out.
function mli(ml: string, transform: (t: string) => string): string {
  const lines = ml.split("\n");
  const out: string[] = [];
  const path: string[] = [];
  for (let i = 0; i < lines.length; i++) {
    const line = lines[i] ?? "";
    const opened = /^(\s*)module (\w+) = struct\s*$/.exec(line);
    if (opened) {
      path.push(opened[2] ?? "");
      out.push(line.replace(/= struct\s*$/, ": sig"));
      continue;
    }
    if (/^\s*end\s*$/.test(line)) {
      path.pop();
      out.push(line);
      continue;
    }
    if (/^\s*external [a-z_0-9]+_js /.test(line)) {
      if (!line.includes("[@@")) i++;
      continue;
    }
    const bound = /^(\s*)let ([a-z_0-9]+) /.exec(line);
    if (bound) {
      const indent = bound[1] ?? "";
      const key = [...path, bound[2]].join(".");
      const type = vals.get(key);
      if (!type) throw new Error(`no type recorded for ${key}`);
      out.push(`${indent}val ${bound[2]} : ${transform(type)}`);
      while (i + 1 < lines.length && (lines[i + 1] ?? "").startsWith(`${indent} `)) i++;
      continue;
    }
    out.push(line);
  }
  return out.join("\n");
}

const typesMli = mli(typesText, inside);
const textMli = mli(text, outside);

if (process.argv.includes("--unmapped")) for (const [k, v] of unmapped) console.error(`${k}: ${v}`);

const namesText = table(names, "generate/kobalte.ts");
if (process.argv.includes("--check")) {
  for (const [file, want] of [[out, text], [`${out}i`, textMli], [typesOut, typesText], [`${typesOut}i`, typesMli], [namesOut, namesText]] as const) {
    if (readFileSync(file, "utf8") !== want) {
      console.error(`${file} is not what Kobalte's types give: run make generate`);
      process.exit(1);
    }
  }
} else {
  writeFileSync(out, text);
  writeFileSync(`${out}i`, textMli);
  writeFileSync(typesOut, typesText);
  writeFileSync(`${typesOut}i`, typesMli);
  writeFileSync(namesOut, namesText);
}
