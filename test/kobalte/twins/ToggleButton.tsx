import * as ToggleButton from "@kobalte/core/toggle-button";

export function make() {
  return (
    <ToggleButton.Root aria-label="Bold">
      {(state) => <span>{state.pressed() ? "On" : "Off"}</span>}
    </ToggleButton.Root>
  );
}
