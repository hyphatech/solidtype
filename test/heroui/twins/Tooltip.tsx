// HeroUI's Tooltip in React, on a Button or on a Tooltip.Trigger of its own,
// which the solidtype port's test renders under the same props, to compare
// the trigger and the tooltip, and steps as it steps the port's.

import { Button, Tooltip } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  placement?: "top" | "bottom" | "left" | "right";
  showArrow?: boolean;
  isDisabled?: boolean;
  // A Tooltip.Trigger of its own around a span, where none is a Button.
  custom?: boolean;
};

export function render({ placement, showArrow, isDisabled, custom }: Props): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <Tooltip delay={0} closeDelay={0} isDisabled={isDisabled}>
        {custom ? (
          <Tooltip.Trigger aria-label="Status">
            <span>Active</span>
          </Tooltip.Trigger>
        ) : (
          <Button variant="secondary">Hover me</Button>
        )}
        <Tooltip.Content placement={placement} showArrow={showArrow} shouldFlip={false}>
          {showArrow ? <Tooltip.Arrow /> : null}
          <p>This is a tooltip</p>
        </Tooltip.Content>
      </Tooltip>,
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
