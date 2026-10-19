import * as ColorField from "@kobalte/core/color-field";
import { createSignal } from "solid-js";

export function make() {
  const [changed, setChanged] = createSignal("");
  return (
    <ColorField.Root defaultValue="#ff0000" onChange={(value) => setChanged(value)}>
      <ColorField.Label>Colour</ColorField.Label>
      <ColorField.Input />
      <ColorField.Description>{"Changed to " + changed()}</ColorField.Description>
    </ColorField.Root>
  );
}
