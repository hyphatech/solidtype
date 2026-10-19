// The example's server for the island tests: notes.ml served on a port free
// when the run starts, its origin handed to each test as "origin" once the
// server says it listens, and stopped when the run ends. It is the real
// server, as an island calls it.

import { spawn } from "node:child_process";
import { createServer } from "node:net";
import { createInterface } from "node:readline";
import type { TestProject } from "vitest/node";

// A port nothing holds, asked of the system and given back.
function freePort(): Promise<number> {
  return new Promise((resolve, reject) => {
    const probe = createServer();
    probe.once("error", reject);
    probe.listen(0, "127.0.0.1", () => {
      const address = probe.address();
      probe.close(() =>
        typeof address === "object" && address
          ? resolve(address.port)
          : reject(new Error("no port")),
      );
    });
  });
}

export default async function setup(project: TestProject) {
  const port = await freePort();
  const server = spawn("_build/default/example/server/serve.exe", [String(port)], {
    stdio: ["ignore", "pipe", "inherit"],
  });
  await new Promise<void>((resolve, reject) => {
    server.once("error", reject);
    server.once("exit", (code) => reject(new Error(`the server exited with ${code}`)));
    createInterface({ input: server.stdout }).once("line", () => resolve());
  });
  project.provide("origin", `http://127.0.0.1:${port}`);
  return () => {
    server.kill();
  };
}

declare module "vitest" {
  export interface ProvidedContext {
    origin: string;
  }
}
