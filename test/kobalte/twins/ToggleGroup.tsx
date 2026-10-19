import * as ToggleGroup from "@kobalte/core/toggle-group";

export function make() {
  return (
    <div>
      <ToggleGroup.Root aria-label="Alignment" defaultValue="left">
        <ToggleGroup.Item value="left">Left</ToggleGroup.Item>
        <ToggleGroup.Item value="center">Center</ToggleGroup.Item>
        <ToggleGroup.Item value="right">Right</ToggleGroup.Item>
      </ToggleGroup.Root>
      <ToggleGroup.Root aria-label="Style" multiple={true} orientation="vertical">
        <ToggleGroup.Item value="bold">Bold</ToggleGroup.Item>
        <ToggleGroup.Item value="italic">Italic</ToggleGroup.Item>
      </ToggleGroup.Root>
    </div>
  );
}
