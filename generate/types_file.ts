import ts from "typescript";
import type { Emitters } from "./emit.ts";
import { isDomLib, moduleOf, named, readable, value, type Binding } from "./library.ts";
import { flatName, isUnit, typeVar, unbound, unknown, type At, type Mapping, type Vars } from "./mapping.ts";
import { snake } from "./names.ts";
import { apply, isArrow, name as tname, printItems, vars as typeVarsOf, type Item, type Type } from "./ocaml.ts";

const optionOf = (t: Type): Type | null => (t.kind === "apply" && t.name === "option" ? (t.args[0] ?? null) : null);

export function typesFiles(b: Binding, { map, mapFunction, declaredPorted, kindOf, argIn, givenIn, showIn }: Mapping, { doc, guarded, throws }: Emitters, header: string): { ml: string; mli: string } {
const { checker, queue, unmapped, moduleNames, opaques } = b;
const both = (vars: Vars, where: string): At => ({ vars, where, polarity: "both" });
const read = (vars: Vars, where: string): At => ({ vars, where, polarity: "read" });
const abstracts: Item[] = [];
const done = new Set<ts.Symbol | ts.Type>();
const modules: Item[] = [];
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
  const kind = kindOf(n.symbol ?? undefined);
  abstracts.push(kind ? { kind: "type", name: flat, manifest: `[ \`${kind} ] t_value` } : { kind: "type", name: flat });
  const items: Item[] = [{ kind: "type", name: t, manifest: flat }];
  modules.push({ kind: "module", name: n.module, items, doc: n.symbol ? doc(n.symbol) : undefined });
  {
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
      // A class's private or protected member is its own, never a user's.
      if ((p.declarations ?? []).some((d) => ts.getCombinedModifierFlags(d) & (ts.ModifierFlags.Private | ts.ModifierFlags.Protected))) continue;
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
        const f = sig ? mapFunction(sig, read(vars, `${n.module}.${p.name}`), true) : null;
        if (!f || unbound(f, params)) {
          unmapped.set(`${n.module}.${p.name}()`, sig ? checker.signatureToString(sig) : "?");
          continue;
        }
        methods++;
        const name = value(snake(p.name));
        if (sig && throws(p, `${n.module}.${p.name}`)) {
          items.push(
            { kind: "external", name: `${name}_js`, type: `${t} -> ${showIn(f)}`, js: p.name, attributes: ["mel.send"], hidden: true },
            ...guarded(name, { ...f, params: [{ type: self }, ...f.params] }, showIn, `${name}_js`, sig, true, doc(p, true)),
          );
          continue;
        }
        items.push({ kind: "external", name, type: `${t} -> ${showIn(f)}`, js: p.name, attributes: ["mel.send"] });
        continue;
      }
      const ft = declaredPorted(p, both(vars, `${n.module}.${p.name}`), optional) ?? map(pt, both(vars, `${n.module}.${p.name}`), optional);
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
      const documentation = doc(p);
      const sig = checker.getNonNullableType(pt).getCallSignatures()[0];
      // A function is one the mapping writes as an arrow, not a setter, an
      // accessor or a type of its own that happens to be callable.
      const fn = sig && isArrow(ft) && checker.getNonNullableType(pt).getProperties().length === 0 && !optional
        ? mapFunction(sig, both(vars, `${n.module}.${p.name}`))
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
        const result = returned ? mapFunction(returned, both(vars, `${n.module}.${p.name}`)) : null;
        if (returned && result) {
          const argTypes = sig.getParameters().map((q) => map(checker.getTypeOfSymbol(q), both(vars, n.module)));
          const inner = returned.getParameters().length;
          const ys = Array.from({ length: inner }, (_, i) => `y${i}`);
          const yargs = inner === 0 ? "()" : ys.join(" ");
          const params = argTypes.length === 0 ? "unit" : argTypes.map((a) => givenIn(a ?? unknown)).join(" -> ");
          const name = value(snake(p.name));
          items.push(
            { kind: "external", name: getter, type: `${t} -> (${params} -> (${showIn(result)} [@u]) [@u])`, js: p.name, attributes: ["mel.get"], hidden: true },
            {
              kind: "let",
              name,
              type: `${t} -> ${params} -> ${argIn(result)}`,
              doc: documentation,
              definition: `let ${name} o ${args} = let r = (${getter} o) ${args} [@u] in fun ${yargs} -> r ${yargs} [@u]`,
            },
          );
          shaped.set(p.name, (f) => `(fun ${args} -> let r = ${f} ${args} in fun ${yargs} -> r ${yargs})`);
        } else {
          // Called as a method of the object that holds it: an external is
          // called directly from another library, where a [let] in a nested
          // module goes through Curry, its arity lost.
          items.push({
            kind: "external",
            name: value(snake(p.name)),
            type: `${t} -> ${showIn(mapFunction(sig, read(vars, `${n.module}.${p.name}`), true) ?? fn)}`,
            js: p.name,
            attributes: ["mel.send"],
            doc: documentation,
          });
        }
      } else if (optional && isArrow(ft)) {
        // Read uncurried and given back curried: Melange calls a curried function it
        // did not make by its length.
        const name = value(snake(p.name));
        const none = ft.params.length === 1 && isUnit(ft.params[0]!.type);
        const xs = none ? "()" : ft.params.map((_, i) => `x${i}`).join(" ");
        const uncurried = `(${ft.params.map((q) => argIn(q.type)).join(" -> ")} -> ${argIn(ft.result)} [@u])`;
        items.push(
          { kind: "external", name: `${name}_js`, type: `${t} -> ${uncurried} option`, js: p.name, attributes: ["mel.get"], hidden: true },
          {
            kind: "let",
            name,
            type: `${t} -> ${argIn(ft)} option`,
            doc: documentation,
            definition: `let ${name} o = match ${name}_js o with None -> None | Some f -> Some (fun ${xs} -> f ${xs} [@u])`,
          },
        );
      } else {
        items.push({
          kind: "external",
          name: value(snake(p.name)),
          type: `${t} -> ${optional ? `${argIn(ft)} option` : argIn(ft)}`,
          js: p.name,
          attributes: ["mel.get"],
          doc: documentation,
        });
      }
    }
    // A value Kobalte declares as a DOM node or event, extended, is that value:
    // the conversion only forgets what Kobalte added, so it is %identity, named
    // as the stdlib names a conversion, to_html_div_element.
    for (const d of n.conversions) {
      items.push({ kind: "external", name: `to_${snake(d.slice(4))}`, type: `${t} -> ${d}`, js: "%identity" });
    }
    // A class is each interface it declares it implements, which a function
    // that takes the interface takes it as: SelectionManager a
    // MultipleSelectionManager.
    const classDecl = isClass ? n.symbol!.declarations?.find(ts.isClassDeclaration) : undefined;
    for (const clause of classDecl?.heritageClauses ?? []) {
      if (clause.token !== ts.SyntaxKind.ImplementsKeyword) continue;
      for (const e of clause.types) {
        // The library's own interfaces; a standard one is Melange's.
        const implemented = checker.getTypeAtLocation(e);
        const symbol = implemented.getSymbol();
        if (!symbol || isDomLib(symbol)) continue;
        const it = map(implemented, both(vars, n.module));
        if (it?.kind === "ref") items.push({ kind: "external", name: `to_${snake(it.module)}`, type: `${t} -> ${showIn(it)}`, js: "%identity" });
      }
    }
    // A function a field holds that JavaScript would call with a function:
    // what it is handed is JavaScript's, which OCaml calls by its length,
    // so the type is read, never built here.
    const handedFunction = fields.find(([, ft]) => {
      const f = isArrow(ft) ? ft : optionOf(ft);
      return f !== null && isArrow(f) && f.params.some((q) => isArrow(q.type));
    });
    const constructed = !isClass && !library && methods === 0 && fields.length > 0 && n.conversions.length === 0;
    if (constructed && handedFunction) unmapped.set(`${n.module}.make`, `a constructor whose ${handedFunction[0]} JavaScript would hand a function`);
    if (constructed && !handedFunction) {
      const label = ([k, ft, opt]: [string, Type, boolean]) =>
        `${opt ? "?" : ""}${value(snake(k))}:(${givenIn(ft)} [@mel.as "${k}"]) ->`;
      // A function of several arguments a field holds: an OCaml function's
      // type does not say whether it takes them at once, as JavaScript
      // calls it, so [make] gives it under one that does.
      for (const [k, ft] of fields) {
        const f = isArrow(ft) ? ft : optionOf(ft);
        if (shaped.has(k) || f === null || !isArrow(f) || f.params.length < 2) continue;
        const xs = f.params.map((_, i) => `x${i}`).join(" ");
        shaped.set(k, (g) => `(fun ${xs} -> ${g} ${xs})`);
      }
      if (shaped.size === 0) {
        items.push({ kind: "external", name: "make", type: `${fields.map(label).join(" ")} unit -> ${t}`, js: "", attributes: ["mel.obj"] });
      } else {
        const params = fields.map(([k, , opt]) => `${opt ? "?" : "~"}${value(snake(k))}`);
        const passed = fields.map(([k, ft, opt]) => {
          const v = value(snake(k));
          const shape = shaped.get(k);
          if (!shape) return opt ? `?${v}` : `~${v}`;
          const mapped = `(Option.map (fun f -> ${shape("f")}) ${v})`;
          return opt ? `?${v}:${mapped}` : optionOf(ft) ? `~${v}:${mapped}` : `~${v}:${shape(v)}`;
        });
        const labels = fields.map(([k, ft, opt]) => `${opt ? "?" : ""}${value(snake(k))}:${givenIn(ft)} ->`);
        items.push(
          { kind: "external", name: "make_js", type: `${fields.map(label).join(" ")} unit -> ${t}`, js: "", attributes: ["mel.obj"], hidden: true },
          { kind: "let", name: "make", type: `${labels.join(" ")} unit -> ${t}`, definition: `let make ${params.join(" ")} () = make_js ${passed.join(" ")} ()` },
        );
      }
    }
    if (isClass && n.symbol?.valueDeclaration) {
      const mod = moduleOf(n.symbol);
      const ctor = checker.getTypeOfSymbolAtLocation(n.symbol, n.symbol.valueDeclaration).getConstructSignatures()[0];
      const f = ctor ? mapFunction(ctor, read(vars, `${n.module}.constructor`), true) : null;
      if (f && mod) {
        items.push({ kind: "external", name: "make", type: showIn({ ...f, result: self }), js: n.module, attributes: ["mel.new", `mel.module ${JSON.stringify(mod)}`] });
      }
    }
  }
}

