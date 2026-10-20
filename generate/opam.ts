// The prefix of the switch the build uses, which `make` runs each generator
// under, `opam exec --switch=...`: Melange's Dom is read from it. opam
// exec says which switch it ran in by OPAM_SWITCH_PREFIX alone; `opam var`
// would answer for whichever switch is current, or none.
export const switchPrefix = (): string => {
  const prefix = process.env.OPAM_SWITCH_PREFIX ?? "";
  if (prefix === "") throw new Error("no switch: run the generator through `make`, which runs it under opam exec");
  return prefix;
};
