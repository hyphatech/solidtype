// HeroUI's NumberField in React, its label, group, buttons, input,
// description and error, which the solidtype port's test renders under the
// same props, to compare every part, and steps as it steps the port's.

import { Description, FieldError, Label, NumberField } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  variant?: "primary" | "secondary";
  fullWidth?: boolean;
  isDisabled?: boolean;
  isInvalid?: boolean;
  isReadOnly?: boolean;
  isRequired?: boolean;
  minValue?: number;
  maxValue?: number;
  step?: number;
};

export function render(props: Props, onChange: (value: number) => void): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <NumberField {...props} defaultValue={4} name="width" onChange={onChange}>
        <Label>Width</Label>
        <NumberField.Group>
          <NumberField.DecrementButton />
          <NumberField.Input />
          <NumberField.IncrementButton />
        </NumberField.Group>
        <Description>In pixels.</Description>
        <FieldError>Too wide.</FieldError>
      </NumberField>,
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
