// HeroUI's ColorSlider in React, as HeroUI's examples draw it, which the
// solidtype port's test renders under the same props and walks by the same
// keys, to compare every part and the colour told.

import { ColorSlider, Label } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";
import { words } from "./words";

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

// A hue slider whose parts draw their children of their state, as words in
// an element marked with each one's name; its thumb, to walk.
export function renderOfState(disabled: boolean): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <ColorSlider aria-label="Hue" channel="hue" defaultValue="hsl(0, 100%, 50%)" isDisabled={disabled}>
        {(r) => (
          <>
            <span data-words="slider">
                {words([["vertical", r.orientation === "vertical"], ["disabled", r.isDisabled]])}
              </span>
            <ColorSlider.Output>{(o) => <span data-words="output">
                {words([["vertical", o.orientation === "vertical"], ["disabled", o.isDisabled]])}
              </span>}</ColorSlider.Output>
            <ColorSlider.Track>
              {(t) => (
                <>
                  <span data-words="track">
                    {words([
                      ["vertical", t.orientation === "vertical"],
                      ["disabled", t.isDisabled],
                      ["hovered", t.isHovered],
                    ])}
                  </span>
                  <ColorSlider.Thumb>{(h) => <span data-words="thumb">
                        {words([
                          ["dragging", h.isDragging],
                          ["hovered", h.isHovered],
                          ["focused", h.isFocused],
                          ["focus-visible", h.isFocusVisible],
                          ["disabled", h.isDisabled],
                        ])}
                        {" " + h.color.toString("hex")}
                      </span>}</ColorSlider.Thumb>
                </>
              )}
            </ColorSlider.Track>
          </>
        )}
      </ColorSlider>,
    ),
  );
  mounted = { root, host };
  const thumb = host.querySelector("[data-slot=color-slider-thumb]");
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
