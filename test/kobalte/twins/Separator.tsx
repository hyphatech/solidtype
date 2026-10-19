import * as Separator from "@kobalte/core/separator";

export function make() {
  return (
    <div>
      <p>Above</p>
      <Separator.Root />
      <p>Below</p>
      <Separator.Root orientation="vertical" />
    </div>
  );
}
