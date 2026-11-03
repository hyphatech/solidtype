// HeroUI's Accordion in React, three items inside it, which the solidtype
// port's test renders under the same props, to compare every part, and steps
// as it steps the port's.

import { Accordion, Button } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";
import { words } from "./words";

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
  // The key of the one trigger given isDisabled of its own.
  triggerDisabled?: string;
  // Whether each trigger tells its presses, as "<key>:pressed".
  presses?: boolean;
};

// What the accordion and its items told, in order: the accordion its keys,
// an item its key and its new state.
export function render(
  { disabled, button, triggerDisabled, presses, ...props }: Props,
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
                <Accordion.Trigger
                  isDisabled={key === triggerDisabled ? true : undefined}
                  onPress={presses ? () => tell(`${key}:pressed`) : undefined}
                >
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

// An accordion of one item whose accordion, item and trigger draw their
// children of their state, each as words in an element marked with its name;
// its trigger, to walk.
export function renderOfState(disabled: boolean): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <Accordion isDisabled={disabled}>
        {(a) => (
          <>
            <span data-words="accordion">{words([["disabled", a.isDisabled]])}</span>
            <Accordion.Item id="shipping">
              {(i) => (
                <>
                  <span data-words="item">
                    {words([
                      ["expanded", i.isExpanded],
                      ["focus-visible-within", i.isFocusVisibleWithin],
                      ["disabled", i.isDisabled],
                    ])}
                  </span>
                  <Accordion.Heading>
                    <Accordion.Trigger>
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
                    </Accordion.Trigger>
                  </Accordion.Heading>
                  <Accordion.Panel>
                    <Accordion.Body>About shipping.</Accordion.Body>
                  </Accordion.Panel>
                </>
              )}
            </Accordion.Item>
          </>
        )}
      </Accordion>,
    ),
  );
  mounted = { root, host };
  const trigger = host.querySelector("button");
  if (!trigger) throw new Error("HeroUI's Accordion rendered no trigger");
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
