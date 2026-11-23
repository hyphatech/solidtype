// An OCaml type as a generator builds it, and its one printer: a generator
// asks what a type is -- a function, its arguments, its variables -- of the
// tree, never of the text it prints.

// [uncurry] marks a function of several arguments given to an external:
// Melange then passes it at the arity its type says, whatever its shape.
export type Param = { label?: string; optional?: boolean; uncurry?: boolean; type: Type };

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
  // Any of a set of kinds of one type of the binding's own, Value, each a
  // class's: [< `time | `zoned_date_time ] Value.t, an open set, so a value
  // of any kind in it is taken.
  | { kind: "kinds"; tags: string[] }
  // What TypeScript types any, where a type is asked: given to JavaScript it
  // is whatever the caller has, _; read from it, it is Unknown, a type of
  // the binding's own that nothing reads, since a type its reader chose
  // would be an unchecked cast.
  | { kind: "unknown" }
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
      case "kinds":
      case "unknown":
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

// A variant's tags in the order of their names. TypeScript lists a union's
// members in the order it first met each, which is whatever was read before,
// so a variant written in that order changes with what else a run reads.
export function byTag<T>(tags: string[], written: T[]): T[] {
  return tags
    .map((tag, i) => [tag, written[i]!] as const)
    .sort(([a], [b]) => (a < b ? -1 : a > b ? 1 : 0))
    .map(([, w]) => w);
}

// A type in a position where an arrow must be parenthesized: an argument, a
// tuple's item, a function's result.
export const paren = (t: Type, ref: (module: string) => string, read = true): string =>
  isArrow(t) ? `(${print(t, ref, read)})` : print(t, ref, read);

// A function's arguments cross the other way to the function itself.
export function print(t: Type, ref: (module: string) => string, read = true): string {
  const applied = (n: string, args: Type[]) =>
    args.length === 0
      ? n
      : args.length === 1
        ? `${paren(args[0]!, ref, read)} ${n}`
        : `(${args.map((a) => print(a, ref, read)).join(", ")}) ${n}`;
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
      const written = t.tags.map((s, i) => (js ? `\`${s} [@mel.as ${JSON.stringify(js[i])}]` : `\`${s}`));
      return `[ ${byTag(t.tags, written).join(" | ")} ]`;
    }
    case "kinds":
      return `[< ${t.tags.map((s) => `\`${s}`).join(" | ")} ] ${ref("Value")}`;
    case "unknown":
      return read ? ref("Unknown") : "_";
    case "tuple":
      return `(${t.items.map((i) => paren(i, ref, read)).join(" * ")})`;
    case "arrow": {
      const params = t.params.map((p) => {
        const given = paren(p.type, ref, !read);
        const type = p.uncurry ? `(${given} [@mel.uncurry])` : given;
        return p.label === undefined ? type : `${p.optional ? "?" : "~"}${p.label}:${type}`;
      });
      return `${params.join(" -> ")} -> ${paren(t.result, ref, read)}`;
    }
  }
}

export type Item =
  // [hidden]: in the file alone, under the wrapper its interface declares.
  | { kind: "external"; name: string; type: string; js: string; attributes?: string[]; doc?: string | undefined; hidden?: boolean }
  | { kind: "let"; name: string; type: string; definition: string; doc?: string | undefined }
  | { kind: "type"; name: string; manifest?: string; doc?: string | undefined; note?: string }
  | { kind: "module"; name: string; items: Item[]; doc?: string | undefined; note?: string }
  | { kind: "alias"; name: string; of: string }
  | { kind: "include"; ml: string; mli: string };

const documented = (doc: string | undefined, declaration: string) => (doc ? `(** ${doc} *)\n${declaration}` : declaration);
const noted = (note: string | undefined, declaration: string) => (note ? `(* ${note} *)\n${declaration}` : declaration);

export function printItems(items: Item[], file: "ml" | "mli"): string {
  const one = (item: Item): string | null => {
    switch (item.kind) {
      case "external": {
        if (item.hidden && file === "mli") return null;
        const attributes = (item.attributes ?? []).map((a) => ` [@@${a}]`).join("");
        return documented(item.doc, `external ${item.name} : ${item.type} = ${JSON.stringify(item.js)}${attributes}`);
      }
      case "let":
        return file === "ml" ? item.definition : documented(item.doc, `val ${item.name} : ${item.type}`);
      case "type":
        return noted(item.note, documented(item.doc, `type ${item.name}${item.manifest ? ` = ${item.manifest}` : ""}`));
      case "module": {
        const body = printItems(item.items, file);
        const opened = file === "ml" ? `module ${item.name} = struct` : `module ${item.name} : sig`;
        return noted(item.note, documented(item.doc, `${opened}\n${body}\nend`));
      }
      case "alias":
        return `module ${item.name} = ${item.of}`;
      case "include":
        return file === "ml" ? item.ml : item.mli;
    }
  };
  return items.map(one).filter((text) => text !== null).join("\n\n");
}
