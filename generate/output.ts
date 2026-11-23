// A generator's files, written, or with `--check`, as `make lint` runs it,
// compared with what is there: a file that differs fails the check, since
// it is never edited by hand.

import { readFileSync, writeFileSync } from "node:fs";

export function refuse(lines: string[], advice: string): void {
  if (lines.length === 0) return;
  for (const line of lines) console.error(line);
  console.error(advice);
  process.exit(1);
}

// ocamlformat is the switch's, which `make` runs each generator under.
export function formatted(path: string, text: string): string {
  const run = Bun.spawnSync(["ocamlformat", `--name=${path}`, "-"], { stdin: Buffer.from(text), stdout: "pipe", stderr: "pipe" });
  if (run.exitCode !== 0) {
    console.error(run.stderr.toString());
    throw new Error(`ocamlformat refuses what the generator wrote for ${path}`);
  }
  return run.stdout.toString();
}

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
