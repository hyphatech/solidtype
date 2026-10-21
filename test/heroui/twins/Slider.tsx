// HeroUI's Slider in React, its label, output, track, fill and thumbs, which
// the solidtype port's test renders under the same props, to compare every
// part, and steps by the keyboard as it steps the port's.

import { Label, Slider } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

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

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
