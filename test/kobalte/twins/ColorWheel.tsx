import * as ColorWheel from "@kobalte/core/color-wheel";
import { parseColor } from "@kobalte/core/colors";

export function make() {
  return (
    <ColorWheel.Root defaultValue={parseColor("hsl(0, 100%, 50%)")} thickness={30}>
      <ColorWheel.Label>Hue</ColorWheel.Label>
      <ColorWheel.ValueLabel />
      <ColorWheel.Track><ColorWheel.Thumb /></ColorWheel.Track>
    </ColorWheel.Root>
  );
}
