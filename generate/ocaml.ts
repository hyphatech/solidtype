// An OCaml type as a generator builds it, and its one printer: a generator
// asks what a type is -- a function, its arguments, its variables -- of the
// tree, never of the text it prints.

export type Param = { label?: string; optional?: boolean; type: Type };

export type Type =
  // A type with no arguments, as written: string, Dom.event, 'a t.
  | { kind: "name"; name: string }
  | { kind: "var"; name: string }
  // A type applied to arguments: int array, (k, v) Js.Map.t.
  | { kind: "apply"; name: string; args: Type[] }
  // A type of the binding's own, by its module, which the file it is printed
  // in decides how to name.
  | { kind: "ref"; module: string; args: Type[] }
  // A closed set of strings; with [js], each tag's string where it is not its
  // name. Every tag is then named, since Melange writes undefined for a tag
  // left unnamed where others are.
  | { kind: "tags"; tags: string[]; js?: string[] }
  | { kind: "tuple"; items: Type[] }
  | { kind: "arrow"; params: Param[]; result: Type };

export const name = (n: string): Type => ({ kind: "name", name: n });
export const apply = (n: string, ...args: Type[]): Type => ({ kind: "apply", name: n, args });

export const isArrow = (t: Type): t is Extract<Type, { kind: "arrow" }> => t.kind === "arrow";

// Every type variable a type names, in order, each once.
export function vars(t: Type): string[] {
  const found = new Set<string>();
  const walk = (t: Type): void => {
    switch (t.kind) {
      case "var":
        found.add(t.name);
        return;
      case "name":
      case "tags":
        return;
      case "apply":
      case "ref":
        t.args.forEach(walk);
        return;
      case "tuple":
        t.items.forEach(walk);
        return;
      case "arrow":
        t.params.forEach((p) => walk(p.type));
        walk(t.result);
        return;
    }
  };
  walk(t);
  return [...found];
}

// A type in a position where an arrow must be parenthesized: an argument, a
// tuple's item, a function's result.
export const paren = (t: Type, ref: (module: string) => string): string =>
  isArrow(t) ? `(${print(t, ref)})` : print(t, ref);

export function print(t: Type, ref: (module: string) => string): string {
  const applied = (n: string, args: Type[]) =>
    args.length === 0
      ? n
      : args.length === 1
        ? `${paren(args[0]!, ref)} ${n}`
        : `(${args.map((a) => print(a, ref)).join(", ")}) ${n}`;
  switch (t.kind) {
    case "name":
      return t.name;
    case "var":
      return `'${t.name}`;
    case "apply":
      return applied(t.name, t.args);
    case "ref":
      return applied(ref(t.module), t.args);
    case "tags": {
      const js = t.js;
      return `[ ${t.tags.map((s, i) => (js ? `\`${s} [@mel.as ${JSON.stringify(js[i])}]` : `\`${s}`)).join(" | ")} ]`;
    }
    case "tuple":
      return `(${t.items.map((i) => paren(i, ref)).join(" * ")})`;
    case "arrow": {
      const params = t.params.map((p) => {
        const type = paren(p.type, ref);
        return p.label === undefined ? type : `${p.optional ? "?" : "~"}${p.label}:${type}`;
      });
      return `${params.join(" -> ")} -> ${paren(t.result, ref)}`;
    }
  }
}
