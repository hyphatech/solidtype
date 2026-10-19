import * as TimeField from "@kobalte/core/time-field";
import { createSignal } from "solid-js";

const part = (n: number | undefined) => (n === undefined ? "-" : n.toFixed(0));

export function make() {
  const [changed, setChanged] = createSignal("nothing");
  return (
    <TimeField.Root
      defaultValue={{ hour: 9, minute: 30, second: 0 }}
      granularity="second"
      onChange={(time) => setChanged([part(time.hour), part(time.minute), part(time.second)].join(":"))}>
      <TimeField.Label>Alarm</TimeField.Label>
      <TimeField.Input>{(segment) => <TimeField.Segment segment={segment()} />}</TimeField.Input>
      <TimeField.HiddenInput />
      <TimeField.Description>{"Changed to " + changed()}</TimeField.Description>
    </TimeField.Root>
  );
}
