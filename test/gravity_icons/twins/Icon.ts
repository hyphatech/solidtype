// The icons of @gravity-ui/icons in React, each drawn by its name with the
// attributes the solidtype icon's test gives its own.

import * as Icons from "@gravity-ui/icons";
import { act, createElement, type ComponentType, type SVGProps } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

export function render(name: string): HTMLElement {
  const icon = (Icons as unknown as Record<string, ComponentType<SVGProps<SVGSVGElement>> | undefined>)[name];
  if (!icon) throw new Error(`@gravity-ui/icons has no ${name}`);
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() => root.render(createElement(icon, { className: "size-4", width: 24, "data-icon": "drawn" } as SVGProps<SVGSVGElement>)));
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
