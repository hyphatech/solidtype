import * as ColorArea from "@kobalte/core/color-area";
import { parseColor } from "@kobalte/core/colors";

export function make() {
  return (
    <ColorArea.Root defaultValue={parseColor("hsl(0, 100%, 50%)")}>
      <ColorArea.Label>Colour</ColorArea.Label>
      <ColorArea.Background>
        <ColorArea.Thumb><ColorArea.HiddenInputX /><ColorArea.HiddenInputY /></ColorArea.Thumb>
      </ColorArea.Background>
    </ColorArea.Root>
  );
}
