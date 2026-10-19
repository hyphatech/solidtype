import * as Link from "@kobalte/core/link";

export function make() {
  return (
    <p>
      <Link.Root href="#docs">Docs</Link.Root>
      <Link.Root href="#archive" disabled>Archive</Link.Root>
    </p>
  );
}
