// HeroUI's Slider in React, its label, output, track, fill and thumbs, which
// the solidtype port's test renders under the same props, to compare every
// part, and steps by the keyboard as it steps the port's.

import { Label, Slider } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";
import { words } from "./words";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  defaultValue: number[];
  minValue?: number;
  maxValue?: number;
  step?: number;
  orientation?: "horizontal" | "vertical";
  isDisabled?: boolean;
};

export function render({ defaultValue, ...props }: Props, onChange: (values: number[]) => void): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  const value = defaultValue.length === 1 ? defaultValue[0] : defaultValue;
  act(() =>
    root.render(
      <Slider
        {...props}
        defaultValue={value}
        className="w-64"
        onChange={(v) => onChange(Array.isArray(v) ? v : [v])}
      >
        <Label>Volume</Label>
        <Slider.Output />
        <Slider.Track>
          <Slider.Fill />
          {defaultValue.map((_, i) => (
            <Slider.Thumb key={i} index={i} />
          ))}
        </Slider.Track>
      </Slider>,
    ),
  );
  mounted = { root, host };
  return host;
}

export async function step(action: () => Promise<unknown>): Promise<void> {
  await act(async () => {
    await action();
  });
}

// A slider whose parts draw their children of their state, as words in an
// element marked with each one's name; its thumb, to walk.
export function renderOfState(disabled: boolean): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <Slider aria-label="Volume" defaultValue={30} isDisabled={disabled}>
        {(r) => (
          <>
            <span data-words="slider">
                {words([["vertical", r.orientation === "vertical"], ["disabled", r.isDisabled]])}
              </span>
            <Slider.Output>{(o) => <span data-words="output">
                {words([["vertical", o.orientation === "vertical"], ["disabled", o.isDisabled]])}
              </span>}</Slider.Output>
            <Slider.Track>
              {(t) => (
                <>
                  <span data-words="track">
                    {words([
                      ["vertical", t.orientation === "vertical"],
                      ["disabled", t.isDisabled],
                      ["hovered", t.isHovered],
                    ])}
                  </span>
                  <Slider.Fill />
                  <Slider.Thumb>{(h) => <span data-words="thumb">
                        {words([
                          ["dragging", h.isDragging],
                          ["hovered", h.isHovered],
                          ["focused", h.isFocused],
                          ["focus-visible", h.isFocusVisible],
                          ["disabled", h.isDisabled],
                        ])}
                      </span>}</Slider.Thumb>
                </>
              )}
            </Slider.Track>
          </>
        )}
      </Slider>,
    ),
  );
  mounted = { root, host };
  const thumb = host.querySelector("[data-slot=slider-thumb]");
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
