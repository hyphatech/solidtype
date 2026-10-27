// HeroUI's Drawer in React, on a Button or on a Drawer.Trigger of its own,
// with a paragraph outside it, which the solidtype port's test renders under
// the same props, to compare the trigger, the drawer and what is outside, and
// steps as it steps the port's.

import { Button, Drawer } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  variant?: "opaque" | "blur" | "transparent";
  isDismissable?: boolean;
  placement?: "top" | "bottom" | "left" | "right";
  // A Drawer.Trigger of its own around a span, where none is a Button.
  custom?: boolean;
};

export function render({ variant, isDismissable, placement, custom }: Props): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <div>
        <p data-testid="outside">Outside</p>
        <Drawer>
          {custom ? (
            <Drawer.Trigger aria-label="Open">
              <span>Card</span>
            </Drawer.Trigger>
          ) : (
            <Button variant="secondary">Open Drawer</Button>
          )}
          <Drawer.Backdrop variant={variant} isDismissable={isDismissable}>
            <Drawer.Content placement={placement}>
              <Drawer.Dialog>
                <Drawer.Handle />
                <Drawer.CloseTrigger />
                <Drawer.Header>
                  <Drawer.Heading>Drawer Title</Drawer.Heading>
                </Drawer.Header>
                <Drawer.Body>
                  <p>This is a bottom drawer built with React Aria's Modal component.</p>
                </Drawer.Body>
                <Drawer.Footer>
                  <Button slot="close">Continue</Button>
                </Drawer.Footer>
              </Drawer.Dialog>
            </Drawer.Content>
          </Drawer.Backdrop>
        </Drawer>
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
