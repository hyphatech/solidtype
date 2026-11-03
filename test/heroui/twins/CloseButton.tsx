// HeroUI's CloseButton in React, on React Aria, which the solidtype port's
// test puts through the same steps as the port, each inside act, as React
// asks of a test.

import { CloseButton } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";
import { words } from "./words";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

export function render(disabled: boolean): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() => root.render(<CloseButton isDisabled={disabled} />));
  mounted = { root, host };
  const button = host.querySelector("button");
  if (!button) throw new Error("HeroUI's CloseButton rendered no button");
  return button;
}

// The button whose children are its render function's, its state as words.
export function renderOfState(disabled: boolean): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <CloseButton isDisabled={disabled}>
        {(s) =>
          words([
            ["hovered", s.isHovered],
            ["pressed", s.isPressed],
            ["focused", s.isFocused],
            ["focus-visible", s.isFocusVisible],
            ["disabled", s.isDisabled],
          ])
        }
      </CloseButton>,
    ),
  );
  mounted = { root, host };
  const button = host.querySelector("button");
  if (!button) throw new Error("HeroUI's CloseButton rendered no button");
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
