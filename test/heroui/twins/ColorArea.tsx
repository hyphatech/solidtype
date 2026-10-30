// HeroUI's ColorArea in React, its area and thumb, which the solidtype port's
// test renders under the same props, to compare both parts and step the thumb
// as it steps the port's.

import { ColorArea } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Channel = "hue" | "saturation" | "brightness" | "lightness" | "red" | "green" | "blue";

type Props = {
  defaultValue: string;
  colorSpace?: "rgb" | "hsl" | "hsb";
  xChannel?: Channel;
  yChannel?: Channel;
  isDisabled?: boolean;
  showDots?: boolean;
};

// Each change, as the colour's hex.
export function render(props: Props, told: (hex: string) => void): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <ColorArea {...props} onChange={(c) => told(c.toString("hex"))}>
        <ColorArea.Thumb />
      </ColorArea>,
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
