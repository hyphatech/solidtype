// A module of the libraries never names what Solid's or Kobalte's browser
// build does not export, so no application's build warns of it. Built as a
// command, as the example site is, since Vite's node bundle does not load
// inside Bun's test runner.

import { expect, test } from "bun:test";
import { fileURLToPath } from "node:url";

const root = fileURLToPath(new URL("../../", import.meta.url));

test("every module builds for the browser with every import found", () => {
  const build = Bun.spawnSync(["bun", "--bun", "vite", "build", "--config", "vite-plugin/test/browser.config.ts"], {
    cwd: root,
    stdout: "pipe",
    stderr: "pipe",
  });
  const log = build.stdout.toString() + build.stderr.toString();
  expect(build.exitCode, log).toBe(0);
  expect(log).not.toContain("IMPORT_IS_UNDEFINED");
}, 120_000);
