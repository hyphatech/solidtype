// The core of a generated binding: a TypeScript library of Solid components,
// read with TypeScript's checker and written as OCaml for Melange -- each type
// mapped, each part a component and its props check, each function and value
// an external, and the types they name, each a module of Types. What is one
// library's own -- which entries it binds, how its parts and their options are
// named -- is its generator's, which binds it once, by bind, and calls these.

import ts from "typescript";
import { readFileSync } from "node:fs";
import { keywords, label, record, snake } from "./names.ts";
import { domType, isString, isTag } from "./melange.ts";
import { apply, isArrow, name as tname, paren, print, vars as typeVarsOf, type Param, type Type } from "./ocaml.ts";
import { Source } from "./source.ts";

export type Library = {
  // Its name, as its odoc says it: Kobalte.
  name: string;
  // Whether a function throws though its documentation does not say so, by
  // its module and name: Color.toFormat.
  throwsUndocumented: (where: string) => boolean;
};

// What a run binds: one library, read by one checker, from the repository at
// root. A generator binds one library and then exits, so it is set once.
let root: string;
let checker: ts.TypeChecker;
let library: Library;

export function bind(repository: string, typeChecker: ts.TypeChecker, bound: Library): void {
  root = repository;
  checker = typeChecker;
  library = bound;
  htmlModules = readHtmlModules();
  attributeNames = readAttributeNames();
}

// What a run has not bound, by where it was met, and each name a user writes
// with its JavaScript name, for the ppx's table.
export const unmapped = new Map<string, string>();
export const names = new Map<string, string>();

// Read once a run has begun: solidtype's Html, as the build has it.
const html = () => readFileSync(`${root}src/html.mli`, "utf8");

// The elements solidtype's Html has a module for.
let htmlModules: Set<string>;
const readHtmlModules = () => new Set(
  html().match(/^module [A-Z][A-Za-z0-9]* :/gm)?.map((m) => m.slice(7, -2)) ?? [],
);


export const value = (name: string) => (keywords.has(name) ? `${name}_` : name);
export const named = (name: string) => /^[A-Za-z_][A-Za-z0-9_]*$/.test(name);


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

type Vars = Map<string, Type>;

function typeVar(name: string, vars: Vars): Type {
  let v = vars.get(name);
  if (!v) {
    v = { kind: "var", name: snake(name) };
    vars.set(name, v);
  }
  return v;
}

// A declaration of a name already bound that TypeScript takes for it both
// ways -- @internationalized/number's NumberFormatOptions, which extends
// Intl's with a member Intl's has -- is that type, so a value of one is
// passed where the other is asked.
function sameAs(symbol: ts.Symbol, type: ts.Type): Named | undefined {
  for (const n of types.values()) {
    if (n.symbol?.name === symbol.name && n.params.length === 0
        && checker.isTypeAssignableTo(type, n.type) && checker.isTypeAssignableTo(n.type, type)) return n;
  }
  return undefined;
}

function namedModule(symbol: ts.Symbol, type: ts.Type): Named {
  let n = types.get(symbol) ?? sameAs(symbol, type);
  if (n) types.set(symbol, n);
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
  "Collator", "NumberFormat", "DateTimeFormat", "DateTimeFormatPart",
]);
const opaques = new Set<string>();
function opaque(name: string): string {
  opaques.add(name);
  return name;
}

const isElement = (t: ts.Type) => t.aliasSymbol?.name === "Element" && moduleOf(t.aliasSymbol) === "solid-js";

