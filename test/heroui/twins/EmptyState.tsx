// HeroUI's EmptyState in React, which the solidtype port's test renders
// under the same props, to compare the two.

import { EmptyState } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

export function render(text: string | undefined): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() => root.render(<EmptyState className="py-6">{text}</EmptyState>));
  mounted = { root, host };
  const empty = host.firstElementChild;
  if (!(empty instanceof HTMLElement)) throw new Error("HeroUI's EmptyState rendered nothing");
  return empty;
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
