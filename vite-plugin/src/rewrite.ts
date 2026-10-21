// Rewrites the markers ppx_solidtype writes -- calls through the namespace
// Melange imports from "vite-plugin-solidtype/markers" -- into the JSX Solid's compiler
// reads. It recognises those calls alone, never another shape of Melange's
// output, so what Melange does around them cannot change their meaning.

import { transformAsync, types as t, type BabelFileResult, type NodePath, type PluginObj } from "@babel/core";

type Scope = NodePath["scope"];

export const MARKERS = "vite-plugin-solidtype/markers";

type Marker = "el" | "c" | "s" | "d" | "spread" | "dynamic";

const isMarker = (name: string): name is Marker =>
  name === "el" || name === "c" || name === "s" || name === "d" ||
  name === "spread" || name === "dynamic";

export class MarkerError extends Error {}

function markerOf(node: t.Node, namespace: string): Marker | null {
  if (!t.isCallExpression(node)) return null;
  const callee = node.callee;
  if (
    t.isMemberExpression(callee) &&
    !callee.computed &&
    t.isIdentifier(callee.object, { name: namespace }) &&
    t.isIdentifier(callee.property) &&
    isMarker(callee.property.name)
  ) {
    return callee.property.name;
  }
  return null;
}

function argsOf(node: t.Node, count: number): t.Expression[] {
  if (!t.isCallExpression(node) || node.arguments.length !== count) {
    throw new MarkerError(`a marker takes ${count} arguments`);
  }
  return node.arguments.map((a) => {
    if (!t.isExpression(a)) throw new MarkerError("a marker's argument is an expression");
    return a;
  });
}

function stringOf(node: t.Expression): string {
  if (!t.isStringLiteral(node)) throw new MarkerError("a marker's name is a string literal");
  return node.value;
}

function referencesName(node: t.Node, name: string): boolean {
  let found = false;
  t.traverseFast(node, (n) => {
    if (t.isIdentifier(n, { name })) found = true;
  });
  return found;
}

// A return-only if/else is the conditional expression Melange made it from.
function asExpression(statement: t.Statement): t.Expression | null {
  if (t.isReturnStatement(statement)) return statement.argument ?? t.identifier("undefined");
  if (t.isBlockStatement(statement) && statement.body.length === 1) {
    const [only] = statement.body;
    return only ? asExpression(only) : null;
  }
  if (t.isIfStatement(statement) && statement.alternate) {
    const yes = asExpression(statement.consequent);
    const no = asExpression(statement.alternate);
    return yes && no ? t.conditionalExpression(statement.test, yes, no) : null;
  }
  return null;
}

// A thunk becomes what it returns, so Solid's compiler sees the expression
// itself: a call in it is reactive, an identifier is static.
export function unwrap(thunk: t.Expression): t.Expression {
  if (t.isArrowFunctionExpression(thunk) || t.isFunctionExpression(thunk)) {
    const [param, ...rest] = thunk.params;
    const unused = rest.length === 0 &&
      (param === undefined || (t.isIdentifier(param) && !referencesName(thunk.body, param.name)));
    if (unused) {
      if (t.isExpression(thunk.body)) return thunk.body;
      if (thunk.body.body.length === 1) {
        const [only] = thunk.body.body;
        const e = only ? asExpression(only) : null;
        if (e) return e;
      }
    }
  }
  return t.callExpression(thunk, []);
}

function jsxName(component: t.Expression, alias: (name: string) => string): t.JSXIdentifier | t.JSXMemberExpression {
  if (t.isIdentifier(component)) {
    const name = /^[A-Z]/.test(component.name) ? component.name : alias(component.name);
    return t.jsxIdentifier(name);
  }
  if (t.isMemberExpression(component) && !component.computed && t.isIdentifier(component.property)) {
    const object = component.object;
    if (t.isIdentifier(object) || t.isMemberExpression(object)) {
      const inner = jsxName(object, (n) => n);
      return t.jsxMemberExpression(inner, t.jsxIdentifier(component.property.name));
    }
  }
  throw new MarkerError("a component is a name or a module's member");
}

