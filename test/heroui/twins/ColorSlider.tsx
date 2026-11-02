// HeroUI's ColorSlider in React, as HeroUI's examples draw it, which the
// solidtype port's test renders under the same props and walks by the same
// keys, to compare every part and the colour told.

import { ColorSlider, Label } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  channel: "hue" | "saturation" | "lightness" | "brightness" | "alpha" | "red" | "green" | "blue";
  defaultValue: string;
  label?: string;
  isDisabled?: boolean;
  orientation?: "horizontal" | "vertical";
};

export function render(
  { channel, defaultValue, label, isDisabled, orientation }: Props,
  told: (color: string) => void,
): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <ColorSlider
        aria-label={label ? undefined : channel}
        channel={channel}
        className="w-full max-w-xs"
        defaultValue={defaultValue}
        isDisabled={isDisabled}
        orientation={orientation}
        onChange={(c) => told(c.toString("css"))}
      >
        {label ? <Label>{label}</Label> : null}
        {label ? <ColorSlider.Output /> : null}
        <ColorSlider.Track>
          <ColorSlider.Thumb />
        </ColorSlider.Track>
      </ColorSlider>,
    ),
  );
  mounted = { root, host };
  return host;
}

export async function step(action: () => Promise<void>): Promise<void> {
  await act(action);
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
