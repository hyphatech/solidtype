// HeroUI's Breadcrumbs in React, three items, the last the page itself, which
// the solidtype port's test renders under the same props, to compare every
// part, and steps as it steps the port's.

import { Breadcrumbs } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  isDisabled?: boolean;
  // The key of the one item given isDisabled of its own.
  disabled?: string;
};

export function render(
  { disabled, ...props }: Props,
  onAction: (key: string) => void,
): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <Breadcrumbs {...props} onAction={(key) => onAction(String(key))}>
        <Breadcrumbs.Item id="home" href="#home" isDisabled={disabled === "home" ? true : undefined}>
          Home
        </Breadcrumbs.Item>
        <Breadcrumbs.Item id="docs" href="#docs" isDisabled={disabled === "docs" ? true : undefined}>
          Docs
        </Breadcrumbs.Item>
        <Breadcrumbs.Item id="tabs">Tabs</Breadcrumbs.Item>
      </Breadcrumbs>,
    ),
  );
  mounted = { root, host };
  return host;
}

export async function step(action: () => Promise<unknown>): Promise<void> {
  await act(async () => {
    await action();
  });
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
