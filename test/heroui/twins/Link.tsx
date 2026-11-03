// HeroUI's Link in React, with its default icon, which the solidtype port's
// test renders under the same props and puts through the same steps.

import { Link } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";
import { words } from "./words";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

export function render(disabled: boolean): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <Link href="#top" isDisabled={disabled}>
        HeroUI
        <Link.Icon />
      </Link>,
    ),
  );
  mounted = { root, host };
  const link = host.querySelector("[data-slot=link]");
  if (!(link instanceof HTMLElement)) throw new Error("HeroUI's Link rendered no link");
  return link;
}

// The link whose children are its render function's, its state as words.
export function renderOfState(disabled: boolean, current: boolean): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <Link href="#top" isDisabled={disabled} aria-current={current ? "page" : undefined}>
        {(s) =>
          words([
            ["current", s.isCurrent],
            ["hovered", s.isHovered],
            ["pressed", s.isPressed],
            ["focused", s.isFocused],
            ["focus-visible", s.isFocusVisible],
            ["disabled", s.isDisabled],
          ])
        }
      </Link>,
    ),
  );
  mounted = { root, host };
  const link = host.querySelector("[data-slot=link]");
  if (!(link instanceof HTMLElement)) throw new Error("HeroUI's Link rendered no link");
  return link;
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
