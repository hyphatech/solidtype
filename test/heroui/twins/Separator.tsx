// HeroUI's Separator in React, which the solidtype port's test renders under
// the same props, to compare the two elements.

import { Separator } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

export function render(orientation: "horizontal" | "vertical", variant: "default" | "secondary" | "tertiary"): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() => root.render(<Separator orientation={orientation} variant={variant} />));
  mounted = { root, host };
  const separator = host.querySelector("[role=separator]");
  if (!(separator instanceof HTMLElement)) throw new Error("HeroUI's Separator rendered no separator");
  return separator;
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
