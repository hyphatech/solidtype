// A generator's files, written, or with `--check`, as `make lint` runs it,
// compared with what is there: a file that differs fails the check, since
// it is never edited by hand.

import { readFileSync, writeFileSync } from "node:fs";

export function writeOrCheck(files: [path: string, text: string][], from: string): void {
  if (process.argv.includes("--check")) {
    for (const [path, text] of files) {
      if (readFileSync(path, "utf8") !== text) {
        console.error(`${path} is not what ${from} give: run make generate`);
        process.exit(1);
      }
    }
  } else {
    for (const [path, text] of files) writeFileSync(path, text);
  }
}
