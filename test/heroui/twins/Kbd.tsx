// HeroUI's Kbd in React, which the solidtype port's test renders under the
// same props, to compare the keyboard key, its symbol and its text.

import { Kbd } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Key = Parameters<typeof Kbd.Abbr>[0]["keyValue"];

export function render(variant: "default" | "light" | undefined, key: Key): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <Kbd variant={variant} className="ms-1">
        <Kbd.Abbr keyValue={key} />
        <Kbd.Content>K</Kbd.Content>
      </Kbd>,
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