// [absent] drops undefined, which an optional prop's absence already says;
// anywhere else -- a callback's argument, a result -- it is an option.
// The OCaml type of a TypeScript one, by AGENTS.md's "Kobalte's binding is
// generated from its declarations"; null when none of its mappings covers it.
function map(t: ts.Type, vars: Vars, where: string, absent = false): Type | null {
  if (t.flags & ts.TypeFlags.TypeParameter) return typeVar(t.symbol?.name ?? "t", vars);
  if (isElement(t)) return jsxElement;
  // Exclude<Option, null> and its kind: the type it narrows.
  if (t.flags & ts.TypeFlags.Conditional) return map((t as ts.ConditionalType).checkType, vars, where);
  if (t.flags & ts.TypeFlags.Substitution) return map((t as ts.SubstitutionType).baseType, vars, where);
  if (t.flags & (ts.TypeFlags.Any | ts.TypeFlags.Unknown | ts.TypeFlags.Never)) return null;
  if (t.flags & ts.TypeFlags.Void) return unit;
  if (t.flags & ts.TypeFlags.Undefined) return unit;
  if (t.isUnion()) {
    const undefinable = t.types.some((m) => m.flags & ts.TypeFlags.Undefined);
    let members = t.types.filter((m) => !(m.flags & ts.TypeFlags.Undefined));
    // An accessor that takes a key or a function takes the function alone;
    // one that takes only a key, Select's optionGroupChildren, takes its
    // name, which OCaml cannot check.
    const keys = members.filter((m) => m.flags & ts.TypeFlags.Index);
    members = members.filter((m) => !(m.flags & ts.TypeFlags.Index));
    if (members.length === 0 && keys.length > 0) return tname("string");
    // Solid's element, inlined, holds null and undefined of its own.
    const isJsx = members.some((m) => m.getSymbol()?.name === "ArrayElement" && moduleOf(m.getSymbol()!) === "solid-js");
    const nullable = !isJsx && members.some((m) => m.flags & ts.TypeFlags.Null);
    if (!isJsx) members = members.filter((m) => !(m.flags & ts.TypeFlags.Null));
    const inner = mapUnion(members, vars, where);
    if (!inner) return null;
    const value = nullable ? apply("Js.Nullable.t", inner) : inner;
    return undefinable && !absent && !isJsx && !isUnit(inner) && !nullable ? apply("option", value) : value;
  }
  return mapUnion([t], vars, where);
}

const jsxElement = tname("Solidtype.Jsx.element");
const unit = tname("unit");
const isUnit = (t: Type) => t.kind === "name" && t.name === "unit";
const either = (left: Type, right: Type): Type => ({ kind: "ref", module: "Either", args: [left, right] });

// A type as each file names it: inside Types, where the types refer to one
// another, a named type is its flat name; outside, its module's t.
const flatName = (module: string) => `t_${snake(module)}`;
const inside = (module: string) => (module === "Either" ? "either" : flatName(module));
const outside = (module: string) => `Types.${module}.t`;
const showIn = (t: Type) => print(t, inside);
const argIn = (t: Type) => paren(t, inside);
const showOut = (t: Type) => print(t, outside);
const argOut = (t: Type) => paren(t, outside);

// Solid's JSX.Element is a union, which TypeScript inlines into a union it is
// part of; its members together are one element.
const isJsxMember = (t: ts.Type) => {
  const s = t.getSymbol();
  return s !== undefined && (s.name === "ArrayElement" || s.name === "Node") &&
    (moduleOf(s) === "solid-js" || isDomLib(s));
};

function mapUnion(members: ts.Type[], vars: Vars, where: string): Type | null {
  if (members.length === 0) return unit;
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
    if (rest.length === 0) return jsxElement;
    const others = mapUnion(rest, vars, where);
    return others ? either(jsxElement, others) : null;
  }
  if (members.some(isString)) {
    const others = members.filter((m) => !isString(m) && !m.isStringLiteral());
    if (others.length === 0) return tname("string");
  }
  const booleans = members.filter((m) => m.flags & ts.TypeFlags.BooleanLike);
  if (booleans.length === members.length) return tname("bool");
  const strings = members.filter((m) => m.isStringLiteral()).map((m) => (m as ts.StringLiteralType).value);
  if (strings.length === members.length) {
    return strings.every(isTag) ? { kind: "tags", tags: strings } : tname("string");
  }
  if (members.every((m) => m.flags & ts.TypeFlags.NumberLike)) return tname("float");
  if (members.length === 1) return mapOne(members[0]!, vars, where);
  // Literals beside other kinds are one member, their own set of tags.
  const literals = members.filter((m) => m.isStringLiteral());
  if (literals.length > 0 && literals.length < members.length) {
    const rest = members.filter((m) => !m.isStringLiteral());
    const tags = mapUnion(literals, vars, where);
    const others = mapUnion(rest, vars, where);
    return tags && others ? either(tags, others) : null;
  }
  // Members of different JavaScript kinds: a type whose values are each
  // member as it is, built by a conversion per member.
  const kinds = members.map((m) => mapOne(m, vars, where));
  if (kinds.some((k) => k === null)) return null;
  const distinct = [...new Map((kinds as Type[]).map((k) => [showIn(k), k])).values()];
  if (distinct.length === 1) return distinct[0]!;
  if (distinct.length === 2) return either(distinct[0]!, distinct[1]!);
  return null;
}

