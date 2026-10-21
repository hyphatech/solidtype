// HeroUI's Skeleton in React, which the solidtype port's test renders under
// the same props, to compare the two placeholders.

import { Skeleton } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

export function render(animationType: "shimmer" | "pulse" | "none" | undefined): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() => root.render(<Skeleton animationType={animationType} className="h-3 w-3/5" />));
  mounted = { root, host };
  const skeleton = host.firstElementChild;
  if (!(skeleton instanceof HTMLElement)) throw new Error("HeroUI's Skeleton rendered nothing");
  return skeleton;
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
