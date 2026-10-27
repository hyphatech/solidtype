// HeroUI's Popover in React, on a Button or on a Popover.Trigger of its own,
// with a paragraph outside it, which the solidtype port's test renders under
// the same props, to compare the trigger, the popover and what is outside,
// and steps as it steps the port's.

import { Button, Popover } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  placement?: "top" | "bottom" | "left" | "right";
  arrow?: boolean;
  // A Popover.Trigger of its own around a span, where none is a Button.
  custom?: boolean;
};

export function render({ placement, arrow, custom }: Props): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <div>
        <p data-testid="outside">Outside</p>
        <Popover>
          {custom ? (
            <Popover.Trigger aria-label="Profile">
              <span>Sarah</span>
            </Popover.Trigger>
          ) : (
            <Button>Click me</Button>
          )}
          <Popover.Content placement={placement} shouldFlip={false}>
            <Popover.Dialog>
              {arrow ? <Popover.Arrow /> : null}
              <Popover.Heading>Popover Title</Popover.Heading>
              <p>This is the popover content.</p>
              <Button size="sm">Follow</Button>
            </Popover.Dialog>
          </Popover.Content>
        </Popover>
      </div>,
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
