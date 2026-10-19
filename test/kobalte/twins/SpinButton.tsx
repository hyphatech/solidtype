import { createSignal } from "solid-js";
import * as SpinButton from "@kobalte/core/spin-button";

export function make() {
  const [volume, setVolume] = createSignal(5);
  return (
    <SpinButton.Root
      aria-label="Volume"
      tabIndex="0"
      value={volume()}
      textValue={`${volume()} of 10`}
      minValue={0}
      maxValue={10}
      onIncrement={() => setVolume(Math.min(volume() + 1, 10))}
      onDecrement={() => setVolume(Math.max(volume() - 1, 0))}
      onIncrementPage={() => setVolume(Math.min(volume() + 5, 10))}
      onDecrementPage={() => setVolume(Math.max(volume() - 5, 0))}
      onDecrementToMin={() => setVolume(0)}
      onIncrementToMax={() => setVolume(10)}>
      {volume()}
    </SpinButton.Root>
  );
}
