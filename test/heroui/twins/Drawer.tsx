// HeroUI's Drawer in React, on a Button or on a Drawer.Trigger of its own,
// with a paragraph outside it, which the solidtype port's test renders under
// the same props, to compare the trigger, the drawer and what is outside, and
// steps as it steps the port's.

import { Button, Drawer } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";
import { words } from "./words";

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

// A drawer whose trigger draws its children of its state, as words in an
// element marked with its name; that trigger, to glance at.
export function renderOfState(_: boolean): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <Drawer>
        <Drawer.Trigger aria-label="Open">
          {(s) => (
            <span data-words="trigger">
              {words([
                ["hovered", s.isHovered],
                ["pressed", s.isPressed],
                ["focused", s.isFocused],
                ["focus-visible", s.isFocusVisible],
              ])}
            </span>
          )}
        </Drawer.Trigger>
        <Drawer.Backdrop>
          <Drawer.Content>
            <Drawer.Dialog>
              <Drawer.Heading>Drawer</Drawer.Heading>
            </Drawer.Dialog>
          </Drawer.Content>
        </Drawer.Backdrop>
      </Drawer>,
    ),
  );
  mounted = { root, host };
  const trigger = host.querySelector("[data-slot=drawer-trigger]");
  if (!(trigger instanceof HTMLElement)) throw new Error("HeroUI's Drawer rendered no trigger");
  return trigger;
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
