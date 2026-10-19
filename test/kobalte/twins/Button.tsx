import { createSignal } from "solid-js";
import * as Button from "@kobalte/core/button";

export function make() {
  const [saves, setSaves] = createSignal(0);
  return (
    <div>
      <Button.Root onClick={(_) => setSaves(saves() + 1)}>Save</Button.Root>
      <Button.Root disabled={true} onClick={(_) => setSaves(saves() + 1)}>
        Delete
      </Button.Root>
      <output>{saves()}</output>
    </div>
  );
}
