// HeroUI's ProgressBar in React, its label, output, track and fill, which the
// solidtype port's test renders under the same props, to compare every part.

import { Label, ProgressBar } from "@heroui/react";
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
};

export function render(props: Props): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <ProgressBar {...props} className="w-64">
        <Label>Loading</Label>
        <ProgressBar.Output />
        <ProgressBar.Track>
          <ProgressBar.Fill />
        </ProgressBar.Track>
      </ProgressBar>,
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
