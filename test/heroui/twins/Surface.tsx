// HeroUI's Surface in React, which the solidtype port's test renders under
// the same props, to compare the two elements.

import { Surface } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

export function render(variant: "default" | "secondary" | "tertiary" | "transparent", className: string): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() => root.render(<Surface variant={variant} className={className}>Content</Surface>));
  mounted = { root, host };
  const surface = host.querySelector("[data-slot=surface]");
  if (!(surface instanceof HTMLElement)) throw new Error("HeroUI's Surface rendered no surface");
  return surface;
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