function mapOne(t: ts.Type, vars: Vars, where: string): Type | null {
  if (t.isUnion() || isElement(t) || t.flags & (ts.TypeFlags.Conditional | ts.TypeFlags.Substitution))
    return map(t, vars, where);
  if (t.flags & ts.TypeFlags.TypeParameter) return typeVar(t.symbol?.name ?? "t", vars);
  if (t.flags & ts.TypeFlags.Index) return tname("string");
  if (checker.isTupleType(t)) {
    const items = checker.getTypeArguments(t as ts.TypeReference).map((a) => map(a, vars, where));
    return items.some((i) => i === null) ? null : { kind: "tuple", items: items as Type[] };
  }
  if (isString(t) || t.isStringLiteral()) return tname("string");
  if (t.flags & ts.TypeFlags.BooleanLike) return tname("bool");
  if (t.flags & ts.TypeFlags.NumberLike) return tname("float");
  if (t.flags & (ts.TypeFlags.Void | ts.TypeFlags.Undefined)) return unit;
  if (t.flags & (ts.TypeFlags.Any | ts.TypeFlags.Unknown | ts.TypeFlags.Never | ts.TypeFlags.Null)) return null;
  const libraryAlias = t.aliasSymbol && isDomLib(t.aliasSymbol);
  if (libraryAlias && t.aliasSymbol!.name === "NonNullable" && t.aliasTypeArguments?.[0])
    return map(t.aliasTypeArguments[0], vars, where);
  // A standard alias -- Partial, Omit -- is the type it makes.
  const alias = libraryAlias ? undefined : t.aliasSymbol;
  // A type of one argument, the argument mapped.
  const of = (n: string, arg: ts.Type | undefined) => {
    const a = arg ? map(arg, vars, where) : null;
    return a ? apply(n, a) : null;
  };
  if (alias?.name === "Accessor") return of("Solidtype.Solid.accessor", t.aliasTypeArguments?.[0]);
  if (alias?.name === "Setter") return of("Solidtype.Solid.setter", t.aliasTypeArguments?.[0]);
  const symbol = t.getSymbol();
  const name = symbol?.name ?? "";
  if (name === "Element" && moduleOf(symbol!) === "solid-js") return jsxElement;
  if (alias?.name === "Element" || /JSX\.Element/.test(checker.typeToString(t))) return jsxElement;
  if (checker.isArrayType(t)) return of("array", checker.getTypeArguments(t as ts.TypeReference)[0]);
  if (name === "Set" && symbol && isDomLib(symbol)) return of("Js.Set.t", checker.getTypeArguments(t as ts.TypeReference)[0]);
  if (name === "Iterable") {
    return of("array", (t as ts.TypeReference).typeArguments?.[0] ?? checker.getTypeArguments(t as ts.TypeReference)[0]);
  }
  if (symbol && isDomLib(symbol)) {
    if (name === "Date") return tname("Js.Date.t");
    if (name === "RegExp") return tname("Js.Re.t");
    if (name === "Map") {
      const [k, v] = checker.getTypeArguments(t as ts.TypeReference).map((a) => map(a, vars, where));
      return k && v ? apply("Js.Map.t", k, v) : null;
    }
    if (name === "Promise") return of("Js.Promise.t", checker.getTypeArguments(t as ts.TypeReference)[0]);
    // An interface or a class named for an event or an element is one, but
    // never a method that happens to be named so, initEvent.
    const kind = symbol.flags & (ts.SymbolFlags.Interface | ts.SymbolFlags.Class);
    const dom = domType(name) ?? (kind && /Event$/.test(name) ? "Dom.event" : kind && /Element$/.test(name) ? "Dom.element" : null);
    if (dom) return tname(dom);
    // A standard interface is opaque but for those a user builds or reads;
    // anything else of the standard library is a function or not bound.
    const declared = symbol.flags & (ts.SymbolFlags.Interface | ts.SymbolFlags.Class);
    if (declared && named(name) && !name.startsWith("__") && !readable.has(name)) return { kind: "ref", module: opaque(name), args: [] };
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
        if (d?.kind === "name" && d.name.startsWith("Dom.")) n.conversions.push(d.name);
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

// A named type's reference, its type arguments applied, one it cannot map
// left to the compiler, _.
function reference(n: Named, t: ts.Type, alias: ts.Symbol | undefined, vars: Vars, where: string): Type {
  const args = (alias ? t.aliasTypeArguments : (t as ts.TypeReference).typeArguments) ?? [];
  return { kind: "ref", module: n.module, args: n.params.map((_, i) => (args[i] ? map(args[i]!, vars, where) : null) ?? tname("_")) };
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
function mapFunction(sig: ts.Signature, vars: Vars, where: string, labelled = false): Extract<Type, { kind: "arrow" }> | null {
  const ps = sig.getParameters();
  const params: (Param | null)[] = ps.map((q) => {
    const optional = labelled && leftOut(q);
    const t = checker.getTypeOfSymbol(q);
    const m = map(optional ? checker.getNonNullableType(t) : t, vars, where);
    if (m === null) return null;
    return optional ? { label: value(snake(q.name)), optional: true, type: m } : { type: m };
  });
  if (params.some((p) => p === null)) return null;
  const result = map(sig.getReturnType(), vars, where);
  if (!result) return null;
  const args = params.length === 0 ? [{ type: unit }] : (params as Param[]);
  if (labelled && ps.some(leftOut)) args.push({ type: unit });
  return { kind: "arrow", params: args, result };
}

// Whether reading a member gives a type variable that neither its module nor
// its own arguments fix: a value whose type its caller would choose, an
// unchecked cast, so it is not read. A variable an argument fixes, a generic
// function's, is the function's own.
function unbound(t: Type, params: string[]): boolean {
  const fixed = new Set([...params, ...(isArrow(t) ? t.params.flatMap((p) => typeVarsOf(p.type)) : [])]);
  return typeVarsOf(isArrow(t) ? t.result : t).some((v) => !fixed.has(v));
}

// Every attribute any element has, from Html: a CommonProps member that is
// none of them, Search.Indicator's loadingComponent, is the part's own.
let attributeNames: Set<string>;
const readAttributeNames = () => new Set(
  html().match(/^  type [A-Za-z_0-9]+ =/gm)?.map((t) => t.slice(7, -2)) ?? [],
);

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

// One part's binding, its component [js] from [jsModule] and its props
// check -- its options, a spread, then its children, then its element's
// attributes --
// [where] naming it in what is not bound. [extra] are props of its own its
// options do not hold, a library's shared props that are no attribute.
export function part(src: Source, jsModule: string, where: string, decl: ts.SignatureDeclaration, options: ts.Type | null, extra: ts.Symbol[], js: string): void {
  const vars: Vars = new Map();
  const tp = decl.typeParameters?.find((p) => p.default && /ValidComponent/.test(p.constraint?.getText() ?? ""));
  const polymorphic = tp?.default && ts.isLiteralTypeNode(tp.default) ? (tp.default.literal as ts.StringLiteral).text : null;
  // A part that is not polymorphic renders the element its props extend,
  // ComponentProps<"input">, and its options are that interface's own.
  const fixed = polymorphic ? null : fixedElement(decl);
  const element = polymorphic ?? fixed?.element ?? null;
  const commons = extra.filter((p) => !attributeNames.has(label(p.name)));
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
      const render = t.kind === "ref" && t.module === "Either" && showOut(t.args[0]!) === showOut(jsxElement) ? t.args[1] : undefined;
      const q = optional ? "?" : "";
      children = render
        ? `${q}children:(${showOut(render)}, [ \`nodes | \`render ]) Solidtype.Check.children ->`
        : isArrow(t)
          ? `${q}children:(${showOut(t)}, [ \`render ]) Solidtype.Check.children ->`
          : `${q}children:('f, [ \`nodes ]) Solidtype.Check.children ->`;
      continue;
    }
    const name = record(names, p.name);
    const checked = isArrow(t) ? `(${showOut(t)})` : `${argOut(t)} Solidtype.Check.value`;
    args.push(`${optional ? "?" : ""}${name}:${checked} ->`);
  }
  // A spread, props=p, as TSX's {...p}: the rest of a component's props
  // passed on, its data- attributes, which any part takes.
  args.push("?props:'spread Solidtype.Solid.rest ->");
  const html = element ? element.charAt(0).toUpperCase() + element.slice(1) : null;
  const tail = `${children} unit -> unit`;
  const check = html && htmlModules.has(html) ? `(${tail}) Solidtype.Html.${html}.check` : tail;
  src.module("    ", "Props", () =>
    src.both(
      `      external check :`,
      ...args.map((a) => `        ${a}`),
      `        ${check} = "check"`,
      `      [@@mel.module "vite-plugin-solidtype/markers"]`,
    ),
  );
  src.both(
    ``,
    `    external component : unit Solidtype.Jsx.component = "${js}"`,
    `    [@@mel.module "${jsModule}"]`,
  );
}

// The library's comment on a declaration, as odoc: its documentation is the
// binding's.
export function doc(symbol: ts.Symbol, indent: string, raises = false): string[] {
  const text = ts.displayPartsToString(symbol.getDocumentationComment(checker)).trim();
  const escaped = text.replace(/\*\)/g, "* )").replace(/[{}\[\]@]/g, (c) => `\\${c}`);
  const raise = raises ? `@raise Invalid_argument with ${library.name}'s message, where it throws.` : "";
  const all = [escaped, raise].filter((t) => t !== "").join("\n\n");
  if (!all) return [];
  return [`${indent}(** ${all.split("\n").join(`\n${indent}    `)} *)`];
}

