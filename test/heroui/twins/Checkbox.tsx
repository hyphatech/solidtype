// HeroUI's Checkbox in React, in the anatomy its documentation gives, which
// the solidtype port's test renders under the same props and puts through
// the same steps.

import { Checkbox, Label } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

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
