// HeroUI's InputGroup in React, alone and in a TextField, which the
// solidtype port's test renders under the same props, to compare every
// part, and walks as it walks the port's.

import { Description, InputGroup, Label, TextField } from "@heroui/react";
import { act } from "react";
import { createRoot, type Root } from "react-dom/client";

(globalThis as { IS_REACT_ACT_ENVIRONMENT?: boolean }).IS_REACT_ACT_ENVIRONMENT = true;

let mounted: { root: Root; host: HTMLElement } | null = null;

type Props = {
  variant?: "primary" | "secondary";
  fullWidth?: boolean;
  inField: boolean;
  multiline: boolean;
};

export function render({ inField, multiline, ...props }: Props): HTMLElement {
  const host = document.body.appendChild(document.createElement("div"));
  const root = createRoot(host);
  const group = (
    <InputGroup {...props}>
      <InputGroup.Prefix>https://</InputGroup.Prefix>
      {multiline ? (
        <InputGroup.TextArea aria-label={inField ? undefined : "Note"} placeholder="note" />
      ) : (
        <InputGroup.Input aria-label={inField ? undefined : "Site"} placeholder="heroui" />
      )}
      <InputGroup.Suffix>.com</InputGroup.Suffix>
    </InputGroup>
  );
  act(() =>
    root.render(
      inField ? (
        <TextField name="site">
          <Label>Site</Label>
          {group}
          <Description>Your site.</Description>
        </TextField>
      ) : (
        group
      ),
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