// A function the library documents as throwing, or one it names as throwing
// undocumented: a precondition the caller broke, raised as Invalid_argument
// with the library's message. One at the top of a module reads input from
// outside, so it also has an _opt that gives None for it.
const throws = (symbol: ts.Symbol, where: string) =>
  library.throwsUndocumented(where) || /\bThrows\b/.test(ts.displayPartsToString(symbol.getDocumentationComment(checker)));

// The OCaml function over [js], an external that may throw, of [type],
// written into [src]: [self] its object where it is a method, and [opt]
// whether an _opt is written beside. It takes [sig]'s arguments as the
// external does: by position, and one that may be left out as ?name, then ().
// The interface declares each function, and leaves the external out.
function guarded(src: Source, indent: string, name: string, type: Extract<Type, { kind: "arrow" }>, show: (t: Type) => string, js: string, sig: ts.Signature, self: boolean, opt: boolean): void {
  const ps = sig.getParameters();
  const named = ps.map((q, i) => (leftOut(q) ? `?${value(snake(q.name))}` : `x${i}`));
  if (ps.some(leftOut)) named.push("()");
  const xs = named.length === 0 ? "()" : named.join(" ");
  const args = self ? `o ${xs}` : xs;
  src.implementation(
    `${indent}let ${name} ${args} =`,
    `${indent}  match ${js} ${args} with`,
    `${indent}  | v -> v`,
    `${indent}  | exception Js.Exn.Error e -> invalid_arg ("${name}: " ^ Option.value (Js.Exn.message e) ~default:"")`,
  );
  src.interface(`${indent}val ${name} : ${show(type)}`);
  if (opt) {
    src.implementation(`${indent}let ${name}_opt ${args} = match ${js} ${args} with v -> Some v | exception Js.Exn.Error _ -> None`);
    src.interface(`${indent}val ${name}_opt : ${show({ ...type, result: apply("option", type.result) })}`);
  }
}

