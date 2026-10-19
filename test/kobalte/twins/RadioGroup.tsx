import * as RadioGroup from "@kobalte/core/radio-group";

export function make() {
  return (
    <RadioGroup.Root defaultValue="medium" orientation="vertical">
      <RadioGroup.Label>Size</RadioGroup.Label>
      <RadioGroup.Item value="small">
        <RadioGroup.ItemInput />
        <RadioGroup.ItemControl><RadioGroup.ItemIndicator /></RadioGroup.ItemControl>
        <RadioGroup.ItemLabel>Small</RadioGroup.ItemLabel>
      </RadioGroup.Item>
      <RadioGroup.Item value="medium">
        <RadioGroup.ItemInput />
        <RadioGroup.ItemControl><RadioGroup.ItemIndicator /></RadioGroup.ItemControl>
        <RadioGroup.ItemLabel>Medium</RadioGroup.ItemLabel>
      </RadioGroup.Item>
      <RadioGroup.Item value="large" disabled={true}>
        <RadioGroup.ItemInput />
        <RadioGroup.ItemControl><RadioGroup.ItemIndicator /></RadioGroup.ItemControl>
        <RadioGroup.ItemLabel>Large</RadioGroup.ItemLabel>
      </RadioGroup.Item>
      <RadioGroup.Description>The fit you wear</RadioGroup.Description>
    </RadioGroup.Root>
  );
}
