// HeroUI's ColorArea in React, its area and thumb, which the solidtype port's
// test renders under the same props, to compare both parts and step the thumb
// as it steps the port's.

import { ColorArea } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";
import { words } from "./words";

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

// An area whose root and thumb draw their children of their state, as words
// in an element marked with each one's name; its thumb, to walk.
export function renderOfState(disabled: boolean): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <ColorArea aria-label="Colour" defaultValue="hsl(0, 100%, 50%)" isDisabled={disabled}>
        {(r) => (
          <>
            <span data-words="area">{words([["disabled", r.isDisabled]])}</span>
            <ColorArea.Thumb>{(h) => <span data-words="thumb">
                        {words([
                          ["dragging", h.isDragging],
                          ["hovered", h.isHovered],
                          ["focused", h.isFocused],
                          ["focus-visible", h.isFocusVisible],
                          ["disabled", h.isDisabled],
                        ])}
                        {" " + h.color.toString("hex")}
                      </span>}</ColorArea.Thumb>
          </>
        )}
      </ColorArea>,
    ),
  );
  mounted = { root, host };
  const thumb = host.querySelector("[data-slot=color-area-thumb]");
  if (!(thumb instanceof HTMLElement)) throw new Error("no thumb was rendered");
  return thumb;
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
