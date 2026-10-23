// HeroUI's ProgressCircle in React, its track and circles, which the solidtype
// port's test renders under the same props, to compare every part.

import { ProgressCircle } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  value?: number;
  isIndeterminate?: boolean;
  minValue?: number;
  maxValue?: number;
  color?: "default" | "accent" | "success" | "warning" | "danger";
  size?: "sm" | "md" | "lg";
  radius?: number;
  strokeWidth?: number;
};

export function render({ radius, strokeWidth, ...props }: Props): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  const circle = radius === undefined ? {} : { cx: 18, cy: 18, r: radius, strokeWidth };
  act(() =>
    root.render(
      <ProgressCircle {...props} aria-label="Loading">
        <ProgressCircle.Track {...(strokeWidth === undefined ? {} : { strokeWidth, viewBox: "0 0 36 36" })}>
          <ProgressCircle.TrackCircle {...circle} />
          <ProgressCircle.FillCircle {...circle} />
        </ProgressCircle.Track>
      </ProgressCircle>,
    ),
  );
  mounted = { root, host };
  return host;
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