export const real = (s: ts.Symbol) => (s.flags & ts.SymbolFlags.Alias ? checker.getAliasedSymbol(s) : s);

// A function the library exports, [jsName] of [jsModule], as an external:
// one that may throw under a wrapper that raises, with an _opt beside it.
export function functionBinding(src: Source, symbol: ts.Symbol, jsName: string, jsModule: string, where: string): void {
  const sig = checker.getSignaturesOfType(checker.getTypeOfSymbol(symbol), ts.SignatureKind.Call)[0];
  const t = sig ? mapFunction(sig, new Map(), where, true) : null;
  if (!t) {
    unmapped.set(where, sig ? checker.signatureToString(sig) : "?");
    return;
  }
  const name = value(snake(jsName));
  if (sig && throws(symbol, jsName)) {
    src.implementation(`  external ${name}_js : ${showOut(t)} = "${jsName}"`, `  [@@mel.module "${jsModule}"]`);
    src.both(...doc(symbol, "  ", true));
    guarded(src, "  ", name, t, showOut, `${name}_js`, sig, false, true);
    src.both(``);
    return;
  }
  src.both(...doc(symbol, "  "));
  src.both(`  external ${name} : ${showOut(t)} = "${jsName}"`, `  [@@mel.module "${jsModule}"]`, ``);
}

