// Writes internationalized_date/solidtype_internationalized_date.ml and
// internationalized_date/types.ml -- @internationalized/date's values, its
// calendars, conversions, queries and parsers, and the types they name --
// from its own declarations, so a date is the library's types and is never
// typed by hand. What any library shares is generate/binding.ts's; this file
// says what is @internationalized/date's. `make generate` writes them; `make
// lint`'s `--check` fails when a file differs from what its types give.

import ts from "typescript";
import { readFileSync, realpathSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { bind, functionBinding, reach, typesFiles, unmapped } from "./binding.ts";
import { writeOrCheck } from "./output.ts";
import { Source } from "./source.ts";
import { browser } from "./program.ts";

const root = fileURLToPath(new URL("../", import.meta.url));
const pkg = realpathSync(`${root}node_modules/@internationalized/date`);
const entry = `${pkg}/dist/types/src/index.d.ts`;
const out = `${root}internationalized_date/solidtype_internationalized_date.ml`;
const typesOut = `${root}internationalized_date/types.ml`;
const version = JSON.parse(readFileSync(`${pkg}/package.json`, "utf8")).version as string;

const program = ts.createProgram([entry], {
  ...browser,
  module: ts.ModuleKind.ESNext,
  moduleResolution: ts.ModuleResolutionKind.Bundler,
});
const checker = program.getTypeChecker();

const source = program.getSourceFile(entry);
const mod = source && checker.getSymbolAtLocation(source);
if (!mod) throw new Error(`no ${entry}`);
const real = (s: ts.Symbol) => (s.flags & ts.SymbolFlags.Alias ? checker.getAliasedSymbol(s) : s);
const exported = (name: string) => {
  const s = checker.getExportsOfModule(mod).find((e) => e.name === name);
  if (!s) throw new Error(`@internationalized/date exports no ${name}`);
  return real(s);
};

// What throws, though no declaration says so: a parser, on a string it
// cannot read; and whatever takes a time zone, which throws RangeError on a
// zone Intl does not know, or a disambiguation, which throws on a time its
// zone skips while it is "reject". By where the core meets it: a function's
// name, a method's Module.name.
const throwing = new Set<string>();
const takesZone = (sig: ts.Signature) =>
  sig.getParameters().some((q) => q.name === "timeZone" || q.name === "disambiguation");
for (const sym of checker.getExportsOfModule(mod)) {
  const r = real(sym);
  if (r.flags & ts.SymbolFlags.Function) {
    const sigs = checker.getTypeOfSymbol(r).getCallSignatures();
    if (/^parse/.test(sym.name) || sigs.some(takesZone)) throwing.add(sym.name);
  }
  if (r.flags & ts.SymbolFlags.Class) {
    for (const m of checker.getPropertiesOfType(checker.getDeclaredTypeOfSymbol(r))) {
      if (checker.getTypeOfSymbol(m).getCallSignatures().some(takesZone)) throwing.add(`${sym.name}.${m.name}`);
    }
  }
}

bind(root, checker, {
  name: "@internationalized/date",
  throwsUndocumented: (where) => throwing.has(where),
  // A date's every number is a small whole one, but the milliseconds since
  // 1970 fromAbsolute takes, and what compare gives, a difference that may
  // be one of milliseconds between two instants.
  whole: (where) => !/^fromAbsolute$|\.compare$/.test(where),
  kinds: {
    classes: ["CalendarDate", "CalendarDateTime", "Time", "ZonedDateTime"].map(exported),
    structural: ["AnyCalendarDate", "AnyDateTime", "AnyTime"].map(exported),
  },
});
// The one class nothing else names: a date's formatter, made by its
// constructor.
reach(exported("DateFormatter"));

// What is left out, each with why. A calendar's optional methods are ones it
// may not have, which the library calls through its own functions where a
// user needs them -- getMinimumMonthInYear, getMinimumDayInMonth,
// isEqualCalendar -- or mutate a date in place inside it.
const leftOut = new Set([
  "getMinimumMonthInYear", "getMinimumDayInMonth", "getFormattableMonth", "isEqual",
  "balanceDate", "balanceYearMonth", "constrainDate", "isInverseEra",
].map((m) => `Calendar.${m}()`));

const src = new Source();
for (const sym of [...checker.getExportsOfModule(mod)].sort((a, b) => (a.name < b.name ? -1 : 1))) {
  const r = real(sym);
  // A class is a module of Types, which the functions name; a type alone is
  // bound where it is named.
  if (r.flags & ts.SymbolFlags.Function) functionBinding(src, r, sym.name, "@internationalized/date", sym.name);
}

const { ml: typesText, mli: typesMli } = typesFiles(`(* The values @internationalized/date makes and takes, each a module: a
   CalendarDate, a CalendarDateTime, a Time and a ZonedDateTime are each a
   kind of Value, so a function that takes several takes any of them as it
   is. Generated from the declarations of @internationalized/date ${version}
   by generate/internationalized_date.ts; never edited by hand. *)`);

const missing = [...unmapped].filter(([k]) => !leftOut.has(k));
if (missing.length > 0) {
  for (const [k, v] of missing) console.error(`${k}: ${v}`);
  console.error("@internationalized/date's declarations above map by no rule: map each, or name it as left out in generate/internationalized_date.ts");
  process.exit(1);
}

const top = (lines: string[]) => lines.map((l) => l.replace(/^  /gm, ""));
const file = (modules: string[]) => `(* @internationalized/date's functions: its conversions, queries and
   parsers, and the values they make and take, in Types. Generated from the
   declarations of @internationalized/date ${version} by
   generate/internationalized_date.ts; never edited by hand. *)

module Types = Types

${modules.join("\n")}`;

writeOrCheck(
  [
    [out, file(top(src.ml))],
    [`${out}i`, file(top(src.mli))],
    [typesOut, typesText],
    [`${typesOut}i`, typesMli],
  ],
  "@internationalized/date's types",
);
