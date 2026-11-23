// The OCaml type of a TypeScript one, by AGENTS.md's "Kobalte's binding is
// generated from its declarations"; null where no rule maps it.

import ts from "typescript";
import { DATA, isDomLib, moduleOf, named, readable, value, type Binding, type Named } from "./library.ts";
import { domType, isString, isTag } from "./melange.ts";
import { snake } from "./names.ts";
import { apply, isArrow, name as tname, paren, print, vars as typeVarsOf, type Param, type Type } from "./ocaml.ts";

export type Vars = Map<string, Type>;

// Which way a value being mapped crosses: given to JavaScript, as a prop is;
// read from it, as a function's result is; or both, as a field its object's
// constructor takes and its getter reads. A function's parameters cross the
// other way to the function itself.
export type Polarity = "given" | "read" | "both";
const flip = (p: Polarity): Polarity => (p === "given" ? "read" : p === "read" ? "given" : "both");

// [path] names a type with no name of its own: a parameter's is its
// function's path and its own name.
export type At = { vars: Vars; where: string; polarity: Polarity; path?: string };
const pathOf = (at: At) => at.path ?? at.where;

export type Arrow = Extract<Type, { kind: "arrow" }>;

export const jsxElement = tname("Solidtype.Jsx.element");
export const unit = tname("unit");
export const unknown: Type = { kind: "unknown" };
export const isUnit = (t: Type) => t.kind === "name" && t.name === "unit";
const either = (left: Type, right: Type): Type => ({ kind: "ref", module: "Either", args: [left, right] });

// A type as each file names it: inside Types, where the types refer to one
// another, a named type is its flat name; outside, its module's t.
export const flatName = (module: string) => `t_${snake(module)}`;

export function typeVar(name: string, vars: Vars): Type {
  let v = vars.get(name);
  if (!v) {
    v = { kind: "var", name: snake(name) };
    vars.set(name, v);
  }
  return v;
}

// Whether a parameter may be left out: optional, or with a default, but not
// a rest of them.
export function leftOut(q: ts.Symbol): boolean {
  const d = q.valueDeclaration;
  return !!d && ts.isParameter(d) && !d.dotDotDotToken && (d.questionToken !== undefined || d.initializer !== undefined);
}

// Whether reading a member gives a type variable that neither its module nor
// its own arguments fix: a value whose type its caller would choose, an
// unchecked cast, so it is not read. A variable an argument fixes, a generic
// function's, is the function's own.
export function unbound(t: Type, params: string[]): boolean {
  const fixed = new Set([...params, ...(isArrow(t) ? t.params.flatMap((p) => typeVarsOf(p.type)) : [])]);
  return typeVarsOf(isArrow(t) ? t.result : t).some((v) => !fixed.has(v));
}

export type Mapping = ReturnType<typeof mapping>;

