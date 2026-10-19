import * as Switch from "@kobalte/core/switch";

export function make() {
  return (
    <Switch.Root>
      <Switch.Input />
      <Switch.Label>Sound</Switch.Label>
      <Switch.Control><Switch.Thumb /></Switch.Control>
    </Switch.Root>
  );
}
