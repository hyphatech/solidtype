import { createSignal } from "solid-js";
import * as NumberField from "@kobalte/core/number-field";

export function make() {
  const [raw, setRaw] = createSignal(5);
  return (
    <div>
      <NumberField.Root
        defaultValue={5}
        onRawValueChange={setRaw}
        minValue={0}
        maxValue={10}
        step={1}
        largeStep={5}>
        <NumberField.Label>Quantity</NumberField.Label>
        <NumberField.HiddenInput />
        <NumberField.DecrementTrigger aria-label="Decrease">-</NumberField.DecrementTrigger>
        <NumberField.Input />
        <NumberField.IncrementTrigger aria-label="Increase">+</NumberField.IncrementTrigger>
        <NumberField.Description>How many to order</NumberField.Description>
      </NumberField.Root>
      <output>{String(raw())}</output>
    </div>
  );
}
