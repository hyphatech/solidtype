import * as ColorChannelField from "@kobalte/core/color-channel-field";
import { parseColor } from "@kobalte/core/colors";

export function make() {
  return (
    <ColorChannelField.Root channel="red" defaultValue={parseColor("rgb(0, 0, 0)")}>
      <ColorChannelField.Label>Red</ColorChannelField.Label>
      <ColorChannelField.Input />
      <ColorChannelField.IncrementTrigger aria-label="More" />
      <ColorChannelField.DecrementTrigger aria-label="Less" />
    </ColorChannelField.Root>
  );
}
