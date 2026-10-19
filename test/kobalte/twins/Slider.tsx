import * as Slider from "@kobalte/core/slider";

export function make() {
  return (
    <Slider.Root defaultValue={[40]}>
      <Slider.Label>Volume</Slider.Label>
      <Slider.ValueLabel />
      <Slider.Track>
        <Slider.Fill />
        <Slider.Thumb style="left: 0" />
      </Slider.Track>
    </Slider.Root>
  );
}