export function mapping(b: Binding) {
  const { checker, library } = b;

  const naming = (name: (module: string) => string) => (module: string) => {
    if (module === "Unknown") b.namesUnknown = true;
    return name(module);
  };
  const inside = naming((module) => (module === "Either" ? "either" : flatName(module)));
  const outside = naming((module) => `Types.${module}.t`);
  const showIn = (t: Type) => print(t, inside);
  const argIn = (t: Type) => paren(t, inside);
  const showOut = (t: Type) => print(t, outside);
  const argOut = (t: Type) => paren(t, outside);
  const givenIn = (t: Type) => paren(t, inside, false);
  const givenOut = (t: Type) => print(t, outside, false);
  const givenArgOut = (t: Type) => paren(t, outside, false);

  const isElement = (t: ts.Type) => t.aliasSymbol?.name === "Element" && moduleOf(t.aliasSymbol) === "solid-js";

  // A type parameter bound by a DOM element, the element a hook is given, is
  // any element, as solidtype's own functions of an element take one: Html
  // types an element Melange has no type for, a <ul>, as Dom.element.
  function elementBound(t: ts.Type, vars: Vars): Type | null {
    const c = checker.getBaseConstraintOfType(t);
    const symbol = c?.getSymbol();
    const dom = symbol && isDomLib(symbol) ? domType(symbol.name) : null;
    return dom ? apply("Dom.element_like", typeVar(t.symbol?.name ?? "t", vars)) : null;
  }

  // TypeScript's null: given, `T | null` is Js.Null.t, which cannot hold the
  // undefined a library reads as no value given, so an option is made one
  // only by Js.Null.fromOption, whose None is null; read, or `T | null |
  // undefined` given, it is Js.Nullable.t, which takes whatever JavaScript
  // holds.
  const nullOf = (polarity: Polarity, undefinable: boolean) =>
    polarity === "given" && !undefinable ? "Js.Null.t" : "Js.Nullable.t";

  // [absent] drops undefined, which an optional prop's absence already says;
  // anywhere else -- a callback's argument, a result -- it is an option.
  function map(t: ts.Type, at: At, absent = false): Type | null {
    const { vars } = at;
    if (t.flags & ts.TypeFlags.TypeParameter) return elementBound(t, vars) ?? typeVar(t.symbol?.name ?? "t", vars);
    const hand = portedType(t, at, absent);
    if (hand) return hand;
    if (isElement(t)) return jsxElement;
    // Exclude<Option, null> and its kind: the type it narrows.
    if (t.flags & ts.TypeFlags.Conditional) return map((t as ts.ConditionalType).checkType, at);
    if (t.flags & ts.TypeFlags.Substitution) return map((t as ts.SubstitutionType).baseType, at);
    if (t.flags & ts.TypeFlags.Any && vars.has(DATA)) return vars.get(DATA)!;
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
      const inner = mapUnion(members, at);
      if (!inner) return null;
      const value = nullable ? apply(nullOf(at.polarity, undefinable && !absent), inner) : inner;
      return undefinable && !absent && !isJsx && !isUnit(inner) && !nullable ? apply("option", value) : value;
    }
    return mapUnion([t], at);
  }

  // Solid's JSX.Element is a union, which TypeScript inlines into a union it
  // is part of; its members together are one element.
  const isJsxMember = (t: ts.Type) => {
    const s = t.getSymbol();
    return s !== undefined && (s.name === "ArrayElement" || s.name === "Node") &&
      (moduleOf(s) === "solid-js" || isDomLib(s));
  };

  const number = (where: string) => tname(library.whole?.(where) ? "int" : "float");

  // A class of the library's kinds, by its kind: CalendarDate's
  // calendar_date.
  const kindOf = (symbol: ts.Symbol | undefined) =>
    symbol && library.kinds?.classes.includes(symbol) ? snake(symbol.name) : null;

  // The kinds a union of the classes is, or a structural interface of
  // theirs: those of the classes TypeScript takes for it.
  function kindsOf(members: ts.Type[]): Type | null {
    const k = library.kinds;
    if (!k) return null;
    const tags = members.map((m) => kindOf(m.getSymbol()));
    if (members.length > 1 && tags.every((t) => t !== null)) return { kind: "kinds", tags: (tags as string[]).sort() };
    const only = members.length === 1 ? members[0]!.getSymbol() : undefined;
    if (only && k.structural.includes(only)) {
      const taken = k.classes.filter((c) => checker.isTypeAssignableTo(checker.getDeclaredTypeOfSymbol(c), members[0]!));
      if (taken.length > 0) return { kind: "kinds", tags: taken.map((c) => snake(c.name)).sort() };
    }
    return null;
  }

  function mapUnion(members: ts.Type[], at: At): Type | null {
    const { vars, where } = at;
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
      const others = mapUnion(rest, at);
      return others ? either(jsxElement, others) : null;
    }
    if (members.some(isString)) {
      const others = members.filter((m) => !isString(m) && !m.isStringLiteral());
      if (others.length === 0) return tname("string");
      // A string beside a function of the caller's data names a field of it,
      // which OCaml cannot check: the function is taken alone, as an option
      // accessor's key is.
      const ofData = others.filter((m) => m.getCallSignatures().some((c) => c.getParameters().some((q) => checker.getTypeOfSymbol(q).flags & ts.TypeFlags.Any)));
      if (vars.has(DATA) && ofData.length > 0) return mapUnion(others, at);
    }
    const booleans = members.filter((m) => m.flags & ts.TypeFlags.BooleanLike);
    if (booleans.length === members.length) return tname("bool");
    const strings = members.filter((m) => m.isStringLiteral()).map((m) => (m as ts.StringLiteralType).value);
    if (strings.length === members.length) {
      return strings.every(isTag) ? { kind: "tags", tags: strings } : tname("string");
    }
    if (members.every((m) => m.flags & ts.TypeFlags.NumberLike)) return number(where);
    const kinded = kindsOf(members);
    if (kinded) return kinded;
    if (members.length === 1) return mapOne(members[0]!, at);
    // Literals beside other kinds are one member, their own set of tags.
    const literals = members.filter((m) => m.isStringLiteral());
    if (literals.length > 0 && literals.length < members.length) {
      const rest = members.filter((m) => !m.isStringLiteral());
      const tags = mapUnion(literals, at);
      const others = mapUnion(rest, at);
      return tags && others ? either(tags, others) : null;
    }
    // Members of different JavaScript kinds: a type whose values are each
    // member as it is, built by a conversion per member.
    const kinds = members.map((m) => mapOne(m, at));
    if (kinds.some((k) => k === null)) return null;
    const distinct = [...new Map((kinds as Type[]).map((k) => [showIn(k), k])).values()];
    if (distinct.length === 1) return distinct[0]!;
    if (distinct.length === 2) return either(distinct[0]!, distinct[1]!);
    return null;
  }

  // A type the library ports by hand, by its alias or its own name: an
  // alias's arguments are its own, an interface's or a class's its
  // reference's.
  function portedType(t: ts.Type, at: At, absent: boolean): Type | null {
    const symbol = t.aliasSymbol ?? t.getSymbol();
    if (!library.ported || !symbol) return null;
    const given = (t.aliasSymbol ? t.aliasTypeArguments : (t as ts.TypeReference).typeArguments) ?? [];
    const args = given.map((a) => map(a, at) ?? unknown);
    return library.ported(symbol, args, absent) ?? null;
  }

  // A ref is Solid's: given an element or a function of one, it calls the
  // function with the element its part draws, so it is that function, as an
  // element's ref and Solid's Portal's are, of the element it declares; one
  // declared as any of several, a portal's div or g, is any element.
  function refOf(t: ts.Type, at: At): Type {
    const fn = (t.isUnion() ? t.types : [t]).find((m) => m.getCallSignatures().length > 0);
    const param = fn?.getCallSignatures()[0]?.parameters[0];
    const inElement = { ...at, where: `${at.where}(element)` };
    // Any of several is not mapped at all: mapping it would make a module of
    // each, which nothing names.
    const declared = param ? checker.getTypeOfSymbol(param) : undefined;
    const element = declared && !declared.isUnion() ? map(declared, inElement, false) : null;
    b.unmapped.delete(inElement.where);
    return { kind: "arrow", params: [{ type: element ?? tname("Dom.element") }], result: tname("unit") };
  }

  // A property's or a parameter's type as its declaration names it, where
  // that is a type the library ports by hand: an optional one's type, made a
  // union with undefined, has lost the alias it was declared by.
  function declaredPorted(p: ts.Symbol, at: At, absent: boolean): Type | null {
    const d = p.valueDeclaration;
    const node = d && (ts.isPropertySignature(d) || ts.isPropertyDeclaration(d) || ts.isParameter(d)) ? d.type : undefined;
    return node && ts.isTypeReferenceNode(node) ? portedType(checker.getTypeFromTypeNode(node), at, absent) : null;
  }

  // A function of several signatures is its first where OCaml calls it,
  // since each is true of it and TypeScript tries them in order; one given
  // to JavaScript would have to be all of them, which no one OCaml function
  // is, so it is not bound.
  const mustBeAll = (calls: readonly ts.Signature[], at: At) => calls.length > 1 && at.polarity !== "read";

  function mapOne(t: ts.Type, at: At): Type | null {
    const { vars, where } = at;
    if (t.isUnion() || isElement(t) || t.flags & (ts.TypeFlags.Conditional | ts.TypeFlags.Substitution))
      return map(t, at);
    const hand = portedType(t, at, false);
    if (hand) return hand;
    if (t.flags & ts.TypeFlags.TypeParameter) return elementBound(t, vars) ?? typeVar(t.symbol?.name ?? "t", vars);
    if (t.flags & ts.TypeFlags.Index) return tname("string");
    if (checker.isTupleType(t)) {
      const items = checker.getTypeArguments(t as ts.TypeReference).map((a) => map(a, at));
      return items.some((i) => i === null) ? null : { kind: "tuple", items: items as Type[] };
    }
    if (isString(t) || t.isStringLiteral()) return tname("string");
    if (t.flags & ts.TypeFlags.BooleanLike) return tname("bool");
    if (t.flags & ts.TypeFlags.NumberLike) return number(where);
    if (t.flags & ts.TypeFlags.BigIntLike) return tname("Js.Bigint.t");
    if (t.flags & (ts.TypeFlags.Void | ts.TypeFlags.Undefined)) return unit;
    if (t.flags & ts.TypeFlags.Any && vars.has(DATA)) return vars.get(DATA)!;
    if (t.flags & (ts.TypeFlags.Any | ts.TypeFlags.Unknown | ts.TypeFlags.Never | ts.TypeFlags.Null)) return null;
    const libraryAlias = t.aliasSymbol && isDomLib(t.aliasSymbol);
    if (libraryAlias && t.aliasSymbol!.name === "NonNullable" && t.aliasTypeArguments?.[0])
      return map(t.aliasTypeArguments[0], at);
    // Required<ThemeValues>: a type of its own, whose every field is there,
    // named for both.
    const required = libraryAlias && t.aliasSymbol!.name === "Required" ? t.aliasTypeArguments?.[0] : undefined;
    const requiredName = required && (required.aliasSymbol ?? required.getSymbol())?.name;
    if (requiredName && named(requiredName)) return reference(b.anonymousModule(t, `Required${requiredName}`), t, undefined, at);
    const path = pathOf(at);
    // A standard alias -- Partial, Omit -- is the type it makes.
    const alias = libraryAlias ? undefined : t.aliasSymbol;
    // A type of one argument, the argument mapped.
    const of = (n: string, arg: ts.Type | undefined) => {
      const a = arg ? map(arg, at) : null;
      return a ? apply(n, a) : null;
    };
    if (alias?.name === "Accessor") return of("Solidtype.Solid.accessor", t.aliasTypeArguments?.[0]);
    if (alias?.name === "Setter") return of("Solidtype.Solid.setter", t.aliasTypeArguments?.[0]);
    const symbol = t.getSymbol();
    const name = symbol?.name ?? "";
    if (name === "Element" && moduleOf(symbol!) === "solid-js") return jsxElement;
    if (alias?.name === "Element" || /JSX\.Element/.test(checker.typeToString(t, undefined, ts.TypeFormatFlags.NoTruncation))) return jsxElement;
    if (checker.isArrayType(t)) return of("array", checker.getTypeArguments(t as ts.TypeReference)[0]);
    if (name === "Set" && symbol && isDomLib(symbol)) return of("Js.Set.t", checker.getTypeArguments(t as ts.TypeReference)[0]);
    if (name === "Iterable") {
      return of("array", (t as ts.TypeReference).typeArguments?.[0] ?? checker.getTypeArguments(t as ts.TypeReference)[0]);
    }
    if (symbol && isDomLib(symbol)) {
      if (name === "Date") return tname("Js.Date.t");
      if (name === "RegExp") return tname("Js.Re.t");
      if (name === "Map") {
        const [k, v] = checker.getTypeArguments(t as ts.TypeReference).map((a) => map(a, at));
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
      if (declared && named(name) && !name.startsWith("__") && !readable.has(name)) return { kind: "ref", module: b.opaque(name), args: [] };
      if (!readable.has(name)) {
        const calls = t.getCallSignatures();
        return calls.length > 0 && t.getProperties().length === 0 && !mustBeAll(calls, at) ? mapFunction(calls[0]!, at) : null;
      }
    }
    const calls = t.getCallSignatures();
    if (mustBeAll(calls, at)) return null;
    if (calls.length > 0 && t.getProperties().length === 0) return mapFunction(calls[0]!, at);
    if (calls.length > 0 && name === "Component") {
      // A component prop: a function from the props Kobalte gives it.
      return mapFunction(calls[0]!, at);
    }
    const anonymous = !symbol || symbol.name === "__type" || symbol.name === "__object";
    // Solid's handler argument, an event with its current target and target
    // named, is the event, as an element's handler in Html takes it.
    if (t.isIntersection()) {
      const event = t.types.find((m) => {
        const e = m.getSymbol();
        return e !== undefined && isDomLib(e) && /Event$/.test(e.name);
      });
      const targets = t.types.filter((m) => m !== event);
      if (event && targets.every((m) => checker.getPropertiesOfType(m).every((p) => p.name === "currentTarget" || p.name === "target"))) {
        return mapOne(event, at);
      }
    }
    if (t.isIntersection()) {
      // Its own members are the module's; a standard member is a conversion.
      const standard = t.types.filter((m) => m.getSymbol() && isDomLib(m.getSymbol()!));
      const own = t.types.filter((m) => !standard.includes(m) && m.getProperties().length > 0);
      if (own.length === 0) return standard[0] ? mapOne(standard[0], at) : null;
      const n = alias ? b.namedModule(alias, t) : b.anonymousModule(t, path);
      const ref = reference(n, t, alias, at);
      if (n.conversions.length === 0) {
        for (const m of standard) {
          const d = mapOne(m, at);
          if (d?.kind === "name" && d.name.startsWith("Dom.")) n.conversions.push(d.name);
        }
      }
      return ref;
    }
    if (anonymous && t.getProperties().length > 0) {
      const n = alias ? b.namedModule(alias, t) : b.anonymousModule(t, path);
      return reference(n, t, alias, at);
    }
    if (symbol && (symbol.flags & (ts.SymbolFlags.Interface | ts.SymbolFlags.Class | ts.SymbolFlags.TypeLiteral | ts.SymbolFlags.TypeAlias))) {
      const owner = alias ?? symbol;
      return reference(b.namedModule(owner, t), t, alias, at);
    }
    return null;
  }

  // A named type's reference, its type arguments applied, one it cannot map
  // unknown.
  function reference(n: Named, t: ts.Type, alias: ts.Symbol | undefined, at: At): Type {
    const args = (alias ? t.aliasTypeArguments : (t as ts.TypeReference).typeArguments) ?? [];
    return { kind: "ref", module: n.module, args: n.params.map((_, i) => (args[i] ? map(args[i]!, at) : null) ?? unknown) };
  }

  // A function's OCaml type. [labelled], for a function the user calls, an
  // external, writes a parameter that may be left out as an optional
  // argument, ?name, followed by unit, as the stdlib does; a function
  // JavaScript calls takes its arguments by position, so there it is an
  // option.
  function mapFunction(sig: ts.Signature, at: At, labelled = false): Arrow | null {
    const ps = sig.getParameters();
    const params: (Param | null)[] = ps.map((q) => {
      const crossed = { ...at, polarity: flip(at.polarity), path: `${pathOf(at)}.${q.name}` };
      const optional = labelled && leftOut(q);
      const t = checker.getTypeOfSymbol(q);
      const m = declaredPorted(q, crossed, optional) ?? map(optional ? checker.getNonNullableType(t) : t, crossed);
      if (m === null) return null;
      // A function of several arguments the user gives: an OCaml function's
      // type does not say whether it takes them at once, so Melange is told
      // to pass it so; it does that for no optional argument, so one left
      // out is not bound.
      const several = labelled && isArrow(m) && m.params.length > 1;
      if (several && optional) return null;
      if (several) return { type: m, uncurry: true };
      return optional ? { label: value(snake(q.name)), optional: true, type: m } : { type: m };
    });
    if (params.some((p) => p === null)) return null;
    // What a function JavaScript calls gives back as any, JavaScript ignores.
    const returned = sig.getReturnType();
    const result = !labelled && returned.flags & ts.TypeFlags.Any ? unit : map(returned, at);
    if (!result) return null;
    const args = params.length === 0 ? [{ type: unit }] : (params as Param[]);
    if (labelled && ps.some(leftOut)) args.push({ type: unit });
    return { kind: "arrow", params: args, result };
  }

  return { map, mapFunction, refOf, declaredPorted, kindOf, showIn, argIn, showOut, argOut, givenIn, givenOut, givenArgOut };
}
