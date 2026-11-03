// HeroUI's Disclosure in React, its heading, trigger, indicator, content and
// body, which the solidtype port's test renders under the same props, to
// compare every part, and steps as it steps the port's.

import { Button, Disclosure } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";
import { words } from "./words";

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

// The disclosure whose root and trigger draw their children of their state,
// each as words in an element marked with its name: its focus and the
// trigger's interaction, since Kobalte's trigger turns on Space let go, as a
// native button clicks, where React Aria's turns as it goes down. Its
// trigger, to walk.
export function renderOfState(disabled: boolean): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <Disclosure isDisabled={disabled}>
        {(d) => (
          <>
            <span data-words="disclosure">
              {words([
                ["focus-visible-within", d.isFocusVisibleWithin],
                ["disabled", d.isDisabled],
              ])}
            </span>
            <Disclosure.Heading>
              <Disclosure.Trigger>
                {(t) => (
                  <span data-words="trigger">
                    {words([
                      ["hovered", t.isHovered],
                      ["pressed", t.isPressed],
                      ["focused", t.isFocused],
                      ["focus-visible", t.isFocusVisible],
                      ["disabled", t.isDisabled],
                    ])}
                  </span>
                )}
              </Disclosure.Trigger>
            </Disclosure.Heading>
            <Disclosure.Content>Orders ship within 2 business days.</Disclosure.Content>
          </>
        )}
      </Disclosure>,
    ),
  );
  mounted = { root, host };
  const trigger = host.querySelector("button");
  if (!trigger) throw new Error("HeroUI's Disclosure rendered no trigger");
  return trigger;
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
