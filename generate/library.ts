import ts from "typescript";
import { keywords } from "./names.ts";
import type { Type } from "./ocaml.ts";
import { solidHtml } from "./solid_html.ts";

export type Library = {
  // Its name, as its odoc says it: Kobalte.
  name: string;
  // Whether a function throws though its documentation does not say so, by
  // its module and name: Color.toFormat.
  throwsUndocumented: (where: string) => boolean;
  // The OCaml type of a declared type the library's binding ports by hand,
  // by its symbol, its type arguments mapped, and whether undefined is
  // already an optional prop's absence; undefined for any other, which the
  // core maps by its rules.
  ported?: (symbol: ts.Symbol, args: Type[], absent: boolean) => Type | undefined;
  // Whether a number is a small whole one where it is met, by where: an int
  // where the binding knows it fits 32 bits; a float anywhere else.
  whole?: (where: string) => boolean;
  // The classes whose values are one type of Types, Value, a kind each, and
  // the structural interfaces they satisfy: a union of the classes, or one of
  // those interfaces, is the kinds of the classes TypeScript takes for it, an
  // open set, so a value of any of them is passed as it is.
  kinds?: { classes: ts.Symbol[]; structural: ts.Symbol[] };
  // Two types of one name fail the run until each is named here.
  named?: (symbol: ts.Symbol) => string | undefined;
  // By where the core meets it, each with why: a name here that no longer
  // applies fails the run.
  leftOut?: Record<string, string>;
  // Whether an object type's members typed any are the caller's own data,
  // given in and handed back only to the caller's functions: they are one
  // type variable of the type, 'data, never read back out as another.
  data?: (symbol: ts.Symbol) => boolean;
};

// The type variable the caller's data is, in a type whose any is its data.
export const DATA = "Data";

export type Named = {
  module: string;
  symbol: ts.Symbol | null;
  type: ts.Type;
  params: string[];
  // The standard types an intersection is too, each a conversion.
  conversions: string[];
};

export const readable = new Set([
  "File", "DateTimeFormatOptions", "NumberFormatOptions", "CollatorOptions",
  "Collator", "NumberFormat", "DateTimeFormat", "DateTimeFormatPart",
  "ResolvedDateTimeFormatOptions",
]);

export const value = (name: string) => (keywords.has(name) ? `${name}_` : name);
export const named = (name: string) => /^[A-Za-z_][A-Za-z0-9_]*$/.test(name);