// Each type by its flat name first, so that they name one another.
const opaqueOnly = [...opaques].sort().filter((o) => !moduleNames.has(o));
const all: Item[] = [
  { kind: "type", name: "('a, 'b) either", note: "Members of different JavaScript kinds, each as it is." },
  ...(b.namesUnknown ? [{ kind: "type", name: "t_unknown" } as Item] : []),
  ...(b.library.kinds ? [{ kind: "type", name: "'k t_value" } as Item] : []),
  ...opaqueOnly.map((o): Item => ({ kind: "type", name: flatName(o) })),
  ...abstracts,
  {
    kind: "module",
    name: "Either",
    items: [
      { kind: "type", name: "('a, 'b) t", manifest: "('a, 'b) either" },
      { kind: "external", name: "left", type: "'a -> ('a, 'b) t", js: "%identity" },
      { kind: "external", name: "right", type: "'b -> ('a, 'b) t", js: "%identity" },
    ],
  },
  ...(b.namesUnknown
    ? [{
        kind: "module",
        name: "Unknown",
        note: "What TypeScript types any, read from JavaScript: nothing reads it, since a type its reader chose would be an unchecked cast.",
        items: [{ kind: "type", name: "t", manifest: "t_unknown" }],
      } as Item]
    : []),
  ...(b.library.kinds
    ? [{
        kind: "module",
        name: "Value",
        note: `A value of one of ${b.library.kinds.classes.map((c) => c.name).join(", ")}, its kind the class it is of: what a union of them, or an interface they satisfy, takes, as the kinds it names.`,
        items: [{ kind: "type", name: "'k t", manifest: "'k t_value" }],
      } as Item]
    : []),
  ...opaqueOnly.map((o): Item => ({ kind: "module", name: o, note: `The standard library's ${o}, opaque.`, items: [{ kind: "type", name: "t", manifest: flatName(o) }] })),
  ...modules,
];
return {
  ml: `${header}\n\n${printItems(all, "ml")}\n`,
  mli: `${header}\n\n${printItems(all, "mli")}\n`,
};
}
