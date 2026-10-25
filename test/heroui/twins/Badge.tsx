// HeroUI's Badge in React, over an anchor and with text for its label, which
// the solidtype port's test renders under the same props.

import { Badge } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  color?: "accent" | "danger" | "default" | "success" | "warning";
  placement?: "bottom-left" | "bottom-right" | "top-left" | "top-right";
  size?: "lg" | "md" | "sm";
  variant?: "primary" | "secondary" | "soft";
  // Whether the badge has no content, HeroUI's dot.
  dot?: boolean;
};

export function render({ dot, ...props }: Props): void {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <Badge.Anchor>
        <span>Inbox</span>
        {dot ? <Badge {...props} /> : <Badge {...props}>5</Badge>}
      </Badge.Anchor>,
    ),
  );
  mounted = { root, host };
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
