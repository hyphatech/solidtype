// HeroUI's Button in React, on React Aria, which the solidtype port's test
// puts through the same steps as the port. React renders a step's state after
// the event, so each step runs inside act, which React asks of a test: the
// step ends once React has rendered what it caused, and nothing later.

import { Button } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";
import { words } from "./words";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

export function render(disabled: boolean, pending: boolean): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <Button isDisabled={disabled} isPending={pending}>
        Save
      </Button>,
    ),
  );
  mounted = { root, host };
  const button = host.querySelector("button");
  if (!button) throw new Error("HeroUI's Button rendered no button");
  return button;
}

// The button whose children are its render function's, writing the state it
// is given as words, true ones alone, in the port's order.
export function renderOfState(disabled: boolean, pending: boolean): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <Button isDisabled={disabled} isPending={pending}>
        {(s) =>
          words([
            ["hovered", s.isHovered],
            ["pressed", s.isPressed],
            ["focused", s.isFocused],
            ["focus-visible", s.isFocusVisible],
            ["disabled", s.isDisabled],
            ["pending", s.isPending],
          ])
        }
      </Button>,
    ),
  );
  mounted = { root, host };
  const button = host.querySelector("button");
  if (!button) throw new Error("HeroUI's Button rendered no button");
  return button;
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
