// HeroUI's Card in React, every part of it, which the solidtype port's test
// renders under the same props, to compare each part.

import { Card } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

export function render(variant: "default" | "secondary" | "tertiary" | "transparent"): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <Card variant={variant} className="w-[400px]" role="article" aria-labelledby="card-title">
        <Card.Header className="gap-1">
          <Card.Title id="card-title">Title</Card.Title>
          <Card.Description>Description</Card.Description>
        </Card.Header>
        <Card.Content>Content</Card.Content>
        <Card.Footer>Footer</Card.Footer>
      </Card>,
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
