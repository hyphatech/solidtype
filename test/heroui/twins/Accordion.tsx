// HeroUI's Accordion in React, three items inside it, which the solidtype
// port's test renders under the same props, to compare every part, and steps
// as it steps the port's.

import { Accordion, Button } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  defaultExpandedKeys?: string[];
  allowsMultipleExpanded?: boolean;
  isDisabled?: boolean;
  variant?: "default" | "surface";
  hideSeparator?: boolean;
  // The key of the one item given isDisabled of its own.
  disabled?: string;
  // A HeroUI Button given the trigger's slot, as HeroUI's examples write it,
  // in place of each Accordion.Trigger.
  button?: boolean;
};

// What the accordion and its items told, in order: the accordion its keys,
// an item its key and its new state.
export function render(
  { disabled, button, ...props }: Props,
  tell: (told: string) => void,
): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <Accordion {...props} onExpandedChange={(keys) => tell([...keys].map(String).join(","))}>
        {["shipping", "returns", "warranty"].map((key) => (
          <Accordion.Item
            key={key}
            id={key}
            isDisabled={key === disabled ? true : undefined}
            onExpandedChange={(expanded) => tell(`${key}:${expanded}`)}
          >
            <Accordion.Heading>
              {button ? (
                <Button slot="trigger" variant="secondary">
                  {key}
                  <Accordion.Indicator />
                </Button>
              ) : (
                <Accordion.Trigger>
                  {key}
                  <Accordion.Indicator />
                </Accordion.Trigger>
              )}
            </Accordion.Heading>
            <Accordion.Panel>
              <Accordion.Body>About {key}.</Accordion.Body>
            </Accordion.Panel>
          </Accordion.Item>
        ))}
      </Accordion>,
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