// The package a symbol is declared in: the last node_modules in its path,
// since a store such as Bun's nests packages under its own.
export function moduleOf(symbol: ts.Symbol): string | null {
  const file = symbol.declarations?.[0]?.getSourceFile().fileName ?? "";
  const m = file.match(/.*node_modules\/((?:@[^/]+\/)?[^/]+)\//);
  return m ? m[1]! : null;
}

export function isDomLib(symbol: ts.Symbol): boolean {
  const file = symbol.declarations?.[0]?.getSourceFile().fileName ?? "";
  return /typescript\/lib\/lib\./.test(file);
}

export class Binding {
  readonly unmapped = new Map<string, string>();
  readonly names = new Map<string, string>();
  readonly types = new Map<ts.Symbol | ts.Type, Named>();
  readonly queue: Named[] = [];
  readonly moduleNames = new Map<string, string>();
  readonly opaques = new Set<string>();
  namesUnknown = false;
  readonly htmlModules: Set<string>;
  readonly attributeNames: Set<string>;

  constructor(
    readonly root: string,
    readonly checker: ts.TypeChecker,
    readonly library: Library,
  ) {
    const html = solidHtml();
    this.htmlModules = html.modules;
    this.attributeNames = html.attributeNames;
  }

  real = (s: ts.Symbol) => (s.flags & ts.SymbolFlags.Alias ? this.checker.getAliasedSymbol(s) : s);

  opaque(name: string): string {
    this.opaques.add(name);
    return name;
  }

  // Never numbered: a number would be the order two types were met in.
  private module(name: string, of: string): string {
    let n = name.replace(/[^A-Za-z0-9_]/g, "_");
    n = n.charAt(0).toUpperCase() + n.slice(1);
    const taken = this.moduleNames.get(n);
    if (taken !== undefined) {
      throw new Error(`two types would be Types.${n}: ${taken}, and ${of}. Name each in the library's generator, by named`);
    }
    this.moduleNames.set(n, of);
    return n;
  }

  // A declaration of a name already bound that TypeScript takes for it both
  // ways -- @internationalized/number's NumberFormatOptions, which extends
  // Intl's with a member Intl's has -- is that type, so a value of one is
  // passed where the other is asked.
  private sameAs(symbol: ts.Symbol, type: ts.Type): Named | undefined {
    for (const n of this.types.values()) {
      if (n.symbol?.name === symbol.name && n.params.length === 0
          && this.checker.isTypeAssignableTo(type, n.type) && this.checker.isTypeAssignableTo(n.type, type)) return n;
    }
    return undefined;
  }

  // Asked of the type, never of its text, which TypeScript cuts short.
  private holdsAny(t: ts.Type, seen = new Set<ts.Type>()): boolean {
    if (t.flags & ts.TypeFlags.Any) return true;
    if (seen.has(t)) return false;
    seen.add(t);
    const any = (ts: readonly ts.Type[] | undefined) => (ts ?? []).some((m) => this.holdsAny(m, seen));
    if (t.isUnionOrIntersection()) return any(t.types);
    if (any(t.aliasTypeArguments) || any(this.checker.getTypeArguments(t as ts.TypeReference))) return true;
    return t.getCallSignatures().some((s) =>
      this.holdsAny(s.getReturnType(), seen) || s.getParameters().some((q) => this.holdsAny(this.checker.getTypeOfSymbol(q), seen)));
  }

  namedModule(symbol: ts.Symbol, type: ts.Type): Named {
    const { checker, library } = this;
    let n = this.types.get(symbol) ?? this.sameAs(symbol, type);
    if (n) this.types.set(symbol, n);
    if (!n) {
      const decl = symbol.declarations?.[0];
      const params =
        decl && (ts.isInterfaceDeclaration(decl) || ts.isClassDeclaration(decl) || ts.isTypeAliasDeclaration(decl))
          ? (decl.typeParameters ?? []).map((p) => p.name.text)
          : [];
      if (library.data?.(symbol) && checker.getPropertiesOfType(type).some((p) => this.holdsAny(checker.getTypeOfSymbol(p)))) params.push(DATA);
      const declaredIn = decl?.getSourceFile().fileName.replace(/.*node_modules\//, "") ?? "the standard library";
      n = { module: this.module(library.named?.(symbol) ?? symbol.name, `${symbol.name} of ${declaredIn}`), symbol, type, params, conversions: [] };
      this.types.set(symbol, n);
      this.queue.push(n);
    }
    return n;
  }

  // An object type with no name of its own -- an inline type, an
  // intersection, a const's typeof -- named by the path of names to where it
  // is first met: a part's prop, Combobox_Root_Translations; what a function
  // gives, Bins; what it takes, the parameter's name after it, Bins_Options.
  anonymousModule(type: ts.Type, where: string): Named {
    let n = this.types.get(type);
    if (!n) {
      n = {
        module: this.module(where.split(".").map((w) => w.split("-").map((x) => x.charAt(0).toUpperCase() + x.slice(1)).join("")).join("_"), `the type met at ${where}`),
        symbol: null,
        type,
        params: [],
        conversions: [],
      };
      this.types.set(type, n);
      this.queue.push(n);
    }
    return n;
  }

  refusals(): string[] {
    const leftOut = this.library.leftOut ?? {};
    return [
      ...[...this.unmapped].filter(([where]) => !(where in leftOut)).map(([where, type]) => `${where}: no rule maps ${type}`),
      ...Object.keys(leftOut).filter((where) => !this.unmapped.has(where)).map((where) => `${where}: named as left out, but it is bound, or no longer declared`),
    ];
  }

  // A type nothing the binding reaches names, bound as a module of Types all
  // the same: a class a library exports alone, its constructor the way in.
  reach = (symbol: ts.Symbol): void => {
    this.namedModule(symbol, this.checker.getDeclaredTypeOfSymbol(symbol));
  };
}
