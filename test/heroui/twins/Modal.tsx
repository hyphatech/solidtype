// HeroUI's Modal in React, HeroUI's own first example, on a Button or on a
// Modal.Trigger of its own, with a paragraph outside it, which the solidtype
// port's test renders under the same props, to compare the trigger, the
// modal and what is outside, and steps as it steps the port's.

import { Button, Modal } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  variant?: "opaque" | "blur" | "transparent";
  isDismissable?: boolean;
  placement?: "auto" | "center" | "top" | "bottom";
  size?: "xs" | "sm" | "md" | "lg" | "cover" | "full";
  scroll?: "inside" | "outside";
  // A Modal.Trigger of its own around a span, where none is a Button.
  custom?: boolean;
};

export function render({ variant, isDismissable, placement, size, scroll, custom }: Props): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <div>
        <p data-testid="outside">Outside</p>
        <Modal>
          {custom ? (
            <Modal.Trigger aria-label="Open">
              <span>Card</span>
            </Modal.Trigger>
          ) : (
            <Button variant="secondary">Open Modal</Button>
          )}
          <Modal.Backdrop variant={variant} isDismissable={isDismissable}>
            <Modal.Container placement={placement} size={size} scroll={scroll}>
              <Modal.Dialog>
                <Modal.CloseTrigger />
                <Modal.Header>
                  <Modal.Icon>i</Modal.Icon>
                  <Modal.Heading>Welcome to HeroUI</Modal.Heading>
                </Modal.Header>
                <Modal.Body>
                  <p>A beautiful, fast, and modern React UI library.</p>
                </Modal.Body>
                <Modal.Footer>
                  <Button slot="close">Continue</Button>
                </Modal.Footer>
              </Modal.Dialog>
            </Modal.Container>
          </Modal.Backdrop>
        </Modal>
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
