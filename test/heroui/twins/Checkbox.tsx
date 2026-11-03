// HeroUI's Checkbox in React, in the anatomy its documentation gives, which
// the solidtype port's test renders under the same props and puts through
// the same steps.

import { Checkbox, Label } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";
import { words } from "./words";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  variant: "primary" | "secondary";
  defaultSelected: boolean;
  isIndeterminate: boolean;
  isDisabled: boolean;
  isInvalid: boolean;
  isReadOnly: boolean;
  isRequired: boolean;
  name: string;
};

export function render(props: Props): void {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <Checkbox {...props}>
        <Checkbox.Content>
          <Checkbox.Control>
            <Checkbox.Indicator />
          </Checkbox.Control>
          <Label>Accept terms</Label>
        </Checkbox.Content>
      </Checkbox>,
    ),
  );
  mounted = { root, host };
}

// The checkbox whose root and content draw their children of their state, as
// words in an element marked with each one's name; its content, to walk.
export function renderOfState(
  isDisabled: boolean,
  isReadOnly: boolean,
  isInvalid: boolean,
  isRequired: boolean,
): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <Checkbox isDisabled={isDisabled} isReadOnly={isReadOnly} isInvalid={isInvalid} isRequired={isRequired}>
        {(r) => (
          <>
            <span data-words="checkbox">
              {words([
                ["selected", r.isSelected],
                ["indeterminate", r.isIndeterminate],
                ["disabled", r.isDisabled],
                ["read-only", r.isReadOnly],
                ["invalid", r.isInvalid],
                ["required", r.isRequired],
              ])}
            </span>
            <Checkbox.Content>
              {(c) => (
                <>
                  <Checkbox.Control>
                    <Checkbox.Indicator />
                  </Checkbox.Control>
                  <Label>Accept terms</Label>
                  <span data-words="content">
                    {words([
                      ["selected", c.isSelected],
                      ["indeterminate", c.isIndeterminate],
                      ["hovered", c.isHovered],
                      ["pressed", c.isPressed],
                      ["focused", c.isFocused],
                      ["focus-visible", c.isFocusVisible],
                      ["disabled", c.isDisabled],
                      ["read-only", c.isReadOnly],
                      ["invalid", c.isInvalid],
                      ["required", c.isRequired],
                    ])}
                  </span>
                </>
              )}
            </Checkbox.Content>
          </>
        )}
      </Checkbox>,
    ),
  );
  mounted = { root, host };
  const content = host.querySelector("[data-slot=checkbox-content]");
  if (!(content instanceof HTMLElement)) throw new Error("HeroUI's Checkbox rendered no content");
  return content;
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
