// HeroUI's ColorSwatch in React, which the solidtype port's test renders
// under the same props, to compare the swatch's element.

import { ColorSwatch } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  color: string;
  colorName?: string;
  "aria-label"?: string;
  shape?: "circle" | "square";
  size?: "xs" | "sm" | "md" | "lg" | "xl";
};

export function render(props: Props): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() => root.render(<ColorSwatch {...props} />));
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
