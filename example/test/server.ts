// The example's server for the island tests, as `make example-serve` runs it,
// once it says it listens, and stopped when the run ends. It serves the
// page Vite builds, which `bun run test` builds first, and keeps its tasks
// in a SQLite file of the run's own, migrated by rowtype-migrate from the
// switch, as `make test` puts it on the path. It is the real server, as the
// board calls it; its log is kept, and shown only when it stops before it
// listens.

import { spawn, spawnSync } from "node:child_process";
import { mkdtempSync, rmSync } from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";
import { createInterface } from "node:readline";

function migrate(...args: string[]) {
  const run = spawnSync("rowtype-migrate", args, { encoding: "utf8" });
  if (run.error) throw new Error(`rowtype-migrate cannot run, outside the switch: ${run.error.message}`);
  if (run.status !== 0) throw new Error(`rowtype-migrate ${args[0]} exited with ${run.status}:\n${run.stderr}`);
}

export default async function setup() {
  const dir = mkdtempSync(join(tmpdir(), "board-"));
  const url = `sqlite:${join(dir, "board.db")}`;
  migrate("create", "--url", url);
  migrate("up", "--dir", "example/migrations", "--url", url);
  const server = spawn("_build/default/example/server/serve.exe", [], {
    stdio: ["ignore", "pipe", "pipe"],
    env: { ...process.env, BOARD_DB: join(dir, "board.db") },
  });
  let log = "";
  server.stderr.on("data", (chunk) => (log += chunk));
  await new Promise<void>((resolve, reject) => {
    server.once("error", reject);
    server.once("exit", (code) => reject(new Error(`the server exited with ${code}:\n${log}`)));
    createInterface({ input: server.stdout }).once("line", () => resolve());
  });
  return () => {
    server.kill();
    rmSync(dir, { recursive: true, force: true });
  };
}
