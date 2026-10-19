import * as ColorSlider from "@kobalte/core/color-slider";
import { parseColor } from "@kobalte/core/colors";

export function make() {
  return (
    <ColorSlider.Root channel="hue" defaultValue={parseColor("hsl(0, 100%, 50%)")}>
      <ColorSlider.Label>Hue</ColorSlider.Label>
      <ColorSlider.ValueLabel />
      <ColorSlider.Track><ColorSlider.Thumb style="left: 0%" /></ColorSlider.Track>
    </ColorSlider.Root>
  );
}
