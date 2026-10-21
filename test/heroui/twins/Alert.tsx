// HeroUI's Alert in React, its indicator, title and description, which the
// solidtype port's test renders under the same props, to compare every part.

import { Alert } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Status = "default" | "accent" | "success" | "warning" | "danger";

export function render(status: Status | undefined): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <Alert status={status} className="max-w-md">
        <Alert.Indicator />
        <Alert.Content>
          <Alert.Title>New features</Alert.Title>
          <Alert.Description>Check out the dashboard.</Alert.Description>
        </Alert.Content>
      </Alert>,
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