// A value the library exports, as an external.
export function valueBinding(src: Source, symbol: ts.Symbol, jsName: string, jsModule: string, where: string): void {
  // A value: toaster, the storage managers, the default translations.
  const vt = checker.getTypeOfSymbol(symbol);
  if (vt.getCallSignatures().length > 0 && vt.getProperties().length > 0) return;
  const t = map(vt, new Map(), where);
  if (!t || typeVarsOf(t).length > 0) {
    unmapped.set(where, checker.typeToString(vt));
    return;
  }
  src.both(`  external ${value(snake(jsName))} : ${showOut(t)} = "${jsName}"`, `  [@@mel.module "${jsModule}"]`, ``);
}

// Types, as its file and its interface: each named type the bindings reached,
// abstract, a getter per property, a method per method, and a constructor
// where it has none and is not a class, under [header], a comment.
export function typesFiles(header: string): { ml: string; mli: string } {
const abstracts: string[] = [];
const done = new Set<ts.Symbol | ts.Type>();
const signatures: Source[] = [];
while (queue.length > 0) {
  const n = queue.shift()!;
  const key = n.symbol ?? n.type;
  if (done.has(key)) continue;
  done.add(key);
  const vars: Vars = new Map();
  const vs = n.params.map((p) => typeVar(p, vars));
  const params = vs.flatMap(typeVarsOf);
  const self: Type = vs.length === 0 ? tname("t") : apply("t", ...vs);
  const t = showIn(self);
  const declared = n.symbol && !(n.symbol.flags & ts.SymbolFlags.TypeAlias) ? checker.getDeclaredTypeOfSymbol(n.symbol) : n.type;
  const flat = showIn(vs.length === 0 ? tname(flatName(n.module)) : apply(flatName(n.module), ...vs));
  abstracts.push(`  type ${flat}`);
  const src = new Source();
  signatures.push(src);
  src.both(...(n.symbol ? doc(n.symbol, "  ") : []));
  src.module("  ", n.module, () => {
    src.both(`    type ${t} = ${flat}`);
    const isClass = n.symbol !== null && (n.symbol.flags & ts.SymbolFlags.Class) !== 0;
    // A standard type is Melange's to bind, but for one a user builds or
    // reads, whose fields, methods and constructor are bound here.
    const library = n.symbol !== null && isDomLib(n.symbol) && !readable.has(n.symbol.name);
    const fields: [string, Type, boolean][] = [];
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
          src.implementation(`    external ${name}_js : ${t} -> ${showIn(f)} = "${p.name}" [@@mel.send]`);
          src.both(...doc(p, "    ", true));
          guarded(src, "    ", name, { ...f, params: [{ type: self }, ...f.params] }, showIn, `${name}_js`, sig, true, false);
          continue;
        }
        src.both(`    external ${name} : ${t} -> ${showIn(f)} = "${p.name}" [@@mel.send]`);
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
        unmapped.set(`${n.module}.${p.name}`, `read as ${showIn(ft)}`);
        continue;
      }
      src.both(...doc(p, "    "));
      const sig = checker.getNonNullableType(pt).getCallSignatures()[0];
      // A function is one the mapping writes as an arrow, not a setter, an
      // accessor or a type of its own that happens to be callable.
      const fn = sig && isArrow(ft) && checker.getNonNullableType(pt).getProperties().length === 0 && !optional
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
          const params = argTypes.length === 0 ? "unit" : argTypes.map((a) => argIn(a ?? tname("_"))).join(" -> ");
          src.implementation(
            `    external ${getter} : ${t} -> (${params} -> (${showIn(result)} [@u]) [@u]) = "${p.name}" [@@mel.get]`,
            `    let ${value(snake(p.name))} o ${args} = let r = (${getter} o) ${args} [@u] in fun ${yargs} -> r ${yargs} [@u]`,
          );
          src.interface(`    val ${value(snake(p.name))} : ${t} -> ${params} -> ${argIn(result)}`);
          shaped.set(p.name, (f) => `(fun ${args} -> let r = ${f} ${args} in fun ${yargs} -> r ${yargs})`);
        } else {
          // Called as a method of the object that holds it: an external is
          // called directly from another library, where a [let] in a nested
          // module goes through Curry, its arity lost.
          src.both(`    external ${value(snake(p.name))} : ${t} -> ${showIn(mapFunction(sig, vars, `${n.module}.${p.name}`, true) ?? fn)} = "${p.name}" [@@mel.send]`);
        }
      } else {
        src.both(`    external ${value(snake(p.name))} : ${t} -> ${optional ? `${argIn(ft)} option` : argIn(ft)} = "${p.name}" [@@mel.get]`);
      }
    }
    // A value Kobalte declares as a DOM node or event, extended, is that value:
    // the conversion only forgets what Kobalte added, so it is %identity, named
    // as the stdlib names a conversion, to_html_div_element.
    for (const d of n.conversions) {
      src.both(`    external to_${snake(d.slice(4))} : ${t} -> ${d} = "%identity"`);
    }
    if (!isClass && !library && methods === 0 && fields.length > 0 && n.conversions.length === 0) {
      const label = ([k, ft, opt]: [string, Type, boolean]) =>
        `${opt ? "?" : ""}${value(snake(k))}:(${argIn(ft)} [@mel.as "${k}"]) ->`;
      if (shaped.size === 0) {
        src.both(`    external make : ${fields.map(label).join(" ")} unit -> ${t} = "" [@@mel.obj]`);
      } else {
        const params = fields.map(([k, , opt]) => `${opt ? "?" : "~"}${value(snake(k))}`);
        const passed = fields.map(([k, , opt]) => {
          const v = value(snake(k));
          const shape = shaped.get(k);
          return opt ? `?${v}` : shape ? `~${v}:${shape(v)}` : `~${v}`;
        });
        src.implementation(
          `    external make_js : ${fields.map(label).join(" ")} unit -> ${t} = "" [@@mel.obj]`,
          `    let make ${params.join(" ")} () = make_js ${passed.join(" ")} ()`,
        );
        const labels = fields.map(([k, ft, opt]) => `${opt ? "?" : ""}${value(snake(k))}:${argIn(ft)} ->`);
        src.interface(`    val make : ${labels.join(" ")} unit -> ${t}`);
      }
    }
    if (isClass && n.symbol?.valueDeclaration) {
      const mod = moduleOf(n.symbol);
      const ctor = checker.getTypeOfSymbolAtLocation(n.symbol, n.symbol.valueDeclaration).getConstructSignatures()[0];
      const f = ctor ? mapFunction(ctor, vars, `${n.module}.constructor`, true) : null;
      if (f && mod) {
        src.both(`    external make : ${showIn({ ...f, result: self })} = "${n.module}" [@@mel.new] [@@mel.module "${mod}"]`);
      }
    }
  });
}

// What Types holds, a module one deep in its own file, as its file or its
// interface writes it.
const opaqueOnly = [...opaques].sort().filter((o) => !moduleNames.has(o));
const typesInner = (lines: (s: Source) => string[], open: (m: string) => string) => `  (* Members of different JavaScript kinds, each as it is. *)
  type ('a, 'b) either
${opaqueOnly.map((o) => `  type ${flatName(o)}`).join("\n")}
${abstracts.join("\n")}

  ${open("Either")}
    type ('a, 'b) t = ('a, 'b) either

    external left : 'a -> ('a, 'b) t = "%identity"
    external right : 'b -> ('a, 'b) t = "%identity"
  end
${opaqueOnly.map((o) => `\n  (* The standard library's ${o}, opaque. *)\n  ${open(o)}\n    type t = ${flatName(o)}\n  end\n`).join("")}
${signatures.map((s) => lines(s).join("\n")).join("\n\n")}`;

const typesFile = (inner: string) => `${header}

${inner.replace(/^  /gm, "")}
`;
return {
  ml: typesFile(typesInner((s) => s.ml, (m) => `module ${m} = struct`)),
  mli: typesFile(typesInner((s) => s.mli, (m) => `module ${m} : sig`)),
};
}
