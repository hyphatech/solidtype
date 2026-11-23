import { expect, test } from "bun:test";
import { bound } from "./bound.ts";

const one = (declaration: string, library = {}) => bound(declaration, library).mli;

test("a number is a float, and an int where the library says it is whole", () => {
  expect(one(`export declare function half(n: number): number;`)).toContain(`external half : float -> float = "half"`);
  expect(one(`export declare function next(n: number): number;`, { whole: () => true })).toContain(`external next : int -> int = "next"`);
});

test("null given is Js.Null.t, and read, or given beside undefined, Js.Nullable.t", () => {
  expect(one(`export declare function set(v: string | null): void;`)).toContain(`external set : string Js.Null.t -> unit`);
  expect(one(`export declare function get(): string | null;`)).toContain(`external get : unit -> string Js.Nullable.t`);
  expect(one(`export declare function set(v: string | null | undefined): void;`)).toContain(`external set : string Js.Nullable.t -> unit`);
});

test("undefined read is an option, and a parameter left out an optional argument before unit", () => {
  expect(one(`export declare function find(): string | undefined;`)).toContain(`external find : unit -> string option`);
  expect(one(`export declare function pad(s: string, width?: number): string;`)).toContain(`external pad : string -> ?width:float -> unit -> string`);
});

test("literals OCaml can name are tags, and any other set of them a string", () => {
  expect(one(`export declare function side(): "left" | "right";`)).toContain("external side : unit -> [ `left | `right ]");
  expect(one(`export declare function size(): "sm" | "md" | "lg";`)).toContain("external size : unit -> [ `lg | `md | `sm ]");
  expect(one(`export declare function size(): "2xl" | "sm";`)).toContain(`external size : unit -> string`);
});

test("members of two JavaScript kinds are an Either, and of three are not bound", () => {
  expect(one(`export declare function id(v: string | number): void;`)).toContain(`external id : (string, float) Types.Either.t -> unit`);
  const three = bound(`export declare function id(v: string | number | Date): void;`);
  expect(three.mli).toBe("");
  expect(three.refusals).toEqual(["id: no rule maps (v: string | number | Date): void"]);
});

test("a bigint is Melange's", () => {
  expect(one(`export declare function big(): bigint;`)).toContain(`external big : unit -> Js.Bigint.t`);
});

test("what TypeScript types any is not bound", () => {
  const b = bound(`export declare function parse(text: string): any;`);
  expect(b.mli).toBe("");
  expect(b.refusals).toEqual(["parse: no rule maps (text: string): any"]);
});

test("a type argument typed any is Unknown where it is read, and whatever is given where it is given", () => {
  const b = bound(`
    export interface Box<T = any> { value: T }
    export declare function open(): Box;
    export declare function close(box: Box): void;`);
  expect(b.mli).toContain(`external open_ : unit -> Types.Unknown.t Types.Box.t`);
  expect(b.mli).toContain(`external close : _ Types.Box.t -> unit`);
  expect(b.types).toContain("module Unknown : sig");
});

test("Unknown is declared only where a type names it", () => {
  expect(bound(`export declare function half(n: number): number;`).types).not.toContain("Unknown");
});

test("what is left out is named with why, and a name that leaves nothing out is refused", () => {
  const declaration = `export declare function parse(text: string): any;`;
  expect(bound(declaration, { leftOut: { parse: "its result is the caller's to decode" } }).refusals).toEqual([]);
  expect(bound(declaration, { leftOut: { parse: "why", format: "why" } }).refusals).toEqual([
    "format: named as left out, but it is bound, or no longer declared",
  ]);
});

test("a function of several signatures is its first where OCaml calls it", () => {
  expect(one(`
    export declare function start(of: string): string;
    export declare function start(of: number): number;`)).toContain(`external start : string -> string`);
});

test("a function of several signatures given to JavaScript is not bound", () => {
  const b = bound(`
    export declare function listen(handler: { (key: string): void; (index: number): void }): void;`);
  expect(b.mli).toBe("");
  expect(b.refusals.length).toBe(1);
});

test("a function that says it throws raises Invalid_argument, with an _opt beside it", () => {
  const b = bound(`
    /** Reads a colour. Throws on a string that is none. */
    export declare function parseColor(text: string): string;`);
  expect(b.mli).toContain(`val parse_color : string -> string`);
  expect(b.mli).toContain(`val parse_color_opt : string -> string option`);
  expect(b.mli).not.toContain("external");
  expect(b.ml).toContain(`| exception Js.Exn.Error e -> invalid_arg`);
});

test("a function a function returns is read uncurried and given back curried", () => {
  const b = bound(`export declare function every(step: number): (value: number) => boolean;`);
  expect(b.ml).toContain(`external every_js : float -> (float -> bool [@u]) = "every"`);
  expect(b.ml).toContain(`let every x0 = let r = every_js x0 in fun y0 -> (r y0 [@u])`);
  expect(b.mli).toContain(`val every : float -> (float -> bool)`);
});

test("a function its object may not have is read uncurried and given back curried", () => {
  const b = bound(`
    export interface Keys { first?: (from: string, wrap: boolean) => string }
    export declare function keys(): Keys;`);
  expect(b.types).toContain(`val first : t -> (string -> bool -> string) option`);
  expect(b.types).not.toContain(`external first`);
});

