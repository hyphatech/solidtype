// HeroUI's RadioGroup in React, in the anatomy its documentation gives,
// which the solidtype port's test renders under the same props and puts
// through the same steps.

import { Description, Label, Radio, RadioGroup } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

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
