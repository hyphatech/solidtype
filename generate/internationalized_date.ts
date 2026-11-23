// Writes internationalized_date/solidtype_internationalized_date.ml and
// internationalized_date/types.ml -- @internationalized/date's values, its
// calendars, conversions, queries and parsers, and the types they name --
// from its own declarations, so a date is the library's types and is never
// typed by hand. What any library shares is generate/binding.ts's; this file
// says what is @internationalized/date's. `make generate` writes them; `make
// lint`'s `--check` fails when a file differs from what its types give.

import ts from "typescript";
import { reading } from "./generator.ts";

const by = "generate/internationalized_date.ts";
const { dir, version, checker, exportsOf, real, bind } = reading({
  package: "@internationalized/date",
  entries: (dir) => [`${dir}/dist/types/src/index.d.ts`],
});
const entry = `${dir}/dist/types/src/index.d.ts`;
const exports = exportsOf(entry);
const exported = (name: string) => {
  const s = exports.find((e) => e.name === name);
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
for (const sym of exports) {
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

const { functions, reach, write } = bind({
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
  // A calendar's optional methods are ones it may not have, which the
  // library calls through its own functions where a user needs them --
  // getMinimumMonthInYear, getMinimumDayInMonth, isEqualCalendar -- or
  // that mutate a date in place inside it.
  leftOut: Object.fromEntries([
    "getMinimumMonthInYear", "getMinimumDayInMonth", "getFormattableMonth", "isEqual",
    "balanceDate", "balanceYearMonth", "constrainDate", "isInverseEra",
  ].map((m) => [`Calendar.${m}()`, "a calendar's optional method, reached through the library's own functions"])),
});
// The one class nothing else names: a date's formatter, made by its
// constructor.
reach(exported("DateFormatter"));

// A class is a module of Types, which the functions name; a type alone is
// bound where it is named.
const items = functions(entry, "@internationalized/date");

write({
  module: "internationalized_date/solidtype_internationalized_date",
  by,
  whose: "@internationalized/date's",
  header: `(* @internationalized/date's functions: its conversions, queries and
   parsers, and the values they make and take, in Types. Generated from the
   declarations of @internationalized/date ${version} by
   ${by}; never edited by hand. *)`,
  typesHeader: `(* The values @internationalized/date makes and takes, each a module: a
   CalendarDate, a CalendarDateTime, a Time and a ZonedDateTime are each a
   kind of Value, so a function that takes several takes any of them as it
   is. Generated from the declarations of @internationalized/date ${version}
   by ${by}; never edited by hand. *)`,
  items,
});
