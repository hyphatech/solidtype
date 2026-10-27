// HeroUI's AlertDialog in React, on a Button or on an AlertDialog.Trigger of
// its own, with a paragraph outside it, which the solidtype port's test
// renders under the same props, to compare the trigger, the dialog and what
// is outside, and steps as it steps the port's.

import { AlertDialog, Button } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  variant?: "opaque" | "blur" | "transparent";
  isDismissable?: boolean;
  isKeyboardDismissDisabled?: boolean;
  placement?: "auto" | "center" | "top" | "bottom";
  size?: "xs" | "sm" | "md" | "lg" | "cover";
  status?: "default" | "accent" | "success" | "warning" | "danger";
  // An AlertDialog.Trigger of its own around a span, where none is a Button.
  custom?: boolean;
};

export function render({ variant, isDismissable, isKeyboardDismissDisabled, placement, size, status, custom }: Props): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <div>
        <p data-testid="outside">Outside</p>
        <AlertDialog>
          {custom ? (
            <AlertDialog.Trigger aria-label="Open">
              <span>Card</span>
            </AlertDialog.Trigger>
          ) : (
            <Button variant="danger">Delete Project</Button>
          )}
          <AlertDialog.Backdrop
            variant={variant}
            isDismissable={isDismissable}
            isKeyboardDismissDisabled={isKeyboardDismissDisabled}
          >
            <AlertDialog.Container placement={placement} size={size}>
              <AlertDialog.Dialog>
                <AlertDialog.CloseTrigger />
                <AlertDialog.Header>
                  <AlertDialog.Icon status={status} />
                  <AlertDialog.Heading>Delete project permanently?</AlertDialog.Heading>
                </AlertDialog.Header>
                <AlertDialog.Body>
                  <p>This will permanently delete the project.</p>
                </AlertDialog.Body>
                <AlertDialog.Footer>
                  <Button slot="close" variant="tertiary">
                    Cancel
                  </Button>
                  <Button slot="close" variant="danger">
                    Delete
                  </Button>
                </AlertDialog.Footer>
              </AlertDialog.Dialog>
            </AlertDialog.Container>
          </AlertDialog.Backdrop>
        </AlertDialog>
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
