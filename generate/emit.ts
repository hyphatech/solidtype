import ts from "typescript";
import type { Binding } from "./library.ts";
import { named, value } from "./library.ts";
import { isUnit, jsxElement, leftOut, type Arrow, type Mapping, type Vars } from "./mapping.ts";
import { label, record, snake } from "./names.ts";
import { apply, isArrow, name as tname, vars as typeVarsOf, type Item, type Type } from "./ocaml.ts";

export type Given = { element: string | null; own: ts.Symbol[] };

export type Emitters = ReturnType<typeof emitters>;

export function emitters(b: Binding, { map, mapFunction, refOf, declaredPorted, argOut, givenArgOut, givenOut, showOut }: Mapping) {
  const { checker, library } = b;

  function fixedElement(decl: ts.SignatureDeclaration): { element: string; own: ts.Symbol[] } | null {
    const param = decl.parameters[0]?.type;
    if (!param || !ts.isTypeReferenceNode(param)) return null;
    const symbol = checker.getSymbolAtLocation(param.typeName);
    const alias = symbol && b.real(symbol).declarations?.find(ts.isTypeAliasDeclaration);
    if (alias && ts.isTypeReferenceNode(alias.type) && /ComponentProps$/.test(alias.type.typeName.getText())) {
      const arg = alias.type.typeArguments?.[0];
      if (arg && ts.isLiteralTypeNode(arg) && ts.isStringLiteral(arg.literal)) return { element: arg.literal.text, own: [] };
    }
    const props = symbol && b.real(symbol).declarations?.find(ts.isInterfaceDeclaration);
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
  // [given], where the library's generator knows them, are the element the
  // part renders and the props of its own, in place of what the core reads
  // from Kobalte's shapes of a declaration.
  function part(jsModule: string, where: string, decl: ts.SignatureDeclaration, options: ts.Type | null, extra: ts.Symbol[], js: string, given?: Given): Item[] {
    const vars: Vars = new Map();
    const tp = decl.typeParameters?.find((p) => p.default && /ValidComponent/.test(p.constraint?.getText() ?? ""));
    const polymorphic = tp?.default && ts.isLiteralTypeNode(tp.default) ? (tp.default.literal as ts.StringLiteral).text : null;
    // A part that is not polymorphic renders the element its props extend,
    // ComponentProps<"input">, and its options are that interface's own.
    const fixed = polymorphic ? null : fixedElement(decl);
    const element = given ? given.element : (polymorphic ?? fixed?.element ?? null);
    const commons = extra.filter((p) => !b.attributeNames.has(label(p.name)));
    // A part with neither options nor an element, I18nProvider, takes the
    // props its signature declares.
    const declaredProps = (): ts.Symbol[] => {
      const param = decl.parameters[0];
      return param ? checker.getPropertiesOfType(checker.getTypeAtLocation(param)) : [];
    };
    const own = given
      ? given.own
      : [...(options ? checker.getPropertiesOfType(options) : (fixed?.own ?? (polymorphic ? [] : declaredProps()))), ...commons];
    const args: string[] = [];
    const severalArguments: [js: string, arity: number][] = [];
    let children = "?children:('f, [ `elements ]) Solidtype.Check.children ->";
    for (const p of own) {
      if (!named(p.name)) continue;
      const pt = checker.getTypeOfSymbol(p);
      const optional = (p.flags & ts.SymbolFlags.Optional) !== 0;
      // A prop only false, as a single-value root's multiple, is not given.
      if (pt.isUnion() && pt.types.every((m) => m.flags & (ts.TypeFlags.BooleanLiteral | ts.TypeFlags.Undefined)) &&
        pt.types.filter((m) => m.flags & ts.TypeFlags.BooleanLiteral).length === 1 && pt.types.includes(checker.getFalseType())) continue;
      const t: Type | null =
        p.name === "ref"
          ? refOf(pt, { vars, where: `${where}.${p.name}`, polarity: "both" })
          : (declaredPorted(p, { vars, where: `${where}.${p.name}`, polarity: "given" }, optional) ??
              map(pt, { vars, where: `${where}.${p.name}`, polarity: "given" }, optional));
      if (!t) {
        b.unmapped.set(`${where}.${p.name}`, checker.typeToString(pt));
        continue;
      }
      if (p.name === "children") {
        // Children: elements, a function of the part's own, or either.
        const render = t.kind === "ref" && t.module === "Either" && givenOut(t.args[0]!) === givenOut(jsxElement) ? t.args[1] : undefined;
        const q = optional ? "?" : "";
        children = render
          ? `${q}children:(${givenOut(render)}, [ \`elements | \`render ]) Solidtype.Check.children ->`
          : isArrow(t)
            ? `${q}children:(${givenOut(t)}, [ \`render ]) Solidtype.Check.children ->`
            : `${q}children:('f, [ \`elements ]) Solidtype.Check.children ->`;
        continue;
      }
      const name = record(b.names, p.name);
      if (isArrow(t) && t.params.length > 1) severalArguments.push([p.name, t.params.length]);
      const checked = isArrow(t) ? `(${givenOut(t)})` : `${givenArgOut(t)} Solidtype.Check.value`;
      args.push(`${optional ? "?" : ""}${name}:${checked} ->`);
    }
    // A spread, props=p, as TSX's {...p}: the rest of a component's props
    // passed on, its data- attributes, which any part takes.
    const html = element ? element.charAt(0).toUpperCase() + element.slice(1) : null;
    // What a part Kobalte draws by its polymorphic `as` draws in its place: a
    // function of the props it is to spread, which Solid takes for a component.
    if (polymorphic && html && b.htmlModules.has(html)) args.push(`?as_:(Solidtype.Html.${html}.props -> Solidtype.Jsx.element) ->`);
    args.push("?props:'spread Solidtype.Solid.rest ->");
    const tail = `${children} unit -> unit`;
    const check = html && b.htmlModules.has(html) ? `(${tail}) Solidtype.Html.${html}.check` : tail;
    const props: Item = {
      kind: "module",
      name: "Props",
      items: [{ kind: "external", name: "check", type: `${args.join(" ")} ${check}`, js: "check", attributes: [`mel.module "vite-plugin-solidtype/markers"`] }],
    };
    const component = "unit Solidtype.Jsx.component";
    if (severalArguments.length === 0) {
      return [props, { kind: "external", name: "component", type: component, js, attributes: [`mel.module ${JSON.stringify(jsModule)}`] }];
    }
    // JavaScript calls such a prop with every argument at once, which an OCaml
    // function's type does not promise: Arity calls it as OCaml does.
    const adapted = severalArguments
      .map(([name, arity]) => {
        const xs = Array.from({ length: arity }, (_, i) => `x${i}`).join(" ");
        return `|> Solidtype.Arity.adapted ${JSON.stringify(name)} (fun f -> fun [@u] ${xs} -> f ${xs})`;
      })
      .join(" ");
    return [
      props,
      { kind: "external", name: "component_js", type: component, js, attributes: [`mel.module ${JSON.stringify(jsModule)}`], hidden: true },
      { kind: "let", name: "component", type: component, definition: `let component = component_js ${adapted}` },
    ];
  }

  // The library's comment on a declaration, as odoc: its documentation is the
  // binding's.
  function doc(symbol: ts.Symbol, raises = false): string | undefined {
    // A package a comment names, @bezda/rhp/rhp.css, is read by TypeScript as
    // a tag, and the comment after it with it: it is given back as written.
    const named = symbol.getJsDocTags(checker).filter((t) => ts.displayPartsToString(t.text).startsWith("/"));
    const text = [ts.displayPartsToString(symbol.getDocumentationComment(checker)), ...named.map((t) => `@${t.name}${ts.displayPartsToString(t.text)}`)]
      .join(" ")
      .trim();
    const escaped = text.replace(/\*\)/g, "* )").replace(/[{}\[\]@]/g, (c) => `\\${c}`);
    // odoc reads an @ as a tag's, so a library's scope is escaped.
    const raise = raises ? `Raises [Invalid_argument] with ${library.name.replace(/@/g, "\\@")}'s message, where it throws.` : "";
    const all = [escaped, raise].filter((t) => t !== "").join("\n\n");
    return all === "" ? undefined : all;
  }

  // A function the library documents as throwing, or one it names as throwing
  // undocumented: a precondition the caller broke, raised as Invalid_argument
  // with the library's message. One at the top of a module reads input from
  // outside, so it also has an _opt that gives None for it.
  const throws = (symbol: ts.Symbol, where: string) =>
    library.throwsUndocumented(where) || /\bthrows\b/i.test(ts.displayPartsToString(symbol.getDocumentationComment(checker)));

  function guarded(name: string, type: Arrow, show: (t: Type) => string, js: string, sig: ts.Signature, self: boolean, documentation: string | undefined): Item[] {
    const ps = sig.getParameters();
    const named = ps.map((q, i) => (leftOut(q) ? `?${value(snake(q.name))}` : `x${i}`));
    if (ps.some(leftOut)) named.push("()");
    const xs = named.length === 0 ? "()" : named.join(" ");
    const args = self ? `o ${xs}` : xs;
    return [
      {
        kind: "let",
        name,
        type: show(type),
        doc: documentation,
        definition: `let ${name} ${args} = match ${js} ${args} with v -> v | exception Js.Exn.Error e -> invalid_arg ("${name}: " ^ Option.value (Js.Exn.message e) ~default:"")`,
      },
      {
        kind: "let",
        name: `${name}_opt`,
        type: show({ ...type, result: apply("option", type.result) }),
        definition: `let ${name}_opt ${args} = match ${js} ${args} with v -> Some v | exception Js.Exn.Error _ -> None`,
      },
    ];
  }

  // A function the library exports, [jsName] of [jsModule], as an external:
  // one that may throw under a wrapper that raises, with an _opt beside it.
  function functionBinding(symbol: ts.Symbol, jsName: string, jsModule: string, where: string): Item[] {
    const sig = checker.getSignaturesOfType(checker.getTypeOfSymbol(symbol), ts.SignatureKind.Call)[0];
    const t = sig ? mapFunction(sig, { vars: new Map(), where, polarity: "read" }, true) : null;
    if (!sig || !t) {
      b.unmapped.set(where, sig ? checker.signatureToString(sig) : "?");
      return [];
    }
    const name = value(snake(jsName));
    const from = [`mel.module ${JSON.stringify(jsModule)}`];
    if (isArrow(t.result)) return returnsFunction(symbol, name, t, t.result, sig, jsName, jsModule);
    if (throws(symbol, jsName)) {
      return [
        { kind: "external", name: `${name}_js`, type: showOut(t), js: jsName, attributes: from, hidden: true },
        ...guarded(name, t, showOut, `${name}_js`, sig, false, doc(symbol, true)),
      ];
    }
    return [{ kind: "external", name, type: showOut(t), js: jsName, attributes: from, doc: doc(symbol) }];
  }

  // A function that returns one, every(step): Melange counts an external's
  // arguments through the parentheses of its result, so a curried result would
  // make every(step) wait for the result's own arguments and call rhp with all
  // of them at once. The external returns it uncurried, and the function wraps
  // it once, curried; one that may throw raises where it is called, with an
  // _opt beside it.
  function returnsFunction(symbol: ts.Symbol, name: string, t: Arrow, returned: Arrow, sig: ts.Signature, jsName: string, jsModule: string): Item[] {
    const uncurried = tname(`(${returned.params.map((p) => argOut(p.type)).join(" -> ")} -> ${argOut(returned.result)} [@u])`);
    const ps = sig.getParameters();
    const named = ps.map((q, i) => (leftOut(q) ? `?${value(snake(q.name))}` : `x${i}`));
    if (ps.some(leftOut)) named.push("()");
    const xs = named.length === 0 ? "()" : named.join(" ");
    // A function of no arguments takes (), as JavaScript calls it with none.
    const none = returned.params.length === 1 && isUnit(returned.params[0]!.type);
    const ys = none ? "()" : returned.params.map((_, i) => `y${i}`).join(" ");
    const curried = `fun ${ys} -> (r ${ys} [@u])`;
    const raises = throws(symbol, jsName);
    const raw: Item = { kind: "external", name: `${name}_js`, type: showOut({ ...t, result: uncurried }), js: jsName, attributes: [`mel.module ${JSON.stringify(jsModule)}`], hidden: true };
    if (!raises) {
      return [raw, { kind: "let", name, type: showOut(t), doc: doc(symbol), definition: `let ${name} ${xs} = let r = ${name}_js ${xs} in ${curried}` }];
    }
    return [
      raw,
      {
        kind: "let",
        name,
        type: showOut(t),
        doc: doc(symbol, true),
        definition: `let ${name} ${xs} = match ${name}_js ${xs} with r -> ${curried} | exception Js.Exn.Error e -> invalid_arg ("${name}: " ^ Option.value (Js.Exn.message e) ~default:"")`,
      },
      {
        kind: "let",
        name: `${name}_opt`,
        type: showOut({ ...t, result: apply("option", t.result) }),
        definition: `let ${name}_opt ${xs} = match ${name}_js ${xs} with r -> Some (${curried}) | exception Js.Exn.Error _ -> None`,
      },
    ];
  }

  // A value the library exports, as an external.
  function valueBinding(symbol: ts.Symbol, jsName: string, jsModule: string, where: string): Item[] {
    // A value: toaster, the storage managers, the default translations.
    const vt = checker.getTypeOfSymbol(symbol);
    if (vt.getCallSignatures().length > 0 && vt.getProperties().length > 0) return [];
    const t = map(vt, { vars: new Map(), where, polarity: "read" });
    if (!t || typeVarsOf(t).length > 0) {
      b.unmapped.set(where, checker.typeToString(vt));
      return [];
    }
    return [{ kind: "external", name: value(snake(jsName)), type: showOut(t), js: jsName, attributes: [`mel.module ${JSON.stringify(jsModule)}`] }];
  }

  return { part, doc, functionBinding, valueBinding, guarded, throws };
}
