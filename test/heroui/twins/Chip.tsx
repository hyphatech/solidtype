// HeroUI's Chip in React, with text for its label, which the solidtype
// port's test renders under the same props.

import { Chip } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  color: "accent" | "danger" | "default" | "success" | "warning";
  size?: "lg" | "md" | "sm";
  variant: "primary" | "secondary" | "soft" | "tertiary";
};

export function render(props: Props): void {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() => root.render(<Chip {...props}>Design</Chip>));
  mounted = { root, host };
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
