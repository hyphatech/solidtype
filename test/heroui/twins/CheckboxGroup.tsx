// HeroUI's CheckboxGroup in React, its label, description and checkboxes,
// which the solidtype port's test renders under the same props, to compare
// every part, and clicks as it clicks the port's.

import { Checkbox, CheckboxGroup, Description, Label } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  variant?: "primary" | "secondary";
  isDisabled?: boolean;
  isInvalid?: boolean;
  isReadOnly?: boolean;
  isRequired?: boolean;
};

const box = (value: string, label: string, isDisabled?: boolean, about?: string) => (
  <Checkbox value={value} isDisabled={isDisabled}>
    <Checkbox.Content>
      <Checkbox.Control>
        <Checkbox.Indicator />
      </Checkbox.Control>
      {label}
    </Checkbox.Content>
    {about && <Description>{about}</Description>}
  </Checkbox>
);

export function render(props: Props, onChange: (values: string[]) => void): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <CheckboxGroup {...props} name="interests" defaultValue={["coding"]} onChange={onChange}>
        <Label>Interests</Label>
        <Description>Pick any.</Description>
        {box("coding", "Coding", undefined, "Building software.")}
        {box("design", "Design")}
        {box("writing", "Writing", true)}
      </CheckboxGroup>,
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
