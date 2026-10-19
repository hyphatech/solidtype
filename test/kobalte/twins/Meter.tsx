import * as Meter from "@kobalte/core/meter";

export function make() {
  return (
    <Meter.Root
      value={40}
      getValueLabel={({ value, max }) => `${value} of ${max} GB`}>
      <Meter.Label>Storage</Meter.Label>
      <Meter.ValueLabel />
      <Meter.Track><Meter.Fill /></Meter.Track>
    </Meter.Root>
  );
}
