// HeroUI's SearchField in React, its label, group, icon, input, clear button
// and description, which the solidtype port's test renders under the same
// props, to compare every part, and types into as it types into the port's.

import { Description, Label, SearchField } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  variant?: "primary" | "secondary";
  fullWidth?: boolean;
  isDisabled?: boolean;
  isInvalid?: boolean;
};

export function render(
  props: Props,
  onChange: (value: string) => void,
  onSubmit: (value: string) => void,
): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  act(() =>
    root.render(
      <SearchField {...props} name="search" onChange={onChange} onSubmit={onSubmit}>
        <Label>Search</Label>
        <SearchField.Group>
          <SearchField.SearchIcon />
          <SearchField.Input placeholder="Search..." />
          <SearchField.ClearButton />
        </SearchField.Group>
        <Description>Find a task.</Description>
      </SearchField>,
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