test("an object type is a module of Types: a getter per field, and a constructor", () => {
  const b = bound(`
    export interface Point { x: number; label?: string }
    export declare function origin(): Point;`);
  expect(b.types).toContain(`external x : t -> float = "x" [@@mel.get]`);
  expect(b.types).toContain(`external label : t -> string option = "label" [@@mel.get]`);
  expect(b.types).toContain(`external make : x:(float [@mel.as "x"]) -> ?label:(string [@mel.as "label"]) -> unit -> t = "" [@@mel.obj]`);
});

test("a name is snake case, and a keyword takes an underscore", () => {
  expect(one(`export declare function toHTMLString(): string;`)).toContain(`external to_html_string :`);
  expect(one(`export declare function open(): void;`)).toContain(`external open_ :`);
});

test("a part whose prop is a function of several arguments is made with Arity, which calls it as OCaml does", () => {
  const b = bound(`
    export declare function Root(props: { onOpenChange?: (open: boolean, by: string) => void; onClose?: () => void }): void;`);
  expect(b.ml).toContain(`external component_js : unit Solidtype.Jsx.component = "Root"`);
  expect(b.ml).toContain(`|> Solidtype.Arity.adapted "onOpenChange" (fun f -> fun [@u] x0 x1 -> f x0 x1)`);
  expect(b.mli).toContain(`val component : unit Solidtype.Jsx.component`);
});

test("a part's function prop is adapted at whatever arity it has", () => {
  const b = bound(`export declare function Root(props: { name: (a: string, b: string, c: string, d: string) => string }): void;`);
  expect(b.ml).toContain(`|> Solidtype.Arity.adapted "name" (fun f -> fun [@u] x0 x1 x2 x3 -> f x0 x1 x2 x3)`);
});

test("a part with no such prop is the library's component itself", () => {
  const b = bound(`export declare function Root(props: { onClose?: () => void; onChange?: (value: string) => void }): void;`);
  expect(b.mli).toContain(`external component : unit Solidtype.Jsx.component = "Root"`);
  expect(b.ml).not.toContain("Arity");
});

test("a function of several arguments given to a function is passed at its arity", () => {
  expect(one(`export declare function each(visit: (key: string, index: number) => void): void;`))
    .toContain(`external each : ((string -> float -> unit) [@mel.uncurry]) -> unit = "each"`);
});

test("one that may be left out is not bound, since Melange passes none so", () => {
  const b = bound(`export declare function each(visit?: (key: string, index: number) => void): void;`);
  expect(b.mli).toBe("");
  expect(b.refusals.length).toBe(1);
});

test("a constructor gives a function of several arguments under one that takes them at once", () => {
  const b = bound(`
    export interface Words { join: (a: string, b: string) => string; maybe?: (a: string, b: string) => string }
    export declare function words(): Words;`);
  expect(bound(`
    export interface Words { join: (a: string, b: string) => string; maybe?: (a: string, b: string) => string }
    export declare function say(words: Words): void;`).types).toContain(`val make : join:(string -> string -> string) -> ?maybe:(string -> string -> string) -> unit -> t`);
  expect(b.types).not.toContain(`external make`);
});

test("an object JavaScript would hand a function has no constructor", () => {
  const b = bound(`
    export interface Toaster { show: (draw: (id: number) => string) => number }
    export declare function toaster(): Toaster;`);
  expect(b.types).not.toContain("make");
  expect(b.refusals).toEqual(["Toaster.make: no rule maps a constructor whose show JavaScript would hand a function"]);
});

test("a type with no name is named by the path to it: what a function gives by the function, what it takes by its parameter too", () => {
  const b = bound(`export declare function bins(values: number[], options?: { count: number }): { edges: number[] };`);
  expect(b.mli).toContain(`external bins : float array -> ?options:Types.Bins_Options.t -> unit -> Types.Bins.t`);
});

test("two types of one name fail the run, until the library names each", () => {
  const declarations = `
    declare namespace meter { interface Params { min: number } }
    declare namespace slider { interface Params { values: number[] } }
    export declare function ofMeter(): meter.Params;
    export declare function ofSlider(): slider.Params;`;
  expect(() => bound(declarations)).toThrow(/two types would be Types\.Params/);
  const fields = (s: { declarations?: { getText(): string }[] }) => s.declarations?.[0]?.getText() ?? "";
  const b = bound(declarations, { named: (s) => (fields(s).includes("values") ? "Slider_Params" : "Meter_Params") });
  expect(b.mli).toContain(`external of_meter : unit -> Types.Meter_Params.t`);
  expect(b.mli).toContain(`external of_slider : unit -> Types.Slider_Params.t`);
});

test("a declaration's comment is its own, in the file and in its interface, whatever is declared before it", () => {
  const b = bound(`
    export interface Box {
      /** How wide it is. */
      width: number;
      /** How tall it is. */
      height: number;
    }
    export declare function box(): Box;`);
  expect(b.types).toContain(`(** How wide it is. *)\nexternal width : t -> float = "width" [@@mel.get]`);
  expect(b.types).toContain(`(** How tall it is. *)\nexternal height : t -> float = "height" [@@mel.get]`);
});
