// A render function's state as words, the true ones alone, in the order
// given: what a port's test compares with its own children of state.

export function words(flags: [string, unknown][]): string {
  return flags
    .filter(([, holds]) => holds === true)
    .map(([word]) => word)
    .join(" ");
}
