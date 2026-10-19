// The prefix of the switch the build uses, asked of opam, which `make` runs
// each generator under: Melange's Dom is read from it.
export const switchPrefix = (): string => {
  const r = Bun.spawnSync(["opam", "var", "prefix"]);
  const prefix = r.stdout.toString().trim();
  if (r.exitCode !== 0 || prefix === "") throw new Error("opam var prefix gave no switch");
  return prefix;
};
