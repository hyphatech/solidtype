// HeroUI's ScrollShadow in React, which the solidtype port's test scrolls as
// it scrolls the port, to compare the edges each marks. React's hook marks
// them in an animation frame, so a step waits for one inside act.

import { ScrollShadow } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = Parameters<typeof ScrollShadow>[0];

export function render(props: Props): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <ScrollShadow {...props} className="max-h-[100px]">
        <p>One</p>
        <p>Two</p>
        <p>Three</p>
      </ScrollShadow>,
    ),
  );
  mounted = { root, host };
  const shadow = host.firstElementChild;
  if (!(shadow instanceof HTMLElement)) throw new Error("HeroUI's ScrollShadow rendered nothing");
  return shadow;
}

export async function step(action: () => void): Promise<void> {
  await act(async () => {
    action();
    await new Promise((resolve) => requestAnimationFrame(() => resolve(undefined)));
  });
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
