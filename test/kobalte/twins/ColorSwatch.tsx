import * as ColorSwatch from "@kobalte/core/color-swatch";
import { parseColor } from "@kobalte/core/colors";

export function make() {
  return (
    <div>
      <ColorSwatch.Root value={parseColor("#ff0000")} />
      <ColorSwatch.Root value={parseColor("#0000ff")} colorName="Ocean" />
    </div>
  );
}
