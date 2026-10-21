// An OCaml file and its interface, written side by side: a line is both
// files', the implementation's alone -- a let's body, a raw external under
// it -- or the interface's alone, the let's val. Nothing reads the
// implementation back to find its interface.

export class Source {
  readonly ml: string[] = [];
  readonly mli: string[] = [];

  both(...lines: string[]): void {
    this.ml.push(...lines);
    this.mli.push(...lines);
  }

  implementation(...lines: string[]): void {
    this.ml.push(...lines);
  }

  interface(...lines: string[]): void {
    this.mli.push(...lines);
  }

  // A module, a struct in the file and a sig in its interface.
  module(indent: string, name: string, body: () => void): void {
    this.ml.push(`${indent}module ${name} = struct`);
    this.mli.push(`${indent}module ${name} : sig`);
    body();
    this.both(`${indent}end`);
  }

  // Another source's lines, after this one's.
  append(other: Source): void {
    this.ml.push(...other.ml);
    this.mli.push(...other.mli);
  }
}
