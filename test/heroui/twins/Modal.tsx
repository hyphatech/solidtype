// HeroUI's Modal in React, HeroUI's own first example, on a Button or on a
// Modal.Trigger of its own, with a paragraph outside it, which the solidtype
// port's test renders under the same props, to compare the trigger, the
// modal and what is outside, and steps as it steps the port's.

import { Button, Modal } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";
import { words } from "./words";

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

// An open modal whose backdrop, container, dialog and close trigger draw their
// children of their state, as words in an element marked with each one's
// name, the dialog a button that closes it.
export function renderOfState(_: boolean): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <Modal defaultOpen>
        <Modal.Backdrop>
          {(b) => (
            <>
              <span data-words="backdrop">
                {words([
                  ["entering", b.isEntering],
                  ["exiting", b.isExiting],
                ])}
              </span>
              <Modal.Container>
                {(c) => (
                  <>
                    <span data-words="container">
                      {words([
                        ["entering", c.isEntering],
                        ["exiting", c.isExiting],
                      ])}
                    </span>
                    <Modal.Dialog>
                      {(d) => (
                        <>
                          <Modal.CloseTrigger>
                            {(s) => (
                              <span data-words="close">
                                {words([
                                  ["hovered", s.isHovered],
                                  ["pressed", s.isPressed],
                                  ["disabled", s.isDisabled],
                                ])}
                              </span>
                            )}
                          </Modal.CloseTrigger>
                          <Modal.Heading>Welcome</Modal.Heading>
                          <button type="button" data-testid="done" onClick={d.close}>
                            Done
                          </button>
                        </>
                      )}
                    </Modal.Dialog>
                  </>
                )}
              </Modal.Container>
            </>
          )}
        </Modal.Backdrop>
      </Modal>,
    ),
  );
  mounted = { root, host };
  return host;
}

export function cleanup(): void {
  if (!mounted) return;
  const { root, host } = mounted;
  act(() => root.unmount());
  host.remove();
  mounted = null;
}
