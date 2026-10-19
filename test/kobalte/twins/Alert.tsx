import * as Alert from "@kobalte/core/alert";
import { createSignal, Show } from "solid-js";

export function make() {
  const [saved, setSaved] = createSignal(false);
  return (
    <div>
      <button type="button" onClick={() => setSaved(true)}>Save</button>
      <Show when={saved()}>
        <Alert.Root>Your changes are saved.</Alert.Root>
      </Show>
    </div>
  );
}
