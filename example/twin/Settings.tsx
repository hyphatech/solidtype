import { createSignal } from "solid-js";
import * as Switch from "@kobalte/core/switch";

export function make() {
  const [on, setOn] = createSignal(false);
  return (
    <div class="settings">
      <Switch.Root checked={on()} onChange={(v) => setOn(v)}>
        <Switch.Input />
        <Switch.Label>Sound</Switch.Label>
        <Switch.Control class="track"><Switch.Thumb class="thumb" /></Switch.Control>
      </Switch.Root>
    </div>
  );
}
