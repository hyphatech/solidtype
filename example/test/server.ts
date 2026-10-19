// The example's server for the island tests, as `make serve` runs it: its
// origin handed to each test as "origin" once the server says it listens,
// and stopped when the run ends. It serves the site the Astro test builds,
// which `bun run test` runs first. It is the real server, as an island
// calls it.

import { spawn } from "node:child_process";
import { createInterface } from "node:readline";
import type { TestProject } from "vitest/node";

export default async function setup(project: TestProject) {
  const server = spawn("_build/default/example/server/serve.exe", [], {
    stdio: ["ignore", "pipe", "inherit"],
  });
  await new Promise<void>((resolve, reject) => {
    server.once("error", reject);
    server.once("exit", (code) => reject(new Error(`the server exited with ${code}`)));
    createInterface({ input: server.stdout }).once("line", () => resolve());
  });
  project.provide("origin", "http://localhost:4420");
  return () => {
    server.kill();
  };
}

declare module "vitest" {
  export interface ProvidedContext {
    origin: string;
  }
}
