import * as Progress from "@kobalte/core/progress";
import { createSignal } from "solid-js";

export function make() {
  const [value, setValue] = createSignal(30);
  return (
    <div>
      <Progress.Root value={value()} minValue={0} maxValue={60}>
        <Progress.Label>Uploading</Progress.Label>
        <Progress.ValueLabel />
        <Progress.Track><Progress.Fill /></Progress.Track>
      </Progress.Root>
      <button type="button" onClick={() => setValue(60)}>
        Finish
      </button>
    </div>
  );
}
