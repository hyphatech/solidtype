// HeroUI's Disclosure in React, its heading, trigger, indicator, content and
// body, which the solidtype port's test renders under the same props, to
// compare every part, and steps as it steps the port's.

import { Button, Disclosure } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  isExpanded?: boolean;
  defaultExpanded?: boolean;
  isDisabled?: boolean;
  // A HeroUI Button given the trigger's slot, as HeroUI's examples write it,
  // in place of Disclosure.Trigger.
  button?: boolean;
};

export function render(
  { button, ...props }: Props,
  onExpandedChange: (isExpanded: boolean) => void,
): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  const trigger = button ? (
    <Button slot="trigger" variant="secondary">
      Shipping
      <Disclosure.Indicator />
    </Button>
  ) : (
    <Disclosure.Trigger>
      Shipping
      <Disclosure.Indicator />
    </Disclosure.Trigger>
  );
  act(() =>
    root.render(
      <Disclosure {...props} onExpandedChange={onExpandedChange}>
        <Disclosure.Heading>{trigger}</Disclosure.Heading>
        <Disclosure.Content>
          <Disclosure.Body>Orders ship within 2 business days.</Disclosure.Body>
        </Disclosure.Content>
      </Disclosure>,
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
