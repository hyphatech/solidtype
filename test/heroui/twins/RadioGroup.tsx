// HeroUI's RadioGroup in React, in the anatomy its documentation gives,
// which the solidtype port's test renders under the same props and puts
// through the same steps.

import { Description, Label, Radio, RadioGroup } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";
import { words } from "./words";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  variant: "primary" | "secondary";
  defaultValue: string;
  orientation: "horizontal" | "vertical";
  isDisabled: boolean;
  isInvalid: boolean;
  starterDisabled: boolean;
  isReadOnly: boolean;
  isRequired: boolean;
  name: string;
};

const plans = [
  ["starter", "Starter", "For side projects"],
  ["pro", "Pro", "Advanced reporting"],
  ["teams", "Teams", "Up to 10 teammates"],
] as const;

export function render({ starterDisabled, ...props }: Props): void {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <RadioGroup {...props}>
        <Label>Plan</Label>
        <Description>Choose the plan that suits you</Description>
        {plans.map(([value, name, about]) => (
          <Radio key={value} value={value} isDisabled={value === "starter" && starterDisabled}>
            <Radio.Content>
              <Radio.Control>
                <Radio.Indicator />
              </Radio.Control>
              {name}
            </Radio.Content>
            <Description>{about}</Description>
          </Radio>
        ))}
      </RadioGroup>,
    ),
  );
  mounted = { root, host };
}

// A group of one radio whose group, radio and content draw their children of
// their state, as words in an element marked with each one's name; the
// radio's content, to walk.
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
      <RadioGroup aria-label="Plan" isDisabled={isDisabled} isReadOnly={isReadOnly} isInvalid={isInvalid} isRequired={isRequired}>
        {(g) => (
          <>
            <span data-words="group">
              {words([
                ["horizontal", g.orientation === "horizontal"],
                ["disabled", g.isDisabled],
                ["read-only", g.isReadOnly],
                ["required", g.isRequired],
                ["invalid", g.isInvalid],
              ])}
            </span>
            <Radio value="pro">
              {(r) => (
                <>
                  <span data-words="radio">
                      {words([
                        ["selected", r.isSelected],
                        ["disabled", r.isDisabled],
                        ["read-only", r.isReadOnly],
                        ["invalid", r.isInvalid],
                        ["required", r.isRequired],
                      ])}
                    </span>
                  <Radio.Content>
                    {(c) => (
                      <>
                        <Radio.Control>
                          <Radio.Indicator />
                        </Radio.Control>
                        Pro
                        <span data-words="content">
                            {words([
                              ["selected", c.isSelected],
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
                  </Radio.Content>
                </>
              )}
            </Radio>
          </>
        )}
      </RadioGroup>,
    ),
  );
  mounted = { root, host };
  const content = host.querySelector("[data-slot=radio-content]");
  if (!(content instanceof HTMLElement)) throw new Error("HeroUI's Radio rendered no content");
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
