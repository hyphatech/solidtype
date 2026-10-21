// HeroUI's Button in React, on React Aria, which the solidtype port's test
// puts through the same steps as the port. React renders a step's state after
// the event, so each step ends in settle, which waits for that render and
// nothing else.

import { Button } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

export function render(disabled: boolean): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() => root.render(<Button isDisabled={disabled}>Save</Button>));
  mounted = { root, host };
  const button = host.querySelector("button");
  if (!button) throw new Error("HeroUI's Button rendered no button");
  return button;
}

export async function settle(): Promise<void> {
  await act(async () => {});
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