// A string is written as JSX's own only where JSX reads it back unchanged,
// as a TSX author writes it; otherwise it stays the expression it is, as
// {"..."}. JSX reads an entity in either, and Solid's compiler collapses a
// run of whitespace in text; a quoted attribute keeps no escape, and Babel
// writes anything but printable ASCII there as one.
const plainText = /^(?:[^{}<>&\s]| (?! ))*$/;
const plainAttribute = /^(?:(?!["&\\])[\x20-\x7e])*$/;

// Solid's namespaces, on:click and attr:x, are JSX's namespaced names.
function attributeName(name: string): t.JSXIdentifier | t.JSXNamespacedName {
  const colon = name.indexOf(":");
  return colon < 0
    ? t.jsxIdentifier(name)
    : t.jsxNamespacedName(t.jsxIdentifier(name.slice(0, colon)), t.jsxIdentifier(name.slice(colon + 1)));
}

function attribute(node: t.Expression, namespace: string): t.JSXAttribute | t.JSXSpreadAttribute {
  switch (markerOf(node, namespace)) {
    case "s": {
      const [name, value] = argsOf(node, 2) as [t.Expression, t.Expression];
      const v = t.isStringLiteral(value) && plainAttribute.test(value.value)
        ? t.stringLiteral(value.value)
        : t.jsxExpressionContainer(value);
      return t.jsxAttribute(attributeName(stringOf(name)), v);
    }
    case "d": {
      const [name, thunk] = argsOf(node, 2) as [t.Expression, t.Expression];
      return t.jsxAttribute(attributeName(stringOf(name)), t.jsxExpressionContainer(unwrap(thunk)));
    }
    case "spread": {
      const [props] = argsOf(node, 1) as [t.Expression];
      return t.jsxSpreadAttribute(props);
    }
    default:
      throw new MarkerError("a prop is written by Jsx.s, Jsx.d or Jsx.spread");
  }
}

function child(node: t.Expression, namespace: string, alias: (name: string) => string): t.JSXElement["children"][number] {
  const marker = markerOf(node, namespace);
  if (marker === "el" || marker === "c") return element(node, namespace, alias);
  if (marker === "dynamic") {
    const [thunk] = argsOf(node, 1) as [t.Expression];
    return t.jsxExpressionContainer(unwrap(thunk));
  }
  if (t.isStringLiteral(node) && plainText.test(node.value)) {
    return t.jsxText(node.value);
  }
  return t.jsxExpressionContainer(node);
}

export function element(node: t.Expression, namespace: string, alias: (name: string) => string): t.JSXElement {
  const marker = markerOf(node, namespace);
  if (marker !== "el" && marker !== "c") throw new MarkerError("an element is written by Jsx.el or Jsx.c");
  const [tag, props, children] = argsOf(node, 3) as [t.Expression, t.Expression, t.Expression];
  if (!t.isArrayExpression(props) || !t.isArrayExpression(children)) {
    throw new MarkerError("an element's props and children are arrays");
  }
  const name = marker === "el" ? t.jsxIdentifier(stringOf(tag)) : jsxName(tag, alias);
  const attributes = props.elements.map((p) => {
    if (!t.isExpression(p)) throw new MarkerError("a prop is an expression");
    return attribute(p, namespace);
  });
  const kids = children.elements.map((c) => {
    if (!t.isExpression(c)) throw new MarkerError("a child is an expression");
    return child(c, namespace, alias);
  });
  const selfClosing = kids.length === 0;
  return t.jsxElement(
    t.jsxOpeningElement(name, attributes, selfClosing),
    selfClosing ? null : t.jsxClosingElement(name),
    kids,
    selfClosing,
  );
}

// A prop or a child the ppx bound once, to name it in its component's check
// too, goes back where it is used, so Solid's compiler sees the function as
// TSX would write it. Only a const bound to a function and used once moves: a
// function expression does nothing until it is called, so writing it later in
// the same scope changes nothing. Any other binding stays, and is called.
function inlineBound(value: NodePath<t.Node | null | undefined>): void {
  if (!value.isIdentifier()) return;
  const binding = value.scope.getBinding(value.node.name);
  if (!binding || binding.kind !== "const" || !binding.constant || binding.references !== 1) return;
  const declarator = binding.path;
  if (!declarator.isVariableDeclarator()) return;
  const init = declarator.get("init");
  if (!init.isFunctionExpression() && !init.isArrowFunctionExpression()) return;
  value.replaceWith(init.node);
  declarator.remove();
}

function markersPlugin(): PluginObj {
  return {
    name: "solidtype-markers",
    visitor: {
      Program(program: NodePath<t.Program>) {
        const imports = program.get("body").filter((s): s is NodePath<t.ImportDeclaration> =>
          s.isImportDeclaration() && s.node.source.value === MARKERS);
        if (imports.length === 0) return;
        const namespaces = imports.flatMap((i) =>
          i.node.specifiers.filter(t.isImportNamespaceSpecifier).map((s) => s.local.name));
        if (namespaces.length !== imports.length) {
          throw new MarkerError(`"${MARKERS}" is imported as a namespace`);
        }
        // A component Melange names in lower case gets a capitalised name,
        // which JSX reads as a component. One bound in a function -- a
        // component a functor is given -- is renamed where it is bound, all
        // its uses with it; one bound at the top, or not bound here, gets an
        // alias, a function declared at the top and so hoisted, which reads
        // the component only when Solid renders it.
        const aliases = new Map<string, string>();
        let scope: Scope = program.scope;
        const alias = (name: string) => {
          const binding = scope.getBinding(name);
          if (binding && binding.scope !== program.scope) {
            const fresh = binding.scope.generateUid(`Component_${name}`).replace(/^_/, "C");
            binding.scope.rename(name, fresh);
            return fresh;
          }
          const existing = aliases.get(name);
          if (existing) return existing;
          const fresh = program.scope.generateUid(`Component_${name}`).replace(/^_/, "C");
          aliases.set(name, fresh);
          return fresh;
        };
        program.traverse({
          CallExpression(call) {
            const namespace = namespaces.find((n) => markerOf(call.node, n));
            if (!namespace) return;
            const marker = markerOf(call.node, namespace);
            const args = call.get("arguments");
            if (marker === "s" || marker === "d") {
              const value = args[1];
              if (value) inlineBound(value);
            }
            if (marker === "el" || marker === "c") {
              const children = args[2];
              if (children?.isArrayExpression()) {
                for (const c of children.get("elements")) inlineBound(c);
              }
            }
          },
        });
        program.traverse({
          CallExpression(call) {
            const namespace = namespaces.find((n) => markerOf(call.node, n));
            if (!namespace) return;
            const marker = markerOf(call.node, namespace);
            if (marker !== "el" && marker !== "c") {
              throw call.buildCodeFrameError(`Jsx.${marker} outside an element`);
            }
            // The new element is traversed in turn: an element given as a
            // prop's value, or returned from a thunk, is a marker still.
            scope = call.scope;
            call.replaceWith(element(call.node, namespace, alias));
          },
        });
        for (const i of imports) i.remove();
        for (const [name, fresh] of aliases) {
          const props = t.identifier("props");
          program.pushContainer("body", t.functionDeclaration(
            t.identifier(fresh), [props],
            t.blockStatement([t.returnStatement(t.callExpression(t.identifier(name), [props]))]),
          ));
        }
      },
    },
  };
}

export async function rewrite(code: string, filename: string): Promise<{ code: string; map: NonNullable<BabelFileResult["map"]> | null } | null> {
  if (!code.includes(MARKERS)) return null;
  const result = await transformAsync(code, {
    filename,
    babelrc: false,
    configFile: false,
    sourceMaps: true,
    plugins: [markersPlugin],
  });
  if (!result?.code) return null;
  return { code: result.code, map: result.map ?? null };
}
