// The example's server for the island tests, as `make example-serve` runs it,
// once it says it listens, and stopped when the run ends. It serves the
// page Vite builds, which `bun run test` builds first. It is the real
// server, as the board calls it; its log is kept, and shown only when it
// stops before it listens.

import { spawn } from "node:child_process";
import { createInterface } from "node:readline";

export default async function setup() {
  const server = spawn("_build/default/example/server/serve.exe", [], {
    stdio: ["ignore", "pipe", "pipe"],
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
  };
}
